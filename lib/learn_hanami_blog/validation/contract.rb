# auto_register: false
# frozen_string_literal: true

require "dry/validation"
require "dry/schema/messages/i18n"
require "dry/monads"

module LearnHanamiBlog
  module Validation
    class Contract < Dry::Validation::Contract
      config.messages.backend = :i18n
      config.messages.top_namespace = "validation"
    end
  end
end

Dry::Validation.load_extensions(:monads)

module DryValidationResultMonadExtensions
  include Dry::Monads[:result]

  # Overrides the default behaviour so that all validation failures
  # have the :validation failure code by default.
  # If a more specific failure code is needed, handle it in the object
  # that calls the contract.
  def to_monad
    success? ? super : Failure[:validation, self]
  end
end
Dry::Validation::Result.prepend DryValidationResultMonadExtensions
