class Profile < ApplicationRecord

  def matched_profile
    Profile.where(id: self.match_id).first
  end

  def matched_user
    User.where(id: self.matched_profile.user_id).first
  end

  def find_match
    if self.candidate == 'Hillary Clinton'
      m_profile = Profile.where(
        candidate: ['Jill Stein', 'Gary Johnson', 'Evan McMullin'],
        state: swing_states,
        match_id: nil
      ).sample
    else
      # They are an indie voter - match with a Hillary voter
      m_profile = Profile.where(
        candidate: 'Hillary Clinton',
        state: dem_states,
        match_id: nil
      ).sample
    end

    if m_profile.nil? || m_profile == self
      return
    end

    m_profile.match_id = self.id
    m_profile.save

    m_user = User.where(id: m_profile.id)
    if m_user.empty?
      return
    end

    self.match_id = m_user.first.id
    self.save
  end

  private

  def dem_states
    [
      'California',
      'Connecticut',
      'Delaware',
      'District of Columbia',
      'Hawaii',
      'Illinois',
      'Maine',
      'Massachusetts',
      'Maryland',
      'Minnesota',
      'New Jersey',
      'New Mexico',
      'New York',
      'Oregon',
      'Rhode Island',
      'Vermont',
      'Washington'
    ]
  end

  def swing_states
    [
      'Arizona',
      'Colorado',
      'Florida',
      'Georgia',
      'Iowa',
      'Michigan',
      'North Carolina',
      'New Hampshire',
      'Nevada',
      'Ohio',
      'Pennsylvania',
      'Virginia',
      'Wisconsin'
    ]
  end

end
