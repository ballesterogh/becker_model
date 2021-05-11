clear all
close all

%Definimo parámetros
t = 0:1:8;
w0 = 10; %salario trabajador no calificado
ww0 = 15; %salario trabajador no calificado despues de la reforma
p0 = 0.65; %probabilidad encontrar empleo de trabajador no calificado
pp0 = 0.75; %probabilidad encontrar empleo de trabajador no calificado despues de la reforma educativa
w1 = 22; %salario trabajador calificado
p1 = 0.9; %probabilidad encontrar empleo de trabajador calificado
c = 20; %costo de educación
k = 25; %costo de educación despues de la reforma
r = 0.4; %tasa de interés

%Flujo ingreso trabajador sin educación antes de la reforma
Y0=[];
for i=1:length(t)    
    Y0(i)= (p0*w0/r)*(1-(1/(1+r)^t(i)))  ;
end


%Flujo ingreso trabajador sin educación despues de la reforma
YY0=[];
for i=1:length(t)    
    YY0(i)= (pp0*ww0/r)*(1-(1/(1+r)^t(i)))  ;
end


%Flujo ingreso trabajador educación antes de la reforma
Y1=[];
Y1=[-c, -c, -c, -c];
for i=5:length(t)    
    Y1(i)= (p1*w1/r)*(1-(1/(1+r)^t(i)))  ;
end


%Flujo ingreso trabajador educación despues de la reforma
YY1=[];
YY1=[-k, -k, -k, -k];
for i=5:length(t)    
    YY1(i)= (p1*w1/r)*(1-(1/(1+r)^t(i)))  ;
end

set(groot,'defaultAxesTickLabelInterpreter','latex');

figure(1)
P1 = plot(t, Y0, 'LineWidth', 2);
set(gca,'FontSize',18);
hold on
P2 = plot(t, Y1, 'LineWidth', 2);
P1.Color = [0 0.4470 0.7410];
P2.Color = [1 0 0];
A11 = area(t, Y0);
A21 = area(t, Y1);
A11.FaceColor = [0 0.4470 0.7410];
alpha(.5);
A21.FaceColor = [1 0 0];
alpha(.5);
xlabel('Año');
ylabel('Ingreso');
legend('Flujo de ingresos futuros sin educación', 'Flujo de ingresos futuros con educación','Location','southeast');
ylim([-30 50]);
yticks([-c, Y0(1), Y1(5)]);
yticklabels({'$-c_0$', '$w_{NC_0}^e$', '$w_{C}^e$'});
xticks([0, 4, 8]);
xticklabels({'18', '$18+ \tau$', 'Retiro laboral'});
str = {{'Costo directo'},'Costo de oportunidad', 'Beneficio neto'};
text([1.5  1.3 5],[-c+10 -c+23.5 -c+50],str, 'FontSize',20);


figure(2)
PP1 = plot(t, YY0, 'LineWidth', 2);
set(gca,'FontSize',18);
hold on
PP2 = plot(t, YY1, 'LineWidth', 2);
hold on
P1 = plot(t, Y0,'--', 'LineWidth', 2);
hold on
P2 = plot(t, Y1,'--' ,'LineWidth', 2);
P1.Color = [0 0.4470 0.7410];
P2.Color = [1 0 0];
PP1.Color = [0 0.4470 0.7410];
PP2.Color = [1 0 0];
A11 = area(t, YY0);
A21 = area(t, YY1);
A11.FaceColor = [0 0.4470 0.7410];
alpha(.5);
A21.FaceColor = [1 0 0];
alpha(.5);
xlabel('Año');
ylabel('Ingreso');
legend('Flujo de ingresos futuros sin educación', 'Flujo de ingresos futuros con educación','Location','southeast');
ylim([-30 50]);
xlim([0 7.5]);
yticks([-k, -c, YY0(1), Y1(5)]);
yticklabels({'$-c_1$', '$-c_0$', '$w_{NC_1}^e$', '$w_{C}^e$'});
xticks([0, 4 7.5]);
xticklabels({'19', '$19+\tau$', 'Retiro laboral'});
str = {{'Costo directo'},'Costo de oportunidad', 'Beneficio neto'};
text([1.5  1.3 5],[-c+10 -c+26 -c+53],str, 'FontSize',20);
