
$(function() {
   Dropzone.options.myAwesomeDropzone = { 

  paramName: "file",
  autoProcessQueue: false,
  uploadMultiple: false,
  parallelUploads: 1,
  maxFiles: 1,

  
  init: function() {
    var myDropzone = this;

    
    this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
      
      e.preventDefault();
      e.stopPropagation();
      myDropzone.processQueue();
    });
  }

}
});
