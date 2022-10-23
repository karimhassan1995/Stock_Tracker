class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
        publishable_token: 'pk_ba524c6483d749849302e7872cf14a85' ,
        endpoint: 'https://cloud.iexapis.com/v1' )

        client.price(ticker_symbol)
    end
end
