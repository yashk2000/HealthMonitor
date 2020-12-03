import React from 'react'
import Row from 'react-bootstrap/Row'
import Container from 'react-bootstrap/Container'
import Col from 'react-bootstrap/Col'
import Button from 'react-bootstrap/Button'
import Image from 'react-bootstrap/Image'
import heartvitals from '../assets/images/heartvitals.jpeg'
import Jumbotron from 'react-bootstrap/Jumbotron'


function LandingPage() {
    return (
        <div>
            <Jumbotron fluid className="bg-black text-white text-center">
                <Container>
                    <h1>RemoTest</h1>
                    <h5>
                        Testing done anywhere.
    </h5>
                </Container>
            </Jumbotron>
            <Container>
                <Row className="d-flex justify-content-md-center p-4">
                    <Col xs="12" md="6">
                        <Image src={heartvitals} fluid />
                    </Col>
                    <Col xs="12" md="6">
                        <h1 className="text-dark">Calculate Heart Rate</h1>
                        <p >Folly words widow one downs few age every seven. If miss part by fact he park just shew. Discovered had get considered projection who favourable. Necessary up knowledge it tolerably. Unwilling departure education is be dashwoods or an. Use off agreeable law unwilling sir deficient curiosity instantly. Easy mind life fact with see has bore ten. Parish any chatty can elinor direct for former. Up as meant widow equal an share least. </p>
                        <Row className="d-flex justify-content-xs-center">
                            <Button variant="dark" size="lg" className="d-flex justify-content-xs-center ml-3">Start Test</Button>{' '}
                        </Row>
                    </Col>
                </Row>
                <Row className="justify-content-xs-center p-4">
                    <Col xs="12" md="6">
                        <h1 className="text-dark"> Respiratory Rate </h1>
                        <p> Folly words widow one downs few age every seven. If miss part by fact he park just shew. Discovered had get considered projection who favourable. Necessary up knowledge it tolerably. Unwilling departure education is be dashwoods or an. Use off agreeable law unwilling sir deficient curiosity instantly. Easy mind life fact with see has bore ten. Parish any chatty can elinor direct for former. Up as meant widow equal an share least. </p>
                        <Row className="d-flex justify-content-xs-center">
                            <Button variant="dark" size="lg" className="d-flex justify-content-xs-center ml-3">Start Test</Button>{' '}
                        </Row>
                    </Col>
                    <Col xs="12" md="6">
                        <Image src={heartvitals} fluid />
                    </Col>
                </Row>
                <Row className="justify-content-xs-center p-4 mb-2">
                    <Col xs="12" md="6">
                        <Image src={heartvitals} fluid />
                    </Col>
                    <Col xs="12" md="6">
                        <h1 className="text-dark"> SpO2 Rate </h1>
                        <p> Folly words widow one downs few age every seven. If miss part by fact he park just shew. Discovered had get considered projection who favourable. Necessary up knowledge it tolerably. Unwilling departure education is be dashwoods or an. Use off agreeable law unwilling sir deficient curiosity instantly. Easy mind life fact with see has bore ten. Parish any chatty can elinor direct for former. Up as meant widow equal an share least. </p>
                        <Row className="d-flex justify-content-xs-center">
                            <Button variant="dark" size="lg" className="d-flex justify-content-xs-center ml-3">Start Test</Button>{' '}
                        </Row>
                    </Col>
                </Row>
            </Container>
        </div>
    )
}

export default LandingPage;