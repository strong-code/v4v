class ProfilesController < ApplicationController

  def new
    if current_user.profile && current_user.profile.completed?
      flash[:notice] = 'You have already filled out a profile. You can now match with another voter.'
      redirect_to root_url
    end
    @profile = Profile.new
    @states = all_states.values
  end

  def create
    if current_user.profile
      flash[:warning] = "You already have filled out your profile. You can now match with another voter."
      redirect_to root_url and return
    end

    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.completed = true

    if @profile.save
      flash[:success] = 'Profile updated! You may now match with another voter!'
    else
      flash[:error] = 'Unable to update your profile!'
    end
    redirect_to root_url
  end

  def find_match
    @profile = current_user.profile
    @profile.find_match

    if @profile.match_id.nil?
      flash[:warning] = "Sorry, but we couldn't find a suitable voter to match you with. You can try again later, or try spreading the word on Twitter, Facebook or email!"
    end
    redirect_to root_url
  end

  def update
    #
  end

  private

  def profile_params
    params.require(:profile).permit(:state, :candidate)
  end

  def all_states
    {
      AK: "Alaska",
      AL: "Alabama",
      AR: "Arkansas",
      AS: "American Samoa",
      AZ: "Arizona",
      CA: "California",
      CO: "Colorado",
      CT: "Connecticut",
      DC: "District of Columbia",
      DE: "Delaware",
      FL: "Florida",
      GA: "Georgia",
      GU: "Guam",
      HI: "Hawaii",
      IA: "Iowa",
      ID: "Idaho",
      IL: "Illinois",
      IN: "Indiana",
      KS: "Kansas",
      KY: "Kentucky",
      LA: "Louisiana",
      MA: "Massachusetts",
      MD: "Maryland",
      ME: "Maine",
      MI: "Michigan",
      MN: "Minnesota",
      MO: "Missouri",
      MS: "Mississippi",
      MT: "Montana",
      NC: "North Carolina",
      ND: "North Dakota",
      NE: "Nebraska",
      NH: "New Hampshire",
      NJ: "New Jersey",
      NM: "New Mexico",
      NV: "Nevada",
      NY: "New York",
      OH: "Ohio",
      OK: "Oklahoma",
      OR: "Oregon",
      PA: "Pennsylvania",
      PR: "Puerto Rico",
      RI: "Rhode Island",
      SC: "South Carolina",
      SD: "South Dakota",
      TN: "Tennessee",
      TX: "Texas",
      UT: "Utah",
      VA: "Virginia",
      VI: "Virgin Islands",
      VT: "Vermont",
      WA: "Washington",
      WI: "Wisconsin",
      WV: "West Virginia",
      WY: "Wyoming"
    }
  end

end
