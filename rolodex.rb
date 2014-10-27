class Rolodex
	attr_reader :contacts, :contact_of_interest, :searched_contact

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
	end

	def search_contact(first_name)
		# matching_contacts_counter = 0
		@contacts.each do |contact_to_be_searched|
			if first_name == contact_to_be_searched.first_name
				@searched_contact = true
				# matching_contacts_counter += 1
				@contact_of_interest = contact_to_be_searched
			else
				@searched_contact = false
			end
		end
	end

	# def modify_contact(first_name)
	# 	search_contact(first_name)
	# 	unless @searched_contact == false
			
	# end
end