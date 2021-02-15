$(".output_items").ready(function() {
  if ($(".output_items.new, .output_items.edit").length > 0) {
    var url = '/input_items/category';
    $.getJSON(url, function(data) {
      var mydata = $.map(data, function(item) {
        item.id = item.id;
        item.text = item.text;
        /*if (item.id == gon.ctg_mtr) {
          item.selected = true;
        }
        */
        return item;
      });
      $( "#ctg_mtrl" ).select2({
        theme: "bootstrap",
        placeholder: '物品名',
        language: "zh-CN",
        data: mydata 
        /*
        ajax: {
          url: '/output_items/category',
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
      $('#ctg_mtrl').on('select2:opening select2:closing', function( event ) {
        var $searchfield = $(this).parent().find('.select2-search__field');
        $searchfield.prop('disabled', true);
      });
    })
  }
});
