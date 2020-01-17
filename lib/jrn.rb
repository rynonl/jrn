require 'jrn/day'
require 'jrn/setup'
require 'jrn/version'

require 'date'

module Jrn
  def self.run
    # First time setup
    setup = Jrn::Setup.new.start

    Jrn::Day.new(Date.today).start
  end
end

Jrn.run
