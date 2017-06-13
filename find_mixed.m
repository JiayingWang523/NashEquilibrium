function [sc, sd] = find_mixed(payoff)

syms C D
payoff = [2.9500 4.3000;
          -1.5500 0.7000];
%eqns = [C + D == 1, payoff(1,1) * C + payoff(2,1) * D == payoff(1,2)* C + payoff(2,2)* D];
%S = solve(eqns, [C, D]);
%sc = S.C;
%sd = S.D;
sc = (payoff(2,2) - payoff(2,1)) / (payoff(1,1) - payoff(2,1) - payoff(1,2) + payoff(2,2));
sd = 1 - sc;
end

