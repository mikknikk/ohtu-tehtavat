class Player:
    def __init__(self, player_dict):
        self.name = player_dict["name"]
        self.nationality = player_dict["nationality"]
        self.assists = player_dict["assists"]
        self.goals = player_dict["goals"]
        self.penalties = player_dict["penalties"]
        self.team = player_dict["team"]
        self.games = player_dict["games"]
    
    def points(self):
        return self.goals + self.assists

    def __str__(self):
        return f"{self.name:20} {self.team:3} {self.goals:2} + {self.assists:2} = {self.points():2}"
