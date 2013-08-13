get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :register_event
end

post '/events/create' do
	event = Event.create(organizer_name: params[:organizer_name], organizer_email: params[:organizer_email], title: params[:title], date: params[:date])
  @event = event
  if event.errors.any?
    erb :register_event
  else
    redirect '/'
  end
  #TODO IMPLEMENT ME
end
