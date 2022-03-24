# frozen_string_literal: true

# Application service class
class ApplicationService
  def self.call(*args)
    new(*args).call
  end
end
