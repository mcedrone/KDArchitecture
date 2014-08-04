class Property < ActiveRecord::Base
	has_many :photos, dependent: :destroy

	CATEGORIES = ['Architecture', 'Interior Design', 'Renovations', 'Additions', 'Works In Progress']
end
