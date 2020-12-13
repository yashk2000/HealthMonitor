import React, { Fragment } from 'react';
import Button from 'react-bootstrap/Button';
import { Col, Card, Container } from 'react-bootstrap';
import { BGPURPLE } from '../constants';
import { SECONDARYPURPLE } from '../constants';
import axios from 'axios'
import Webcam from "react-webcam";
let ans = '';
let anythingElse;

const videoConstraints = {
    width: 1280,
    height: 720,
    facingMode: "user"
  };
   
function RespiratoryInstructions() {
    const webcamRef = React.useRef(null);
   
    const capture = React.useCallback(
      () => {
        let imgSrc = webcamRef.current.getScreenshot();
        imgSrc = imgSrc.replace('data:image/jpeg;base64,', '')
        
        //console.log(imgSrc)
        for(let i=0; i<2; i++){
            imgSrc += `;${imgSrc}`
        }
        let data = JSON.stringify({ frames: imgSrc });
        axios.post(`https://cors-anywhere.herokuapp.com/https://health-monitor-mlh.herokuapp.com/hr`, data, { headers: { "Content-Type": "application/json" } })
            .then(response => {
                console.log(response.data)
                if (response.data[0] === 'F') {
                    ans = 'Oops! It seems that the face was not recognized!'
                } else {
                    anythingElse = (response.data).split(" ")
                    console.log(anythingElse)
                    ans = `The heart rate is ${anythingElse[0]} and the respiratory rate is ${anythingElse[1]}`
                }
                console.log('the ans is', ans)
                alert(ans)
            })
            .catch(error => {
                console.log(error);
            });;
      },
      [webcamRef]
    );
    return (
        <div>
            <div style={BGPURPLE}>
                <Container className="p-5" >
                    <Col>
                        <Fragment>
                            <Webcam
                                audio={false}
                                height={640}
                                ref={webcamRef}
                                screenshotFormat="image/jpeg"
                                width={860}
                                videoConstraints={videoConstraints}
                            />
                        </Fragment>
                        <div className="d-flex justify-content-center mt-5">
                            <Button style={{ backgroundColor: SECONDARYPURPLE }} size="lg" active className="rounded" onClick={capture}>Capture photo</Button>
                        </div>
                    </Col>
                </Container>
            </div>
            <Card className="mx-5 my-5">
                <Card.Body>
                    <Card.Title><strong>Heart & Respiratory Rate Calculator Instructions</strong></Card.Title>
                    <Card.Text>
                        To measure your vitals successfully, read the following instructions carefully: <br /> <br />

1. Please sit in an upright position and face the camera. <br />
2. Make sure the face is well lit. <br />
3. Once you are ready, hit on the Measure button and wait for the camera to capture your image. While this process is happening, please stay as still as you can.  <br />
4. After capturing the image please wait for about 15-20 seconds for an alert message before hitting the Next button.  <br />

                    </Card.Text>
                </Card.Body>
            </Card>
        </div>
    )
}

export default RespiratoryInstructions;