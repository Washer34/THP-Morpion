# On appelle la gem "colorize" qui permet d'afficher du texte en couleur dans la console
require 'colorize'

# On appelle toutes les classes nécessaires pour le fonctionnement de l'application
require_relative 'lib/Game.rb'
require_relative 'lib/Board.rb'
require_relative 'lib/BoardCase.rb'
require_relative 'lib/Player.rb'
require_relative 'lib/Show.rb'

# La classe Application représente l'application elle-même
class Application
  # La méthode perform permet de lancer l'application
  def perform
    # On affiche un message de bienvenue en rouge
    puts "Bienvenue dans le jeu du Morpion !".red
    puts ""

    # On boucle tant que l'utilisateur souhaite jouer
    loop do
      # On crée une nouvelle partie et on la lance
      Game.new.play
      puts ""

      # On demande à l'utilisateur s'il veut rejouer
      puts "Voulez-vous refaire une partie ? (O/N)".cyan
      print "> "
      answer = gets.chomp.upcase

      # On vérifie que la réponse est valide (O ou N)
      until answer == "O" || answer == "N"
        puts "Réponse invalide, veuillez réessayer. (O/N)".red
        print "> "
        answer = gets.chomp.upcase
      end

      # Si la réponse est N, on sort de la boucle
      break if answer == "N"
    end

    # On affiche un message de fin de jeu en cyan
    puts "Merci d'avoir joué, à bientôt !".cyan
  end
end

# On crée une instance de la classe Application et on lance la méthode perform
Application.new.perform