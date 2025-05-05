import React, { Component } from 'react';
import './Calculator.css'; 

class Calculator extends Component {
  state = {
    display: '0',
    current: '',
    previous: '',
    operation: '',
  };

  handleNumber = (num) => {
    this.setState((prevState) => ({
      current: prevState.current === '0' ? num : prevState.current + num,
      display: prevState.current === '0' ? num : prevState.current + num,
    }));
  };

  handleOperation = (op) => {
    this.setState((prevState) => ({
      previous: prevState.current,
      current: '',
      operation: op,
    }));
  };

  handleEqual = () => {
    const { current, previous, operation } = this.state;
    let result;
    const prev = parseFloat(previous);
    const curr = parseFloat(current);

    switch (operation) {
      case '+':
        result = prev + curr;
        break;
      case '-':
        result = prev - curr;
        break;
      case '*':
        result = prev * curr;
        break;
      case '/':
        result = prev / curr;
        break;
      default:
        return;
    }

    this.setState({ display: result.toString(), current: result.toString(), previous: '', operation: '' });
  };

  handleSquare = () => {
    const num = parseFloat(this.state.current);
    const result = num * num;
    this.setState({ display: result.toString(), current: result.toString() });
  };

  handleSqrt = () => {
    const num = parseFloat(this.state.current);
    const result = Math.sqrt(num);
    this.setState({ display: result.toString(), current: result.toString() });
  };

  handleClear = () => {
    this.setState({ display: '0', current: '', previous: '', operation: '' });
  };

  render() {
    return (
      <div className="calculator container mt-4"> {}
        <h3>Calculator</h3>
        <div className="display">{this.state.display}</div> {}
        <div className="buttons"> {}
          <button onClick={() => this.handleNumber('1')}>1</button>
          <button onClick={() => this.handleNumber('2')}>2</button>
          <button onClick={() => this.handleNumber('3')}>3</button>
          <button onClick={() => this.handleOperation('+')}>+</button>
          <button onClick={() => this.handleNumber('4')}>4</button>
          <button onClick={() => this.handleNumber('5')}>5</button>
          <button onClick={() => this.handleNumber('6')}>6</button>
          <button onClick={() => this.handleOperation('-')}>-</button>
          <button onClick={() => this.handleNumber('7')}>7</button>
          <button onClick={() => this.handleNumber('8')}>8</button>
          <button onClick={() => this.handleNumber('9')}>9</button>
          <button onClick={() => this.handleOperation('*')}>*</button>
          <button onClick={() => this.handleNumber('0')}>0</button>
          <button onClick={this.handleClear}>C</button>
          <button onClick={() => this.handleOperation('/')}>/</button>
          <button onClick={this.handleEqual}>=</button>
          <button onClick={this.handleSquare}>x²</button>
          <button onClick={this.handleSqrt}>√</button>
        </div>
      </div>
    );
  }
}

export default Calculator;