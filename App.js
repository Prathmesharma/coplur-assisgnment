import logo from './logo.svg';
import './App.css';
import Header from './Header';
import Footer from './Footer';
import Hello from './Hello';
import List from './Assignment2/t'; 
import Calculator from './Assignment3/Calculator'; 
function App() {
  const students = [
    {
      name: "Prathmesh Sharma",
      toc: 91,
      dbms: 89,
      cn: 79,
      os: 90,
      m3: 100
    },
    {
      name: "Rashi Jain",
      toc: 88,
      dbms: 70,
      cn: 97,
      os: 72,
      m3: 80
    },
    {
      name: "Naman Soni",
      toc: 60,
      dbms: 90,
      cn: 84,
      os: 66,
      m3: 68
    },
    {
      name: "Kohinoor Tiwari",
      toc: 72,
      dbms: 56,
      cn: 99,
      os: 91,
      m3: 65
    },
    {
      name: "Suraj Sharma",
      toc: 64,
      dbms: 97,
      cn: 85,
      os: 74,
      m3: 57
    },
    {
      name: "Ravi Gupta",
      toc: 90,
      dbms: 54,
      cn: 87,
      os: 68,
      m3: 45
    },
    {
      name: "Rahul dravid",
      toc: 56,
      dbms: 95,
      cn: 78,
      os: 79,
      m3: 98
    },
    {
      name: "Golu Mishra",
      toc: 85,
      dbms: 61,
      cn: 80,
      os: 56,
      m3: 89
    },
    {
      name: "Abhi Dubey",
      toc: 83,
      dbms: 68,
      cn: 80,
      os: 56,
      m3: 55
    }
  ];
  let nam = "React Project";
  // let l=[10,20,30,40];
  return (
    <div className="App">
      <header className="App-header">
        <Header />
        <Hello />
        <Calculator /> {}
        <List data={students} />
      
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <h1>{nam}</h1>
        <Footer />
      </header>
    </div>
  );
}

export default App;