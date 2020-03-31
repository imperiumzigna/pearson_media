# frozen_string_literal: true

# == Schema Information
#
# Table name: stories
#
#  id          :bigint           not null, primary key
#  body        :text(65535)
#  deleted_at  :datetime
#  headline    :string(255)
#  status      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reviewer_id :bigint
#  writer_id   :bigint
#
# Indexes
#
#  index_stories_on_deleted_at   (deleted_at)
#  index_stories_on_reviewer_id  (reviewer_id)
#  index_stories_on_writer_id    (writer_id)
#
# Foreign Keys
#
#  fk_rails_...  (reviewer_id => users.id)
#  fk_rails_...  (writer_id => users.id)
#
class Story < ApplicationRecord
  include AASM
  include StoryEvents

  scope :by_writer, ->(id) { where(writer_id: id) }
  scope :by_writer_or_reviewer, ->(id) { where(writer_id: id).or(where(reviewer_id: id)) }
  scope :by_status, -> (s) { where(status: s) }

  belongs_to :writer, optional: true, class_name: "User"
  belongs_to :reviewer, optional: true, class_name: "User"

  acts_as_paranoid

  validates :headline, :body, presence: true
end
