function [Ye,Error] = validate(Uv,Yv,nu,ny,Theta)
  [N,c] = size(Uv); % rows and col should be the same size as Uv
  PHI=zeros(N,nu+ny); % initializating our matrix with an zero vector. lenght should be N rows and ny+nu cols

  Ye=zeros(N,c); % create a vector for estimated outputs

  for i=1:N % first index is 1, not zero
    % filling nu
    for j=1:nu
      if(i>nu)
        PHI(i,j) = Uv(i-j,1); % force col format by using the one
      else
        if(j<i) % above main diagonal
          PHI(i,j) = Uv(i-j,1);
        end
      end
    end

    % filling ny
    for j=1:ny %
      if(i>nu)
        PHI(i,j+nu) = -Ye(i-j,1); %  we sum nu value to skip nu from cols
      else
        if(j<i) % above main diagonal
          PHI(i,j+nu) = -Ye(i-j,1); %  we sum nu value to skip nu from cols
        end
      end
    end
    Ye(i,1)=PHI(i,:)*Theta; % this should be our estimated output calculation
  end

  % for comparing real output and estimated output
  % figure
  % plot(Yv)
  % hold on
  % plot(Ye,'r--')

  %for minimazing the impact of garbage data in our new curve
  % sum all yv and ye value to get medium quadratic error
  E=Yv-Ye; % error
  disp('EQM:');
    Error=((E'*E)/N) % Changed from EQM to Error to match the return value
end