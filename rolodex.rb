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

	def modify_contact(attribute, modified_attribute)
			if attribute == 1 
				@contact_of_interest.first_name = modified_attribute
			elsif attribute == 2
				@contact_of_interest.last_name = modified_attribute
			elsif attribute == 3
				@contact_of_interest.email = modified_attribute
			elsif attribute == 4 
				@contact_of_interest.notes = modified_attribute
			end
	end

	def display_attribute(attribute_to_display)
		@contacts.each do |contact|
			if attribute_to_display == 0
				puts "#{contact.id}"
			elsif attribute_to_display == 1
				puts "#{contact.first_name}"
			elsif attribute_to_display == 2
				puts "#{contact.last_name}"
			elsif attribute_to_display == 3
				puts "#{contact.email}"
			elsif attribute_to_display == 4
				puts "#{contact.notes}"
			end
		end
	end

	def delete(attribute_to_delete)
		puts "#{attribute_to_delete}"
	end
end