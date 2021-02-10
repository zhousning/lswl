$(".ctg_mtrls").ready(function() {
  if ($(".ctg_mtrls").length > 0) {
    $( "#ctg_dropdown" ).select2({
      theme: "bootstrap",
      placeholder: '选择分类',
      language: "zh-CN"
    });
  }
});
