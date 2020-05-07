# auto_register: false
# frozen_string_literal: true

require "rom-repository"

module LearnHanamiBlog
  class Repository < ROM::Repository::Root
    include Deps[container: "persistence.rom"]
  end
end
