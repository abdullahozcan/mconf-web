$ ->
  if isOnPage 'spaces', 'edit'
    updatePasswords($('input#space_public').is(':checked'))
    $('input#space_public').on 'click', -> updatePasswords($(this).is(':checked'))

  uploader_callbacks =
    onComplete: (id, name, response) ->
      if response.success

        # Hide these elements on successs
        $('.progress').hide()

        $.get response.redirect_url, (data) ->
          # show the modal
          mconf.Modal.showWindow
            data: data
          mconf.Crop.bindCrop()

  mconf.Uploader.bindAll(uploader_callbacks)


updatePasswords = (checked) ->
  $('#space_bigbluebutton_room_attributes_attendee_password').prop('disabled', checked)
  $('#space_bigbluebutton_room_attributes_moderator_password').prop('disabled', checked)
