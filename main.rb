require_relative 'lib/console_inerface'
require_relative 'lib/game'

puts "Hello to all!!!"

word = File.readlines(__dir__ + '/data/words.txt', encoding: 'UTF-8', chomp: true).sample

puts word



game = Game.new(word)
console_interface = ConsoleInterface.new(game)
until game.over?
  console_interface.print_out
  letter = console_interface.get_input

  game.play!(letter)


end

console_interface.print_out

