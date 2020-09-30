close all;clearvars;clc
LC=linspecer(5);
width = 6.5;     % Width in inches
height = 5.5;    % Height in inches
figure;
set(gcf, 'Position', [20 100 width*100, height*100]); %<- Set size
% [ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(1, 1, [.05 .05],[0.2 .15],[.15,.1]);
alw = 0.5;    % AxesLineWidth
fsz = 11;      % FontSize
fszax = fsz;
% lw = 1.0;      % LineWidth
ftype1= 'Helvetica';  %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor= [1,1,1]*0.2;

DH_AE = 469;
DH_AN_CO2 = 16.77;
DH_AN_NOCO2 = 18.33;
e2 = 2/3;


alpha=0.0:0.01:1;
% alpha=0.005:0.001:0.05;
beta=alpha;
lambda =0;
tol=eps;
[a,b]=meshgrid(alpha, beta);
idb= a+b>(1-lambda);

a(idb)=nan;
b(idb)=nan;
c=1-a-b;

CRLIM  = 700;
% (0.1.*DH_AE + 0.*DH_AN_CO2 + 0.9.*DH_AN_NOCO2)/(0.1 + 1/3 .*0 )
CR = (a.*DH_AE + b.*DH_AN_CO2 + (1-a-b).*DH_AN_NOCO2)./(a + 1/3 .*b );
idcr= CR>CRLIM;
CR(idcr)=CRLIM;
% surf(a,b,CR)
[C,ch]=contourf(a,b,CR);hold on
contour(a,b,c,'LineColor',[1,1,1]*0.4 ,'LineWidth', 0.1);
ch.LevelStep=50;
clabel(C,ch,'FontSize',fsz-2,'Color','k','FontName',ftype1)
ch.LineWidth=0.5;ch.LineStyle='-';
ch.LineColor=[1,1,1]*0;


c2=colorbar; c2.Box='off';c2.TickDirection='out';
c2.Ticks = 0:100:CRLIM;
c2.TickLabels(end)= {['>', num2str(CRLIM)]};

% c2.TickLabels=min(CR(:)):ch.LevelStep:max(CR(:));
xlabel('\alpha');ylabel('\beta')
set(get(c2,'Title'),'String','{\it CR} (kJ C-mol^{-1} CO_2)',...
  'FontName', ftype1, 'FontSize', fsz,'Interpreter', 'tex')
set(gca,...
    'FontSize', fszax,'FontName',ftype1,...
    'LineWidth',  alw,'Box', 'off',...
    'XTick',0:0.1:1, 'YTick',0:0.1:1,...
    'TickDir', 'out', 'TickLength', [.02 .02],'XMinorTick', 'on', ...
    'YMinorTick', 'on','XColor', xycolor, 'YColor', xycolor,...
    'XGrid', 'on', 'YGrid', 'on', 'GridColor', [1,1,1]*0.4 );
ax1=gca; 
hold(ax1,'on')
colormap jet


ar1=annotation('arrow',[0.2154 0.7062],[0.03636 0.04182]);
ar2=annotation('arrow',[0.007692 0.009231],[0.2491 0.7673]);
ar3=annotation('arrow',[0.55 0.45],[0.55 0.45]);
ar1.Position=[0.2154    0.0927    0.4908    0.0055];
ar2.Position=[ 0.0554    0.2473    0.0015    0.5182];

tt1=text(0.3200 ,  -0.1863  ,'Degree of Aerobicity',...
    'FontSize', fszax+1,'FontName',ftype1,'Color',xycolor);
tt2=text(-0.1784  ,  0.125,'Degree of Fermentation (Ethanol)',...
    'Rotation',90,'FontSize', fszax+1,'FontName',ftype1,'Color',xycolor);
tt3=text(ax1,0.55, 0.6,'Degree of Fermentation (\lambda) \newline (Lactic acid)',...
    'FontSize', fszax+1,'FontName',ftype1,'Color',xycolor);
scatter(ax1,0.7,0,100, 'k*'); 
a=0.7;b=0;
CR = (a.*DH_AE + b.*DH_AN_CO2 + (1-a-b).*DH_AN_NOCO2)./(a + 1/3 .*b );
text(ax1,0.69, 0.05,['A (',sprintf('%.0f',CR),')'],...
    'FontSize', fszax+2,'FontName',ftype1,'Color','k','FontWeight','bold');
  
a=0;b=0.5;
CR = (a.*DH_AE + b.*DH_AN_CO2 + (1-a-b).*DH_AN_NOCO2)./(a + 1/3 .*b );
scatter(ax1,0,0.5,100, 'k*'); 
text(ax1,0.025, 0.5,['B (',sprintf('%.0f',CR),')'],...
    'FontSize', fszax+2,'FontName',ftype1,'Color','k','FontWeight','bold');

a=0.6;b=0.2;
CR = (a.*DH_AE + b.*DH_AN_CO2 + (1-a-b).*DH_AN_NOCO2)./(a + 1/3 .*b );
scatter(ax1,0.6,0.2,100, 'k*'); 
text(ax1,0.625, 0.2,['C (',sprintf('%.0f',CR),')'],...
    'FontSize', fszax+2,'FontName',ftype1,'Color','k','FontWeight','bold');
  
text(ax1,0.35, 0.95,'Non-growing systems',...
    'FontSize', fszax+2,'FontName',ftype1,'Color','k','FontWeight','bold');

set(gcf,'Color','w');

figpath='..\Figures\';
export_fig(gcf,[figpath,'Figure3.png'],'-r300');