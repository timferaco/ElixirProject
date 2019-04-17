# This code was written by Matthew Schwartzkopf

defmodule BlackJack do

    # Runs once
    def init() do
        deck = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "K", "Q", "J"]

        # Variables
        playerHand = []
        playerPoints = 0
        computerHand = []
        computerPoints = 0

        # Start players with 2 RANDOM cards
        playerHand = draw(playerHand, deck)
        playerPoints = (calculatePoints(Enum.at(playerHand, 0, nil))) + playerPoints
        playerHand = draw(playerHand, deck)
        playerPoints = (calculatePoints(Enum.at(playerHand, 0, nil))) + playerPoints
        
        # Stars computer with 2 RANDOM cards
        computerHand = draw(computerHand, deck)
        computerPoints = (calculatePoints(Enum.at(computerHand, 0, nil))) + computerPoints
        computerHand = draw(computerHand, deck)
        computerPoints = (calculatePoints(Enum.at(computerHand, 0, nil))) + computerPoints

        # Displays current game hand
        IO.puts("Player's Starting Hand")
        IO.puts(playerHand)
        IO.puts("Points:")
        IO.puts(playerPoints)
        IO.puts("\n")

        IO.puts("Computer's Starting Hand")
        IO.puts(computerHand)
        IO.puts("Points:")
        IO.puts(computerPoints)
        IO.puts("\n")

        # Stars the game
        BlackJack.main(playerHand, playerPoints, computerHand, computerPoints, deck)
    end

    # Loops forever
    def main(playerHand, playerPoints, computerHand, computerPoints, deck) do

        # Hit, Stay, or Fold?
        t = IO.gets("Hit(h), Stay(s), or Fold(f)?")
        IO.puts(t)

        # Asks player their move
        if t == "h\n" do
            playerHand = draw(playerHand, deck)
            playerPoints = (calculatePoints(Enum.at(playerHand, 0, nil))) + playerPoints
            IO.puts(playerHand)
            IO.puts(playerPoints)
            IO.puts("\n")
            IO.puts(computerHand)
            IO.puts(computerPoints)
            checkWin(playerPoints, computerPoints)
            BlackJack.main(playerHand, playerPoints, computerHand, computerPoints, deck)
        end
        if t == "s\n" do
            if computerPoints < 21 do
                loopComputer(computerHand, computerPoints, playerPoints, playerHand, deck)
            end
            BlackJack.main(playerHand, playerPoints, computerHand, computerPoints, deck)
        end
        if t == "f\n" do
            IO.puts("FOLDINGGG")
        end
              
        BlackJack.main(playerHand, playerPoints, computerHand, deck)
    end

    def loopComputer(computerHand, computerPoints, playerPoints, playerHand, deck) do
        computerHand = draw(computerHand, deck)
        computerPoints = (calculatePoints(Enum.at(computerHand, 0, nil))) + computerPoints
        IO.puts(playerHand)
        IO.puts(playerPoints)
        IO.puts("\n")
        IO.puts(computerHand)
        IO.puts(computerPoints)
        checkWin(playerPoints, computerPoints)
    end

    def checkWin(playerPoints, computerPoints) do
        if playerPoints == 21 do
            IO.puts("Player Wins!")
        end
        if computerPoints == 21 do
            IO.puts("Computer Wins!")
        end
        if playerPoints > 21 do
            IO.puts("Computer Wins!")
        end
        if computerPoints > 21 do
            IO.puts("Player Wins!")
        end
        if playerPoints > 21 && computerPoints > playerPoints do
            IO.puts("Computer Wins!")
        end
        if computerPoints > 21 && playerPoints > computerPoints do
            IO.puts("Player Wins!")
        end
    end

    def draw(hand, deck) do
        randomNumber = [[deck |> Enum.shuffle |> hd]]
        [randomNumber] ++ hand
    end

    def calculatePoints(points) do
        getNumber(points)
    end

    # Reads new number after player draws new card
    def getNumber(theList) do
        case theList do
            [["1"]] -> 1
            [["2"]] -> 2
            [["3"]] -> 3
            [["4"]] -> 4
            [["5"]] -> 5
            [["6"]] -> 6
            [["7"]] -> 7
            [["8"]] -> 8
            [["9"]] -> 9
          [["A"]] -> 11
          [["K"]] -> 10
          [["Q"]] -> 10
          [["J"]] -> 10
          nil -> nil
        end
    end
end

# Beginning of loop
BlackJack.init()

















## Main ##
    #RunOnce
        # Give player their cards
    # Loop
        ## Player Moves ##
        ## CheckWin ##
        #Hit
        #Stay
        #Fold

## Functions ##
# Create Deck (Just have a simple one)

# Shuffle Deck

# Start with 2 cards

#Randomizer Function

#CheckWin function




                    ## ERRORS ##

# - > Breaks if you start the game and then press enter
# -> Or if you press 'h' once, then press enter after one turn