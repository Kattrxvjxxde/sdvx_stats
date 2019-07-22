class Chart < ApplicationRecord
  extend Enumerize
  enumerize :difficult, in: { NOV: 0, ADV: 1, EXH: 2, MXM: 3, INF: 4, GRV: 5, HVN: 6, VVD: 7 }
end
