# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_or_create_from_auth_hash!' do
    it '新しいユーザーを作成する' do
      auth_hash = {
        provider: 'github',
        uid: '1234567',
        info: { nickname: 'smallmonkeykey' }
      }

      user = User.find_or_create_from_auth_hash!(auth_hash)

      expect(user.name).to eq('smallmonkeykey')
      expect(user.provider).to eq('github')
      expect(user.uid).to eq('1234567')
    end
  end
end
