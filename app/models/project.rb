class Project < ActiveRecord::Base
	belongs_to :user
	has_many :todo_lists, dependent: :destroy
end
