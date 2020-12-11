import React from 'react';
import { Navbar, Nav, } from 'react-bootstrap';
import { BGPURPLE } from '../constants';


function Header() {
    return (
        <div>
            <Navbar style={BGPURPLE} variant="dark" className="color-nav">
                <Navbar.Brand href="/">
                    RemoTest
    </Navbar.Brand>
                <Nav className="ml-auto">
                    <Nav.Link href="/spo2">SPO2 Generator</Nav.Link>
                    <Nav.Link href="/heart-rate">Heart Rate</Nav.Link>
                    <Nav.Link href="/respiratory-rate">Respiratory Rate</Nav.Link>
                </Nav>
            </Navbar>

        </div>

    );
}

export default Header;