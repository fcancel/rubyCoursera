module GreeterHelper
  def time_to_AM_PM(time)
    time.strftime("%I:%M:%p")
  end
end
