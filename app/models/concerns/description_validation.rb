module DescriptionValidation
  extend ActiveSupport::Concern

  included do
    validate :description_cannot_contain_contact_info
    validate :at_least_one_photo
  end

  private

  def at_least_one_photo
    errors.add(:photo, "must have at least one attached photo") if photo.blank?
  end

  def description_cannot_contain_contact_info
    if description.present? && contains_contact_info?(description)
      errors.add(:description, "cannot contain contact information like email, phone numbers, or URLs")
    end
  end

  def contains_contact_info?(text)
    email_regex = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\b/i
    phone_regex = /\b\d{3,}\b/
    url_regex = %r{https?://[^\s]+}

    text.match?(email_regex) || text.match?(phone_regex) || text.match?(url_regex)
  end
end
