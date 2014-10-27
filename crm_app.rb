#CRM application assignment

require_relative './contacts.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name

	def initialize(name)
		puts "Welcome to #{@name}'s CRM application!"
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
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
		
		while true
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7 
			interpret_option(input)
		end	
	end

	def interpret_option(input)
		case input 
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_all_contact
			when 4 then display_contact
			when 5 then display_attribute
			when 6 then delete
			else
				return
		end
	end

	def add_contact
		print "First name: "
			first_name = gets.chomp.downcase.capitalize
		print "Last name: "
			last_name = gets.chomp.downcase.capitalize
		print "Email: "
			email = gets.chomp.downcase.capitalize
		print "Notes: "
			notes = gets.chomp.downcase.capitalize

		contact = Contacts.new(first_name, last_name, email, notes)
		@rolodex.add_contact(contact)
		puts "The contact has been added."
	end

	def display_contact
		puts "Please enter the first name of the contact you would like to display: "
		first_name = gets.chomp.downcase.capitalize
		@rolodex.display_contact(first_name)
		if @rolodex.searched_contact == true
			contact = @rolodex.contact_of_interest
			put_statement_for_contacts(contact)
		else
			puts "The contact does not exist!"
		end
		
	end

	def display_all_contact
		puts "The following contacts were found in your crm application:"
		@rolodex.contacts.each do |contact|
		put_statement_for_contacts(contact)
		end
	end

	def modify_contact
		puts "What is the first name of the contact that you wish to modify?"
		first_name = gets.chomp.downcase.capitalize
		@rolodex.search_contact(first_name)
		if @rolodex.searched_contact == true
			contact_to_modify = @rolodex.contact_of_interest
			puts "Which attribute would you like to modify?"
			put_statement_for_contacts(contact_to_modify)
			puts "[1] First Name"
			puts "[2] Last Name"
			puts "[3] Email"
			puts "[4] Notes"
			attribute_to_modify = gets.chomp.to_i
			puts "Are you sure you want to change this attribute? (Yes/No):"
			confirmation = gets.chomp.downcase.capitalize
				if confirmation == "Yes"
					puts "What would you like to modify the attribute to?"
					modified_attribute = gets.chomp.downcase.capitalize
					@rolodex.modify_contact(attribute_to_modify, modified_attribute)
					puts "Success! The contact's information has been updated."
				elsif confirmation == "No"
					return
				end
			
		else
			puts "The contact does not exist!"	
		end
	end

	def display_attribute
		puts "What attribute would you like to display?"
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email"
		puts "[4] Notes"
		attribute_to_display = gets.chomp.to_i
		@rolodex.display_attribute(attribute_to_display)

	end

	def put_statement_for_contacts(contact)
		puts "ID: #{contact.id}, First Name: #{contact.first_name}, Last Name: #{contact.last_name}, Email: #{contact.email}, Notes: #{contact.notes}"
	end

end

crm = CRM.new("Vincent")
crm.main_menu