$(".input_items").ready(function() {
  if ($(".input_items.new, .input_items.edit").length > 0) {
    var url = '/input_items/category';
    $.getJSON(url, function(data) {
      var mydata = $.map(data, function(item) {
        item.id = item.id;
        item.text = item.text;
        if (item.id == gon.ctg_mtr) {
          item.selected = true;
        }
        return item;
      });
      $( "#ctg_mtrl" ).select2({
        theme: "bootstrap",
        placeholder: '物品名',
        language: "zh-CN",
        data: mydata 
        /*
        ajax: {
          url: '/input_items/category',
          dataType: 'json',
          processResults: function (data) {
            console.log(data);
            return {
              results: data
            };
          }
        }
        */
      });
    })
  }
});
