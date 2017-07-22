require 'net/http'

desc 'Pull BTC data, and insert into database'
task :btc_pull => :environment do
    url = URI('https://api.bitfinex.com/v1/pubticker/btcusd')
    
    http = Net::HTTP.new( url.host, url.port )
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    tick_val = http.request( request )
    
    if tick_val.code.to_i == 200
        parsed_tick_val = JSON.parse(tick_val.body)
        
        price = parsed_tick_val.values_at('mid')[0].to_f
        epoch_time = parsed_tick_val.values_at('timestamp')[0].to_i

        time = Time.at(epoch_time).to_datetime
        
        puts "Price = #{price}"
        puts "Time  = #{time}"
        
        btc_tick = BtcPrice.new(:price => price, :timestamp => time)
        btc_tick.save
    elsif
        puts "Pull failed"
    end
end