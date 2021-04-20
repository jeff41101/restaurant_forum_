class Category < ApplicationRecord
  validates_presence_of :name

  # if there's restaurant under the catogory, you cannot delete the catogory
   has_many :restaurants, dependent: :restrict_with_error
end
