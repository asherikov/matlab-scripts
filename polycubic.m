function poly = polycubic(t, pos, vel)
    t0 = t(1);
    t1 = t(2);

    A = [   t0^3,   t0^2,   t0, 1;
            t1^3,   t1^2,   t1, 1;
            3*t0^2, 2*t0,   1,  0;
            3*t1^2, 2*t1,   1,  0];

    b = [pos(:); vel(:)];


    poly.coef = A\b;
    poly.coef_vel = [3*poly.coef(1); 2*poly.coef(2); poly.coef(3)];
    poly.coef_acc = [6*poly.coef(1); 2*poly.coef(2)];
    poly.jerk = 6*poly.coef(1);


    poly.get_positions =        @get_positions;
    poly.get_velocities =       @get_velocities;
    poly.get_accelerations =    @get_accelerations;
    poly.get_jerk =             @get_jerk;
end


function p = get_positions(poly, t)
    TMP = vander(t);
    p = TMP(:, end-3:end) * poly.coef;
end


function v = get_velocities(poly, t)
    TMP = vander(t);
    v = TMP(:, end-2:end) * poly.coef_vel;
end


function a = get_accelerations(poly, t)
    TMP = vander(t);
    a = TMP(:, end-1:end) * poly.coef_acc;
end


function j = get_jerk(poly)
    j = poly.jerk;
end
