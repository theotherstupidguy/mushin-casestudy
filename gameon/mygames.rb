module Hackspree 
  module Gamebook 
    extend GameOn::DSL
    opts = {:inc_by => 1, :dec_by => 1 }

    context :good_mayor do 
      activity [:user, :visits, :good_page_one] do 
	#use GameOn::Points, opts, GameOn::Points::Params[:add] 
	use GameOn::Points, {:inc_by => 1}, {:add => 1}  
      end
    end

    context :bad_mayor do 
      activity [:user, :visits, :bad_page] do 
	use GameOn::Points, opts, GameOn::Points::Params[:remove] 
	use GameOn::Points, opts,{:remove => 1}  
      end
    end
  end
end
