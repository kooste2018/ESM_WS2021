function M_ppb = ppb_convert(B)
%B = readmatrix('NO2.xlsx');
B(725:744,:)= [];% Data preprocessing
M = B(:,26:30);% Data preprocessing
m_w = 46.0055;% NO2 molecular weight
T = 283;% temperature
P = 1000;% pressure
m_v = 22.41 * (T/273) * (1013/P);% molecular volume (litres)
M_ppb = (m_v * M) / m_w ;% convert to ppb
end