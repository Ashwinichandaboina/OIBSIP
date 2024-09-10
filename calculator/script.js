const display=document.getElementById('display');
function toDisplay(value){
    display.value+=value;
}
function clearDisplay(){
    display.value='';
}
function deleteChar(){
    
    display.value=display.value.slice(0,-1);
}
function calculate(){
    
    let expression=display.value;
    expression=expression.replace(/\^/g,'**');
    expression=expression.replace(/√\(/g,'Math.sqrt(');
    expression=expression.replace(/√(\d+)/g,'Math.sqrt($1)');
    try {
        const result = eval(expression);
        display.value = result;
    } catch (error) {
        display.value = 'Error'; // Handle any errors during calculation
    }
}

