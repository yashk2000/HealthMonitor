import React, { Fragment, useRef } from 'react';
import Button from 'react-bootstrap/Button';
import { Col, Card, Container } from 'react-bootstrap';
import { BGPURPLE } from '../constants';
import { Camera } from 'react-cam';
import { SECONDARYPURPLE } from '../constants';
import { CameraFill } from 'react-bootstrap-icons';
const axios = require('axios');
let ans = '';
let anythingElse;


function capture(imgSrc) {
    console.log('Image captured!');
    imgSrc = imgSrc.replace('data:image/jpeg;base64,', '')
    console.log(imgSrc)
    for (let i = 0; i < 2; i++) {
        imgSrc += `;${imgSrc}`
    }
    let data = JSON.stringify({ frames: imgSrc });
    axios.post(`https://cors-anywhere.herokuapp.com/https://health-monitor-mlh.herokuapp.com/hr`, data, { headers: { "Content-Type": "application/json" } })
        .then(response => {
            if (typeof (response.data[0]) === Number) {
                anythingElse = toString(response.data).split(" ")
                ans = `heart rate = ${anythingElse[0]} respiratory rate = ${anythingElse[1]}`
            } else {
                ans = 'Face not found!'
            }
            console.log('the ans is', ans)
        })
        .catch(error => {
            console.log(error);
        });;
}



function RespiratoryInstructions() {
    const cam = useRef(null);
    return (
        <div>
            <div style={BGPURPLE}>
                <Container className="p-5" >
                    <Col>
                        <Fragment>
                            <Camera
                                showFocus={false}
                                front={false}
                                capture={capture}
                                ref={cam}
                                width="80%"
                                height="auto"
                                focusWidth="80%"
                                focusHeight="60%"
                                btnColor="white"
                            />
                            {/* <button onClick={img => cam.current.capture(img)}>Take image</button> */}
                        </Fragment>
                        <div className="d-flex justify-content-center mt-5">
                            <Button style={{ backgroundColor: SECONDARYPURPLE }} size="lg" active className="rounded" onClick={img => cam.current.capture(img)}>
                                <CameraFill /> Capture Image
            </Button>
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