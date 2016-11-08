class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.profile && current_user.profile.completed
      @twitter_url = 'https://twitter.com/intent/tweet?text=' + URI.escape(twitter_text)
    end
    unless current_user.confirmed?
      flash[:error] = "You must confirm your email before continuing!"
    end
  end

  private

  def twitter_text
    if current_user.profile.candidate == 'Hillary Clinton'
      "I just ensured another swing-state vote for Hillary Clinton with #Vote4Vote! Trade your vote for #election2016 at"
    elsif current_user.profile.candidate == 'Jill Stein'
      "I just helped Jill Stein secure another vote with #Vote4Vote! Trade your vote for #election2016 at"
    elsif current_user.profile.candidate == 'Gary Johnson'
      "I just helped Gary Johnson secure another vote with #Vote4Vote! Trade your vote for #election2016 at"
    else
      "I just helped Evan McMullin secure another vote with #Vote4Vote! Trade your vote for #election2016 at"
    end
  end

end
