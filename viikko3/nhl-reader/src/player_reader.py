import requests
from player import Player

class PlayerReader:
    def __init__(self, url):
        response = requests.get(url).json()

        players = []

        for player_dict in response:
            player = Player(player_dict)
            players.append(player)

        self.players = players

    def get_players_by_nationality(self, nationality):
        players_by_nationality = []
        for player in self.players:
            if player.nationality == nationality:
                players_by_nationality.append(player)
        return players_by_nationality