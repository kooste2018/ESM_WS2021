clc;
clear all ;
B = readmatrix('NO2.xlsx');
B(isnan(B)==1)=0;
M_ppb = ppb_convert(B);
A = zeros(20,20);
A(7,2) = mean(M_ppb(:,1));
A(8,17) = mean(M_ppb(:,2));
A(11,8) = mean(M_ppb(:,3));
A(10,9) = mean(M_ppb(:,4));
A(12,10) = mean(M_ppb(:,5));
M_new = zeros(20,20);% 
for i = 1:20
    for j = 1:20
        d1 = sqrt((i-7)^2 + (j-2)^2);
        d2 = sqrt((i-8)^2 + (j-17)^2);
        d3 = sqrt((i-11)^2 + (j-8)^2);
        d4 = sqrt((i-10)^2 + (j-9)^2);
        d5 = sqrt((i-12)^2 + (j-10)^2);
        if i == 7 && j == 2
        d_sum = 1 + 1/d2 + 1/d3 + 1/d4 + 1/d5 ;
        w1 =  1/d_sum ;
        w2 = (1/d2)/d_sum ;
        w3 = (1/d3)/d_sum ;
        w4 = (1/d4)/d_sum ;
        w5 = (1/d5)/d_sum ;
        elseif i == 8 && j == 17
            d_sum = 1/d1 + 1 + 1/d3 + 1/d4 + 1/d5 ;
            w1 = (1/d1)/d_sum ;
            w2 = 1/d_sum ;
            w3 = (1/d3)/d_sum ;
            w4 = (1/d4)/d_sum ;
            w5 = (1/d5)/d_sum ;
        elseif i == 11 && j == 8
            d_sum = 1/d1 + 1/d2 + 1 + 1/d4 + 1/d5 ;
            w1 = (1/d1)/d_sum ;
            w2 = (1/d2)/d_sum ;
            w3 = 1/d_sum ;
            w4 = (1/d4)/d_sum ;
            w5 = (1/d5)/d_sum ;
        elseif i == 10 && j == 9
            d_sum = 1/d1 + 1/d2 + 1/d3 + 1 + 1/d5 ;
            w1 = (1/d1)/d_sum ;
            w2 = (1/d2)/d_sum ;
            w3 = (1/d3)/d_sum ;
            w4 = 1/d_sum ;
            w5 = (1/d5)/d_sum ;
        elseif i == 12 && j==10
            d_sum = 1/d1 + 1/d2 + 1/d3 + 1/d4 + 1 ;
            w1 = (1/d1)/d_sum ;
            w2 = (1/d2)/d_sum ;
            w3 = (1/d3)/d_sum ;
            w4 = (1/d4)/d_sum ;
            w5 = 1/d_sum ;
        else
            d_sum = 1/d1 + 1/d2 + 1/d3 + 1/d4 + 1/d5 ;
            w1 = (1/d1)/d_sum ;
            w2 = (1/d2)/d_sum ;
            w3 = (1/d3)/d_sum ;
            w4 = (1/d4)/d_sum ;
            w5 = (1/d5)/d_sum ;
        end

        M_new(i,j) = w1*A(7,2) + w2*A(8,17) + w3*A(11,8) + w4*A(10,9)+ w5*A(12,10);
    end
end
heatmap(M_new);
c = hot;
c = flipud(c);
colormap(c);