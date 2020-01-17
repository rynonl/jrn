require "jrn/version"
require "jrn/day"

require 'date'

module Jrn
  def self.run
    # First time setup
    setup = Jrn::Setup.new.start

    Jrn::Day.new(Date.today).start
  end
end

Jrn.run
