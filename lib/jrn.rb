require "jrn/version"
require "jrn/day"

module Jrn
  def run
    Day.new(Date.today).start
  end
end
