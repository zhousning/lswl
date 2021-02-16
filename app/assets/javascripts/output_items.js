$(".output_items").ready(function() {
  if ($(".output_items.index").length > 0) {
    var $table = $('#stock-table');
    var $button = $('#stock-table-btn');
    var $save = $('#output-item-save');
    var url = "/retrievals/" + gon.retrieval + "/output_items/select_stock?selections=";
    var create_url = "/retrievals/" + gon.retrieval + "/output_items/output_item_create?nums=";

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
      var outputCounts = $(".output-count");
      var outputItems = $(".output-item-index");
      var result = "";
      if (stockCounts.length == 0) {
        return;
      }
      for (var i=0; i<stockCounts.length; i++) {
        var outputid = $(outputItems[i]).text();
        var stocknum = parseInt($(stockCounts[i]).text());
        var outputnum = parseInt($(outputCounts[i]).val());
        if (stocknum < outputnum) {
          alert("超出库存");
          return;
        } else if (outputnum == 0) {
          alert("存在未填项目");
          return;
        } else {
          result += outputid + "," + outputnum + "$";
        }
      }
      //var obj = JSON.stringify(result);
      create_url += result;
      window.location = create_url;
    })
  }
});
