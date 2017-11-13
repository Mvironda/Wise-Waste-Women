require 'sinatra'
require 'csv'

get '/' do

	@boroughs = CSV.read("boroughs.csv").flatten
	erb :index

end

get '/boroughs/:borough_name' do
	@borough = params[:borough_name]

	erb :borough
end
