%game1 = [3 3 -2 5;
%         5 -2 1 1];
%game2 = [2.5 2.5 2.5 -2;
%         -2 2.5 -2 -2];
%theta1 = 0.62;
%theta2 = 0.1;
%eta1 = 0.5;
%eta2 = 0.5;

%game1 = [2 1 -1 -1;
%         -1 -1 1 2];
%game2 = [0 0 0 0;
%         0 0 0 0];
%theta1 = 0;
%theta2 = 0;
%eta1 = 1;
%eta2 = 1;

game1 = [4 3 -1 4.5;
         5 -2 1 1];
game2 = [2.6 2.6 2.6 -2;
         -2 2.6 -2 -2];
eta1 = 0.2;
eta2 = 0.6;
theta1 = 0.72;
theta2 = 0.08;

[game, A, B, ne] = find_ne(game1, game2, theta1, theta2, eta1, eta2);
game
A
B
if ne(1) == 1
    disp('CC');
end

if ne(2) == 1
    disp('CD');
end

if ne(3) == 1
    disp('DC');
end

if ne(4) == 1
    disp('DD');
end