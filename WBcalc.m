%Luis Eduardo Duran AERE1610H Project 1 Problem 1
empty_weight = 1471 %lbs
center_gravity = 85.9 %in
front_seat_arm = 85.5
fuel_tank_arm = 95 
rear_seat_arm = 118.1
max_ramp_weight = 2400 %lbs
max_fuel = 50 %US gallons to lbs

%inputs to get missing variables 
fuel = input("How much fuel is on board (in US Gallons)? ")
fuel_weight = fuel * 6 %convert to pounds since were using pounds
weight_pilot = input("What is the weight of the pilot? (in lbs) ")
weight_copilot = input('What is the weight of the copilot? (in lbs) ')
weight_p1 = input("What is the weight of passenger one? (0 if no passenger) ")
weight_p2 = input("What is the weight of passenger two? (0 if no passenger) ")

aircraftsafety(fuel, weight_pilot, weight_copilot, weight_p1, weight_p2)