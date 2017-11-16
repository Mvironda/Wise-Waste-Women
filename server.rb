require 'sinatra'
require 'csv'
require 'twitter'

get '/' do

	@boroughs = CSV.read("boroughs.csv").flatten
	erb :index

end

get '/boroughs/:borough_name' do
	@borough = params[:borough_name]

	erb :borough
end

twitter_api = Twitter::REST::Client.new do |config|
config.consumer_key = "ti9FkhNaXjvBmt6kwnf8DbQEN"
config.consumer_secret = "HrrSzcOH7rBKvPrmQEpzMUovtfR4HEeD0N0SIjCcpiraZmepWo"
config.access_token = "836261833946382336-VszT2RSrGATyZVPaa1MlZ2FBajiBiL7"
config.access_token_secret = "JPl5BogxaMqW42WAVU7VXCuXkln1IhwxxeTV72WX9THo3"
end

get '/:search_query' do
	@search_query = params[:search_query]
	@tweets = client.search(@search_query)

	erb :tweet_list

end
