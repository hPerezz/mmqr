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

function [THETA,Pk] = MMQR(P,Phi,Theta,y)
  K=P*Phi'*inv(1+Phi*P*Phi');
  THETA = Theta + K*(y-Phi*Theta);
  Pk=P-P*Phi'*inv(1+Phi*P*Phi')*Phi*P;
end

