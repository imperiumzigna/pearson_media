# frozen_string_literal: true

module OrganizationAuthenticable
  extend ActiveSupport::Concern
  included do
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      slug = conditions.delete(:organization_slug)
      where(conditions).joins(:organization).where('organizations.slug': slug).first
    end

    after_initialize do |user|
      self.organization_slug = organization&.slug
    end
  end
end
