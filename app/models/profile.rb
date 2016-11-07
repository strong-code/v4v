class Profile < ApplicationRecord

  def matched_profile
    Profile.where(id: self.match_id).first
  end

  def matched_user
    User.where(id: self.matched_profile.user_id).first
  end

  def find_match
    if self.candidate = 'Hillary Clinton'
      m_id = Profile.where(
        candidate: ['Jill Stein', 'Gary Johnson'],
        state: swing_states,
        match_id: nil
      ).sample.id

      m = User.where(id: m_id)
      if m.empty?
        return
      end

      self.match_id = m.first.id
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
