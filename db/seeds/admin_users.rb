pp '管理者 作成'

if AdminUser.find_by(id: 1)
  pp '既に存在しているためスキップ'
else
  pp AdminUser.create!(
    id: 1,
    name: 'test_user',
    email: 'test@test.com',
    password: 'test12345'
  )
end
