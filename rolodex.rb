class Rolodex
	attr_reader :contacts

	@@index = 0000

	def initialize
		@contacts = []
	end
	
	def add_contact(contact)
		@@index += 1
		contact.id = @@index
		@contacts << contact
	end

	def display_contact(first_name)
		search_contact(first_name)
		# if @searched_contact == true
				
		# 	end	

	end

	def search_contact(first_name)
		@contacts.each do |contact_to_be_searched|
			if first_name == contact_to_be_searched.first_name
				@searched_contact = true
				puts "the contact is here"
			else
				@searched_contact = false
				puts "no such contact"
			end
		end
	end
end