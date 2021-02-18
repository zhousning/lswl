$(".input_items").ready(function() {
  if ($(".input_items.index").length > 0) {
    var $table = $('#ctg-mtrl-table');
    var $button = $('#ctg-mtrl-table-btn');
    var $save = $('#input-item-save');
    var url = "/ware_houses/" + gon.ware_house + "/input_items/select_ctg_mtrl?selections=";
    var create_url = "/ware_houses/" + gon.ware_house + "/input_items/input_item_create?nums=";

    $button.click(function () {
      var selections = $table.bootstrapTable('getSelections');
      var str = "";
      for (var i=0; i<selections.length; i++) {
        str += selections[i]["id"] + ",";
      }
      url += str;
      window.location = url;
    })

    $save.click(function () {
      var inputItems = $(".input-item-index");
      var inputUnitPrices = $(".input-unit-price");
      var inputCounts = $(".input-count");
      var result = "";
      if (inputItems.length == 0) {
        return;
      }
      for (var i=0; i<inputItems.length; i++) {
        var inputid = $(inputItems[i]).text();
        var inputUnitPrice = parseFloat($(inputUnitPrices[i]).val());
        var inputnum = parseInt($(inputCounts[i]).val());
        if (inputnum == 0 || inputUnitPrice == 0) {
          alert("存在为0的项");
          return;
        } else {
          result += inputid + "," + inputUnitPrice + "-" + inputnum + "$";
        }
      }
      create_url += result;
      window.location = create_url;
    })
  }
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
