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

function [Theta] = MMQ(PHI,Y)
  Theta = inv(PHI'*PHI)*PHI'*Y; % using inv() saves compute
  
endfunction
