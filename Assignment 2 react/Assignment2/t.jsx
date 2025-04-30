import React from 'react';
import "./t.css";

const t = (props) => {
  return (
    <div className="Student">
        <h2>Students </h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>TOC</th>
                    <th>DBMS</th>
                    <th>CN</th>
                    <th>OS</th>
                    <th>M3</th>
                    <th>Total</th>
                    <th>CGPA</th>
                </tr>
            </thead>
       
        <tbody>
            {props.data.map((item) =>{
                return(
                    <tr>
                        <td>{item.name}</td>
                        <td>{item.toc}</td>
                        <td>{item.dbms}</td>
                        <td>{item.cn}</td>
                        <td>{item.os}</td>
                        <td>{item.m3}</td>
                        <td>{item.toc+item.dbms+item.cn+item.os+item.m3 }</td>
                        <td>{(((item.toc+item.dbms+item.cn+item.os+item.m3) /500)*10).toFixed(2)}</td>
                    </tr>
                );
            })}
        </tbody>
    </table>
    </div>
  )
}
export default t;