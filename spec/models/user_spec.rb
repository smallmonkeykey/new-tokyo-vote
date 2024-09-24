# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_or_create_from_auth_hash!' do
    it '新しいユーザーが作成される' do
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

  describe '#log_in' do
    let(:user) { FactoryBot.create(:user) }
    it 'セッショントークンを生成し、session_digestが更新される' do
      session_token = user.log_in

      expect(session_token).not_to be_nil
      expect(user.session_digest).not_to be_nil
      expect(BCrypt::Password.new(user.session_digest).is_password?(session_token)).to be true
    end
  end

  describe '#log_out' do
    let(:user) { FactoryBot.create(:user) }
    it 'session_digestがnilに更新される' do
      user.log_out

      expect(user.session_digest).to eq nil
    end
  end
end
