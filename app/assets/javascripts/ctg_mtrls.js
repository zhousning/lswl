$(".ctg_mtrls").ready(function() {
  if ($(".ctg_mtrls.index, .ctg_mtrls.list").length > 0) {
    var ctg_Nodes = gon.ctg_nodes; 
    var settingCtg = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};
    $.fn.zTree.init($("#ctg-tree"), settingCtg, ctg_Nodes);

    $("form#form-parse-excel").submit(function(res) {
      $(".btn-parse-submit").attr("disabled",true);
      $(".ctn-progress").css("display","flex");
    })
    /*$( "#ctg_dropdown" ).select2({
      theme: "bootstrap",
      placeholder: '选择分类',
      language: "zh-CN"
    });*/
  }
});
