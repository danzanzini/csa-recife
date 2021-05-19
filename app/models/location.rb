class Location < ApplicationRecord
  before_save :set_slug

private
  def set_slug
    self.slug = name.parameterize
  end
end
