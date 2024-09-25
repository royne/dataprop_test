class Property < ApplicationRecord
  include DescriptionValidation

  enum property_type: {
    rent: 'rent',
    sale: 'sale'
  }
  enum currency: {
    usd: 'USD',
    clp: 'CLP'
  }

  validates :price, numericality: { greater_than: 0 }
  validates :commune, :address, presence: true
  validates :latitude, :longitude, presence: true
  validate :at_least_one_photo
  validate :description_cannot_contain_contact_info

  belongs_to :user
  has_one_attached :photo

  def at_least_one_photo
    errors.add(:photo, "must have at least one attached photo") if photo.blank?
  end
end
