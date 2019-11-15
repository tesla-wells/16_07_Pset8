clear 
close all

k =1 ;
m = 1;
A = [ -2 1 0 0 0 0 0 0 0 ;
     1 -2 1 0 0 0 0 0 0 ;
     0 1 -2 1 0 0 0 0 0 ;
     0 0 1 -2 1 0 0 0 0 ;
     0 0 0 1 -2 1 0 0 0 ;
     0 0 0 0 1 -2 1 0 0 ;
     0 0 0 0 0 1 -2 1 0 ;
     0 0 0 0 0 0 1 -2 1 ;
     0 0 0 0 0 0 0 1 -2 ];
 
 [vectors, eigenvalues] = eig(A);
 
 
 for n = 1 : 4
    figure(n)
    hold on
    i = 10-n;
    title("plot of " + n + " mode")
    scatter(linspace(1, 9, 9), vectors(:,i))
 end