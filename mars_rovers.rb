require_relative "./rover"

puts 'Enter your Inputs'
plateau_dimensions = gets.chomp #input for plateau's dimensions
plateau = Plateau.new plateau_dimensions.split

while !ARGF.eof
  position = gets.chomp #input for rover location and orientation
  instructions = gets #input for rover movement instruction
  plateau.deploy_rover(position.split[0, 2],
                        position.split[2].upcase,
                        instructions.chomp.upcase
                      )
end

plateau.execute_rovers
