import React from 'react';
import Container from 'react-bootstrap/Container';
import Jumbotron from 'react-bootstrap/Jumbotron';
import { BGPURPLE } from '../constants';
import Card from 'react-bootstrap/Card';
import CardDeck from 'react-bootstrap/CardDeck';


function LandingPage() {
    return (
        <div>
            <Jumbotron fluid className="text-white text-center" style={BGPURPLE}>
                <Container>
                    <h3>Want to get a quick vital dest done? We can help you monitor your vitals with the contactless Pulse oximetry from RemoTest. We also help you to monitor your heart rate, breathing rate and body temperature via your web-camera.</h3>
                </Container>
            </Jumbotron>
            <Container>
                <CardDeck className="mb-lg">
                    <Card>
                        <Card.Img variant="top" src="https://www.pngitem.com/pimgs/m/78-785158_heart-rate-pulse-live-line-wave-frequency-medical.png" />
                        <br/><br/><br/><br/><br/>
                        <Card.Body>
                            <Card.Title>Heart Rate and Respiratory Rate Monitor</Card.Title>
                            <Card.Text>
                                Take this quick test to check your heart rate and respiratory rate.
      </Card.Text>
                        </Card.Body>
                    </Card>
                    <Card>
                        <Card.Img variant="top" src="https://www.nonin.com/wp-content/uploads/2018/10/SPO2_website-icon.png" />
                        <Card.Body>
                            <Card.Title>SpO2 Calculator</Card.Title>
                            <Card.Text>
                                Take this test to check your SpO2 levels.
                            </Card.Text>
                        </Card.Body>
                    </Card>
                </CardDeck>
                <div className="my-5">
                </div>
            </Container>
        </div>
    )
}

export default LandingPage;