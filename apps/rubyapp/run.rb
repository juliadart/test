require 'mongo'
require 'sinatra'

set :bind, '0.0.0.0'

include Mongo

# connecting to the database
client = MongoClient.new # defaults to localhost:27017
db     = client['example-db']
coll   = db['example-collection']

get '/add/:forename/:surname' do
  coll.insert({ :forename => params['forename'], :surname => params['surname'] })
  return 'OK'
end

get '/find/:surname' do
  res = coll.find({"surname" => params['surname']})
  return res.to_a.to_s
end
