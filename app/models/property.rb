class Property < ActiveRecord::Base
	has_many :photos

	CATEGORIES = ['Architecture', 'Interior Design', 'Renovations', 'Additions', 'Works In Progress']
end
