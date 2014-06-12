
$(function() {
   Dropzone.options.myAwesomeDropzone = { 

  paramName: "photo[photo]",
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

return myAwesomeDropzone.on("success", function(file, responseText) {
  alert('b');
    var imageUrl;
    imageUrl = responseText.file_name.url;
  });
myAwesomeDropzone.on("totaluploadprogress", function(progress) {
  document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
});