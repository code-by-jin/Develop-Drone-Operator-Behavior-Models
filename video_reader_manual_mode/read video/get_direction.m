function direction = get_direction(C_moving, C_static)

if C_moving(1) >= C_static(1)
    if C_moving(2) <= C_static(2)
        degree = 90 - atand(abs(C_moving(2) - C_static(2)) / abs(C_moving(1) - C_static(1)));      
    else
        degree = 90 + atand(abs(C_moving(2) - C_static(2)) / abs(C_moving(1) - C_static(1))); 
    end
else
    if C_moving(2) <= C_static(2)
        degree = 270 + atand(abs(C_moving(2)-C_static(2))/abs(C_moving(1) - C_static(1))); 
    else
        degree = 270 - atand(abs(C_moving(2)-C_static(2))/abs(C_moving(1) - C_static(1)));
    end
end

if degree < 45 || degree >= 315
    direction = 'Move Forward';
elseif degree >= 45 && degree < 135
    direction = 'Move Right';
elseif degree >= 135 && degree < 225
    direction = 'Move Backward'; 
elseif degree >= 225 && degree < 315
    direction = 'Move Left';
end