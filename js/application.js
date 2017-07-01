var order = 16;

$(document).ready(function() {
  $('button').click(function() {
    order = $('input').val();
  });
});

function drawCanvas(order) {
  for (var i = 0; i < order; i++) {
    drawLine(order);
  }
}

function drawLine(order) {
  for (var i = 0; i < order; i++) {
    
  }
}
