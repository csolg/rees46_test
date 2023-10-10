# frozen_string_literal: true

class ServiceFailure < ServiceResponse
  attr_reader :error

  def initialize(error)
    super(false, nil)
    @error = error
  end
end
