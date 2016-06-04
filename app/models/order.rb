class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipping_method
  belongs_to :payment_method
  enum status: {
    created:     0,
    in_progress: 1,
    sent:        2,
    aproved:     3,
    declined:    4,
    waiting:     5,
  }
  scope :index, -> { includes(:shipping_method, :payment_method).order(created_at: :desc) }
  scope :all_summ, -> (from=Time.now, to=30.days.ago, status=3) { where("created_at > ?", to).where("created_at < ?", from).where(status: status).map{|o| ActiveSupport::JSON.decode(o[:data]).map{|i| i["price"].to_f * i["amount"].to_i }.inject(0){|sum,x| sum + x } }.inject(0){|sum,x| sum + x }  }
end
