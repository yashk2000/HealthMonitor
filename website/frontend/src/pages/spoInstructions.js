import React, { Fragment, useRef } from 'react';
import Button from 'react-bootstrap/Button';
import { Col, Card, Container } from 'react-bootstrap';
import { BGPURPLE } from '../constants';
import { Camera } from 'react-cam';
import { SECONDARYPURPLE } from '../constants';
import { CameraFill } from 'react-bootstrap-icons';


function capture(imgSrc) {
    console.log('rachit')
    console.log(imgSrc);
}

function SPO2Instructions() {
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
                    <Card.Title><strong>SPO2 Calculator Instructions</strong></Card.Title>
                    <Card.Text>
                        To measure your SpO2 successfully, read the following instructions carefully: <br /><br />

                        1. Please sit in an upright position and face the camera.<br />
                        2. Place your finger at a distance of 3-5 cms as shown below.<br />
                        3. Once you are ready, hit on the Measure button and wait for the camera to capture your finger's image. While this process is happening, please stay as still as you can. <br />
                        4. After capturing the image please wait for about 5-10 seconds for a alert message before hitting the Next button. <br />
                    </Card.Text>
                </Card.Body>
            </Card>
        </div>
    )
}

export default SPO2Instructions;