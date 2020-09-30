function CR_alpha_beta(ax, Y, e1, e2,num,xa,yb)

alw = 0.5; % AxesLineWidth
fsz = 11; % FontSize
fszax = fsz-1;
% lw = 1.0;      % LineWidth
ftype1 = 'Helvetica'; %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor = [1, 1, 1] * 0.2;
dcatg = -469;
dcatL = -18.33;
dcatE = -16.77;
gamma_glu =4;
% gamma_eth = 6;
% gamma_lac = 4;
HT = -469;
Hx = -491;
gamma_bio= 4*Hx/HT;
dhana = dcatg*gamma_bio/gamma_glu - Hx;

DH_AE = abs((1 - Y * gamma_bio/gamma_glu)*dcatg+Y*dhana);
DH_eth = abs((1 - gamma_bio/gamma_glu*e1)*dcatE+e1*dhana);
DH_Lac = abs((1 - gamma_bio/gamma_glu * e2)*dcatL+e2*dhana);

alpha = 0.0:0.01:1;
beta = alpha;
lambda = 0;
[a, b] = meshgrid(alpha, beta);
idb = a + b > (1 - lambda);
a(idb) = nan;
b(idb) = nan;
c=1-a-b;
CRmaxLIM  = 700;
CRminLIM = 40;
CR = (a .* DH_AE + b .* DH_eth + (1 - a - b) .* DH_Lac) ./ ...
    (a .* (1 - Y) + (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3) .* b + 0.05 * e2 .* (1 - a - b));
axes(ax)
idcr= CR>CRmaxLIM;
CR(idcr)=CRmaxLIM;
% % surf(a,b,CR)
% view([0,90])
[C, ch] = contourf(a, b, (CR)); hold on 
contour(a,b,c,'LineColor',[1,1,1]*0.4 ,'LineWidth', 0.1);

ch.LevelStep = 100;
caxis([CRminLIM, CRmaxLIM])
clabel(C, ch, 'FontSize', fsz-2, 'Color', 'k', 'FontName', ftype1)
ch.LineWidth = 0.1;
ch.LineStyle = '-';
ch.LineColor = [1, 1, 1] * 0.4;


xlabel('\alpha','FontSize', fsz+1); ylabel('\beta','FontSize', fsz+1)
text(0.7, 0.8, ['{\it Y_{AE}}',sprintf(' = %.2f' ,Y)],...
    'FontName', ftype1, 'FontSize', fsz-1)
text(0.7, 0.7, ['{\it Y_{F1}}',sprintf(' = %.2f' ,e1)],...
    'FontName', ftype1, 'FontSize', fsz-1)
text(0.7, 0.6, ['{\it Y_{F2}}',sprintf(' = %.2f' ,e2)],...
    'FontName', ftype1, 'FontSize', fsz-1)

a=xa;b=yb;
CR = (a .* DH_AE + b .* DH_eth + (1 - a - b) .* DH_Lac) ./ ...
    (a .* (1 - Y) + (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3) .* b + 0.05 * e2 .* (1 - a - b));
numbers = 1:26;
letters = upper(char(numbers+64));

scatter(ax,xa,yb,100, 'k*'); 
text(ax,xa-0.1,yb+0.1,[letters(num),'(',sprintf('%1.0f',CR),')'],...
    'FontSize', 12,'FontName','Helvetica','Color','k','FontWeight','bold');

  
set(gca, ...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'XTick', 0:0.2:1, 'YTick', 0:0.2:1, ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XColor', xycolor, 'YColor', xycolor, ...
    'XGrid', 'on', 'YGrid', 'on', 'GridColor', [1, 1, 1]*0.4);
set(gcf, 'Color', 'w');
colormap jet

end
