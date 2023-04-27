class Board
  attr_reader :cases

  def initialize
    @cases = Array.new(9) { BoardCase.new } # Crée un tableau de 9 cases, initialisées avec des objets BoardCase vides
  end

  def play(position, symbol)
    @cases[position].value = symbol # Modifie la valeur de la case à la position donnée avec le symbole du joueur en cours
  end

  def is_full?
    @cases.all? { |board_case| board_case.value != " " } # Retourne true si toutes les cases sont remplies, false sinon
  end

  def reset
    @cases.each { |board_case| board_case.value = " " } # Remet toutes les cases à vide
  end
end