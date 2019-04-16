import React, { Component } from "react";
import "./App.css";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import Fib from "./Fib";
import OtherPage from "./OtherPage";

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header>
            <h1 className="App-title">Fib Calculator version 2</h1>
            <Link style={{ margin: "10px" }} to="/">
              Home
            </Link>
            <Link style={{ margin: "10px" }} to="/otherpage">
              Other Page
            </Link>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
