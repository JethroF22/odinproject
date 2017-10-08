$(document).ready(function() {
  var size = setSize();
  drawGrid(size);
  $('button').click(function() {
    size = setSize();
    drawGrid(size);
  })
});

function drawGrid(size=order) {
  $('#canvas').empty();
  var $grid = $('<div></div>')
  for (var i = 0; i < order*order; i++) {
    $grid.append(cell.clone())
  }
  $('#canvas').append($grid);
  $('.cell').on('mouseenter', function() {
    $(this).addClass('painted');
  })
}

function setSize () {
  order = $('input').val();
  each = (960 - 4 * order)/ order;
  cell = $('<div class="cell" style="height: ' + each + 'px; width: ' + each + 'px"></div>')
  return cell;
}
