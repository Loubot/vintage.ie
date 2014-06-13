jQuery ->

  if $('#my-awesome-dropzone').length > 0
    edit_form = new Dropzone("#my-awesome-dropzone", {
        paramName: "photo[photo]"
        #enqueueForUpload: false
        addRemoveLinks: true
        autoProcessQueue: false
        previewsContainer: ".preview_photo"
        
    })

    edit_form.on("success", (file) ->
      console.log("successfully uploaded file ")
      location.reload()
    )

    edit_form.on("error", (file) ->
      console.log("error occurred while uploading file")
      $('#status_message').html("<b style='color: red;'>An error occurred while saving the Student.</b>")
    )

    $("#edit_form_save_button").click( ->
      console.log("Save Button Clicked")
      if edit_form.files.length > 0
        console.log("found file to process")
        
        edit_form.processQueue();
      
    )