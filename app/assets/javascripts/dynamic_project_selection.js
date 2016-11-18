$(document).ready(function() {

  var projects = $('#timesheet_project_name').html();
   $('#timesheet_client_name').change(function(){
    var selectedClient = $('#timesheet_client_name :selected').text();
    var optgroup = "optgroup[label='"+ selectedClient + "']";
    var projectOptions = $(projects).filter(optgroup).html();

    var placeholder = '<option disabled selected value>Select project</option>';

    $('#timesheet_project_name').html(placeholder + projectOptions);
  });
 });

