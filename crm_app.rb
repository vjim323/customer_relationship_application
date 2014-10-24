#CRM application assignment

class CRM
	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "Welcome to #{@name}'s CRM application!"
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display a contact"
		puts "[5] Display attribute"
		puts "[6] Delete"
		puts "[7] Exit"
		puts "Please select an option from the list above: "
	end

	def main_menu
		
		input = gets.chomp.to_i
		interpret_option(input)
	end

	def interpret_option(input)
		case input 
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_all_contact
			when 4 then display_contact
			when 5 then display_attribute
			when 6 then delete
			when 7 
				return
			else
				return
		end
	end

	def add_contact
		print "First name: "
			first_name = gets.chomp
		print "Last name: "
			last_name = gets.chomp
		print "Email: "
			email = gets.chomp
		print "Notes: "
			notes = gets.chomp
	end
end

crm = CRM.new("Vincent")
crm.print_main_menu
crm.main_menu