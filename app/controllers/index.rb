get '/' do
  @notes = Note.all 
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

get '/notes/:id/delete' do
  @note = Note.find_by_id(params[:id])
  erb :delete
end

get '/notes/:id/edit' do
  @body = Note.find params[:id]
  erb :edit
end

put '/notes/:id' do  
  n = Note.find(params[:id])  
  n.content = params[:content]  
  n.save  
  redirect '/'  
end  

delete '/notes/:id' do  
  Note.find_by_id(params[:id]).destroy  
  redirect '/'
end 