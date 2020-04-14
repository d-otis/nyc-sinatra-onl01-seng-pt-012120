class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
  	@landmarks = Landmark.all

  	erb :'/landmarks/index'
  end

  get '/landmarks/new' do
  	erb :'/landmarks/new'
  end

  get '/landmarks/:slug' do
  	@landmark = Landmark.find_by_slug(params[:slug])

  	erb :'/landmarks/show'
  end

  get '/landmarks/:slug/edit' do
  	@landmark = Landmark.find_by_slug(params[:slug])

  	erb :'landmarks/edit'
  end

  patch '/landmarks/:slug' do
  	landmark = Landmark.find_by_slug(params[:slug])
  	landmark.update(params[:landmark])

  	redirect "/landmarks/#{landmark.slug}"
  end

  post '/landmarks' do
  	landmark = Landmark.create(params[:landmark])
  	landmark.update(params[:landmark])

  	redirect "/landmarks/#{landmark.slug}"
  end
end
