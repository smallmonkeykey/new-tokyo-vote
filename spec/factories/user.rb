# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider { 'github' }
    uid { '1234567' }
    name { 'smallmonkeykey' }
    admin { true }
    session_digest { nil }
  end
end
