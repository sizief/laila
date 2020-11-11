namespace :create_orders do
  desc "Create tasks"
  task orders: :environment do
    user = User.first
    1.upto 1000 do
      start = Time.now
      1.upto 250 do
        user.orders.create(
          position: 'sell',
          amount: rand(1..100),
          price: rand(100..1000),
          fulfilled: false
        )
      end
      puts("time spent: #{Time.now - start}")
    end
  end

end
