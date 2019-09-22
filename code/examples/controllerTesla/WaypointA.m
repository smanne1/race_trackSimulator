function [Waypoint] = WaypointA(x,y,l,r)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
P = 100 % even number only
Waypoint(1,:) = [x y+r];
for (i = 1:((P/2)-1))
    Waypoint(i+1,:)= Waypoint(1,:) + i*(0.5*l/((P/2)-1))*[1 0];
end

for (i = 1:P)
    Waypoint(P/2 + i,:) = Waypoint(P/2,:) + [r*sin(i*(pi/P)) -(r - r*cos(i*(pi/P)))] ;
end

for (i = 1:P)
    Waypoint(i + P + P/2,:) = Waypoint(P/2,:) - [i*(l/P)*1 2*r];
end

for (i = 1:P)
    Waypoint(P/2 + 2*P + i,:) = Waypoint(P/2 + 2*P,:) + [-r*sin(i*(pi/P)) r-r*cos(i*(pi/P))];
end

for (i = 1:P/2)
    Waypoint(3*P + P/2 + i,:)= Waypoint(2*P + P/2,:) + [i*(0.5*l/(P/2)) 2*r];
end

end

