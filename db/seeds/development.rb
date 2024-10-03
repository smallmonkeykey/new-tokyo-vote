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
    },
    {
      provider: 'github',
      uid: '12345678',
      name: 'name5',
      session_digest: BCrypt::Password.create(SecureRandom.urlsafe_base64)
    },
    {
      provider: 'github',
      uid: '123456789',
      name: 'name6',
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
    # food entries
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
    },
    {
      user_id: users[4].id,
      category_id: categories[0].id,
      title: 'フレンチトースト'
    },
    {
      user_id: users[5].id,
      category_id: categories[0].id,
      title: 'ミートボールスパゲッティ'
    },
    {
      user_id: users[1].id,
      category_id: categories[1].id,
      title: 'カクテル'
    },
    {
      user_id: users[3].id,
      category_id: categories[1].id,
      title: 'クラフトビール'
    },
    {
      user_id: users[2].id,
      category_id: categories[1].id,
      title: 'ワイン'
    },
    {
      user_id: users[5].id,
      category_id: categories[1].id,
      title: 'フルーツ酒'
    },
    {
      user_id: users[4].id,
      category_id: categories[1].id,
      title: '日本酒'
    },
    {
      user_id: users[1].id,
      category_id: categories[2].id,
      title: 'LTについて話す'
    },
    {
      user_id: users[2].id,
      category_id: categories[2].id,
      title: 'プレゼンのコツ'
    },
    {
      user_id: users[3].id,
      category_id: categories[2].id,
      title: 'LTああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
    }
  ]
)

Vote.create!(
  [
    {
      entry_id: entries[0].id,
      user_id: users[1].id,
      comment: "最高でした！"
    },
    {
      entry_id: entries[0].id,
      user_id: users[2].id,
      comment: "めっちゃおいしかったでーーーーーーす！"
    },
    {
      entry_id: entries[0].id,
      user_id: users[3].id,
      comment: "いっぱい食べちゃいましたよ！"
    },
    {
      entry_id: entries[1].id,
      user_id: users[2].id,
      comment: "美味しかったですまた食べたいです！"
    },
    {
      entry_id: entries[1].id,
      user_id: users[3].id,
      comment: "作り方おしえてほしいです〜〜〜〜！"
    },
    {
      entry_id: entries[2].id,
      user_id: users[4].id,
      comment: "このラーメンは傑作です！"
    },
    {
      entry_id: entries[3].id,
      user_id: users[5].id,
      comment: "このパスタは元気が出ますね！"
    },
    # votes for drink entries
    {
      entry_id: entries[7].id,
      user_id: users[0].id,
      comment: "素晴らしいカクテルでした！"
    },
    {
      entry_id: entries[8].id,
      user_id: users[1].id,
      comment: "クラフトビールは最高！"
    },
    {
      entry_id: entries[9].id,
      user_id: users[2].id,
      comment: "レモネードがさっぱりして美味しい！"
    },
    {
      entry_id: entries[10].id,
      user_id: users[3].id,
      comment: "フルーツジュース美味しかったです！"
    },
    {
      entry_id: entries[11].id,
      user_id: users[4].id,
      comment: "アイスコーヒーがとても爽やかでした。"
    },
    {
      entry_id: entries[12].id,
      user_id: users[0].id,
      comment: "LTについて色々学びました。"
    },
    {
      entry_id: entries[13].id,
      user_id: users[1].id,
      comment: "プレゼンのコツをもっと知りたいです。"
    },
    {
      entry_id: entries[14].id,
      user_id: users[2].id,
      comment: "成功するプレゼンについてすごく参考になりましたあああああああああああああああああああああああああああああああああああああああああああああ"
    }
  ]
)
