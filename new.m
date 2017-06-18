%game1 = [3 3 -1 5;
%         5 -1 1 1];
%game2 = [2.5 2.5 2.5 -1;
%         -1 2.5 -1 -1];
%eta1 = 0.60;
%eta2 = 0.60;

game1 = [3 1 1 2;
         2 5 4 4];
game2 = [2.6 1 4 3;
         1.5 3 5 2];
eta1 = 0.5;
eta2 = 0.5;

%game1 = [3 3 1 4;
%         4 1 2 2];
%game2 = [2.75 2.75 2.75 1;
%         1 2.75 1 1];
%eta1 = 0.6;
%eta2 = 0.5;

%game1 = [4 3 -1 4.5;
%         5 -2 1 1];
%game2 = [2.6 2.6 2.6 -2;
%         -2 2.6 -2 -2];
%eta1 = 0.2;
%eta2 = 0.6;

%game1 = [3 3 -1 5;
%         5 -1 1 1];
%game2 = [2.5 2.5 2.5 -1;
%         -1 2.5 -1 -1];
%eta1 = 0.6;
%eta2 = 0.6;

%game1 = [4 5 0 6;
%         6 0 2 1];
%game2 = [3 4 3 0;
%         0 4 0 0];
%eta1 = 0.5;
%eta2 = 0.5;

%game1 = [3 3 -3.5 6;
%         5 -2 1 3.5];
%game2 = [2.5 2.5 2.5 -2;
%         -2 2.5 -2 -2];
%eta1 = 0.5;
%eta2 = 0.5;

finalizeC = 0;
finalizeD = 0;
resultC = 0;
resultD = 0;
firstStep = 0;
for x = 0.005 : 0.005 : 1
    voteC = 0;
    voteD = 0;
    
    for y = 0.005 : 0.005 : 1
        [game, A, B, ne] = find_ne(game1, game2, x, y, eta1, eta2);
        
        result = find_choice(ne);
        if result == 1
            voteC = voteC + 1;
        elseif result == 2
            voteD = voteD + 1;
        end
        
        xCoor = [(x-0.005) x x (x-0.005)];
        yCoor = [(y-0.005) (y-0.005) y y];

        % CC
        if ne(1) == 1 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0
            patch(xCoor, yCoor, 'red', 'EdgeColor','red')
        end
        % CD
        if ne(1) == 0 & ne(2) == 1 & ne(3) == 0 & ne(4) == 0
            patch(xCoor, yCoor, 'green', 'EdgeColor','green')
        end
        % DC
        if ne(1) == 0 & ne(2) == 0 & ne(3) == 1 & ne(4) == 0
            patch(xCoor, yCoor, 'blue', 'EdgeColor','blue')
        end
        % DD
        if ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 1
            patch(xCoor, yCoor, 'yellow', 'EdgeColor','yellow')
        end
        % CD DC
        if ne(1) == 0 & ne(2) == 1 & ne(3) == 1 & ne(4) == 0
            patch(xCoor, yCoor, 'magenta', 'EdgeColor','magenta')
        end
        % CC DD
        if ne(1) == 1 & ne(2) == 0 & ne(3) == 0 & ne(4) == 1
            patch(xCoor, yCoor, 'cyan', 'EdgeColor','cyan')
        end
        firstStep = firstStep + 1;
        fprintf('current step %i/40000\n', firstStep);
    end
    
    if finalizeD == 0 & voteD >= 100
        resultD = x;
    end
    if finalizeD == 0 & voteD < 100
        finalizeD = 1;
    end
    if finalizeC == 0 & voteC >= 100
        resultC = x;
        finalizeC = 1;
    end
    if finalizeC == 1 & voteC < 100
        resultC = 0;
        finalizeC = 0;
    end
    
end

EPC = 0;
EPD = 0;
finalizeC = 0;
finalizeD = 0;
step = 0;

if resultC ~= resultD
    Ndecimals = 2;
    f = 10.^Ndecimals;
    total = (resultC - resultD);
    total = round(f*total)/f + 0.01;
    total = total * 10000;
    for x = resultD : 0.01 : resultC
        voteC = 0;
        voteD = 0;
        for y = 0.01 : 0.01 : 1
            [game, A, B, ne] = find_ne(game1, game2, x, y, eta1, eta2);
            payoff = [game(1,2) game(1,4);
                      game(2,2) game(2,4)];
            [sc, sd] = find_mixed(payoff);
            if ne(1) == 1 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0
                 voteC = voteC + 1;
            elseif ne(1) == 0 & ne(2) == 1 & ne(3) == 0 & ne(4) == 0
                 voteC = voteC + 1;
            elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 1 & ne(4) == 0
                voteD = voteD + 1;
            elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 1
                voteD = voteD + 1;
            elseif sc >= 0.5 & sd >= 0.5
                voteC = voteC + 1;
                voteD = voteD + 1;
            elseif sd >= 0.5
                voteD = voteD + 1;
            elseif sc >= 0.5
                voteC = voteC + 1;
            end
            step = step + 1;
            fprintf('current step %i/%i\n', step, total);
        end
        if finalizeD == 0 & voteD >= 100
            EPD = x;
        end
        if finalizeD == 0 & voteD < 100
            finalizeD = 1;
        end
        if finalizeC == 0 & voteC >= 100
            EPC = x;
            finalizeC = 1;
        end
        if finalizeC == 1 & voteC < 100
            resultC = 0;
            finalizeC = 0;
        end
    end
end

resultC
resultD
EPC
EPD
a1 = (game1(1,3) - game1(2,3)) / (game1(1,3) - game2(1,3) - game1(2,3) + game2(2,3))
a2 = (game1(2,4) - game1(2,2)) / (game1(2,4) - game2(2,4) - game1(2,2) + game2(2,2))
b1 = (game1(1,1) - game1(2,1)) / (game1(1,1) - game2(1,1) - game1(2,1) + game2(2,1))
b2 = (game1(1,4) - game1(1,2)) / (game1(1,4) - game2(1,4) - game1(1,2) + game2(1,2))