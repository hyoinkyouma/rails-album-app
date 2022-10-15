class Album < ApplicationRecord
  validates :title, :year, :description, :img_url, presence: true
end
