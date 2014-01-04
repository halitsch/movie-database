var ready;
ready = function() {

  $("table").tablesorter();

};

$(document).ready(ready);
$(document).on('page:load', ready);