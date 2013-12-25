$ ->
  $("#volume_artist_token").tokenInput '/artists.json',
    tokenLimit: 1,
    prePopulate: $('#volume_artist_token').data('load')
