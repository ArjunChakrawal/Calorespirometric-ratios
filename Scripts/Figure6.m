function Figure6(HT)

% phi = (1+sqrt(5))/2; %godlen ratio
width = 9.5; % Width in inches
height = 7; % Height in inches
alw = 0.5; % AxesLineWidth
fsz = 11; % FontSize
xL =600;
fszax = fsz;

ftype1 = 'Helvetica'; %hLegend, gca
%ftype2='Times New Roman'; % hTitle, hXLabel, hYLabel
xycolor = [0.2, 0.2, 0.2];
figure;
set(gcf, 'Position', [20, 100, width * 100, height * 100]); %<- Set size
%[ha, ~] = tight_subplot(Nh, Nw, [gap_h gap_w], [lower upper], [left right])
[ha, ~] = tight_subplot(2, 2, [.05, .05], [0.1, .05], [.1, .05]);
Hx = -492;
gb= 4*Hx/HT;
gs =4;
YF=0.3;
Hs = -469;

theromax = 1;
dhana = Hs*gb/gs - Hx;
dcatg = -469;
dcatL = -18.33;
dcatE = -16.77;
%Aerobic 2a
axes(ha(1));
y_ae_max = min([dcatg/(gb/gs * dcatg - dhana), theromax]);
Y = linspace(0, y_ae_max, 1000);

% DH_AE = (Y*Hx - Hs);
DH_AE = abs((1 - Y * gb/gs)*dcatg+Y*dhana);
cAE = (1 - Y);
CR = DH_AE ./ cAE;
p1 = plot(CR, Y, '-', 'Color', 'k', 'LineWidth', 2); hold on

%Anaerobic to eth
e_eth_max = min([dcatE/(gb/gs * dcatE - dhana), theromax]); % from excel
e1 = linspace(0, e_eth_max, 1000);
DH_eth = abs((1 - e1 * gb/gs)*dcatE+e1*dhana);
cEth = (0.05 * e1 + (1 - gb/gs * e1) * 1 / 3);
CR = DH_eth ./ cEth;
p2 = plot(CR, e1, '--', 'Color', 'k', 'LineWidth', 2); hold on


%Anaerobic to Lac
e_lac_max = min([dcatL/(gb/gs * dcatL - dhana), theromax]);
e2 = linspace(0, e_lac_max, 100);
DH_Lac = abs(e2*dhana+(1 - gb/gs * e2)*dcatL);
cLac = 0.05 * e2;
CR = DH_Lac ./ cLac;
p3 = plot(CR, e2, '-.', 'Color','k', 'LineWidth', 2); hold on
% text(475, 0.29, 'CUE = 0 as CR \newlineapproaches infinity', 'FontSize', fsz,...
%   'Interpreter', 'tex')

xlim([0, xL])
ylim([0, 1])

ylabel('$CUE$ (C-mol B C-mol$^{-1}$ glu)','Interpreter', 'latex')
hlegend1 = legend([p1, p2, p3], {'Aerobic: varying Y_{AE}', 'F1: varying Y_{F1}', 'F2: varying Y_{F2}'});
set(hlegend1, 'box', 'off', 'Location', 'best', 'Interpreter', 'tex', 'FontSize', fsz);
% hlegend1.Position(1)=hlegend1.Position(1)-0.02;


set(gca, ...
    'XTickLabel',[],'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);
set(gcf, 'Color', 'w')

% [x_begin y_begin dx dy]
A=annotation('arrow','Units','normalized','LineWidth',2);
A.Position=[3.9596e-01   8.3200e-01   2.2746e-02  -7.8857e-02];
B=annotation('arrow','LineStyle','--','LineWidth',2);
B.Position=[   1.5095e-01   5.7771e-01  -3.3684e-03   7.7429e-02];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];
C=annotation('arrow','LineStyle','-.','LineWidth',2);
C.Position=[3.3958e-01   7.2171e-01  -8.0000e-02   4.0857e-02];
C.Position = [C.Position(1)+C.Position(3), C.Position(2)+C.Position(4), -C.Position(3),-C.Position(4)];


% Anaerobic 2b
axes(ha(2));
beta = 0.5;
gamma = 1-beta;
% e_eth_max = 0.9;
e1 = linspace(0, e_eth_max, 1000);

e22 = YF;
lw=[1.5,2.5];
for i = 1:length(e22)
    e2 = e22(i);    
    DH_eth = abs((1 - e1 * gb/gs)*dcatE+e1*dhana);
    DH_Lac = abs(e2*dhana+(1 - gb/gs * e2)*dcatL);
    cue1 = beta * e1 + gamma * e2;
    cLac = 0.05 * e2;
    cEth = (0.05 * e1 + (1 - gb/gs * e1) * 1 / 3);

    CR1 = (beta * DH_eth + gamma * DH_Lac) ./ (beta * cEth + gamma * cLac);
    plot(CR1, cue1, '--', 'Color', 'k', 'LineWidth', lw(i)); hold on
end
% text(375, 0.5, 'Y_{F2} = 0', 'FontSize', fsz-1)
text(200, 0.65, ['Y_{F2} = ', num2str(YF)], 'FontSize', fsz-1)





e2 = linspace(0, e_lac_max, 1000);
DH_Lac = abs(e2*dhana+(1 - gb/gs * e2)*dcatL);
cLac = 0.05 * e2;
beta = 0.5;
gamma = 1-beta;

e11 = YF;
for i = 1:length(e11)
    e1 = e11(i);
    cue2 = beta * e1 + gamma * e2;
    DH_eth = abs((1 - e1 * gb/gs)*dcatE+e1*dhana);
    cEth = (0.05 * e1 + (1 - gb/gs * e1) * 1 / 3);
    CR2 = (beta * DH_eth + gamma * DH_Lac) ./ (beta * cEth + gamma * cLac);
    plot(CR2, cue2, '-', 'Color', 'k', 'LineWidth', lw(i)); hold on
end
ylim([0, 1])
xlim([0, xL])
% text(35, 0.5, 'Y_{F1} = 0', 'FontSize', fsz-1, 'Rotation',0)
text(30, 0.65, ['Y_{F1} =', num2str(YF)], 'FontSize', fsz-1, 'Rotation',0)
% scatter(122.5,0.15,100,'kp' );scatter(84.2,0.15,100,'kp' )
text(122,0.1,'Y','FontSize', fszax, 'FontName', 'times' );
text(70,0.1,'X','FontSize', fszax, 'FontName', 'times' )


p1 = line(nan, nan, 'Linestyle', '-', 'Marker', 'none', 'Color', 'k' ,'LineWidth', 1.5);
p2 = line(nan, nan, 'Linestyle', '--', 'Marker', 'none', 'Color', 'k', 'LineWidth', 1.5);

hlegend2 = legend([p1, p2], ...
    {'constant Y_{F1} varying Y_{F2}', 'constant Y_{F2} varying Y_{F1}'});
set(hlegend2, 'box', 'off', 'Location', 'northeast', 'Interpreter', 'tex', 'FontSize', fsz);
hlegend2.Title.String = 'Combined fermentation (F1 and F2)';
hlegend2.Title.FontSize = fsz;
hlegend2.Title.FontWeight='normal';
hlegend2.Title.FontName = ftype1;
hlegend2.Position(1)=hlegend2.Position(1)-0.02;
set(gca, ...
     'XTickLabel',[], 'YTickLabel',[],'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);
A=annotation('arrow','LineWidth',2);
A.Position=[5.9478e-01   6.9029e-01  -2.1061e-02   6.8571e-02];
A.Position = [A.Position(1)+A.Position(3), A.Position(2)+A.Position(4), -A.Position(3),-A.Position(4)];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[6.2700e-01   6.8800e-01   2.0132e-02   6.4229e-02];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];




% Complex aerobic and fermt
axes(ha(3));
alpha = 0.5;
beta = 0.5;
gamma = 0;

y = linspace(0, y_ae_max, 1000);
DH_AE = abs((1 - Y * gb/gs)*dcatg+Y*dhana);
cAE = (1 - Y);

e11 = YF;
for i = 1:length(e11)
    e1 = e11(i);
    DH_eth = abs((1 - e1 * gb/gs)*dcatE+e1*dhana);
    cEth = (0.05 * e1 + (1 - gb/gs * e1) * 1 / 3);
    e2 = 0;
    DH_Lac = abs(e2*dhana+(1 - gb/gs * e2)*dcatL);
    cLac = 0.05 * e2;
    CR = (alpha * DH_AE + beta * DH_eth + gamma * DH_Lac) ./ (alpha * cAE + beta * cEth + gamma * cLac);
    cue = alpha * y + beta * e1 + gamma * e2;
    plot(CR, cue, '-', 'Color', 'k', 'LineWidth', lw(i)); hold on
end
ylim([0, 1])
xlim([0, xL])
% text(40, 0.525, 'Y_{F1} = 0', 'FontSize', fsz-1, 'Rotation',-15)
text(40, 0.675, ['Y_{F1} = ', num2str(YF)], 'FontSize', fsz-1, 'Rotation',-10)


alpha = 0.5;
beta = 0;
gamma = 0.5;
y = linspace(0, y_ae_max, 1000);
DH_AE = abs((1 - Y * gb/gs)*dcatg+Y*dhana);
cAE = (1 - Y);

e22 = YF;
for i = 1:length(e22)
    e2 = e22(i);
    e1 = 0;
    DH_eth = abs((1 - e1 * gb/gs)*dcatE+e1*dhana);
    cEth = (0.05 * e1 + (1 - gb/gs * e1) * 1 / 3);
    DH_Lac = abs(e2*dhana+(1 - gb/gs * e2)*dcatL);
    cLac = 0.05 * e2;
    CR = (alpha * DH_AE + beta * DH_eth + gamma * DH_Lac) ./ (alpha * cAE + beta * cEth + gamma * cLac);
    cue = alpha * y + beta * e1 + gamma * e2;
    plot(CR, cue, '--', 'Color', 'k', 'LineWidth', lw(i)); hold on
end
% text(375, 0.425, 'Y_{F2} = 0', 'FontSize', fsz-1, 'Rotation',-5)
text(250, 0.67, ['Y_{F2} =', num2str(YF)], 'FontSize', fsz-1, 'Rotation',-5)

xlim([0, xL])
ylim([0, 1])
xlabel('$CR$ (kJ C-mol$^{-1}$ $\mathrm{CO_2}$)', 'FontSize', fsz,'Interpreter', 'latex')
ylabel('$CUE$ (C-mol B C-mol$^{-1}$ glu)','Interpreter', 'latex')
p1 = line(nan, nan, 'Linestyle', '-', 'Marker', 'none', 'Color', 'k' ,'LineWidth', 1.5);
p2 = line(nan, nan, 'Linestyle', '--', 'Marker', 'none', 'Color', 'k', 'LineWidth', 1.5);

hlegend3 = legend([p1, p2], ...
    {['Aerobic + F1 \newlinevarying Y_{AE}, ', ['Y_{F1} = ', num2str(YF)] , ', and Y_{F2} = 0'],...
    ['Aerobic + F2 \newlinevarying Y_{AE}, Y_{F1} = 0, and ',  ['Y_{F2} = ', num2str(YF)]]});
set(hlegend3, 'box', 'off', 'Location', 'northeast', 'Interpreter', 'tex', 'FontSize', fsz);
% hlegend3.Position=[0.3007    0.3635    0.1877    0.1367];
hlegend3.Position(1)=hlegend3.Position(1)-0.02;
hlegend3.Position(2)=hlegend3.Position(2)+0.05;

set(gca, ...
    'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);

A=annotation('arrow','LineWidth',2,'LineStyle', '-');
A.Position=[ 2.9907e-01   2.4571e-01  -6.9924e-02   5.1429e-02];

B=annotation('arrow','LineWidth',2,'LineStyle', '--');
B.Position=[4.2965e-01   2.0914e-01  -1.5164e-02   9.6000e-02];
B.Position = [B.Position(1)+B.Position(3), B.Position(2)+B.Position(4), -B.Position(3),-B.Position(4)];
A.Position = [A.Position(1)+A.Position(3), A.Position(2)+A.Position(4), -A.Position(3),-A.Position(4)];

% Completely complex
axes(ha(4));
alpha = 0.5;
beta = 0.25;
gamma = 0.25;
y = linspace(0, y_ae_max, 1000);
DH_AE = abs((1 - Y * gb/gs)*dcatg+Y*dhana);
cAE = (1 - Y);

e2 = 0.3;
e1=0.3;
DH_eth = abs((1 - e1 * gb/gs)*dcatE+e1*dhana);
cEth = (0.05 * e1 + (1 - gb/gs * e1) * 1 / 3);

DH_Lac = abs(e2*dhana+(1 - gb/gs * e2)*dcatL);
cLac = 0.05 * e2;
CR = (alpha * DH_AE + beta * DH_eth + gamma * DH_Lac) ./ (alpha * cAE + beta * cEth + gamma * cLac);
cue = alpha * y + beta * e1 + gamma * e2;
plot(CR, cue, '-', 'Color', 'k', 'LineWidth', 1.5); hold on



xlim([0, xL])
ylim([0, 1])
xlabel('$CR$ (kJ C-mol$^{-1}$ $\mathrm{CO_2}$)', 'FontSize', fsz,'Interpreter', 'latex')
hlegend4 = legend(['varying Y_{AE}, Y_{F1} = ', num2str(YF),', and Y_{F2} = ', num2str(YF)]);
set(hlegend4, 'box', 'off', 'Location', 'northeast', 'Interpreter', 'tex', 'FontSize', fsz);
hlegend4.Title.String = 'Aerobic + fermentation (F1 and F2)';
hlegend4.Title.FontSize = fsz;
hlegend4.Title.FontWeight='normal';
hlegend4.Title.FontName = ftype1;
hlegend4.Position(1)=hlegend4.Position(1)-0.02;

set(gca, ...
     'YTickLabel',[],'FontSize', fszax, 'FontName', ftype1, ...
    'LineWidth', alw, 'Box', 'off', ...
    'TickDir', 'out', 'TickLength', [.02, .02], 'XMinorTick', 'on', ...
    'YMinorTick', 'on', 'YGrid', 'on', 'XGrid', 'on', 'XColor', xycolor, 'YColor', xycolor);
A=annotation('arrow','LineWidth',2,'LineStyle', '-');
A.Position=[  8.3067e-01   2.4571e-01  -7.2452e-02   8.4571e-02];
A.Position = [A.Position(1)+A.Position(3), A.Position(2)+A.Position(4), -A.Position(3),-A.Position(4)];

text(ha(1), 0.95, 0.975, '(a)', 'FontSize', fszax, 'FontName', ftype1, 'Units','normalized')
text(ha(2),0.95, 0.975, '(b)', 'FontSize', fszax, 'FontName', ftype1, 'Units','normalized')
text(ha(3),0.95, 0.975, '(c)', 'FontSize', fszax, 'FontName', ftype1, 'Units','normalized')
text(ha(4), 0.95, 0.975,'(d)', 'FontSize', fszax, 'FontName', ftype1, 'Units','normalized')

figpath='..\Figures\';
export_fig(gcf, [figpath, 'Figure6.pdf'], '-r300');
