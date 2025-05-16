import React from'react';
import'./EmployeeForm.css'
class EmployeeForm extends React.Component{
    constructor(props) {
        super(props);
        this.state={
            emp:{}
        }
        this.handleNameChange=this.handleNameChange.bind(this);
        this.handleIDChange=this.handleIDChange.bind(this);
        this.handleDateChange=this.handleDateChange.bind(this);
        this.handleDepartmentChange=this.handleDepartmentChange.bind(this);
    }
    handleNameChange(e) {
        this.setState( (state, props) =>{
            let emp=state.emp
            emp.name=e.target.value;
            return{ emp:emp}
        });
    }
    handleIDChange(e) {
        this.setState( (state, props) =>{
            let emp=state.emp
            emp.eid=e.target.value;
            return{ emp:emp}
        });
    }
    handleDateChange(e) {
        this.setState( (state, props) =>{
            let emp = state.emp
            emp.date=e.target.value;
            return{ emp:emp}
        });
    }
    handleDepartmentChange(e) {
        this.setState( (state, props) =>{
            let emp = state.emp
            emp.department=e.target.value;
            return{ emp:emp}
        });
    }
    onSubmit=(e) =>{
        e.preventDefault();
        alert(JSON.stringify(this.state.emp));
    }
    render() {
        return(
            <div id="EmployeeForm">
            <form onSubmit={(e) =>this.onSubmit(e)}>
            <label for="name">Title</label>
            <input type="text"id="name"name="name"placeholder="Enter Employee name"
            value={this.state.emp.name}
            onChange={this.handleNameChange}/>
            <label for="eid">ID</label>
            <input type="number"id="eid"name="eid"placeholder="Enter Employee ID"
            value={this.state.emp.eid}
            onChange={this.handleIDChange}/>
            <label for="date">Joining Date</label>
            <input type="date"id="date"name="date"placeholder="Enter Joining date"
            value={this.state.emp.date}
            onChange={this.handleDateChange}/>
            <label for="department">Department</label>
            <select id="department"name="department"value={this.state.emp.department}
            onChange={this.handleDepartmentChange}>
            <option value="">Select</option>
            <option value="HR">HR</option>
            <option value="Sales">Sales</option>
            <option value="Accounts">Accounts</option>
            </select>
            <input type="submit"value="Submit"/>
            </form>
            </div>
        )
    }
}
export default EmployeeForm;