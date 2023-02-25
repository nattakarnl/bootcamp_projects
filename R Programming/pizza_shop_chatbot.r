## Pizza Shop chatbot
## Ordering pizza

# information
pizza_df <- data.frame(number = c(1,2,3,4),
                      menu = c("Hawaiian","Pepperoni", "Salmon Cheese", "Parma Ham"),
                      M_price = c(250, 300, 349, 325),
                      L_price = c(400, 425, 499, 495))

drink_df <- data.frame(id = c(1,2,3),
                      drink = c("Water", "Coke", "Lemonade"),
                      price = c(20,40,45))
# order
pizza_order <- NULL
price_pizza <- NULL
drink_order <- NULL
price_drink <- NULL

# control loop
control1 <- "y"
control2 <- "1"

#Greeting

print("Welcome to King's Pizza!")
print("May I have your name?")
name <- readLines("stdin", n = 1)
print("and contact number?")
phone <- readLines("stdin", n = 1)

print ("Thank you for your information! This is our menu")
print (pizza_df)

#Pizza Order 
 while(control1 == "y"){
  print("Please select the number of pizza that you would like to order")
  q1 <- readLines("stdin", n = 1) 
 if(as.numeric(q1) %in% 1:4){
   print("Your order is :")
   pizza_order <-append(pizza_order, print(pizza_df[[q1,2]]))
 }
  print("Which size do you want? (m/l)")
   q2 <- toupper(readLines("stdin", n = 1))
  if(q2 == "M"){
    price_pizza <- append(price_pizza, as.numeric(pizza_df[[q1,3]]))
  }
  else if(q2 == "L"){
    price_pizza <- append(price_pizza, as.numeric(pizza_df[[q1,4]]))
  }

  print("Do you want to order more pizza? (y/n)")
  control1 <- readLines("stdin", n = 1) 
  if(control1 == "n" | control1 != "y"){
  print("Do you want some drinks?")
    
    #Drink order
  print("Please press '1' for YES | press '2' for NO")
  control2 <- readLines("stdin", n = 1)
while(control2 == "1"){
  print("This is our drinks menu")
  print(drink_df)
  print("Please select the number of drinks that you would like to order")
  q5 <- readLines("stdin", n = 1) 
 if(as.numeric(q5) %in% 1:3){
   print("Your order is :")
   drink_order <- append(drink_order, print(drink_df[[q5,2]]))
   price_drink <- append(price_drink, as.numeric(drink_df[[q5,3]]))
   
   print("Do you want anything more? (y/n)")
   q6 <- readLines("stdin", n = 1)
   if(q6 == "n" | q6 != "y"){
   print("All right! Let's summary your order")
   break}
   }
 }
  if(control2 == "2"){
  print("All right! Let's summary your order")
  }
  }
}

#Summary Order

all_order <- list(Pizza = as.character(pizza_order),
                          Pizza_price = as.numeric(price_pizza),
                    Drinks = as.character(drink_order),
                    Drinks_price = as.numeric(price_drink)
                   )
sum_pizza <- sum(all_order$Pizza_price)
sum_drink <- sum(all_order$Drinks_price)

price <- sum_pizza + sum_drink

print("------------- Receipt -------------")
print(paste("Customer Name: " ,name))
print(paste("Contact Number: " ,phone))
print("------------- Your Order -------------")
print(all_order)
print(paste("Total :", price," THB"))
print("------------THANK YOU------------")
