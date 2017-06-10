function [game, A, B, ne] = find_ne(game1, game2, theta1, theta2, eta1, eta2)

k1 = eta1 * theta1 + (1 - eta1) * theta2;
k2 = eta2 * theta2 + (1 - eta2) * theta1;

game = zeros(2,4);
ne = [0 0 0 0];

for i = 1 : 2
    for j = 1 : 4
        if j == 1 | j == 3
            game(i,j) = game1(i,j) * (1 - k1) + game2(i,j) * k1;
        else    
            game(i,j) = game1(i,j) * (1 - k2) + game2(i,j) * k2;
        end
    end
end
A = 0;
B = 0;
%M = [game(1,1) game(1,3);
%     game(2,1) game(2,3)];
%N = [game(1,2) game(1,4);
%     game(2,2) game(2,4)];
%[A,B,a,b,iterations,err,ms] = bimat(M,N);

index = 1;
for p = 1 : -1 : 0
    for q = 1 : -1 : 0
        g1 = game(1,1)*p*q + game(1,3)*p*(1-q) + game(2,1)*(1-p)*q + game(2,3)*(1-p)*(1-q);
        g2 = game(1,2)*p*q + game(1,4)*p*(1-q) + game(2,2)*(1-p)*q + game(2,4)*(1-p)*(1-q);
        e1 = game(1,1)*q + game(1,3)*(1-q);
        e2 = game(2,1)*q + game(2,3)*(1-q);
        e3 = game(1,2)*p + game(2,2)*(1-p);
        e4 = game(1,4)*p + game(2,4)*(1-p);
        if g1 >= e1 && g1 >= e2 && g2 >= e3 && g2 >= e4
            ne(index) = 1;
        end
        index = index + 1;
    end
end

end
