function numberOfIntersections = simulatef(orbitRadius, expoTime, speed, viewingAngle, satelliteNumber)
    earthRadius = 6400;                     % radius of Earth
    totalRadius = earthRadius+orbitRadius;  % radius of Earth + altitude
    totalArea = 4*pi*totalRadius^2;         % surface area of sphere / square
    dimensions = sqrt(totalArea);           % dimensions of square
    midPoint = dimensions/2;                % midpoint of square (also centre of viewing circle)
    viewingRadius = viewingAngle/360 * pi*totalRadius;  % radius of viewing circle
    
    numberOfIntersections = 0;      % initial number of intersections of satellites and our viewing circle is 0
    
    for i = 1:satelliteNumber       % simulate every satellite
        initialPosition = [rand*dimensions, rand*dimensions];   % choose a random initial position
        tmp = 2*(rand-0.5)*speed;                           % chooses a random direction vector in which the
        direction = [tmp, sqrt(speed^2 - tmp^2)];           % satellites travel, with magnitude equal to speed
        if rand <= 0.5
            direction(2) = -direction(2);
        end
        direction(1) = direction(1) - pi/43200 * totalRadius;   % accomodate for Earth's rotation
        
        finalPosition = initialPosition + expoTime*direction;   % calculate final position of satellite after expoTime
        
        % the following lines test if the satellite goes through the viewing circle
        % if it does, add one to the numberOfIntersections
        m = (finalPosition(2)-initialPosition(2))/(finalPosition(1)-initialPosition(1));
        c = finalPosition(2)-m*finalPosition(1);
        tmp1 = 2*midPoint - 2*m*(c-midPoint);
        tmp2 = sqrt((2*m*(c-midPoint)-2*midPoint)^2 - 4*(1+m^2)*(midPoint^2+(c-midPoint)^2-viewingRadius^2));
        tmp3 = 2*(1+m^2);
        x1 = (tmp1 + tmp2)/tmp3;
        x2 = (tmp1 - tmp2)/tmp3;
        if (isreal(x1) && x1 >= min(initialPosition(1), finalPosition(1)) && x1 <= max(initialPosition(1), finalPosition(1))) ...
                || (isreal(x2) && x2 >= min(initialPosition(1), finalPosition(1)) && x2 <= max(initialPosition(1), finalPosition(1))) ...
                || (initialPosition(1)-midPoint)^2+(initialPosition(2)-midPoint)^2 <= viewingRadius^2
            numberOfIntersections = numberOfIntersections + 1;
        end
    end
end