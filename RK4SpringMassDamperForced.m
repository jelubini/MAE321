% Joel Lubinitsky
% 03/24/15
% Runge-Kutta Method for Forced Spring-Mass-Damper System

function vxNext = RK4SpringMassDamperForced(velocity, x, mass,...
                  coefficientDamping, stiffness, dt, funForcing, t)

% Calculate Slopes, K_1-4
vK1 =  (funForcing(t) / mass)                                       ...
      -(coefficientDamping * velocity / mass)                    ...
      - (stiffness * x / mass);
vK2 =  (funForcing(t) / mass)                                       ...
      -(coefficientDamping * (velocity + (dt * vK1 / 2)) / mass) ...
      - (stiffness * x / mass);
vK3 =  (funForcing(t) / mass)                                       ...
      -(coefficientDamping * (velocity + (dt * vK2 / 2)) / mass) ...
      - (stiffness * x / mass);
vK4 =  (funForcing(t) / mass)                                       ...
      -(coefficientDamping * (velocity + (dt * vK3))     / mass) ...
      - (stiffness * x / mass);
  
xK1 =   velocity;
xK2 =   velocity + (dt * vK1 / 2);
xK3 =   velocity + (dt * vK2 / 2);
xK4 =   velocity + (dt * vK3);

% Apply Weighted Average of Increments to Previous Term
vNext  = velocity + (dt / 6) * (vK1 + (2 * vK2) + (2 * vK3) + vK4);
xNext  = x        + (dt / 6) * (xK1 + (2 * xK2) + (2 * xK3) + xK4);
vxNext = [vNext, xNext];
end