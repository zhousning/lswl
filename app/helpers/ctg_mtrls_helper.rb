module CtgMtrlsHelper

  #def options_for_ctg(my_secd)
  #  ctg_frsts = current_user.ctg_frsts
  #  str = ""
  #  ctg_frsts.each do |frst|
  #    str += " <optgroup label='#{frst.name}'>"
  #    ctg_secds = frst.ctg_secds
  #    ctg_secds.each do |secd|
  #      if !secd.nil? && secd.id == my_secd.id
  #        str += " <option selected='selected' value='#{secd.id}'>#{secd.name}</option>"
  #      else
  #        str += " <option value='#{secd.id}'>#{secd.name}</option>"
  #      end
  #    end
  #    str += "</optgroup>"
  #  end
  #  raw(str)
  #end                                            

  def options_for_domain_level(level) 
    levels = [Setting.domains.level_one, Setting.domains.level_two, Setting.domains.level_three]

    str = "<option value='0'>无</option>"
    if !level.nil? && levels.include?(level) 
      str += "<option selected='selected' value='" + level + "'>" + level + "</option>"
    end
    ls = levels.reject do |l|
      l == level
    end
    ls.each do |item|
        str += "<option value='" + item + "'>" + item + "</option>"
    end
    raw(str)
  end
end  
