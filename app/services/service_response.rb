# frozen_string_literal: true

class ServiceResponse
  attr_reader :result

  def initialize(success, result)
    @success = success
    @result = result
  end

  def success?
    @success
  end

  def failure?
    !@success
  end
end
