   

def get_category_order(category)
    if category == "Sorting"
      return 1
    elsif category == "Container"
      return 2
    elsif category == "Paiza"
      return 100
    else
      return 3
    end
end 

def get_key_from_subcategory(input)
    capture = input.scan(/[1-9]?[0-9]/).first.to_i      
    return capture
end

def get_hierarchy (runs)
    hierarchy = {}
    runs.each do |run|   
        if hierarchy[run.category]
            if hierarchy[run.category][run.sub_category] 
                hierarchy[run.category][run.sub_category].push run
            else
                hierarchy[run.category][run.sub_category] = [run]
            end
        else 
            hierarchy[run.category] = {run.sub_category => [run] }
        end
    end 
  
    hierarchy.each do |k, v|
        hierarchy[k] = v.sort_by { |k, v| get_key_from_subcategory(k) }.to_h
    end

    hierarchy = hierarchy.sort_by { |k,v| get_category_order(k) }

    return hierarchy.to_h
end


