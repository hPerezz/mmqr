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
  
% how many regressors i have in U n Y; will call it nu and ny
function [PHI,Y] = regressor(IN,OUT,nu,ny) 
  [N,c] = size(IN); % rows and col should be the same size as IN
  Y = OUT;
  PHI=zeros(N,nu+ny); % initializating our matrix with an zero vector. lenght should be N rows and ny+nu cols
  
  for i=1:N % first index is 1, not zero
    % filling nu
    for j=1:nu
      if(i>nu)
        PHI(i,j) = IN(i-j,1); % force col format by using the one
      else
        if(j<i) % above main diagonal
          PHI(i,j) = IN(i-j,1);
        end
      end
    end
    
    % filling ny
    for j=1:ny %
      if(i>nu)
        PHI(i,j+nu) = -OUT(i-j,1); %  we sum nu value to skip nu from cols
      else
        if(j<i) % above main diagonal
          PHI(i,j+nu) = -OUT(i-j,1); %  we sum nu value to skip nu from cols
        end
      end
    end
    
  end
  

end
