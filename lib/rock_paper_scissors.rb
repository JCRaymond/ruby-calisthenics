class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    wins = /RS|SP|PR/
    if player1[1] == player2[1] or
        (player1[1]+player2[1]) =~ wins
      return player1
    elsif (player2[1]+player1[1]) =~ wins
      return player2
    else
      raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][1]=~ /R|P|S/ and tournament[1][1] =~ /R|P|S/
      return self.winner(tournament[0], tournament[1])
    end
    self.winner(
      self.tournament_winner(tournament[0]),
      self.tournament_winner(tournament[1])
    )
  end

end
