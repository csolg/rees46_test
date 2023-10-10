# frozen_string_literal: true

class ServiceSuccess < ServiceResponse
  def initialize(result = nil)
    super(true, result)
  end
end
