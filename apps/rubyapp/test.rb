require 'mongo'
require 'sinatra'

set :bind, '0.0.0.0'

include Mongo

# connecting to the database
client = MongoClient.new # defaults to localhost:27017
db     = client['example-db']
coll   = db['example-collection']

get '/add/:address' do
  coll.insert({ :address => params['address'] })
  return 'OK'
end

get '/find/:address' do
  res = coll.find({"address" => params['address']})
  return res.to_a.to_s
end
