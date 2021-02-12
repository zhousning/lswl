$(".ctg_mtrls").ready(function() {
  if ($(".ctg_mtrls.index").length > 0) {
    var ctg_Nodes = gon.ctg_nodes; 
    var settingCtg = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};
    $.fn.zTree.init($("#ctg-tree"), settingCtg, ctg_Nodes);

    /*$( "#ctg_dropdown" ).select2({
      theme: "bootstrap",
      placeholder: '选择分类',
      language: "zh-CN"
    });*/
  }
});
