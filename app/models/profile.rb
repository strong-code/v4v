class Profile < ApplicationRecord

  def matched_profile
    Profile.where(id: self.match_id).first
  end

  def matched_user
    User.where(id: self.matched_profile.user_id).first
  end

  def find_match
    if self.candidate = 'Hillary Clinton'
      m_profile = Profile.where(
        candidate: ['Jill Stein', 'Gary Johnson', 'Evan McMullin'],
        state: swing_states,
        match_id: nil
      ).sample

      if m_profile.nil?
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
    else
      #
    end
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
