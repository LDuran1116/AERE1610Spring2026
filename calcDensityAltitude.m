%function file 
function densityaltitude = calcDensityAltitude(city, key)

% given code
key = '7cab1fcaf444883263bc48dd983e6018'; 
options = weboptions('ContentType','json');
url=['https://api.openweathermap.org/data/2.5/weather?q=','Ames','&APPID=',key];
CurrentData = webread(url, options);

%calculations 
temperature = CurrentData.main.temp %retrieve temperature
pressure = CurrentData.main.pressure %retrieve pressure 
humidity = CurrentData.main.humidity %retrieve humidity 
temperatureC = temperature - 273.15; % convert temperature to Celsius  
dewpoint = temperatureC - ((100-humidity)/5) %calculate dewpoint temperature 
vapor_pressure = 6.11 * 10^((7.5*dewpoint)/(237.7+dewpoint)) %calculate vapor pressure
virtualtemp = temperature / (1-(vapor_pressure/pressure)*(1-0.622)) %calculate virtual temperature 
virtualtempR = ((9/5) * (virtualtemp - 273.15) + 32 ) + 459.69 %convert virtual temeprature to Rankine 
pressureinHG = pressure * 0.02953 %convert pressure in millibars to pressure in inches of Mercury 
fieldelv = 955.6 %given field elevation 
densityaltitude = fieldelv + (145336 * (1 - ((17.326 * pressureinHG)/virtualtempR)^0.235)) %calcualte density altitude using all variables and calculations 