$(".retrievals").ready(function() {
  if ($(".retrievals.new, .retrievals.edit").length > 0) {
    var url = '/input_items/ware_item';
    $.getJSON(url, function(data) {
      var mydata = $.map(data, function(item) {
        item.id = item.id;
        item.text = item.text;
        /*if (item.id == gon.ctg_mtr) {
          item.selected = true;
        }*/
        return item;
      });
      $( ".ctg_mtrl" ).select2({
        theme: "bootstrap",
        placeholder: '物品名',
        language: "zh-CN",
        data: mydata 
        /*ajax: {
          url: '/input_items/ware_item',
          dataType: 'json',
          data: function (params) {
            var query = {
              search: params.term,
              type: 'public'
            }
            return query;
          }
          processResults: function (data) {
            console.log(data);
            return {
              results: data
            };
          }
        }*/
      });
    })
  }
});
