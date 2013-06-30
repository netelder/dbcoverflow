module Voteable

  def increment_score(amount)
    self.score += amount.to_i
    save
  end
  
end