jQuery ->

  if $('#my-awesome-dropzone').length > 0
    edit_form = new Dropzone("#my-awesome-dropzone", {
        paramName: "photo[photo]"
        enqueueForUpload: false
        addRemoveLinks: true
    })

    edit_form.on("success", (file) ->
      console.log("successfully uploaded file")
      $('#status_message').html("<b style='color: green;'>Student Saved</b>")
    )

    edit_form.on("error", (file) ->
      console.log("error occurred while uploading file")
      $('#status_message').html("<b style='color: red;'>An error occurred while saving the Student.</b>")
    )

    $("#edit_form_save_button").click( ->
      console.log("Save Button Clicked")
      if edit_form.files.length > 0
        alert 'a'
        console.log("found file to process")
        file = edit_form.files[0]
        edit_form.filesQueue.push(file);
        edit_form.processQueue();
      
    )