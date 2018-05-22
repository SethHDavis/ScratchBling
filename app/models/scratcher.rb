class Scratcher < ApplicationRecord
  validates_presence_of :name, :description, :size, :price
end
