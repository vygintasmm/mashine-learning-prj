% Užkraunami visi reikalingi failai ir funkcijos
addpath('C:\Users\MSI\Desktop\New folder\IS-Lab4-master'); % Čia 'kelias/iki/funkcijos/' pakeiskite savo funkcijų direktorija

% Išvalomi kintamieji ir uždaromi visi atvaizdai
close all;
clear variables;
clc;

%% Mokymo duomenų paruošimas
% Čia nurodome mokymo duomenų vaizdo failo pavadinimą
pavadinimas_mokymui = 'test.jpg'; 
% Skaičių eilučių vaizde nustatymas
pvz_eiluciu_sk_mokymui = 1; % 
% Požymių išskyrimas mokymo vaizdui
pozymiai_mokymui = pozymiai_raidems_atpazinti(pavadinimas_mokymui, pvz_eiluciu_sk_mokymui);

% Požymių ir teisingų atsakymų matricų paruošimas
P_mokymui = cell2mat(pozymiai_mokymui);
T_mokymui = eye(size(pozymiai_mokymui, 2));

%% RBFN tinklo mokymas
% Neuronų skaičiaus sumažinimas
neuronu_sk = 10; % Čia galite pasirinkti mažesnį skaičių nei 13
% RBFN tinklo kūrimas
tinklas = newrb(P_mokymui, T_mokymui, 0, 1, neuronu_sk);

%% Tinklo testavimas su naujais duomenimis
% Testavimo duomenų vaizdo failo pavadinimas
pavadinimas_testavimui = 'train.jpg'; 
% Skaičių eilučių vaizde nustatymas testavimui
pvz_eiluciu_sk_testavimui = 1;
% Požymių išskyrimas testavimo vaizdui
pozymiai_testavimui = pozymiai_raidems_atpazinti(pavadinimas_testavimui, pvz_eiluciu_sk_testavimui);

% Požymių matricos paruošimas testavimui
P_testavimui = cell2mat(pozymiai_testavimui);
% Tinklo išvesties apskaičiavimas
Y_testavimui = sim(tinklas, P_testavimui);

% Atpažintų simbolių nustatymas
[~, atpazinti_indeksai] = max(Y_testavimui);
% Rezultatų atvaizdavimas
disp('Atpažinti simboliai:');
disp(atpazinti_indeksai);

