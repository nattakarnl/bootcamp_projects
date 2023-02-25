## Pao Ying Chub Game!!
## You can play unlimited times

# loop control
times <- 0
user_win <- 0
bot_win <- 0
tie <- 0

# dataframe
number <- c(1,2,3,4)
meaning <- c("rock", "paper", "scissor","quit")
df <- data.frame(number, meaning)
# greeting
print("Hello! Welcome to our Pao-Ying-Chub Game!!")
print("What's your name ?")
user_name <- readLines("stdin", n=1)
print(paste("Hi", user_name, "Pls choose the number : start game press 0,  quit game press 4"))
start <- readLines("stdin", n=1)
if(start == 4){print("BYE BYE")}
while (start == 0){
  print("Enter the following number to play the game 1: rock, 2: paper, 3: scissors")
  print("play!!!")
  user_play <- readLines("stdin", n=1)
  bot_play <- sample(c(1,2,3), size =1)
                             
  ## play
  if (user_play == bot_play){
    print(paste("user:",user_play, "vs bot:",bot_play))
    print(" result: tie")
    tie <- tie +1
  } else 
    if(user_play == 1 & bot_play == 2 |
      user_play == 2 & bot_play == 3 |
      user_play == 3 & bot_play == 1){
      print(paste("user:",user_play, "vs bot:",bot_play))
      print("result: lose") 
      bot_win <- bot_win +1
      }
      else if (user_play == 2 & bot_play == 1 |
      user_play == 3 & bot_play == 2 |
      user_play == 1 & bot_play == 3){
      print(paste("user:",user_play, "vs bot:",bot_play))
      print("result: win") 
      user_win <- user_win +1
      }

                             
  ## break
  else if (user_play == 4){
    print("play result")
    print(paste("Win:", user_win))
    print(paste("Lose:", bot_win))
    print(paste("tie:",tie))
    print("BYE BYE")
    break
  }
  
}

