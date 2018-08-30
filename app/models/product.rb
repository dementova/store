class Product < ActiveRecord::Base
  # STATUS = {
  #   answered:     'ANSWERED',
  #   no_answered:  'NO ANSWER',
  #   busy:         'BUSY',
  #   failed:       'FAILED',
  #   congestion:   'CONGESTION',
  #   lost_on_ivr:  'LOST_ON_IVR'
  # }

  # enum call_type: [ :incoming, :outgoing ]
end