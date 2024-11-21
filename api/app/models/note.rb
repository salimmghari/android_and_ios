class Note < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :body, presence: false
  
  belongs_to :user
end
