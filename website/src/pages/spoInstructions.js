import React from 'react';
import Image from 'react-bootstrap/Image'
import Button from 'react-bootstrap/Button'
import { Col } from 'react-bootstrap';

function SPO2Instructions() {
    return (
        <div>
            <Col>
                <Image src="https://images.unsplash.com/photo-1607609654079-cc5000f7c635?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80" className="mx-center" width="50%" rounded />
                <Button variant="primary" size="lg" active>
                    SPO2 Instructions
            </Button>
            </Col>
        </div>
    )
}

export default SPO2Instructions;