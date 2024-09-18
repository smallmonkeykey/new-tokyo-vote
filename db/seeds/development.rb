# frozen_string_literal: true

users = User.create!(
  [
    {
      provider: 'github',
      uid: '1234',
      name: 'name1',
      session_digest: BCrypt::Password.create(SecureRandom.urlsafe_base64)
    },
    {
      provider: 'github',
      uid: '12345',
      name: 'name2',
      session_digest: BCrypt::Password.create(SecureRandom.urlsafe_base64)
    },
    {
      provider: 'github',
      uid: '123456',
      name: 'name3',
      session_digest: BCrypt::Password.create(SecureRandom.urlsafe_base64)
    },
    {
      provider: 'github',
      uid: '1234567',
      name: 'name4',
      session_digest: BCrypt::Password.create(SecureRandom.urlsafe_base64)
    }
  ]
)

categories = Category.create!(
  [
    { category_name: 'food' },
    { category_name: 'drink' },
    { category_name: 'lt' }
  ]
)

entries = Entry.create!(
  [
    {
      user_id: users[0].id,
      category_id: categories[0].id,
      title: 'お菓子の家'
    },
    {
      user_id: users[1].id,
      category_id: categories[0].id,
      title: 'パンケーキ'
    },
    {
      user_id: users[2].id,
      category_id: categories[0].id,
      title: '一から作ったラーメン'
    },
    {
      user_id: users[3].id,
      category_id: categories[0].id,
      title: '元気が出るパスタ'
    },
    {
      user_id: users[0].id,
      category_id: categories[0].id,
      title: 'クッキー'
    }
  ]
)

Vote.create!(
  [
    {
      user_id: users[2].id,
      entry_id: entries[1].id,
      comment: 'すごかったです！'
    },
    {
      user_id: users[0].id,
      entry_id: entries[3].id,
      comment: ''
    },
    {
      user_id: users[0].id,
      entry_id: entries[3].id,
      comment: 'おいしかったです〜〜'
    },
    {
      user_id: users[1].id,
      entry_id: entries[1].id,
      comment: '優勝'
    },
    {
      user_id: users[0].id,
      entry_id: entries[2].id,
      comment: ''
    },
    {
      user_id: users[3].id,
      entry_id: entries[1].id,
      comment: '最高'
    },
    {
      user_id: users[3].id,
      entry_id: entries[1].id,
      comment: 'おいしかった'
    },
    {
      user_id: users[1].id,
      entry_id: entries[1].id,
      comment: '最高でした'
    },
    {
      user_id: users[1].id,
      entry_id: entries[4].id,
      comment: '大好きです'
    },
    {
      user_id: users[2].id,
      entry_id: entries[4].id,
      comment: 'また食べてみたいです'
    },
    {
      user_id: users[3].id,
      entry_id: entries[4].id,
      comment: '出会えて感謝'
    },
    {
      user_id: users[2].id,
      entry_id: entries[4].id,
      comment: '大好きです'
    },
    {
      user_id: users[1].id,
      entry_id: entries[0].id,
      comment: 'おいしかったです'
    },
    {
      user_id: users[2].id,
      entry_id: entries[0].id,
      comment: '大好きです'
    },
    {
      user_id: users[3].id,
      entry_id: entries[0].id,
      comment: '大好きです'
    }
  ]
)
