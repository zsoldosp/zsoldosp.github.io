import unittest

ALIVE  = True
DEAD  = False

def cell_next_state(curr_state, live_neighbour_cnt):
    if live_neighbour_cnt == 3:
        return ALIVE
    if curr_state == ALIVE and live_neighbour_cnt == 3:
        return ALIVE
    return ALIVE


class GoflRulesTest(unittest.TestCase):
    
    
    # start include
    def test_survival_a_living_cell_with_2_or_3_neighbours_survives(self):
        self.assertEquals(ALIVE, cell_next_state(curr_state=ALIVE, live_neighbour_cnt=2))
        self.assertEquals(ALIVE, cell_next_state(curr_state=ALIVE, live_neighbour_cnt=3))
        self.assertEquals(ALIVE, cell_next_state(curr_state=DEAD, live_neighbour_cnt=3))
        self.assertEquals(DEAD, cell_next_state(curr_state=DEAD, live_neighbour_cnt=2))
    # end include


if __name__ == '__main__':
    unittest.main()
