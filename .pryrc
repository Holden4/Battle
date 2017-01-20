require 'capybara/dsl'
require 'selenium-webdriver'
require './lib/game'
require './lib/player'


Capybara.default_driver = :selenium
include Capybara::DSL




