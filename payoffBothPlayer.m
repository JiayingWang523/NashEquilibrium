eta1 = 0.3;
eta2 = 0.3;
a = 0.35;
b = 0.65;

x0 = [a/eta1,0];
y0 = [0,a/(1- eta1)];
x1 = [a/(1-eta2),0];
y1 = [0,a/eta2];
x2 = [b/eta1,0];
y2 = [0,b/(1-eta1)];
x3 = [b/(1-eta2),0];
y3 = [0,b/eta2];
one = [1,1];
xzero = [1,0];
yzero = [0,1];

figure
set(gca, 'XTick', [0,1]);
set(gca, 'YTick', [1]);
line(x0,y0,'Color','red')
line(x1,y1,'Color','magenta')
line(x2,y2,'Color','blue')
line(x3,y3,'Color','green')
line(xzero,one,'Color','black')
line(one,yzero,'Color','black')
