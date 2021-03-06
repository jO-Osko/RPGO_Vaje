clf;

t = 0:0.0001:1;
l = length(t);

phi = pi/6;

zac = [cos(phi) -sin(phi)];
kon = [cos(phi) sin(phi)];

% metoda 1

b1 = [1/cos(phi) 0];
B = [zac; b1; kon];

bezier(B, linspace(0, 1, 10))

plotbezier(B, t, 'r-', false);
for i=2:2:12
    tr = [cos(i*phi) sin(i*phi); -sin(i*phi) cos(i*phi)];
    plotbezier(B, t, 'r-', false, tr);
end


% metoda 2

b1 = [cos(phi)+1/3*sin(phi) -sin(phi)+1/3*cos(phi)];
b2 = [cos(phi)+1/3*sin(phi) sin(phi)-1/3*cos(phi)];
B = [zac; b1; b2; kon];

plotbezier(B, t, 'g-', false);
for i=2:2:12
    tr = [cos(i*phi) sin(i*phi); -sin(i*phi) cos(i*phi)];
    plotbezier(B, t, 'g-', false, tr);
end

% metoda 3

b1 = [4- cos(phi) 4*cot(phi)-4/sin(phi)+sin(phi)]/3;
b2 = [4- cos(phi) -4*cot(phi)+4/sin(phi)-sin(phi)]/3;
B = [zac; b1; b2; kon];

plotbezier(B, t, 'b-', false);
for i=2:2:12
    tr = [cos(i*phi) sin(i*phi); -sin(i*phi) cos(i*phi)];
    plotbezier(B, t, 'b-', false, tr);
end

axis equal;
hold off;