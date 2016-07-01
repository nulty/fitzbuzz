$ ->
  $('.per_page').on 'change', ->
    val = $(this).val()
    window.location = 'http://localhost.com:3000/?per_page=' + val