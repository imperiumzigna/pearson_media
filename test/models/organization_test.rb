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
require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  should validate_presence_of(:name)

  test "slug creation" do
    one = Organization.create(name: "Some Organization")
    assert_equal "some-organization", one.slug
  end
end
