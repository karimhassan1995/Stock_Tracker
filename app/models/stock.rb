class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users , through: :user_stocks

    validates :name , :ticker ,presence: true
    
   
    def self.new_lookup(title)
   
            #ده =#{title} اللي بيخليني اقدر اكتب اي تايتل او فاليو و يظهر الريكورد 
            # الكود ده بيخليني اختار اوبجكت واحد من الاراي اللي عندي 
        response = Faraday.get("https://dummyjson.com/products/search?q=#{title}" )
        data = JSON.parse response.body
        products = data['products']
        
        # الاوبجكت اللي انت اختارته بيكون ترتيبه صفر اندكس
        begin
            new(ticker: title , name: products[0]['brand'] , last_price: products[0]['price'])
                rescue => exception
            return nil
        end
   
    end

    def self.check_db(ticker_symbol)
        where(ticker: ticker_symbol).first
    end
end


