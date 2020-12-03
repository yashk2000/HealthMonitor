import React from 'react'
import Navbar from 'react-bootstrap/Navbar'
import Nav from 'react-bootstrap/Nav'
function Footer() {
    return (
        <Navbar bg="dark" expand="lg">
            <Navbar.Brand className="text-white" href="#home">RemoTest</Navbar.Brand>
            <Nav.Link className="text-white" href="#home">About</Nav.Link>
            <Nav.Link className="text-white" href="#link">GitHub</Nav.Link>
        </Navbar>
    )
}

export default Footer;

