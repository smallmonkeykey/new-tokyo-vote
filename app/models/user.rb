# frozen_string_literal: true

class User < ApplicationRecord
  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]

    User.find_or_create_by!(provider:, uid:) do |user|
      user.name = nickname
    end
  end
end
