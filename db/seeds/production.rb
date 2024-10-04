# frozen_string_literal: true

users = User.create!(
  [
    {
      name: 'sue445'
    },
    {
      name: 'neko314'
    },
    {
      name: 'Toshio Maki'
    },
    {
      name: 'ryopeko with 子peko'
    },
    {
      name: '乙羽屋'
    },
    {
      name: 'Shu Oogawara (@expajp)'
    },
    {
      name: 'すずか(suzuka_hori)'
    },
    {
      name: 'yancya'
    },
    {
      name: '川村 徹 (@tkawa)'
    },
    {
      name: 'kei-q'
    },
    {
      name: '舩越南斗'
    },
    {
      name: 'しおい(@coe401_)'
    },
    {
      name: '小林悟史（ノエル'
    },
    {
      name: 'yasulab'
    },
    {
      name: 'Hiroki Mori'
    },
    {
      name: 'joker1007'
    },
    {
      name: 'kwappa'
    },
    {
      name: '大倉雅史'
    },
    {
      name: '村上 佳久'
    },
    {
      name: 'tk0miya'
    },
    {
      name: '早川遼 (rira100000000)'
    },
    {
      name: 'えりりん'
    },
    {
      name: '桐生あんず'
    },
    {
      name: 'Risa Okutani'
    },
    {
      name: 'osyoyu'
    },
    {
      name: 'junk0612'
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

Entry.create!(
  [
    {
      user_id: users[0].id,
      category_id: categories[2].id,
      title: '135日のRubyist'
    },
    {
      user_id: users[1].id,
      category_id: categories[2].id,
      title: "Happy 20's anniversary to our Rubyist Magazine"
    },
    {
      user_id: users[2].id,
      category_id: categories[2].id,
      title: 'Omotesando.rbを配信する技術'
    },
    {
      user_id: users[3].id,
      category_id: categories[2].id,
      title: 'What I did to let my son know about my work'
    },
    {
      user_id: users[5].id,
      category_id: categories[2].id,
      title: '(@expajp)	Rubyはなぜ「たのしい」のか'
    },
    {
      user_id: users[6].id,
      category_id: categories[2].id,
      title: '山手線一周のパフォーマンス改善'
    },
    {
      user_id: users[7].id,
      category_id: categories[2].id,
      title: 'Rubyistが量子コンピュータープログラミングを？'
    },
    {
      user_id: users[8].id,
      category_id: categories[2].id,
      title: '“Cache to Your Advantage”の裏側'
    },
    {
      user_id: users[9].id,
      category_id: categories[2].id,
      title: 'Rubyistのみんなに私の推しのDuckDBを紹介させてください'
    },
    {
      user_id: users[10].id,
      category_id: categories[2].id,
      title: 'railsジョブの実装パターンを考える'
    },
    {
      user_id: users[11].id,
      category_id: categories[2].id,
      title: 'XPE2-bookclub explained'
    },
    {
      user_id: users[12].id,
      category_id: categories[2].id,
      title: 'Ruby on RailsとDjangoを比較してみる'
    },
    {
      user_id: users[14].id,
      category_id: categories[2].id,
      title: 'mruby三兄弟'
    },
    {
      user_id: users[15].id,
      category_id: categories[2].id,
      title: '5分で分かった気になるDebezium'
    },
    {
      user_id: users[16].id,
      category_id: categories[2].id,
      title: 'ビアバーを間借りで営業してみたけど何か質問ある？'
    },
    {
      user_id: users[17].id,
      category_id: categories[2].id,
      title: 'TokyuRuby会議15記念、RubyのJSONシリアライザ15個解説'
    },
    {
      user_id: users[18].id,
      category_id: categories[2].id,
      title: 'あるデザインパターンの導入に失敗した話'
    },

    {
      user_id: users[19].id,
      category_id: categories[2].id,
      title: 'Rails に型を導入するための長い道のり'
    },
    {
      user_id: users[20].id,
      category_id: categories[2].id,
      title: 'Rubyのsuccとnextはエイリアスじゃないの？'
    },
    {
      user_id: users[21].id,
      category_id: categories[2].id,
      title: '初めて海外カンファレンスで登壇しました'
    },
    {
      user_id: users[22].id,
      category_id: categories[2].id,
      title: 'チームで管理する10個のRailsアプリの CI/CD を CircleCI から GitHub Actions に移行した時の話'
    },
    {
      user_id: users[23].id,
      category_id: categories[2].id,
      title: 'TokyuRuby会議の投票アプリを作った話'
    },
    {
      user_id: users[24].id,
      category_id: categories[2].id,
      title: 'ZigでC拡張をつくる 2024 Edition'
    },
    {
      user_id: users[25].id,
      category_id: categories[2].id,
      title: 'LR で JSON パーサーを作る 第2回'
    }
  ]
)
