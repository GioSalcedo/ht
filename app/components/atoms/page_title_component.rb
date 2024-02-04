# frozen_string_literal: true

class Atoms::PageTitleComponent < ViewComponent::Base
  def initialize(title)
    @title = title
  end
end
