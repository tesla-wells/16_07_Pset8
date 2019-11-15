function [] = pend_anim(tout,stateout,L1,L2) 
% this function takes the result from ode45 and plots the motion of the 
% double pendulum 
% loop over times and create a frame for each time
x1 = L1*sin(stateout(1,1)); 
y1 = -L1*cos(stateout(1,1));
x2 = x1 + L2*sin(stateout(1,2));
y2 = y1 - L2*cos(stateout(1,2));
figure
hold on 
p1 = plot([0 x1],[0 y1],'Color','k','LineWidth',1);
p2 = plot([x1 x2],[y1 y2],'Color','k','LineWidth',1);
set(p1,'Erase','xor');
set(p2,'Erase','xor');
rr = 0.1*(L1+L2);
r1 = rectangle('Position',[x1-rr/2,y1-rr/2,rr,rr],'Curvature',[1,1],...
    'FaceColor','r');
r2 = rectangle('Position',[x2-rr/2,y2-rr/2,rr,rr],'Curvature',[1,1],...
    'FaceColor','b');
set(r1,'Erase','xor');
set(r2,'Erase','xor');
axis square
ylim([-1.1*(L1+L2) 1.1*(L1+L2)]);
xlim([-1.1*(L1+L2) 1.1*(L1+L2)]);
an = 0:0.01:2*pi;
plot(L1*cos(an),L1*sin(an),'r');
for t = 1:length(tout)
    th1 = stateout(t,1);
    th2 = stateout(t,2);
    x1 = L1*sin(th1);
    y1 = -L1*cos(th1);
    x2 = x1 + L2*sin(th2);
    y2 = y1 - L2*cos(th2);
    if t > 1 
        th1p = stateout(t-1,1);
        th2p = stateout(t-1,2);
        x1p = L1*sin(th1p);
        y1p = -L1*cos(th1p);
        x2p = x1p + L2*sin(th2p);
        y2p = y1p - L2*cos(th2p);
        plot([x2p x2],[y2p y2]);
    end
    set(p1,'XData',[0 x1]);
    set(p1,'YData',[0 y1]);
    set(p2,'XData',[x1 x2]);
    set(p2,'YData',[y1 y2]);
    set(r1,'Position',[x1-rr/2,y1-rr/2,rr,rr]);
    set(r2,'Position',[x2-rr/2,y2-rr/2,rr,rr]);
    drawnow 
    % pause(.01); 
end