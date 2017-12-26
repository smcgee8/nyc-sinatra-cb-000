class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
      erb :"/figures/new"
  end

  post '/figures' do
    if !params[:title][:name].empty?
      title = Title.new(name: params[:title][:name])
      title.save
      params[:figure][:title_ids] ||= []
      params[:figure][:title_ids] << title.id
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.new(name: params[:landmark][:name])
      landmark.save
      params[:figure][:landmark_ids] ||= []
      params[:figure][:landmark_ids] << landmark.id
    end
    figure = Figure.new(params[:figure])
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    if !params[:title][:name].empty?
      title = Title.new(name: params[:title][:name])
      title.save
      params[:figure][:title_ids] ||= []
      params[:figure][:title_ids] << title.id
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.new(name: params[:landmark][:name])
      landmark.save
      params[:figure][:landmark_ids] ||= []
      params[:figure][:landmark_ids] << landmark.id
    end
    figure.update(params[:figure]).save
    redirect "/figures/#{figure.id}"
  end

end
