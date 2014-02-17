#this is the Owner model

class Owner

#these are methods
  def name
    name = 'Krazy Dazy'
  end

  def birthdate
    birthdate = Date.new(1993, 11, 07)
  end

  def countdown
    Rails.logger.debug 'DEBUG: entering Owner countdown method'
    today = Date.today
    birthday = Date.new(today.year, birthdate.month, birthdate.day)
    if birthday > today
      countdown = (birthday - today).to_i
    else
      countdown = (birthday.next_year - today).to_i
    end
  end

end