class Vendor < ApplicationRecord
  belongs_to :event
  before_validation :normalize_attributes

  validates :ig_handle, uniqueness: { 
    scope: :event_id, 
    message: "is already registered for this event" 
  }


  private

  def normalize_attributes
    self.ig_handle = ig_handle&.strip&.downcase&.delete("@")
    self.name      = name&.strip
  end

end