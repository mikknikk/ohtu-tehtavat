import requests
import datetime
from player import Player

def main():
    url = "https://nhlstatisticsforohtu.herokuapp.com/players"
    response = requests.get(url).json()

    finnishPlayers = []

    for player_dict in response:
        if player_dict["nationality"] == "FIN":
            player = Player(player_dict)
            finnishPlayers.append(player)

    print("Players from FIN", datetime.datetime.now())
    for player in finnishPlayers:
        print(player)

main()