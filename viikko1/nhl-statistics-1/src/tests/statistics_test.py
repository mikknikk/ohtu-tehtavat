import unittest
from statistics import Statistics
from player import Player


class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri",   "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatistics(unittest.TestCase):
    def setUp(self):
        # annetaan Statistics-luokan oliolle "stub"-luokan olio
        self.statistics = Statistics(
            PlayerReaderStub()
        )

    def test_joukkueen_pelaajamaara(self):
        joukkueen_pelaajat = self.statistics.team("EDM")

        joukkueen_pelaajamaara = len(joukkueen_pelaajat)

        self.assertAlmostEqual(joukkueen_pelaajamaara, 3)

    def test_etsi_pelaaja(self):
        pelaaja = self.statistics.search("Yzerman")

        self.assertEqual(str(pelaaja), "Yzerman DET 42 + 56 = 98")

    def test_etsittya_pelaajaa_ei_loydy(self):
        pelaaja = self.statistics.search("Mörkö")

        self.assertEqual(pelaaja, None)

    def test_parhaat_pisteet(self):
        pelaaja = self.statistics.top_scorers(1)[0]
        print(pelaaja)
        self.assertEqual(str(pelaaja), "Gretzky EDM 35 + 89 = 124")