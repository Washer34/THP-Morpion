class Player
  # L'attribut reader est utilisé pour donner accès en lecture seule aux variables d'instance name et symbol.
  attr_reader :name, :symbol

  # La méthode initialize est appelée lorsque la méthode new est invoquée.
  # Elle prend en argument un nom et un symbole pour créer une nouvelle instance de la classe Player.
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end