# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create!(
  [
    {
      provider: 'github',
      uid: '1234',
      name: 'test1'
    },
    {
      provider: 'github',
      uid: '12345',
      name: 'test2'
    },
    {
      provider: 'github',
      uid: '123456',
      name: 'test3'
    },
    {
      provider: 'github',
      uid: '1234567',
      name: 'test4'
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
      nickname: '安藤忠雄',
      title: 'お菓子の家',
      image: nil
    },
    {
      user_id: users[1].id,
      category_id: categories[0].id,
      nickname: '伊藤博文',
      title: 'パンケーキ',
      image: nil
    },
    {
      user_id: users[2].id,
      category_id: categories[0].id,
      nickname: '坂本龍馬',
      title: '一から作ったラーメン',
      image: nil
    },
    {
      user_id: users[3].id,
      category_id: categories[0].id,
      nickname: '野口英世',
      title: '元気が出るパスタ',
      image: nil
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
      comment: '大好きです'
    }
  ]
)
