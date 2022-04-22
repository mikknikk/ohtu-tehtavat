import datetime
from player import Player

class PlayerStats:
    def __init__(self, reader):
        self.reader = reader

    def top_scorers_by_nationality(self, nationality):
        players_by_nationality = self.reader.get_players_by_nationality(nationality)
        players_by_nationality.sort(reverse = True, key = lambda player : player.points())
        return players_by_nationality