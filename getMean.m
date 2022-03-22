function getMean(satelliteNumber)
    orbitRadius = 615;
    expoTime = 1200;
    speed = 7.55;
    viewingAngle = 0.0048;
    data = zeros(1, 100);
    for i = 1:length(data)
        data(i) = simulate(orbitRadius, expoTime, speed, viewingAngle, satelliteNumber);
    end
    disp(mean(data));
end