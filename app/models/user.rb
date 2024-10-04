# frozen_string_literal: true

class User < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :votes, dependent: :destroy

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]

    User.find_or_create_by!(provider:, uid:) do |user|
      user.name = nickname
    end
  end

  def log_in
    session_token = SecureRandom.urlsafe_base64
    update(session_digest: BCrypt::Password.create(session_token))
    session_token
  end

  def log_out
    update(session_digest: nil)
  end

  def authenticated?(token)
    return false if session_digest.nil?

    BCrypt::Password.new(session_digest).is_password?(token)
  end
end
