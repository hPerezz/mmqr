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


% we added lambda on the place of 1 of MMQR.
function [THETA,Pk] = MMQRE(P,Phi,Theta,y,L)
  K=P*Phi'*inv(L+Phi*P*Phi');
  THETA = Theta + K*(y-Phi*Theta);
  % we also divided by lambda here
  Pk=(P-P*Phi'*inv(L+Phi*P*Phi')*Phi*P)/L;
end

% wee need to think about lambda value because depending on data velocity or quantity we have to
% do it faster

