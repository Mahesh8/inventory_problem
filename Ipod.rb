
class Ipod
	def inventory
		n = 7
		while n.times do
			p "Input => " 
			data = gets.chomp
			split_data = data.split(":")
			no_of_order = split_data[1].strip.to_i
			place = split_data[0].strip.capitalize
			if (no_of_order % 5 == 0)
				p "Output => "
				check_stock(no_of_order, place)
			else
				puts "Error! You must enter orders only in multiples of 10. Try Again "
			end
		end       
	end

	def check_stock(no_of_order, place)
		brazil_stock = 100
		argentina_stock = 100
		cost_of_per_brazil_stock = 100
		total_stock = brazil_stock + argentina_stock
		cost_of_per_argentina_stock = 50
		no_of_order = no_of_order
		place = place
		if (no_of_order > total_stock)
			puts "Out Of Stock !"
		else
		    case place
		    when 'Brazil'
		    	if no_of_order <= brazil_stock
		    		cost_of_argentina_inven = no_of_order * cost_of_per_argentina_stock
		    		cost_of_brazil_inven = no_of_order * cost_of_per_brazil_stock
		    		if cost_of_argentina_inven < cost_of_brazil_inven
			    		after_deduction_brazil_stock = brazil_stock
			    		after_deduction_argentina_stock = argentina_stock - no_of_order
			    		cost_in_transportation = (no_of_order / 10).to_i * 400 
			    		cost_of_shipped_argentina_stock = cost_of_argentina_inven + cost_in_transportation
			    		puts "#{cost_of_shipped_argentina_stock}" + ":" + "#{after_deduction_brazil_stock}" + ":" + "#{after_deduction_argentina_stock}"
			    	else
			    		after_deduction_brazil_stock = brazil_stock - no_of_order
			    		after_deduction_argentina_stock = argentina_stock
		    			puts "#{cost_of_brazil_inven}" + ":" + "#{after_deduction_brazil_stock}" + ":" + "#{after_deduction_argentina_stock}"
			    	end

		    	else
		    		after_deduction_brazil_stock = 0
		    		after_deduction_argentina_stock = argentina_stock - (no_of_order - brazil_stock)
		    		used_argentina_stock = aregentina_stock - after_deduction_argentina_stock
		    		cost_in_transportation = (used_argentina_stock / 10).to_i * 400
		    		cost_of_shipped_argentina_stock = (used_argentina_stock * cost_of_per_argentina_stock) + cost_in_transportation
		    		cost_of_brazil_inven = (brazil_stock * cost_of_per_brazil_stock) + cost_of_shipped_argentina_stock
		    		puts "#{cost_of_brazil_inven}" + ":" + "#{after_deduction_brazil_stock}" + ":" + "#{after_deduction_argentina_stock}"
		    	end
		    when 'Argentina'
		    	if no_of_order <= argentina_stock
		    		cost_of_argentina_inven = no_of_order * argentina_stock
		    		after_deduction_brazil_stock = brazil_stock
			    	after_deduction_argentina_stock = argentina_stock - no_of_order
			    	puts "#{cost_of_argentina_inven}" + ":" + "#{after_deduction_argentina_stock}" + ":" + "#{after_deduction_brazil_stock}"
			    else
		    		after_deduction_argentina_stock = 0
		    		after_deduction_brazil_stock = brazil_stock - (no_of_order - argentina_stock)
		    		used_brazil_stock = brazil_stock - after_deduction_brazil_stock
		    		cost_in_transportation = (used_brazil_stock / 10).to_i * 400
		    		cost_of_shipped_brazil_stock = (used_brazil_stock * cost_of_per_brazil_stock) + cost_in_transportation
		    		cost_of_argentina_inven = (argentina_stock * cost_of_per_argentina_stock) + cost_of_shipped_brazil_stock
		    		puts "#{cost_of_argentina_inven}" + ":" + "#{after_deduction_argentina_stock}" + ":" + "#{after_deduction_brazil_stock}"
		    	end
		    else
		    	puts "Something is wrong"
		    end
	    end
	end
end

ipod = Ipod.new
ipod.inventory