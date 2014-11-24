var slides;
var slide;
slide = 0;

$(document).ready( 
    function() {
		slides = $('.slide');
		var hash = window.location.hash || "#0";
		var num = parseInt(hash.replace('#',''));
		show(num);
	}
);

function hide(num) {
  slides[num].style.display = "none";
}

var notesVisible = false;

function showNotes() {
 notesVisible = !notesVisible;
 var notes = $(slides[slide]).children('.notes').html();
 $('#noteDetail').html(notes);
 if (notesVisible) {
   $('#noteDetail').show();
 } else {
   $('#noteDetail').hide();
 }
}

function show(num) {
  notesVisible = false
  $('#noteDetail').hide();
  var notes;
  slide = num;
  slides[num].style.display = "block";
  $('#num').html("<a href='#" + num + "'>" + num + "</a>");
  notes = $(slides[slide]).children('.notes').html();
  if (notes !== null) {
    $('#notes').show();
  } else  {
      $('#notes').hide();
  }
}

function move(n) {
  hide(slide);
  slide = slide + n;
  if (slide > slides.length - 1) {
    slide = 0;
  }
  if (slide < 0) {
    //time to wrappy round back to the start.
    slide = slides.length - 1;
  }
  show(slide);
}

function next() {
  move(1);
}
function previous() {
  move(-1);
}

document.onkeydown = function(e) {
  var keyvent = e || window.event;
  var keyPressed = keyvent.which || keyvent.keyCode;
  switch (keyPressed) {
    case 32 :  // [ctrl|shift] space
      return move(keyvent.ctrlKey || event.shiftKey ? -1 : 1);
    case 37 : 
	case 39 :  // left and right arrows
      if (!keyvent.metaKey && !keyvent.altKey) 
        return move(keyPressed === 37 ? -1 : 1);
	}
};

