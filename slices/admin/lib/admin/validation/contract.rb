# frozen_string_literal: true
require 'learn_hanami_blog/validation/contract'

# We have defined this to act as the "SliceValidation"
# Conceptually analogue to Rails' "ApplicationValidation"
# We can remove it if we don't need it
module Admin
  module Validation
    class Contract < LearnHanamiBlog::Validation::Contract
    end
  end
end
