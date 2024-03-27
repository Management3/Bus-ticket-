
import './App.css';
import Footer from './components/Footer';
import Header from './components/Header';
import Hero from './components/Hero';
import Login from './components/Login';
function App() {
  return (
    <div className="App">
      <Header></Header>
      <Hero childElement={<Login></Login>}></Hero>
      <Footer></Footer>
    </div>
  );
}

export default App;
