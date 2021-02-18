json.array! @ctg_mtrls do |ctg_mtrl|
  json.index ctg_mtrl.id
  json.id ctg_mtrl.id
  json.idno ctg_mtrl.idno
  json.name ctg_mtrl.name 
  json.model_no ctg_mtrl.model_no 
  json.pet_name ctg_mtrl.pet_name 
end
