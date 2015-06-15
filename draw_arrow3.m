%%%
%
% p1 - point 1 (in 3d)
% p2 - point 2 (in 3d)
%
% m  - number of points to approximate a circle
%
% Example:
% draw_arrow3(randn(3,1),randn(3,1),1,0.5,'r',20);
%
function draw_arrow3(p1,p2,arrow_radius,arrow_length,color,m)
    if nargin<6
        m = 10;
        if nargin<5
            color = 'b';
        end
    end
    m = m+1;

    n = p2-p1;
    pb = p2 - arrow_length*n/norm(n);

    % projection matrix
    P = eye(3)-(n*n')/(n'*n);

    [U,S,V] = svd(P);

    t = linspace(-pi,pi,m);
    x = arrow_radius*cos(t);
    y = arrow_radius*sin(t);
    z = 0*t;

    r = repmat(pb,1,m)+U*[x;y;z];

    hold on;
    plot3([p1(1) pb(1)],[p1(2) pb(2)],[p1(3) pb(3)],color)

    patch(r(1,:),r(2,:),r(3,:),color) % fill base of arrow
    % fill sides of arrow
    for i=1:m-1
        x = [r(1,i);r(1,i+1);p2(1)];
        y = [r(2,i);r(2,i+1);p2(2)];
        z = [r(3,i);r(3,i+1);p2(3)];
        patch(x,y,z,color)
    end
    x = [r(1,1);r(1,m);p2(1)];
    y = [r(2,1);r(2,m);p2(2)];
    z = [r(3,1);r(3,m);p2(3)];
    patch(x,y,z,color)

end
