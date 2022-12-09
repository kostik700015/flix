class Movie < ApplicationRecord

  def flop?
    total_gross.blank? || total_gross < 225000000
  end

end
