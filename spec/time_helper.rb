class Fixnum

  def seconds
    self
  end

  def minutes
    self * 60
  end

  def hours
    minutes * 60
  end

  def days
    hours * 24
  end

  def months
    days * 30
  end

  def years
    days * 365
  end

  def ago
    Time.now - self
  end

end
