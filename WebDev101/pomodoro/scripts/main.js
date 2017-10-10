/* global $*/

var mySession = 9;             // Default value: 1500  (25min)
var myBreak = 6;               // Default value: 300    (5 min)
var currentCount = mySession;      
var interval = 0;

var isSession = true;


$(document).ready(function() {
    displayFields();
    
// Add/Remove time from Session/Break
$('.buttonPlusMinus').click(function(){
    switch (this.id) {
    case "plusSession":
         mySession += 60;
         break;
    case "minusSession":
        if (mySession > 60){
            mySession -= 60;
        }
         break; 
    case "plusBreak":
         myBreak += 60;
         break;
    case "minusBreak":
        if(myBreak > 60){
         myBreak -= 60;
        }
         break;
    }
    currentCount = mySession;
    displayFields();
});    

    //Start Stop Pause Reset Buttons
    $("#start").click(function() {
    interval =  setInterval(countdown, 1000);
    document.getElementById("footer").innerHTML = "working";
    });
    
    $("#stop").click(function() {
    clearInterval(interval);
    currentCount = mySession;
    displayFields();
    document.getElementById("footer").innerHTML = "stop";
    });
    
    $("#pause").click(function() {
    clearInterval(interval);
    document.getElementById("footer").innerHTML = "PAUSED";
    });
    
    $("#reset").click(function() {
    clearInterval(interval);
    mySession = 1500;
    myBreak = 300;
    currentCount = mySession;
    interval = 0;
    displayFields();
    document.getElementById("footer").innerHTML = "ready to work...";
    });
});


// Displays current values of session and pause
function displayFields(){
     document.getElementById("displaySession").innerHTML = mySession / 60;
     document.getElementById("displayBreak").innerHTML = myBreak / 60;
     document.getElementById("display").innerHTML = formatTime(currentCount);
}


// formats time from INT to MIN:SEC
function formatTime(timeAsInt){
    var minutes = Math.floor(timeAsInt / 60);
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var seconds = timeAsInt % 60;
    seconds = seconds < 10 ? '0' + seconds : seconds;
    return minutes + ':' + seconds;
}


function countdown() {
    currentCount--;
    document.getElementById("display").innerHTML = formatTime(currentCount);
    if (currentCount == 0) {
        ding.play();
        currentCount = isSession? myBreak : mySession;
        isSession = !isSession;
        if (isSession == false){
            document.getElementById("footer").innerHTML = "break";
        }
    }
}


// The Big "Ding"
var ding = document.createElement('audio');
ding.innerHTML = '<source src="' + 'ding.wav'+ '" type="audio/wav" />';

