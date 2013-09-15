get '/' do
  @notes = Note.order(:id)
  erb :index
end

post '/notes' do
  n = Note.new(params)
  if n.save
    redirect '/'
  else
    @errors = n.errors.full_messages
    erb :index
  end
end

get '/notes/:id/edit' do
  @body = Note.find(params[:id])
  erb :edit
end

put '/notes/:id' do  
  n = Note.find(params[:id])  
  n.content = params[:content]  
  if n.save
    redirect '/'
  else
    @body = Note.find(params[:id])
    @errors = n.errors.full_messages
    erb :edit
  end
end  

get '/notes/:id/delete' do
  @note = Note.find_by_id(params[:id])
  erb :delete
end

delete '/notes/:id' do  
  Note.find_by_id(params[:id]).destroy  
  redirect '/'
end

not_found do 
  "404, no page exists"
end 