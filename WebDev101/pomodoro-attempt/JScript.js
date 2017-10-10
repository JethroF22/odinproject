/* global $*/

// Variables that initialize the session and pause times, in seconds
var session = 1500;       // Default value: 1500
var pause = 300;         // Default value: 300
var duration = session;

/*  is_pause is true when the current phase is a pause, false
    when it's a work session.
    is_running is true when the pomodoro clock is counting down,
    false when it is paused or stopped.
*/
var is_pause = false;
var is_running = true;

// The audio element
var ding = document.createElement('audio');
ding.innerHTML = '<source src="' + 'ding.wav'+ '" type="audio/wav" />';

// Displays current values of session and pause
document.getElementById("display_session").innerHTML = session / 60;
document.getElementById("display_pause").innerHTML = pause / 60;

// (document).ready(funtion(){
// .onClick("Start");
// setInterval()
// });

$("Start").click(function() {
    is_running = true
});

//  The method that implements the pomo clock
$(document).ready(function() {
    var interval = setInterval(function(){
        
        duration--;
        
        var minutes = Math.floor(duration / 60);
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var seconds = duration % 60;
        seconds = seconds < 10 ? '0' + seconds : seconds;
        var time = minutes + ':' + seconds;
        document.getElementById("time").innerHTML = time;
    
        if (duration == 0) {
            
            ding.play();
            
            if (is_pause) {
                duration = session;
                
            } else {
                duration = pause;
                
            }
            
            is_pause = !is_pause;
        }
        
    }, 1000);

});
// clearInterval(interval)  // I think this will be used when the user stops clock


