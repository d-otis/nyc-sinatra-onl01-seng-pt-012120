class ApplicationController < Sinatra::Base
	register Sinatra::ActiveRecordExtension
  set :views, proc { File.join(root, '../views/') }
  # register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end
end
