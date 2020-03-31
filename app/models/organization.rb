# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true

  before_save :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end
end
