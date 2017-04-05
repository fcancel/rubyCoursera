class GreeterController < ApplicationController

  def hello
    random_names = ["Alex", "Ash", "Tiger", "Pooh", "Ness", "Rosco"]
    @name = random_names.sample
    @time = Time.now

  end
  def bye
  end
end
