# La classe BoardCase représente une case du plateau de jeu
class BoardCase
  attr_accessor :value # permet de lire et d'écrire la valeur de la case

  def initialize
    @value = " " # par défaut, la valeur de la case est un espace vide
  end
end