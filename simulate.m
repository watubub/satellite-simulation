function numberOfIntersections = simulate(orbitRadius, expoTime, speed, viewingAngle, satelliteNumber)
    clf;
    hold on;
    earthRadius = 6400;
    totalRadius = earthRadius+orbitRadius;
    totalArea = 4*pi*totalRadius^2;
    dimensions = sqrt(totalArea);
    midPoint = dimensions/2;
    viewingRadius = viewingAngle/360 * pi*totalRadius;
    
    numberOfIntersections = 0;
    
    for i = 1:satelliteNumber
        initialPosition = [rand*dimensions, rand*dimensions];
        tmp = 2*(rand-0.5)*speed;
        direction = [tmp, sqrt(speed^2 - tmp^2)];
        if rand <= 0.5
            direction(2) = -direction(2);
        end
        direction(1) = direction(1) - pi/43200 * totalRadius;
        
        finalPosition = initialPosition + expoTime*direction;
        plot([initialPosition(1), finalPosition(1)], [initialPosition(2), finalPosition(2)]);
        
        m = (finalPosition(2)-initialPosition(2))/(finalPosition(1)-initialPosition(1));
        c = finalPosition(2)-m*finalPosition(1);
        tmp1 = 2*midPoint - 2*m*(c-midPoint);
        tmp2 = sqrt((2*m*(c-midPoint)-2*midPoint)^2 - 4*(1+m^2)*(midPoint^2+(c-midPoint)^2-viewingRadius^2));
        tmp3 = 2*(1+m^2);
        x1 = (tmp1 + tmp2)/tmp3;
        x2 = (tmp1 - tmp2)/tmp3;
        if (isreal(x1) && x1 >= min(initialPosition(1), finalPosition(1)) && x1 <= max(initialPosition(1), finalPosition(1))) || (isreal(x2) && x2 >= min(initialPosition(1), finalPosition(1)) && x2 <= max(initialPosition(1), finalPosition(1))) || (initialPosition(1)-midPoint)^2+(initialPosition(2)-midPoint)^2 <= viewingRadius^2
            numberOfIntersections = numberOfIntersections + 1;
        end
    end
    
    theta = linspace(0, 2*pi, 100);
    x = viewingRadius * cos(theta) + midPoint;
    y = viewingRadius * sin(theta) + midPoint;
    plot(x, y, 'LineWidth', 2);
    
    axis([0 dimensions 0 dimensions]);
    pbaspect([1 1 1]);
    hold off;
    
    disp(numberOfIntersections);
end