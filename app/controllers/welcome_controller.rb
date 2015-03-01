class WelcomeController < ApplicationController
	require "eurovision"
  
  def index
  	result = Eurovision.getAll()
    @songs = Array.new 
    result.each do |song|
      @new_song = Song.new
      @new_song.from_json(song.to_json)     
      @songs << @new_song       
    end
  end

def dynamo_write

    key = "xxx"
    secret ="xxxx"

    dynamodb = Aws::DynamoDB::Client.new( 
      :access_key_id => key,
      :secret_access_key => secret,
      :region => 'eu-west-1')


    @user = User.find(session[:user_id])
    user_access = prepare_access_token_user(@user.access_token, @user.access_secret, @user.consumer_token, @user.consumer_secret)
    @response = user_access.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")

    tweets = JSON.parse(@response.body)
    tweets.each do |item|
      item = {
        item_id: item["id"].to_i,
        name: item["name"],
        name: item["text"]
      }
      dynamodb.put_item(table_name:"my_books", :item => item)
    end

    render json: "ALL DONE"
end



def dynamo

    key = "xxx"
    secret ="xxx"

    dynamodb = Aws::DynamoDB::Client.new( 
      :access_key_id => key,
      :secret_access_key => secret,
      :region => 'eu-west-1')

    dynamodb.create_table({
      # This section requires us to define our primary key 
      # Which will be called "item_id" and it must be a numerical value
      :attribute_definitions => [
        { :attribute_name => "test_id", :attribute_type => "N" }
      ],
      :table_name => "cop_test_table_3",
      # The primary key will be a simple Hash key (not a Hash/Range which requires both key types to be provided)
      # The attributes defined above must be included in the :key_schema Array
      :key_schema => [
        { :attribute_name => "test_id", :key_type => "HASH" }
      ],
      :provisioned_throughput => {
        :read_capacity_units  => 10,
        :write_capacity_units => 10
      }
    })

    render text: "Table has been created"

  end
  

end
