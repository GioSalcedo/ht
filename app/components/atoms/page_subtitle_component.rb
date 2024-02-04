# frozen_string_literal: true

class Atoms::PageSubtitleComponent < ViewComponent::Base
  def initialize(subtitle)
    @subtitle = subtitle
  end
end
