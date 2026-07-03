class Event < ApplicationRecord
  has_many :vendors, dependent: :destroy
end