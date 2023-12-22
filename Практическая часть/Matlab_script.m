data = [
1	2018	"Baku"	"Diesel"	1594;
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
21	2018	"Shaki"	"Diesel"	765;
22	2018	"Shaki"	"Gasoline"	2747;
23	2018	"Shaki"	"Electric"	1513;
24	2018	"Shaki"	"Hybrid"	2348;
25	2018	"Lankaran"	"Diesel"	223;
26	2018	"Lankaran"	"Gasoline"	1054;
27	2018	"Lankaran"	"Electric"	1580;
28	2018	"Lankaran"	"Hybrid"	1245;
29	2018	"Yevlakh"	"Diesel"	742;
30	2018	"Yevlakh"	"Gasoline"	717;
31	2018	"Yevlakh"	"Electric"	424;
32	2018	"Yevlakh"	"Hybrid"	1460;
33	2018	"Gabala"	"Diesel"	2499;
34	2018	"Gabala"	"Gasoline"	303;
35	2018	"Gabala"	"Electric"	2766;
36	2018	"Gabala"	"Hybrid"	2555;
37	2018	"Goychay"	"Diesel"	1083;
38	2018	"Goychay"	"Gasoline"	2607;
39	2018	"Goychay"	"Electric"	970;
40	2018	"Goychay"	"Hybrid"	1289;
41	2019	"Baku"	"Diesel"	978;
42	2019	"Baku"	"Gasoline"	1039;
43	2019	"Baku"	"Electric"	1105;
44	2019	"Baku"	"Hybrid"	2143;
45	2019	"Ganja"	"Diesel"	824;
46	2019	"Ganja"	"Gasoline"	1542;
47	2019	"Ganja"	"Electric"	1006;
48	2019	"Ganja"	"Hybrid"	231;
49	2019	"Sumgait"	"Diesel"	1090;
50	2019	"Sumgait"	"Gasoline"	916;
51	2019	"Sumgait"	"Electric"	2895;
52	2019	"Sumgait"	"Hybrid"	2934;
53	2019	"Mingachevir"	"Diesel"	1835;
54	2019	"Mingachevir"	"Gasoline"	2534;
55	2019	"Mingachevir"	"Electric"	689;
56	2019	"Mingachevir"	"Hybrid"	2487;
57	2019	"Nakhchivan"	"Diesel"	352;
58	2019	"Nakhchivan"	"Gasoline"	2340;
59	2019	"Nakhchivan"	"Electric"	642;
60	2019	"Nakhchivan"	"Hybrid"	2072;
61	2019	"Shaki"	"Diesel"	1324;
62	2019	"Shaki"	"Gasoline"	716;
63	2019	"Shaki"	"Electric"	457;
64	2019	"Shaki"	"Hybrid"	1138;
65	2019	"Lankaran"	"Diesel"	2586;
66	2019	"Lankaran"	"Gasoline"	2245;
67	2019	"Lankaran"	"Electric"	1645;
68	2019	"Lankaran"	"Hybrid"	1338;
69	2019	"Yevlakh"	"Diesel"	1269;
70	2019	"Yevlakh"	"Gasoline"	888;
71	2019	"Yevlakh"	"Electric"	383;
72	2019	"Yevlakh"	"Hybrid"	995;
73	2019	"Gabala"	"Diesel"	1171;
74	2019	"Gabala"	"Gasoline"	1507;
75	2019	"Gabala"	"Electric"	1243;
76	2019	"Gabala"	"Hybrid"	973;
77	2019	"Goychay"	"Diesel"	2935;
78	2019	"Goychay"	"Gasoline"	1119;
79	2019	"Goychay"	"Electric"	995;
80	2019	"Goychay"	"Hybrid"	2054;
];

% Преобразование категориальных переменных в числовые
data(:, 3) = grp2idx(data(:, 3)); % Преобразование региона в числовой формат
data(:, 4) = grp2idx(data(:, 4)); % Преобразование типа топлива в числовой формат

% Разделение данных на обучающую и тестовую выборки
trainData = data(str2double(data(:, 2)) < 2019, :); % Данные до 2019 года
testData = data(str2double(data(:, 2)) == 2019, :); % Данные за 2019 год

% Извлечение входных параметров (год, регион, тип топлива)
X_train = trainData(:, [2 3 4]);
X_train = str2double(X_train);
% Извлечение целевой переменной (количество)
Y_train = trainData(:, 5);
Y_train = str2double(Y_train);
% Создание нейронной сети
net = fitnet([10 5]); % Указание количества нейронов в каждом слое

% Настройка нейронной сети
net = configure(net, X_train', Y_train');

% Обучение нейронной сети
net = train(net, X_train', Y_train');

% Извлечение входных параметров для тестирования
X_test = testData(:, [2 3 4]);
X_test = str2double(X_test);

% Прогнозирование с использованием обученной нейронной сети
predictions = net(X_test');

% Вывод прогнозов
disp(predictions);
