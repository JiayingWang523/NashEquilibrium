function [result] = find_choice(ne)
    if     ne(1) == 1 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0 % CC
        result = 1;
    elseif ne(1) == 0 & ne(2) == 1 & ne(3) == 0 & ne(4) == 0 % CD
        result = 1;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 1 & ne(4) == 0 % DC
        result = 2;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 1 % DD
        result = 2;
    elseif ne(1) == 1 & ne(2) == 1 & ne(3) == 0 & ne(4) == 0 % CC CD
        result = 1;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 1 & ne(4) == 1 % DC DD
        result = 2;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0 % CC CD DC
        result = 1;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0 % CC CD DD
        result = 1;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0 % CC DC DD
        result = 2;
    elseif ne(1) == 0 & ne(2) == 0 & ne(3) == 0 & ne(4) == 0 % CD DC DD
        result = 2;
    else
        result = 0;
    end
end