close all;clearvars;clc
LC=linspecer(5);
width = 7.5;     % Width in inches
height = 8;    % Height in inches
figure;
set(gcf, 'Position', [10    10, width*100, height*100]); %<- Set size
% [ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(3, 2, [.05 .05],[0.15 .07],[.175,.05]);

% Only aerobic
Y=0.25;e1=0;e2=0;
CR_alpha_beta(ha(1),Y,e1,e2,1,0.625, 0.2)

Y=0.5;e1=0;e2=0;
CR_alpha_beta(ha(2),Y,e1,e2,2,0.625, 0.2)



% aerobic + eth
Y=0.25;e1=0.1;e2=0;
CR_alpha_beta(ha(3),Y,e1,e2,3,0.625, 0.2)

Y=0.5;e1=0.3;e2=0;
CR_alpha_beta(ha(4),Y,e1,e2,4,0.625, 0.2)

% aerobic + eth + lac

Y=0.25;e1=0.1;e2=0.1;
CR_alpha_beta(ha(5),Y,e1,e2,5,0.625, 0.2)

Y=0.5;e1=0.3;e2=0.3;

CR_alpha_beta(ha(6),Y,e1,e2,6,0.625, 0.2)

figpath='..\Figures\';
set(ha(1:4), 'XTickLabel', [],'XLabel',[])
set(ha([2,4,6]), 'YTickLabel', [],'YLabel',[])

CRmaxLIM  = 700;
CRminLIM = 40;
c2 = colorbar;
c2.Location='southoutside';
c2.Box = 'off';
c2.TickDirection = 'out';
c2.Limits = [CRminLIM,CRmaxLIM];
c2.FontSize =12;
% c2.TickLabels=0:100:CRLIM;
c2.TickLabels(end)= {['>', num2str(CRmaxLIM)]};
set(get(c2, 'Title'), 'String', '{\it CR} (kJ C-mol^{-1} CO_2)',...
  'FontName', 'Helvetica', 'FontSize', 12,'Interpreter', 'tex')
c2.Position = [ 0.35    0.0402    0.3925     0.0175];



numbers = 1:26;
letters = lower(char(numbers+64));

for i = 1:length(ha)
    axes(ha(i)); %set the current axes to axes2
    text(ha(i).XLim(2)-ha(i).XLim(2)/10, ha(i).YLim(2)-ha(i).YLim(2)/30, ['(', letters(i), ')'], ...
        'FontSize', 10, 'FontName', 'Helvetica')
end

text(ha(1), -0.25,0.4, 'Aerobic',...
    'FontSize', 13, 'FontName', 'Times New Roman' ,...
    'Rotation', 90)
text(ha(3), -0.25,0.25, 'Aerobic + F1',...
    'FontSize', 13, 'FontName', 'Times New Roman' ,...
    'Rotation', 90)
text(ha(5), -0.25,0.15, 'Aerobic + F1 + F2',...
    'FontSize', 13, 'FontName', 'Times New Roman' ,...
    'Rotation', 90)
  
t1=title(ha(1), 'Low growth yields','FontSize', 14, 'FontName', 'Times New Roman',...
    'FontWeight','normal', 'interpreter','latex');
t1.Position(2)=t1.Position(2)+0.075;
t2=title(ha(2), 'High growth yields','FontSize', 14, 'FontName', 'Times New Roman',...
    'FontWeight','normal', 'interpreter','latex');
t2.Position(2)=t2.Position(2)+0.075;


num = 6;xa=0;yb=0;ax=ha(6);
Y=0.5;e1=0.3;e2=0.3;
% 1.1285e+03
scatter(ha(6),0,0,100, 'k*'); 
text(ha(6),-0.12, 0.05,'(838)',...
    'FontSize', 12,'FontName','Helvetica','Color','k','FontWeight','bold');
  
xa=0;yb=1;
scatter(ha(6),0,1,100, 'k*'); 
text(ha(6),0.0, 1.05,'(47)',...
    'FontSize', 12,'FontName','Helvetica','Color','k','FontWeight','bold');
%65.2  
  
xa=1;yb=0;

scatter(ha(6),1,0,100, 'k*'); 
text(ha(6),1, -0.2,'(447)',...
    'FontSize', 12,'FontName','Helvetica','Color','k','FontWeight','bold');
%447

export_fig(gcf,[figpath,'Figure4.png'],'-r300');