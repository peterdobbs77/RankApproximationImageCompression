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
k=1;
rank1 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
%k=10;
%rank10 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
%k=20;
%rank20 = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';

rankN = rank1;

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