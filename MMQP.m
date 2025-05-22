%     ______ ______ ___    ______ ____   _____
%    / ____// ____//   |  / ____// __ \ / ___/
%   / __/  / /    / /| | / /    / / / // __ \
%  / /___ / /___ / ___ |/ /___ / /_/ // /_/ /
% /_____/ \____//_/  |_|\____/ \____/ \____/
%
%  Henrique Perez Gomes da Silva
%  henrique.perez@lumorobotics.com - 16/04/2025
%
% - - - - - - - - - - - - - - - - - - - - - - - -

function [Theta] = MMQP(PHI,Y)
  [l,c] = size(Y); % just to know how many data is beeing used

  W=eye(1); % identity matrix

  for i = 1:l
    if l<60
      W(i,i)=0.6;
    end
  end

  % Calculate the inverse of (PHI' * W * PHI)
  Theta = inv(PHI' * W * PHI) * PHI' * W * Y;
  
