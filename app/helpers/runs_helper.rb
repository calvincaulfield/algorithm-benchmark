module RunsHelper
    def getChartType(category, sub_category, title)
        if (category == "Matrix" && title == "MKL vs recursive parallel")
            return "2d";
        elsif (category == "Paiza" && title == "S_018 天気の予報")
            return "line"
        elsif (category == "String")
            return 'horizontalBar'
        else
            return "horizontalBar"
        end
    end
    
    def get_category_order(category)
        if category == "Sorting"
          return 1
        elsif category == "Container"
          return 2
        elsif category == "Matrix"
            return 3
        elsif category == "String"
            return 4
        elsif category == "Etc."
          return 100
        else
          return 5
        end
    end 
    
    def get_key_from_category_subcategory(category, sub_category)
        leading_number = sub_category.scan(/[1-9]?[0-9]/).first.to_i 
		if category == 'Sorting'
			if sub_category.include? 'Random'
				return 0
			elsif sub_category.include? 'All equal'
				return 1
			end
        elsif category == 'Matrix'
            if sub_category.include? 'drop'
                return 1000
            else
                return leading_number
            end
        elsif category == 'Container'
            if sub_category.include? '('
                return leading_number + 1
            else
                return leading_number    
            end
        else
            return leading_number  
        end
    end
    
    def get_hierarchy (runs)
        hierarchy = {}
        runs.sort_by { |e| e.created_at } .each do |run| 
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
      
        hierarchy.each do |category, v|
            hierarchy[category] = v.sort_by { |sub_category, run| get_key_from_category_subcategory(category, sub_category) }.to_h
        end
    
        hierarchy = hierarchy.sort_by { |k,v| get_category_order(k) }
    
        return hierarchy.to_h
    end    
end
