# frozen_string_literal: true

module StoryEvents
  extend ActiveSupport::Concern
  included do
  aasm column: :status do
  state :unassigned, initial: true
  state :draft
  state :for_review
  state :in_review
  state :pending
  state :approved
  state :published
  state :archived

  event :assigned do
    transitions from: :unassigned, to: :draft
  end

  event :drafted do
    transitions from: :draft, to: :for_review
  end

  event :reviewing do
    transitions from: :for_review, to: :in_review
  end

  event :requested_changes do
    transitions from: :in_review, to: :pending
  end

  event :requested_changes do
    transitions from: :in_review, to: :pending
  end

  event :approve do
    transitions from: :pending, to: :approved
  end

  event :publish do
    transitions from: :approved, to: :published
  end

  event :archive do
    transitions from: :published, to: :archive
  end
end
end
end
