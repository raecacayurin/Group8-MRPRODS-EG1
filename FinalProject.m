% No of smoke detector to be purchased for 6 months
x1_1 = optimvar('x1_1', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x1_2 = optimvar('x1_2', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x1_3 = optimvar('x1_3', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x1_4 = optimvar('x1_4', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x1_5 = optimvar('x1_5', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x1_6 = optimvar('x1_6', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

% No of fire alarm to be purchased for 6 months
x2_1 = optimvar('x2_1', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x2_2 = optimvar('x2_2', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x2_3 = optimvar('x2_3', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x2_4 = optimvar('x2_4', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x2_5 = optimvar('x2_5', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x2_6 = optimvar('x2_6', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

% No of control panel to be purchased for 6 months
x3_1 = optimvar('x3_1', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x3_2 = optimvar('x3_2', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x3_3 = optimvar('x3_3', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x3_4 = optimvar('x3_4', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x3_5 = optimvar('x3_5', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x3_6 = optimvar('x3_6', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

% No of smoke detector inventory left at the end of each month
I1_0 = optimvar('I1_0', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I1_1 = optimvar('I1_1', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I1_2 = optimvar('I1_2', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I1_3 = optimvar('I1_3', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I1_4 = optimvar('I1_4', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I1_5 = optimvar('I1_5', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

% No of fire alarm inventory left at the end of each month
I2_0 = optimvar('I2_0', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I2_1 = optimvar('I2_1', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I2_2 = optimvar('I2_2', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I2_3 = optimvar('I2_3', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I2_4 = optimvar('I2_4', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I2_5 = optimvar('I2_5', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

% No of control panel inventory left at the end of each month
I3_0 = optimvar('I3_0', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I3_1 = optimvar('I3_1', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I3_2 = optimvar('I3_2', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I3_3 = optimvar('I3_3', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I3_4 = optimvar('I3_4', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
I3_5 = optimvar('I3_5', 'type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

% Define optimization problem
prob = optimproblem('Objective', ...
   (40*58.82*x1_1 + 40*58.73*x1_2 + ...
   40*59.69*x1_3 + 40*59.61*x1_4 + ...
   40*58.14*x1_5 + 40*58.32*x1_6 + ...
   26*58.82*x2_1 + 26*58.73*x2_2 + ...
   26*59.69*x2_3 + 26*59.61*x2_4 + ...
   26*58.14*x2_5 + 26*58.32*x2_6 + ...
   2500*58.82*x3_1 + 2500*58.73*x3_2 + ...
   2500*59.69*x3_3 + 2500*59.61*x3_4 + ...
   2500*58.14*x3_5 + 2500*58.32*x3_6)*1.25 + ...
   5*(I1_1+I1_2+I1_3+I1_4+I1_5+39530) + ...
   8*(I2_1+I2_2+I2_3+I2_4+I2_5+3843) + ...
   20*(I3_1+I3_2+I3_3+I3_4+I3_5+105), ...
   'ObjectiveSense', 'min');

% Purchasing budget constraint for each month
prob.Constraints.b1 = ((40*58.82*x1_1)+(26*58.82*x2_1)+(2500*58.82*x3_1))*1.25 <= 35000000;
prob.Constraints.b2 = ((40*58.73*x1_2)+(26*58.73*x2_2)+(2500*58.73*x3_2))*1.25 <= 35000000;
prob.Constraints.b3 = ((40*59.69*x1_3)+(26*59.69*x2_3)+(2500*59.69*x3_3))*1.25 <= 35000000;
prob.Constraints.b4 = ((40*59.61*x1_4)+(26*59.61*x2_4)+(2500*59.61*x3_4))*1.25 <= 35000000;
prob.Constraints.b5 = ((40*58.14*x1_5)+(26*58.14*x2_5)+(2500*58.14*x3_5))*1.25 <= 35000000;
prob.Constraints.b6 = ((40*58.32*x1_6)+(26*58.32*x2_6)+(2500*58.32*x3_6))*1.25 <= 35000000;

% Inventory constraint for smoke detector
prob.Constraints.Inv1 = x1_1 - I1_1 >= 5632;
prob.Constraints.Inv2 = I1_1 + x1_2 - I1_2 >= 6848;
prob.Constraints.Inv3 = I1_2 + x1_3 - I1_3 >= 4491;
prob.Constraints.Inv4 = I1_3 + x1_4 - I1_4 >= 5957;
prob.Constraints.Inv5 = I1_4 + x1_5 - I1_5 >= 9218;
prob.Constraints.Inv6 = I1_5 + x1_6 >= 7384;
prob.Constraints.Inv1a = x1_1 - I1_1 <= 20000;
prob.Constraints.Inv2a = I1_1 + x1_2 - I1_2 <= 20000;
prob.Constraints.Inv3a = I1_2 + x1_3 - I1_3 <= 20000;
prob.Constraints.Inv4a = I1_3 + x1_4 - I1_4 <= 20000;
prob.Constraints.Inv5a = I1_4 + x1_5 - I1_5 <= 20000;
prob.Constraints.Inv6a = x1_6 + I1_5 <= 20000;

% Inventory constraint for fire alarm
prob.Constraints.Inv7 = x2_1 - I2_1 >= 523;
prob.Constraints.Inv8 = I2_1 + x2_2 - I2_2 >= 780;
prob.Constraints.Inv9 = I2_2 + x2_3 - I2_3 >= 389;
prob.Constraints.Inv10 = I2_3 + x2_4 - I2_4 >= 633;
prob.Constraints.Inv11 = I2_4 + x2_5 - I2_5 >= 819;
prob.Constraints.Inv12 = x2_6 + I2_5 >= 699;
prob.Constraints.In7a = x2_1 - I2_1 <= 1800;
prob.Constraints.Inv8a = I2_1 + x2_2 - I2_2 <= 1800;
prob.Constraints.Inv9a = I2_2 + x2_3 - I2_3 <= 1800;
prob.Constraints.Inv10a = I2_3 + x2_4 - I2_4 <= 1800;
prob.Constraints.Inv11a = I2_4 + x2_5 - I2_5 <= 1800;
prob.Constraints.Inv12a = x2_6 + I2_5 <= 1800;

% Inventory constraint for control panel
prob.Constraints.Inv13 = x3_1 - I3_1 >= 17;
prob.Constraints.Inv14 = I3_1 + x3_2 - I3_2 >= 21;
prob.Constraints.Inv15 = I3_2 + x3_3 - I3_3 >= 8;
prob.Constraints.Inv16 = I3_3 + x3_4 - I3_4 >= 14;
prob.Constraints.Inv17 = I3_4 + x3_5 - I3_5 >= 26;
prob.Constraints.Inv18 = x3_6 + I3_5 >= 19;
prob.Constraints.Inv13a = x3_1 - I3_1 <= 70;
prob.Constraints.Inv14a = I3_1 + x3_2 - I3_2 <= 70;
prob.Constraints.Inv15a = I3_2 + x3_3 - I3_3 <= 70;
prob.Constraints.Inv16a = I3_3 + x3_4 - I3_4 <= 70;
prob.Constraints.Inv17a = I3_4 + x3_5 - I3_5 <= 70;
prob.Constraints.Inv18a = x3_6 + I3_5 <= 70;

% Solve the optimization problem
[sol, fval] = solve (prob)
