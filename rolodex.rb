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
end