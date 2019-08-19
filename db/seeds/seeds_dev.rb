return if Rails.env.production?

# Player
pp 'プレイヤー作成'

(1..99).each do |n|
  num_str = n.to_s.rjust(2, '0')
  player = Player.create!(
    status: 1,
    rival_id: "SV-9999-99#{num_str}",
    name: "test_player_#{num_str}",
    volforce: (1000 + n),
    puc_diff_nov: n,
    puc_diff_adv: n,
    puc_diff_exh: n,
    puc_diff_mxm: n,
    puc_diff_fx: n,
    puc_lv_1: n,
    puc_lv_2: n,
    puc_lv_3: n,
    puc_lv_4: n,
    puc_lv_5: n,
    puc_lv_6: n,
    puc_lv_7: n,
    puc_lv_8: n,
    puc_lv_9: n,
    puc_lv_10: n,
    puc_lv_11: n,
    puc_lv_12: n,
    puc_lv_13: n,
    puc_lv_14: n,
    puc_lv_15: n,
    puc_lv_16: n,
    puc_lv_17: n,
    puc_lv_18: n,
    puc_lv_19: n,
    puc_lv_20: n
  )

  pp "create: #{player.name}"
end
