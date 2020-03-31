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
require "test_helper"

class StoryTest < ActiveSupport::TestCase
  should validate_presence_of(:headline)
  should validate_presence_of(:body)
end
