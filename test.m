%% Part 1

image = imread('photo.jpg');

figure();
imshow(image);
title('photo');

%% Part 2

red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

figure;
subplot(1, 3, 1);
imshow(red);
title('Red');

subplot(1, 3, 2);
imshow(green);
title('Green');

subplot(1, 3, 3);
imshow(blue);
title('Blue');

%% Part 3

gray = rgb2gray(image);

n = min(size(gray));
arrayImage = gray(1:n, 1:n);

figure;
imshow(arrayImage);
title(sprintf('%d×%d Array', n, n));

%% Part 4

[P, D] = eig(double(arrayImage));
An = P * Dn * pinv(P);

% 10個最大特徵值
eigVals = diag(D);
[~, index] = maxk(eigVals, 10);
eigMask = zeros(length(eigVals), 1);
eigMask(index) = 1;
eigNew = eigMask .* eigVals;

D_new = diag(eigNew);
A_new = P * D_new * pinv(P);

figure()
subplot(1, 3, 1);
imshow(uint8(real(A_new)), [], 'InitialMagnification', 'fit');
title('保留前10個最大特徵值');

% 100個最大特徵值
eigVals = diag(D);
[~, index] = maxk(eigVals, 100);
eigMask = zeros(length(eigVals), 1);
eigMask(index) = 1;
eigNew = eigMask .* eigVals;

D_new = diag(eigNew);
A_new = P * D_new * pinv(P);

subplot(1, 3, 2);
imshow(uint8(real(A_new)), [], 'InitialMagnification', 'fit');
title('保留前100個最大特徵值');

% 200個最大特徵值
eigVals = diag(D);
[~, index] = maxk(eigVals, 200);
eigMask = zeros(length(eigVals), 1);
eigMask(index) = 1;
eigNew = eigMask .* eigVals;

D_new = diag(eigNew);
A_new = P * D_new * pinv(P);

subplot(1, 3, 3);
imshow(uint8(real(A_new)), [], 'InitialMagnification', 'fit');
title('保留前200個最大特徵值');

%% Part 5

[U, S, V] = svd(double(arrayImage));

% 10個最大特徵值
S_new = S;
S_new(11:end, 11:end) = 0;
A_new = U * S_new * V';

figure()
subplot(1, 3, 1);
imshow(uint8(real(A_new)), [], 'InitialMagnification', 'fit');
title('保留前10個最大特徵值');

% 100個最大特徵值
S_new = S;
S_new(101:end, 101:end) = 0;
A_new = U * S_new * V';

subplot(1, 3, 2);
imshow(uint8(real(A_new)), [], 'InitialMagnification', 'fit');
title('保留前100個最大特徵值');

% 200個最大特徵值
S_new = S;
S_new(201:end, 201:end) = 0;
A_new = U * S_new * V';

subplot(1, 3, 3);
imshow(uint8(real(A_new)), [], 'InitialMagnification', 'fit');
title('保留前200個最大特徵值');
