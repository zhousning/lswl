json.array! @stocks do |stock|
  json.index stock.id
  json.id stock.id
  json.idno stock.ctg_mtrl.idno
  json.name stock.ctg_mtrl.name 
  json.model_no stock.ctg_mtrl.model_no 
  json.pet_name stock.ctg_mtrl.pet_name 
  json.count stock.count
  json.unit_price stock.unit_price
end
