close all;clearvars
LC=linspecer(5);
width = 8;     % Width in inches
height = 3.5;    % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 11; % FontSize
fszax = fsz-1;
ftype1 = 'Helvetica'; %hLegend, gca
xycolor = [1, 1, 1] * 0.2;

figure;
set(gcf, 'Position', [10    10, width*100, height*100]); %<- Set size
% [ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(1,2, [.05 .1],[0.2 .05],[.1,.05]);

Y=(0.569+0.566)/2;e1=0.128;e2=0;
CR_alpha_beta_appd2(ha(1),Y,e1,e2,1,0,1)%B
CR_alpha_beta_appd2(ha(1),Y,e1,e2,2,1,0)%A
CR_alpha_beta_appd2(ha(1),Y,e1,e2,3,0.5,0.5)%C

CRmaxLIM  = 700;
CRminLIM = 40;
c2 = colorbar;
c2.Location='eastoutside';
c2.Box = 'off';
c2.TickDirection = 'out';
c2.Limits = [CRminLIM,CRmaxLIM];
c2.TickLabels(end)= {['>', num2str(CRmaxLIM)]};
  set(get(c2, 'Title'), 'String', '{\it CR} (kJ C-mol^{-1} CO_2)', 'FontName', 'Helvetica', 'FontSize', 10)
xlabel('\alpha','FontSize', fsz+1); ylabel('\beta','FontSize', fsz+1)
text(0.7, 0.8, sprintf('$Y_{AE}$ = %.2f' ,Y),...
    'FontName', ftype1, 'FontSize', fsz-1, 'Interpreter', 'latex')
text(0.7, 0.7, sprintf('$Y_{F1}$  = %.2f' ,e1),...
    'FontName', ftype1, 'FontSize', fsz-1, 'Interpreter', 'latex')
text(0.7, 0.6, sprintf('$Y_{F2}$  = %.2f' ,e2),...
    'FontName', ftype1, 'FontSize', fsz-1, 'Interpreter', 'latex')
axis(ha(1),'square')

dhana = 0;
dcatg = -469;
dcatL = -18.33;
dcatE = -16.77;
gamma_glu =4;
% gamma_eth = 6;
% gamma_lac = 4;
gamma_bio =4.2;
DH_AE = abs((1 - Y * gamma_bio/gamma_glu)*dcatg+Y*dhana);
DH_eth = abs((1 - gamma_bio/gamma_glu*e1)*dcatE+e1*dhana);
DH_Lac = abs((1 - gamma_bio/gamma_glu * e2)*dcatL+e2*dhana);
a=[0,1,0.5]; b=[1,0,0.5];
CR = (a .* DH_AE + b .* DH_eth + (1 - a - b) .* DH_Lac) ./ ...
    (a .* (1 - Y) + (0.05 * e1 + (1 - 1.05 * e1) * 1 / 3) .* b + 0.05 * e2 .* (1 - a - b));

obsCR= [53.8, 457.63, 280.51];
scatter(ha(2), CR, obsCR,50, 'o','filled'); hold(ha(2),'on')
plot(ha(2) ,1:500, 1:500, 'k-')
xlabel(ha(2),'Observed CR'); ylabel(ha(2),'Modeled CR'); 
axis(ha(2),'square')
set(ha(2), ...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'XColor', xycolor, 'YColor', xycolor, ...
    'XGrid', 'on', 'YGrid', 'on', 'GridColor', [1, 1, 1]*0.4);
ha(2).Position(3:4) =  ha(1).Position(3:4) ;
text(ha(1), 0.95, 0.975, '(a)', 'FontSize', fszax, 'FontName', ftype1, 'Units','normalized')
text(ha(2),0.95, 0.975, '(b)', 'FontSize', fszax, 'FontName', ftype1, 'Units','normalized')


figpath='..\Figures\';
export_fig(gcf,[figpath,'App_Fig2.pdf'],'-r300');