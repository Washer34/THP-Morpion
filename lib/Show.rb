class Show
  # Méthode qui affiche le plateau de jeu
  def self.display_board(board)
    puts "╔═══╦═══╦═══╗".yellow
    # Affiche la première ligne du tableau
    puts "║ #{board.cases[0].value.colorize(get_color(board.cases[0].value))} ║ #{board.cases[1].value.colorize(get_color(board.cases[1].value))} ║ #{board.cases[2].value.colorize(get_color(board.cases[2].value))} ║"
    puts "╠═══╬═══╬═══╣".yellow
    # Affiche la deuxième ligne du tableau
    puts "║ #{board.cases[3].value.colorize(get_color(board.cases[3].value))} ║ #{board.cases[4].value.colorize(get_color(board.cases[4].value))} ║ #{board.cases[5].value.colorize(get_color(board.cases[5].value))} ║"
    puts "╠═══╬═══╬═══╣".yellow
    # Affiche la troisième ligne du tableau
    puts "║ #{board.cases[6].value.colorize(get_color(board.cases[6].value))} ║ #{board.cases[7].value.colorize(get_color(board.cases[7].value))} ║ #{board.cases[8].value.colorize(get_color(board.cases[8].value))} ║"
    puts "╚═══╩═══╩═══╝".yellow
  end

  # Méthode qui retourne la couleur à utiliser pour l'affichage d'une case
  def self.get_color(value)
    case value
    when "X"
      :red
    when "O"
      :blue
    else
      :white
    end
  end
end