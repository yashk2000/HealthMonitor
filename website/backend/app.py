import warnings
from utils import base64_to_pil_image
import cv2
import numpy as np
from flask import Flask, request
from flask_restful import Api
from operator import itemgetter
import base64
from numpy import mean

warnings.filterwarnings(action="ignore", category=UserWarning, module="gensim")


app = Flask(__name__)
api = Api(app)


@app.route("/spo", methods=["POST"])
def spo():
    count = 0
    i = 0
    A = 100
    B = 5
    json_data = request.json
    video_frames = itemgetter("frames")(json_data)
    video_strings = video_frames.split(";")
    video_strings = video_strings[0:]
    spresult = 0
    spcount = 0
    result = 0
    length = len(video_strings)
    print("The no of video_strings: " + str(length))
    for w in range(len(video_strings)):

        input_img = base64_to_pil_image(video_strings[w])

        input_img = input_img.resize((640, 480))

        img = cv2.cvtColor(np.array(input_img), cv2.COLOR_BGR2RGB)

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        avg = 0
        count = 0
        sumres = 0
        c1 = 0
        res = 0
        rows, cols = gray.shape
        for i in range(rows):
            for j in range(cols):
                temp = gray[i, j]
                avg = avg + temp
                c1 += 1
        for i in range(285, 386):
            for j in range(177, 351):
                k = gray[i, j]
                count += 1
                sumres = sumres + k

        avg = avg / c1
        sumres = sumres / count
        avg = round(avg, 0)
        sumres = round(sumres, 0)
        print("photo avg: " + str(avg))
        print("Fin avg:" + str(sumres))
        diff = avg - sumres
        diff = abs(diff)

        if avg >= 140:
            if sumres >= 140 and sumres <= 200:
                # print("Hand detected")
                res = 1

        elif avg >= 120 and avg <= 139:
            if sumres >= 130 and sumres <= 200:
                res = 1
            else:
                res = 0

        elif avg >= 90 and avg <= 119:
            if sumres >= 90 and sumres <= 180:
                res = 1

            else:
                res = 0

        else:
            res = 0

        print("res", str(res))
        # res = 1
        if res == 1:

            # Red channel operations
            red_channel = img[:, :, 2]
            mean_red = np.mean(red_channel)

            std_red = np.std(red_channel)

            red_final = std_red / mean_red

            # Blue channel operations
            blue_channel = img[:, :, 0]
            mean_blue = np.mean(blue_channel)

            std_blue = np.std(red_channel)

            blue_final = std_blue / mean_blue

            sp = A - (B * (red_final / blue_final))
            sp = round(sp, 2)
            spresult = spresult + sp
            spcount += 1

        else:
            sp = "Finger not found"

        result = result + res

    result = result / length

    if result > 0.25:
        spresult = spresult / spcount
        spresult = round(spresult, 2)
    else:
        spresult = "Finger not recognised"

    return spresult


@app.route("/hr", methods=["POST"])
def hr():
    json_data = request.json
    video_frames = itemgetter("frames")(json_data)
    video_strings = video_frames.split(";")

    video_strings2 = video_strings[1:]
    print(len(video_strings))
    video_strings = video_strings2 * 20

    face_found_flag = 0
    for index, i in enumerate(video_strings2):
        imgdata = base64.b64decode(i)
        filename = str(index) + "some_image.jpg"
        with open(filename, "wb") as f:
            f.write(imgdata)
        face_cascade = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")

        img = cv2.imread(filename)

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        faces = face_cascade.detectMultiScale(gray, 1.1, 4)
        if len(faces) > 0:
            face_found_flag = 1
            break

    face_cascade = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")

    def buildGauss(frame, levels):
        pyramid = [frame]
        for level in range(levels):
            frame = cv2.pyrDown(frame)
            pyramid.append(frame)
        return pyramid

    def reconstructFrame(pyramid, index, levels):
        filteredFrame = pyramid[index]
        for level in range(levels):
            filteredFrame = cv2.pyrUp(filteredFrame)
        filteredFrame = filteredFrame[:videoHeight, :videoWidth]
        return filteredFrame

    def applyFFT(frames, fps):
        n = frames.shape[0]
        t = np.linspace(0, float(n) / fps, n)
        disp = frames.mean(axis=0)
        y = frames - disp

        k = np.arange(n)
        T = n / fps
        frq = k / T
        freqs = frq[range(n // 2)]

        Y = np.fft.fft(y, axis=0) / n
        signals = Y[range(n // 2), :, :]

        return freqs, signals

    def bandPass(freqs, signals, freqRange):

        signals[freqs < freqRange[0]] *= 0
        signals[freqs > freqRange[1]] *= 0

        return signals

    def find(condition):
        (res,) = np.nonzero(np.ravel(condition))
        return res

    def freq_from_crossings(sig, fs):

        indices = find((sig[1:] >= 0) & (sig[:-1] < 0))
        x = sig[1:]
        x = mean(x)

        return x

    def searchFreq(freqs, signals, frames, fs):

        curMax = 0
        freMax = 0
        Mi = 0
        Mj = 0
        for i in range(10, signals.shape[1]):
            for j in range(signals.shape[2]):

                idxMax = abs(signals[:, i, j])
                idxMax = np.argmax(idxMax)
                freqMax = freqs[idxMax]
                ampMax = signals[idxMax, i, j]
                c, a = abs(curMax), abs(ampMax)
                if (c < a).any():
                    curMax = ampMax
                    freMax = freqMax
                    Mi = i
                    Mj = j

        y = frames[:, Mi, Mj]
        y = y - y.mean()
        fq = freq_from_crossings(y, fs)
        rate_fft = freMax * 60

        rate_count = round(20 + (fq * 10))

        if np.isnan(rate_count):
            rate = rate_fft
        elif abs(rate_fft - rate_count) > 20:
            rate = rate_fft
        else:
            rate = rate_count

        return rate

    def answer(videoStrings):

        sampleLen = 10
        firstFrame = np.zeros((videoHeight, videoWidth, videoChannels))
        firstGauss = buildGauss(firstFrame, levels + 1)[levels]
        sample = np.zeros(
            (sampleLen, firstGauss.shape[0], firstGauss.shape[1], videoChannels)
        )

        idx = 0

        respRate = []

        face_flag = 0
        for i in range(len(videoStrings)):

            input_img = base64_to_pil_image(videoStrings[i])

            input_img = input_img.resize((320, 240))

            if face_found_flag == 1:
                # print("FACE FOUND _ RR")

                face_flag = 1

                frame = cv2.cvtColor(np.array(input_img), cv2.COLOR_BGR2RGB)

                detectionFrame = frame[
                    int(videoHeight / 2) : int(realHeight - videoHeight / 2),
                    int(videoWidth / 2) : int(realWidth - int(videoWidth / 2)),
                    :,
                ]

                sample[idx] = buildGauss(detectionFrame, levels + 1)[levels]

                freqs, signals = applyFFT(sample, videoFrameRate)
                signals = bandPass(freqs, signals, (0.2, 0.8))
                respiratoryRate = searchFreq(freqs, signals, sample, videoFrameRate)

                idx = (idx + 1) % 10

                respRate.append(respiratoryRate)

            else:
                print("Face not found")

        if face_flag == 1:
            l = []
            a = max(respRate)
            b = mean(respRate)
            if b < 0:
                b = 5
            l.append(a)
            l.append(b)

            rr = mean(l)
            rr = round(rr, 2)
        else:
            rr = "Face not recognised!"

        return rr

    # Webcam Parameters
    realWidth = 320
    realHeight = 240
    videoWidth = 160
    videoHeight = 120
    videoChannels = 3
    videoFrameRate = 15

    # Color Magnification Parameters
    levels = 3
    alpha = 170
    minFrequency = 1.0
    maxFrequency = 2.0
    bufferSize = 150
    bufferIndex = 0

    # Initialize Gaussian Pyramid
    firstFrame = np.zeros((videoHeight, videoWidth, videoChannels))
    firstGauss = buildGauss(firstFrame, levels + 1)[levels]
    videoGauss = np.zeros(
        (bufferSize, firstGauss.shape[0], firstGauss.shape[1], videoChannels)
    )
    fourierTransformAvg = np.zeros((bufferSize))

    # Bandpass Filter for Specified Frequencies
    frequencies = (1.0 * videoFrameRate) * np.arange(bufferSize) / (1.0 * bufferSize)
    mask = (frequencies >= minFrequency) & (frequencies <= maxFrequency)

    # Heart Rate Calculation Variables
    bpmCalculationFrequency = 15
    bpmBufferIndex = 0
    bpmBufferSize = 10
    bpmBuffer = np.zeros((bpmBufferSize))
    i = 0
    bpm_values = []
    face_flag = 0
    for j in range(len(video_strings)):
        # convert it to a pil image
        input_img = base64_to_pil_image(video_strings[j])

        input_img = input_img.resize((320, 240))

        img = cv2.cvtColor(np.array(input_img), cv2.COLOR_BGR2RGB)

        if face_found_flag == 1:
            face_flag = 1
            # print("FACE FOUND")
            detectionFrame = img[
                int(videoHeight / 2) : int(realHeight - videoHeight / 2),
                int(videoWidth / 2) : int(realWidth - int(videoWidth / 2)),
                :,
            ]

            # Construct Gaussian Pyramid
            videoGauss[bufferIndex] = buildGauss(detectionFrame, levels + 1)[levels]
            fourierTransform = np.fft.fft(videoGauss, axis=0)
            # Bandpass Filter
            fourierTransform[mask == False] = 0

            # Grab a Pulse
            if bufferIndex % bpmCalculationFrequency == 0:
                i = i + 1
                for buf in range(bufferSize):
                    fourierTransformAvg[buf] = np.real(fourierTransform[buf]).mean()
                hz = frequencies[np.argmax(fourierTransformAvg)]
                bpm = 60.0 * hz
                bpmBuffer[bpmBufferIndex] = bpm

                bpmBufferIndex = (bpmBufferIndex + 1) % bpmBufferSize

            # Amplify
            filtered = np.real(np.fft.ifft(fourierTransform, axis=0))
            filtered = filtered * alpha

            # Reconstruct Resulting Frame
            filteredFrame = reconstructFrame(filtered, bufferIndex, levels)
            outputFrame = detectionFrame + filteredFrame
            outputFrame = cv2.convertScaleAbs(outputFrame)

            bufferIndex = (bufferIndex + 1) % bufferSize
            print(f"IIIIIIII is equal to {i} and bpmBufferSize is {bpmBufferSize}")
            if i < bpmBufferSize:
                bpm_values.append(bpmBuffer.mean())
                print("bpm_values: ")
                print(bpm_values)

        else:
            print("Face not found")

    if face_flag == 1:
        hr = max(bpm_values)
        hr = round(hr)

    else:
        hr = "Face not found"

    print(hr)

    rr = answer(video_strings)
    print(rr)

    answer = str(hr) + " " + str(rr)
    return answer


if __name__ == "__main__":
    app.run()
