% Created date: July 6, 2022
% Author: XYZ
close all, clear all
disp('Running...')

%% 
% load contour data
load('Contour_1.mat')

% initial
A = data;
[row,col] = find(A==true);
x0 = col(1);
y0 = row(1);
x = [x0];
y = [y0];

%
outputname = 'ContourSeprator';
vSession = VideoWriter([outputname,'.avi']);
vSession.FrameRate = 15;
open(vSession)
%%
x_ = x0;
y_ = y0;
p = 1; % 

figure, imshow(A)
tic
while (1)
    mask = zeros(size(A));
    if (p == 1) % down
        mask(y_:y_+1,x_-1:x_+1) = true;
        mask(y_,x_) = false;
    elseif (p == 2) % right
        mask(y_-1:y_+1,x_:x_+1) = true;
        mask(y_,x_) = false;
    elseif (p == 3) % up
        mask(y_-1:y_,x_-1:x_+1) = true;
        mask(y_,x_) = false;
    elseif (p == 4) % left
        mask(y_-1:y_+1,x_-1:x_) = true;
        mask(y_,x_) = false;
    end
        
    [y_,x_] = find(mask&A==1);
    
    % switch direction
    if length(y_) >1
        if (p == 1)
            mask2 = zeros(size(A));
            mask2(y(end):y(end)+1,x(end)+1) = true;
            [y_,x_] = find(mask&A&mask2==1);
            p = 2;
        elseif (p == 2)
            mask2 = zeros(size(A));
            mask2(y(end)-1,x(end):x(end)+1) = true;
            [y_,x_] = find(mask&A&mask2==1);
            p = 3;
        elseif (p == 3)
            mask2 = zeros(size(A));
            mask2(y(end)-1:y(end),x(end)-1) = true;
            [y_,x_] = find(mask&A&mask2==1);
            p = 4;
        elseif (p == 4)
            mask2 = zeros(size(A));
            mask2(y(end)+1,x(end)-1:x(end)) = true;
            [y_,x_] = find(mask&A&mask2==1);
            p = 1;
        end
    end
    
    % save result
    x = [x;x_];
    y = [y;y_];
    
    % monitoring
    hold on, plot(x,y,'r')
    frame = getframe();
    writeVideo(vSession, frame);

    % finish condition
    if (x_== x0) && (y_ == y0)
        x = [x;x0];
        y = [y;y0];
        break;
    end
end
close(vSession)
toc
%%
disp('Done.')