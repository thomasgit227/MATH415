pkg load io
myData = xlsread('data.xlsx');
n = myData(:,1);
p = myData(:,2);
approxLimit = 665; 
approxK = 0.0008;

%Plotting Data
scatter(n, p)
grid on
xlabel('time, n (hrs)')
ylabel('population,  p_n (biomass)')
title('Yeast Population Over Time')

dp = diff(p); %p_n+1 - p_n

%Plotting Change vs. Pop
figure(2)
scatter((approxLimit-p(1:end-1)) .* p(1:end-1), dp, 'o')
grid on
xlabel('population, p_n (biomass)');
ylabel('change in population, p_d (biomass over time)');
title('Yeast Growth Over Population');
x = linspace(1, 120000);
y = approxK * x; %approx.
line(x,y, 'Color', 'Red')
legend('Observed', 'Predicted', 'Location', 'southeast')

%Plotting Model
figure(1)
hold on
model = zeros(1, length(n));
model(1) = 9.6;
for i = 2:length(n)
    model(i) = model(i-1) + 0.0008 * (approxLimit - model(i-1)) * model(i-1);
end
plot(n, model, '*')
legend('Observed', 'Predicted', 'Location', 'southeast')

%Plotting Prediction - Not Working Currently
%figure(1)
%hold on
%predictionLength = length(n) + 4;
%predictionInputs = (23, n + %stuff)
%predictionModel = zeros(1, predictionLength);
%predictionModel(1) = 9.6;
%for i = 2:predictionLength
%    predictionModel(i) = predictionModel(i-1) + 0.0008 * (approxLimit - predictionModel(i-1)) * predictionModel(i-1);
%end
%plot(predictionInputs, predictionModel, 'o')

