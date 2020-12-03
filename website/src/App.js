import logo from './logo.svg';
import './App.css';
import LandingPage from './pages/landingPage'
import Header from './components/header'
import Footer from './components/footer'

function App() {
  return (
    <div>
      <Header></Header>
      <LandingPage></LandingPage>
      <Footer></Footer>
    </div>
  );
}

export default App;
