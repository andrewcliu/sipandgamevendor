class Vendor < ApplicationRecord
  belongs_to :event

  validates :ig_handle, uniqueness: { 
    scope: :event_id, 
    message: "is already registered for this event" 
  }
end