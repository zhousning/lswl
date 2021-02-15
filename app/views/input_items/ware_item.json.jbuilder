json.array! @input_items do |input_item|
  json.id input_item.id
  json.text input_item.ctg_mtrl.name + "(" + input_item.count.to_s + ")"
end
