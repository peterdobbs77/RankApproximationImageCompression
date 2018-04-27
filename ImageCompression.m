% Application of Low Rank Approximation in Image Compression

A=imread('./Edgar.jpg');    % 

B=double(A(:,:,1))+1;       % converts A into double-precision format

B=B/256;                    % Gives values between 0 and 1
[U, S, V] = svd(B);           % 

% 1) What are the dimensions of U, S, and V?
dimU = size(U);
dimS = size(S);
dimV = size(V);
%   Compute the best rank-1 approx to B
n=20;
rankN = U(:,1:n)*S(1:n,1:n)*V(:,1:n)';

% three copies are necessary for RGB values
C(:,:,1)=rankN;
C(:,:,2)=rankN;
C(:,:,3)=rankN;

% truncate the approximations to fit
C(:,:,:)=min(1,C(:,:,:));
C(:,:,:)=max(0,C(:,:,:));

% view the resulting image
figure
image(C); axis equal; axis off;