if Rails.env.production?
  pp 'トークン作成：スキップ'
else
  pp '----- トークン作成 開始 -----'
  pp ''

  if Token.find_by(id: 1)
    pp '既に存在しているためスキップ'
  else
    pp Token.create!(
      id: 1,
      key: 'token123'
    )
  end

  pp ''
  pp '----- トークン作成 終了 -----'
end
