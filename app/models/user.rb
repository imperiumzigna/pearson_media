# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :string(255)      default(NULL)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  organization_id        :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_organization_id       (organization_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  attr_accessor :organization_slug
  include OrganizationAuthenticable

  belongs_to :organization
  devise :database_authenticatable, :validatable

  enum role: { writer: "writer", editor: "editor" }

  scope :is_writer, -> { where(role: :writer) }
  scope :is_reviewer, -> { where(role: :reviewer) }

  has_many :written_stories, class_name: "Story", foreign_key: "writer_id"
  has_many :reviewed_stories, class_name: "Story", foreign_key: "reviewer_id"
end
