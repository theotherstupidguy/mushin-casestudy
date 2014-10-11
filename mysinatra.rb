# a gameon activity to gameon is similar to a webrequest for rack/sinatra
require 'sinatra'

require 'gameon'
require 'gameon-redis'
require 'gameon-points'

#require './gameon/mygames.rb'  
class User
  attr_accessor :id
  def initialize id
    @id = id
  end
end

get '/good/:id' do 
  user = User.new params[:id]
  #GameOn::Points::Params[:add] = {:add => 1}  

  GameOn::Env.set user.id do 
    context :good_mayor do 
      activity [:user, :visits, :good_page_one]
    end
  end

  gameon = GameOn::Env.get user.id 

  "#{Time.now} Welcome #{gameon.id} Current score is #{gameon.points}"
end

#=begin
get '/bad/:id' do
  user = User.new params[:id]

  GameOn::Env.set user.id do 
    context :bad_mayor do 
      activity [:user, :visits, :bad_page]
    end
  end
  gameon = GameOn::Env.get user.id
  "#{Time.now} Welcome #{gameon.id} Current score is #{gameon.points}"
end
#=end
