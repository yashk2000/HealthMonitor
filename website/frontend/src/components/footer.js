import React from 'react'
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav';
import { BGPURPLE } from '../constants';

function Footer() {
    return (
        <Navbar style={BGPURPLE} expand="lg" fixed="bottom">
            <Nav.Link className="text-white" href="https://github.com/yashk2000/HealthMonitor/blob/main/README.md" target="_blank">About</Nav.Link>
            <Nav.Link className="text-white" href="https://github.com/yashk2000/team2" target="_blank">GitHub</Nav.Link>
        </Navbar>
    )
}

export default Footer;

