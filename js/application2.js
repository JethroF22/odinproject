function setOrder() {
    order = +$('input').val();
    var totalMargins = order
    var size = (960 - totalMargins)/ order;
    $('.cell').css({'width': size, 'height': size});
}

function drawCanvas(order) {
  $('#canvas').empty();
  for (var i = 0; i < order; i++) {
    drawLine(order);
  }
}

function drawLine(order) {
  $('#canvas').append('<div></div>')
  for (var i = 0; i < order; i++) {
    $('#canvas').append('<div class="cell"></div>')
  }
}

$(document).ready(function() {
  /* setOrder();  // Will reimplement this once I figure out how to
                     dynamically set the width and height. Might have
                     to add a <style> tag to the HTML. */
  $('button').click(function() {
    setOrder();
    drawCanvas(order);
  })
});
