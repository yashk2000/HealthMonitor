import LandingPage from './pages/landingPage'
import Header from './components/header';
import Footer from './components/footer';
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import SPO2Instructions from './pages/spoInstructions';
import RespiratoryInstructions from './pages/respiratoryInstructions';

function App() {
  return (
    <div>
      <Router>
        <Header />
        <Switch>
          <Route path="/" exact component={() => <LandingPage />} />
          <Route path="/spo2" exact component={() => <SPO2Instructions />} />
          <Route path="/heart-and-respiratory-rate" exact component={() => <RespiratoryInstructions />}
          />
        </Switch>
        <Footer />
      </Router>
    </div>
  );
}

export default App;
