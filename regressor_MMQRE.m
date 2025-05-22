%     ______ ______ ___    ______ ____   _____
%    / ____// ____//   |  / ____// __ \ / ___/
%   / __/  / /    / /| | / /    / / / // __ \
%  / /___ / /___ / ___ |/ /___ / /_/ // /_/ /
% /_____/ \____//_/  |_|\____/ \____/ \____/
%
%  Henrique Perez Gomes da Silva
%  henrique.perez@lumorobotics.com - 23/04/2025
%
% - - - - - - - - - - - - - - - - - - - - - - - -


% how many regressors i have in U n Y; will call it nu and ny
function [PHI,Y,THETA] = regressor_MMQRE(IN,OUT,nu,ny,L)
  [N,c] = size(IN); % rows and col should be the same size as IN
  Y = OUT;

  % we have to think how much

  PHI=zeros(N,nu+ny); % initializating our matrix with an zero vector. lenght should be N rows and ny+nu cols
  PHIe=zeros(N,nu+ny);

  THETA = zeros(nu+ny,N); %initializating our Theta
  P = 10000*eye(nu+ny); % square matrix with nu+ny size
  % P = covariance matrix.

  Ye = zeros(size(OUT));

  for i=2:N % first index is 1, not zero
    % filling nu
    for j=1:nu
      if(i>nu)
        PHI(i,j) = IN(i-j,1); % force col format by using the one
        PHIe(i,j) = IN(i-j,1); % force col format by using the one

      else
        if(j<i) % above main diagonal
          PHI(i,j) = IN(i-j,1);
          PHIe(i,j) = IN(i-j,1);
        end
      end
    end

    % filling ny
    for j=1:ny %
      if(i>nu)
        PHI(i,j+nu) = -OUT(i-j,1); %  we sum nu value to skip nu from cols
        PHIe(i,j+nu) = -Ye(i-j,1);
      else
        if(j<i) % above main diagonal
          PHI(i,j+nu) = -OUT(i-j,1); %  we sum nu value to skip nu from cols
          PHIe(i,j+nu) = -Ye(i-j,1);
        end
      end
    end


    % we check the P by using L. the L refresh P value.

    [THETA(:,i),P] = MMQRE(P,PHI(i,:),THETA(:,i-1),OUT(i,1),L);
    Ye(i,1) = PHIe(i,:)*THETA(:,i);
  end

%  figure
%  plot(OUT)
%  hold on
%  plot(Ye)

%  figure
%plot(THETA(1,:),'k')
%hold on

%plot(THETA(2,:),'r')
%hold on

%plot(THETA(3,:),'g')
%hold on

%plot(THETA(4,:),'b')
%hold on

end
