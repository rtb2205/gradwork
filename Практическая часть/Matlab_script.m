data = [1	2018	"Baku"	"Diesel"	1594;
2	2018	"Baku"	"Gasoline"	2918;
3	2018	"Baku"	"Electric"	517;
4	2018	"Baku"	"Hybrid"	2565;
5	2018	"Ganja"	"Diesel"	370;
6	2018	"Ganja"	"Gasoline"	1518;
7	2018	"Ganja"	"Electric"	2750;
8	2018	"Ganja"	"Hybrid"	2728;
9	2018	"Sumgait"	"Diesel"	193;
10	2018	"Sumgait"	"Gasoline"	1873;
11	2018	"Sumgait"	"Electric"	1069;
12	2018	"Sumgait"	"Hybrid"	2292;
13	2018	"Mingachevir"	"Diesel"	672;
14	2018	"Mingachevir"	"Gasoline"	2600;
15	2018	"Mingachevir"	"Electric"	1467;
16	2018	"Mingachevir"	"Hybrid"	2232;
17	2018	"Nakhchivan"	"Diesel"	1380;
18	2018	"Nakhchivan"	"Gasoline"	1146;
19	2018	"Nakhchivan"	"Electric"	953;
20	2018	"Nakhchivan"	"Hybrid"	1070;
];

X_features = data(:, 2:4);
Y = str2double(data(:, 6));

X_features(:, 2) = grp2idx(X_features(:, 2));
X_features(:, 3) = grp2idx(X_features(:, 3));

X_features = str2double(X_features);

% Создание нейронной сети для количества
net_count = fitnet([10 5]); % Укажите количество нейронов в каждом слое
net_count = configure(net_count, X_features', Y');
net_count = train(net_count, X_features', Y');
% Тестирование
X_test = [1	2018	"Baku"	"Diesel"	13010970	742;
2	2018	"Baku"	"Gasoline"	10394024	566;
3	2018	"Baku"	"Electric"	14966864	1228;
4	2018	"Baku"	"Hybrid"	6005076	1474;
5	2018	"Ganja"	"Diesel"	27551016	2754;
6	2018	"Ganja"	"Gasoline"	4890132	351;
7	2018	"Ganja"	"Electric"	29546496	1832;
8	2018	"Ganja"	"Hybrid"	17028063	1339;
9	2018	"Sumgait"	"Diesel"	24898131	2909;
10	2018	"Sumgait"	"Gasoline"	22338680	1292;
11	2018	"Sumgait"	"Electric"	10727476	782;
12	2018	"Sumgait"	"Hybrid"	5724894	651;
13	2018	"Mingachevir"	"Diesel"	3396256	422;
14	2018	"Mingachevir"	"Gasoline"	15555958	866;
15	2018	"Mingachevir"	"Electric"	5925902	449;
16	2018	"Mingachevir"	"Hybrid"	19743828	2613;
17	2018	"Nakhchivan"	"Diesel"	19358870	1153;
18	2018	"Nakhchivan"	"Gasoline"	9993396	542;
19	2018	"Nakhchivan"	"Electric"	7812714	1722;
20	2018	"Nakhchivan"	"Hybrid"	44632977	2969;
];

X_test(:, 2) = grp2idx(X_test(:, 2));
X_test(:, 3) = grp2idx(X_test(:, 3));

X_test = str2double(X_test);

% Предсказание количества
predictions_count = net_count(X_test');

disp(predictions_count);

