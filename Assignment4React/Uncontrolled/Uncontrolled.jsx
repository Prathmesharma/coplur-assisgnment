import React from 'react';
import './Uncontrolled.css';

class EmployeeForm extends React.Component {
  constructor(props) {
    super(props);
    this.nameInputRef = React.createRef();
    this.eidInputRef = React.createRef();
    this.emailInputRef = React.createRef();
    this.genderInputRef = React.createRef();
  }

  onSubmit = (e) => {
    e.preventDefault();
    let emp = {
      name: this.nameInputRef.current.value,
      eid: this.eidInputRef.current.value,
      email: this.emailInputRef.current.value,
      gender: this.genderInputRef.current.value
    };
    alert(JSON.stringify(emp, null, 2));
  }

  render() {
    return (
      <div id="EmployeeForm">
        <form onSubmit={this.onSubmit}>
          <label htmlFor="name">Title</label>
          <input type="text" id="name" name="name" placeholder="Enter Employee title" ref={this.nameInputRef} />

          <label htmlFor="eid">ID</label>
          <input type="number" id="eid" name="eid" placeholder="Enter Employee ID" ref={this.eidInputRef} />

          <label htmlFor="email">Email</label>
          <input type="email" id="email" name="email" placeholder="Enter Email" ref={this.emailInputRef} />

          <label htmlFor="gender">Gender</label>
          <select id="gender" name="gender" ref={this.genderInputRef}>
            <option value="">Select</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>

          <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}

export default EmployeeForm;