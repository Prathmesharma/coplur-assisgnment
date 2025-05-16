import React, { useState,useEffect } from "react";

function Timer(){
    const [count, setCount] = useState(0);
    const [seconds,setSeconds]=useState(0);

    useEffect(() => { 
        const timeout = setTimeout(() =>{
            setCount((count) => count+1);
        },5000);
        const interval = setInterval(() =>{
            setSeconds((count) => count + 1);
        },1000); 

        return () => {
            clearInterval(interval);
            clearTimeout(timeout)
        }
            
    },[count]); 
    return(

        <>
        <h1>I've rendered {count} times!</h1>;
        <h1>I've rendered {seconds} times!</h1>
        </>
    )
    
    
}
export default Timer;