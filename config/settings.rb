# frozen_string_literal: true

require "learn_hanami_blog/types"

Hanami.application.settings do
  Types = LearnHanamiBlog::Types

  # Database
  setting :database_url, Types::String

  # Assets
  setting :precompiled_assets, Types::Params::Bool.optional.default(false)
  setting :assets_server_url, Types::String.optional.default("http://localhost:8080")
end
