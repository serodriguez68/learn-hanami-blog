# auto_register: false

module LearnHanamiBlog
  module Entities
  end
end

Dir[File.join(__dir__, "entities", "*.rb")].each(&method(:require))
