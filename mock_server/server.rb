# encoding: utf-8
require 'bundler'
Bundler.require

get '/user/starred' do
  content_type :json
  if params[:page].to_i > 1
    ""
  else
    IO.readlines(File.expand_path('../starred.json',__FILE__)).first
  end
end
