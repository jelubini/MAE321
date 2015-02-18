% Joel Lubinitsky
% 02/17/15
% Runge-Kutta Method for Simple Spring-Mass-Damper System

function vxNext = RK4SpringMassDamper(velocity, x, mass,...
                  coefficientDamping, stiffness, dt)

% Calculate Slopes, K_1-4
vK1 = -(coefficientDamping * velocity / mass)                  ...
      - (stiffness * x / mass);
vK2 = -(coefficientDamping * (velocity + (dt * vK1 / 2)) / mass) ...
      - (stiffness * x / mass);
vK3 = -(coefficientDamping * (velocity + (dt * vK2 / 2)) / mass) ...
      - (stiffness * x / mass);
vK4 = -(coefficientDamping * (velocity + (dt * vK3))     / mass) ...
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