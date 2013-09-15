$(document).ready(function() {
  var modal = new Modal();
  modal.showModal($('#blah'), $('#someId'));
})

function Modal(){
}

Modal.prototype = {
  showModal: function(form, link){
    $(form).easyModal({
      top: 200,
      overlay: 0.2
    });

    $(link).click(function(e){
      $(form).trigger('openModal');
      e.preventDefault();
    });
  }
}
