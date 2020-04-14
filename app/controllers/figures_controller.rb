class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
  	@figures = Figure.all

  	erb :'/figures/index'
  end

  get '/figures/new' do
  	@figures = Figure.all
  	@titles = Title.all
  	@landmarks = Landmark.all

  	erb :'figures/new'
  end

  get '/figures/:id' do
  	@figure = Figure.find(params[:id])

  	erb :'/figures/show'
  end

  get '/figures/:id/edit' do
  	@figure = Figure.find(params[:id])
  	@titles = Title.all
  	@landmarks = Landmark.all

  	erb :'/figures/edit'
  end

  patch '/figures/:id' do
  	figure = Figure.find(params[:id])
  	figure.update(params[:figure])

  	figure.titles.create(params[:title]) if !params[:title][:name].empty?
  	figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty?

  	redirect "/figures/#{figure.id}"
  end

  post '/figures' do
  	figure = Figure.create(params[:figure])

  	figure.titles.create(params[:title]) if !params[:title][:name].empty?

  	figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty?

  	redirect "/figures/#{figure.id}"
  end

end
