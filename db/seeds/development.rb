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

events = Event.create!([
                         { title: 'TokyuRubyKaigi 15', status: 3 },
                         { title: 'TokyuRubyKaigi 16', status: 1 }
                       ])

entries = Entry.create!(
  [
    # food entries
    {
      user_id: users[0].id,
      category_id: categories[0].id,
      title: 'お菓子の家',
      event_id: events[0].id
    },
    {
      user_id: users[1].id,
      category_id: categories[0].id,
      title: 'パンケーキ',
      event_id: events[0].id
    },
    {
      user_id: users[2].id,
      category_id: categories[0].id,
      title: '一から作ったラーメン',
      event_id: events[0].id
    },
    {
      user_id: users[3].id,
      category_id: categories[0].id,
      title: '元気が出るパスタ',
      event_id: events[0].id
    },
    {
      user_id: users[0].id,
      category_id: categories[0].id,
      title: 'クッキー',
      event_id: events[0].id
    },
    {
      user_id: users[4].id,
      category_id: categories[0].id,
      title: 'フレンチトースト',
      event_id: events[0].id
    },
    {
      user_id: users[5].id,
      category_id: categories[0].id,
      title: 'ミートボールスパゲッティ',
      event_id: events[0].id
    },
    {
      user_id: users[1].id,
      category_id: categories[1].id,
      title: 'カクテル',
      event_id: events[0].id
    },
    {
      user_id: users[3].id,
      category_id: categories[1].id,
      title: 'クラフトビール',
      event_id: events[0].id
    },
    {
      user_id: users[2].id,
      category_id: categories[1].id,
      title: 'ワイン',
      event_id: events[0].id
    },
    {
      user_id: users[5].id,
      category_id: categories[1].id,
      title: 'フルーツ酒',
      event_id: events[0].id
    },
    {
      user_id: users[4].id,
      category_id: categories[1].id,
      title: '日本酒',
      event_id: events[0].id
    },
    {
      user_id: users[1].id,
      category_id: categories[2].id,
      title: 'LTについて話す',
      event_id: events[0].id
    },
    {
      user_id: users[2].id,
      category_id: categories[2].id,
      title: 'プレゼンのコツ',
      event_id: events[0].id
    },
    {
      user_id: users[3].id,
      category_id: categories[2].id,
      title: 'LTああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ',
      event_id: events[0].id
    },
    {
      user_id: users[2].id,
      category_id: categories[0].id,
      title: 'おにぎり',
      event_id: events[1].id
    },
    {
      user_id: users[1].id,
      category_id: categories[0].id,
      title: 'カレーライス',
      event_id: events[1].id
    },
    {
      user_id: users[3].id,
      category_id: categories[0].id,
      title: 'フレンチトースト',
      event_id: events[1].id
    },
    {
      user_id: users[4].id,
      category_id: categories[0].id,
      title: '手巻き寿司',
      event_id: events[1].id
    },
    {
      user_id: users[0].id,
      category_id: categories[0].id,
      title: 'クッキー',
      event_id: events[1].id
    },
    {
      user_id: users[4].id,
      category_id: categories[0].id,
      title: 'はちみつトースト',
      event_id: events[1].id
    },
    {
      user_id: users[5].id,
      category_id: categories[0].id,
      title: 'ハンバーグ',
      event_id: events[1].id
    },
    {
      user_id: users[2].id,
      category_id: categories[1].id,
      title: 'サングリア',
      event_id: events[1].id
    },
    {
      user_id: users[3].id,
      category_id: categories[1].id,
      title: 'オリジナルクラフトビール',
      event_id: events[1].id
    },
    {
      user_id: users[1].id,
      category_id: categories[1].id,
      title: '赤ワイン',
      event_id: events[1].id
    },
    {
      user_id: users[5].id,
      category_id: categories[1].id,
      title: 'フルーツ酒',
      event_id: events[1].id
    },
    {
      user_id: users[4].id,
      category_id: categories[1].id,
      title: '日本酒',
      event_id: events[1].id
    },
    {
      user_id: users[1].id,
      category_id: categories[2].id,
      title: '型について',
      event_id: events[1].id
    },
    {
      user_id: users[2].id,
      category_id: categories[2].id,
      title: 'LT大好きについて',
      event_id: events[1].id
    },
    {
      user_id: users[3].id,
      category_id: categories[2].id,
      title: 'LTああああああああああああああああああああああああああああ',
      event_id: events[1].id
    }

  ]
)

Vote.create!(
  [
    {
      entry_id: entries[0].id,
      user_id: users[1].id,
      comment: '最高でした！'
    },
    {
      entry_id: entries[0].id,
      user_id: users[2].id,
      comment: 'めっちゃおいしかったでーーーーーーす！'
    },
    {
      entry_id: entries[0].id,
      user_id: users[3].id,
      comment: 'いっぱい食べちゃいましたよ！'
    },
    {
      entry_id: entries[1].id,
      user_id: users[2].id,
      comment: '美味しかったですまた食べたいです！'
    },
    {
      entry_id: entries[1].id,
      user_id: users[3].id,
      comment: '作り方おしえてほしいです〜〜〜〜！'
    },
    {
      entry_id: entries[2].id,
      user_id: users[4].id,
      comment: 'このラーメンは傑作です！'
    },
    {
      entry_id: entries[3].id,
      user_id: users[5].id,
      comment: 'このパスタは元気が出ますね！'
    },
    {
      entry_id: entries[7].id,
      user_id: users[0].id,
      comment: '素晴らしいカクテルでした！'
    },
    {
      entry_id: entries[8].id,
      user_id: users[1].id,
      comment: 'クラフトビールは最高！'
    },
    {
      entry_id: entries[9].id,
      user_id: users[2].id,
      comment: 'レモネードがさっぱりして美味しい！'
    },
    {
      entry_id: entries[10].id,
      user_id: users[3].id,
      comment: 'フルーツジュース美味しかったです！'
    },
    {
      entry_id: entries[11].id,
      user_id: users[4].id,
      comment: 'アイスコーヒーがとても爽やかでした。'
    },
    {
      entry_id: entries[12].id,
      user_id: users[0].id,
      comment: 'LTについて色々学びました。'
    },
    {
      entry_id: entries[13].id,
      user_id: users[1].id,
      comment: 'プレゼンのコツをもっと知りたいです。'
    },
    {
      entry_id: entries[14].id,
      user_id: users[2].id,
      comment: '成功するプレゼンについてすごく参考になりましたあああああああああああああああああああああああああああああああああああああああああああああ'
    },
    {
      entry_id: entries[15].id,
      user_id: users[1].id,
      comment: '最高でした！'
    },
    {
      entry_id: entries[16].id,
      user_id: users[2].id,
      comment: 'めっちゃおいしかったでーーーーーーす！'
    },
    {
      entry_id: entries[17].id,
      user_id: users[3].id,
      comment: 'いっぱい食べちゃいましたよ！'
    },
    {
      entry_id: entries[17].id,
      user_id: users[2].id,
      comment: '美味しかったですまた食べたいです！'
    },
    {
      entry_id: entries[15].id,
      user_id: users[3].id,
      comment: '作り方おしえてほしいです〜〜〜〜！'
    },
    {
      entry_id: entries[20].id,
      user_id: users[4].id,
      comment: 'これは傑作です！'
    },
    {
      entry_id: entries[19].id,
      user_id: users[5].id,
      comment: 'このパスタは元気が出ますね！'
    },
    {
      entry_id: entries[25].id,
      user_id: users[0].id,
      comment: 'おいしかったです！'
    },
    {
      entry_id: entries[24].id,
      user_id: users[1].id,
      comment: '最高！'
    },
    {
      entry_id: entries[16].id,
      user_id: users[3].id,
      comment: 'さっぱりして美味しい！'
    },
    {
      entry_id: entries[22].id,
      user_id: users[3].id,
      comment: '美味しかったです！'
    },
    {
      entry_id: entries[23].id,
      user_id: users[4].id,
      comment: 'とても爽やかでした。'
    },
    {
      entry_id: entries[27].id,
      user_id: users[0].id,
      comment: 'LTについて色々学びました。'
    },
    {
      entry_id: entries[28].id,
      user_id: users[1].id,
      comment: 'プレゼンのコツをもっと知りたいです。'
    },
    {
      entry_id: entries[29].id,
      user_id: users[2].id,
      comment: '成功するプレゼンについてすごく参考になりましたあああああああああああああああああああああああああああああああああああああああああああああ'
    }
  ]
)
