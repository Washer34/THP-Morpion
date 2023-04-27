# On requiert le fichier Show.rb qui contient la méthode pour afficher le plateau de jeu
require_relative 'Show.rb'

# On définit la classe Game
class Game
  # On utilise l'attribut d'accès pour les variables current_player et status et l'attribut de lecture pour les variables player1, player2 et board
  attr_accessor :current_player, :status
  attr_reader :player1, :player2, :board

  # On définit la méthode initialize, qui sera appelée lorsque la classe Game sera instanciée
  def initialize
    # On demande le nom du joueur 1 et on crée un objet Player avec ce nom et le symbole "X"
    puts "Joueur1 présente toi : ".yellow
    print ">"
    @player1 = Player.new(gets.chomp, "X")
    # On demande le nom du joueur 2 et on crée un objet Player avec ce nom et le symbole "O"
    puts "Joueur2 présente toi : ".yellow
    print ">"
    @player2 = Player.new(gets.chomp, "O")
    # On crée un objet Board, qui représente le plateau de jeu
    @board = Board.new
    # On définit le joueur courant comme étant le joueur 1 au début de la partie
    @current_player = @player1
    # On définit le statut du jeu comme étant "ongoing" (en cours) au début de la partie
    @status = "ongoing"
  end

  # On définit la méthode switch_player, qui permet de changer le joueur courant
  def switch_player
    # On utilise l'opérateur ternaire pour vérifier si le joueur courant est le joueur 1, et si oui, on le change pour le joueur 2, sinon on le change pour le joueur 1
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # On définit la méthode play_turn, qui permet de jouer un tour
  def play_turn
    # On affiche le nom du joueur courant et on lui demande de choisir une case
    puts "#{current_player.name}, c'est à toi de jouer !".magenta
    print "> "
    position = gets.chomp.to_i
    # On vérifie si la case choisie est valide, sinon on demande au joueur de choisir une autre case
    if position < 1 || position > 9 || board.cases[position - 1].value != " "
      puts "Case invalide, veuillez réessayer.".red
      play_turn
    else
      # Si la case choisie est valide, on joue le coup et on vérifie si la partie est terminée
      board.play(position - 1, current_player.symbol)
      @status = game_over
      # On change le joueur courant pour le prochain tour
      switch_player
    end
  end


  # Cette méthode vérifie si un joueur a remporté la partie ou si la partie est nulle
  def game_over
    # Vérifier si le joueur actuel a gagné la partie
    if board.cases[0].value == current_player.symbol && board.cases[1].value == current_player.symbol && board.cases[2].value == current_player.symbol ||
       board.cases[3].value == current_player.symbol && board.cases[4].value == current_player.symbol && board.cases[5].value == current_player.symbol ||
       board.cases[6].value == current_player.symbol && board.cases[7].value == current_player.symbol && board.cases[8].value == current_player.symbol ||
       board.cases[0].value == current_player.symbol && board.cases[3].value == current_player.symbol && board.cases[6].value == current_player.symbol ||
       board.cases[1].value == current_player.symbol && board.cases[4].value == current_player.symbol && board.cases[7].value == current_player.symbol ||
       board.cases[2].value == current_player.symbol && board.cases[5].value == current_player.symbol && board.cases[8].value == current_player.symbol ||
       board.cases[0].value == current_player.symbol && board.cases[4].value == current_player.symbol && board.cases[8].value == current_player.symbol ||
       board.cases[2].value == current_player.symbol && board.cases[4].value == current_player.symbol && board.cases[6].value == current_player.symbol
      return "victory" # Renvoie la chaîne "victory" si le joueur actuel a gagné la partie
    # Vérifier si la partie est nulle
    elsif board.is_full?
      return "draw" # Renvoie la chaîne "draw" si la partie est nulle
    else
      return "ongoing" # Renvoie la chaîne "ongoing" si la partie continue
    end
  end

  # Cette méthode permet de jouer au jeu de morpion
  def play
    puts "Bienvenue dans le jeu du Morpion !".red
    puts "Voici les règles : le but du jeu est d'aligner 3 symboles identiques sur une ligne, une colonne ou une diagonale.".yellow
    puts "Les joueurs alternent les tours. Le joueur 1 joue avec le symbole X, le joueur 2 avec le symbole O.".yellow
    puts "Les cases sont numérotées de 1 à 9, de haut en bas et de gauche à droite.".yellow
    puts "Bonne chance !".yellow
    puts ""
    puts "Voici le plateau de jeu :".magenta
    puts ""

    # Tant que la partie continue
    while status == "ongoing"
      Show.display_board(board) # Afficher le plateau de jeu
      play_turn # Demander au joueur actuel de jouer
      system("clear")
    end

    Show.display_board(board) # Afficher le plateau de jeu à la fin de la partie

    # Afficher le résultat de la partie
    if status == "victory"
      puts "#{current_player.name} remporte la partie !".green
    else
      puts "Match nul!".yellow
    end
  end
end
