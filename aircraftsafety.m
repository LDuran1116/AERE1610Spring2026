function[] = aircraftsafety(fuel, weight_pilot, weight_copilot, weight_p1, weight_p2)
%constants
fuel_weight = fuel * 6 %convert to pounds since were using pounds
empty_weight = 1471 %lbs
center_gravity = 85.9 %in
front_seat_arm = 85.5
fuel_tank_arm = 95 
rear_seat_arm = 118.1
max_ramp_weight = 2400 %lbs
max_fuel = 50 %US gallons to lbs
if fuel > max_fuel
    fprintf("This value is not valid, enter it again ")
    return

end
%compute the total weight and make sure its under the max weight 
total_weight = empty_weight + fuel_weight + weight_pilot + weight_copilot + weight_p1 + weight_p2; % 1 gallon of fuel = 6.073 lbs
fprintf("The total weight is ", total_weight)
if total_weight > max_ramp_weight
    fprintf("Total weight exceeds maximum ramp weight. Please adjust the weights.\n");
end

%calculate the moments per airplane area and new center of gravity. 
front_seat_moment = front_seat_arm * (weight_pilot + weight_copilot);
fuel_tank_moment = fuel_tank_arm * fuel_weight;
rear_seat_moment = rear_seat_arm * (weight_p2 + weight_p1);
empty_moment = empty_weight * center_gravity
total_moment = rear_seat_moment + front_seat_moment + fuel_tank_moment + empty_moment
new_center_gravity = total_moment / total_weight


%calculate and make sure we are within the limits for the new center of
%gravity 
if new_center_gravity >= 86.8 && new_center_gravity <=95.8
    fprintf("Aircraft is within weight and balance limits")
else 
    fprintf("Aircraft is out of weight and balance limits\n");
end
end
