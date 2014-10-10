module Hackspree 
  module Gamebook 
    extend GameOn::DSL
    opts = {:inc_by => 1, :dec_by => 1 }

    context :good_mayor do 
      statment [:user, :visits, :good_page_one] do 
	#activation GameOn::Points, opts, GameOn::Points::Params[:add] 
	activation GameOn::Points, {:inc_by => 1}, {:add => 1}  
      end
    end

    context :bad_mayor do 
      statment [:user, :visits, :bad_page] do 
	activation GameOn::Points, opts, GameOn::Points::Params[:remove] 
	#activation GameOn::Points, opts,{:remove => 1}  
      end
    end
  end
end
