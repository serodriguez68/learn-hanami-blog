# frozen_string_literal: true

require "learn_hanami_blog/repository"
require_relative "entities"

module Admin
  class Repository < LearnHanamiBlog::Repository
    struct_namespace Entities
  end
end
