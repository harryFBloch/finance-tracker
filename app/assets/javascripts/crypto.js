$(document).on('turbolinks:load', function(){
  $("#crypto-lookup-form").on("ajax:complete", function(event, data, status){
    $("#cresults").html(data.responseText)
  })
})