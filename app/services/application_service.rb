# frozen_string_literal: true

class ApplicationService
  def self.call(*, &)
    service = new(*, &)
    ServiceSuccess.new(service.call)
  rescue StandardError => e
    Rails.logger.error("Service failure #{name}:\n#{e.message}\n\n#{e.backtrace.join("\n")}")
    ServiceFailure.new(e)
  end
end
