$(".pick_items").ready(function() {
  if ($(".pick_items").length > 0) {
    var $table = $('#stock-table');
    var $button = $('#stock-table-btn');
    var $save = $('#pick-item-save');
    var url = "/projects/" + gon.project + "/picks/" + gon.pick + "/pick_items/select_stock?selections=";
    var create_url = "/projects/" + gon.project + "/picks/" + gon.pick + "/pick_items/pick_item_create?nums=";

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
      var stockCounts = $(".stock-count");
      var pickCounts = $(".pick-count");
      var pickItems = $(".pick-item-index");
      var result = "";
      if (stockCounts.length == 0) {
        return;
      }
      for (var i=0; i<stockCounts.length; i++) {
        var pickid = $(pickItems[i]).text();
        var stocknum = parseInt($(stockCounts[i]).text());
        var picknum = parseInt($(pickCounts[i]).val());
        if (picknum == 0) {
          alert("存在未填项目");
          return;
        } else {
          result += pickid + "," + picknum + "$";
        }
      }
      //var obj = JSON.stringify(result);
      create_url += result;
      window.location = create_url;
    })
  }
});
