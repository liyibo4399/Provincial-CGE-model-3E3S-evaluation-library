* --------------------------------------------------------------------
* 全国50个部门多区域动态CGE模型，
* 含能源模块和碳模块，可模拟碳税和碳交易
*--------------------------------------------------------------------
*$OFFLISTING
OPTION RESLIM=117200;
OPTION DOMLIM=127200;
OPTION LIMROW=1, LIMCOL=0
SOLPRINT=OFF
*SYSOUT=OFF
Option decimals = 6
;

*----------------------------------
* Sets
*----------------------------------
SETS
REG Regions /BJ,TJ,HB,SX,NM,LN,JL,HLJ,SH,JS,ZJ,AH,FJ,JX,SD,HeN,HuB,HuN,GD,GX,HN,CQ,SC,GZ,YN,XZ,ShX,GS,QH,NX,XJ,URC/
PRO(REG) Provinces /BJ,TJ,HB,SX,NM,LN,JL,HLJ,SH,JS,ZJ,AH,FJ,JX,SD,HeN,HuB,HuN,GD,GX,HN,CQ,SC,GZ,YN,XZ,ShX,GS,QH,NX,XJ,URC/
;
SET
RSAM SECTORS /
01        农林牧渔产品和服务
02        煤炭采选产品
03        石油开采产品
04        天然气开采产品
05        金属矿采选产品
06        非金属矿和其他矿采选产品
07        食品和烟草
08        纺织品
09        纺织服装鞋帽皮革羽绒及其制品
10        木材加工品和家具
11        造纸印刷和文教体育用品
12        石油和核燃料加工品
13        煤炭加工品
14        化学产品
15        非金属矿物制品
16        金属冶炼和压延加工品
17        金属制品
18        通用设备
19        专用设备
20        交通运输设备
21        电气机械和器材
22        通信设备、计算机和其他电子设备
23        仪器仪表
24        其他制造产品和废品废料
25        金属制品、机械和设备修理服务
26        火电
27        水电
28        核电
29        风电
30        太阳能电
31        其他可再生能源发电
32        电力供应
33        燃气生产和供应
34        水的生产和供应
35        建筑
36        批发和零售
37        交通运输、仓储和邮政
38        住宿和餐饮
39        信息传输、软件和信息技术服务
40        金融
41        房地产
42        租赁和商务服务
43        研究和试验发展
44        综合技术服务
45        水利、环境和公共设施管理
46        居民服务、修理和其他服务
47        教育
48        卫生和社会工作
49        文化、体育和娱乐
50        公共管理、社会保障和社会组织
51        农林牧渔产品和服务
52        煤炭采选产品
53        石油开采产品
54        天然气开采产品
55        金属矿采选产品
56        非金属矿和其他矿采选产品
57        食品和烟草
58        纺织品
59        纺织服装鞋帽皮革羽绒及其制品
60        木材加工品和家具
61        造纸印刷和文教体育用品
62        石油和核燃料加工品
63        煤炭加工品
64        化学产品
65        非金属矿物制品
66        金属冶炼和压延加工品
67        金属制品
68        通用设备
69        专用设备
70        交通运输设备
71        电气机械和器材
72        通信设备、计算机和其他电子设备
73        仪器仪表
74        其他制造产品和废品废料
75        金属制品、机械和设备修理服务
76        火电
77        水电
78        核电
79        风电
80        太阳能电
81        其他可再生能源发电
82        电力供应
83        燃气生产和供应
84        水的生产和供应
85        建筑
86        批发和零售
87        交通运输、仓储和邮政
88        住宿和餐饮
89        信息传输、软件和信息技术服务
90        金融
91        房地产
92        租赁和商务服务
93        研究和试验发展
94        综合技术服务
95        水利、环境和公共设施管理
96        居民服务、修理和其他服务
97        教育
98        卫生和社会工作
99        文化、体育和娱乐
100        公共管理、社会保障和社会组织
101        城镇低收入20%
102        城镇中低收入20%
103        城镇中收入20%
104        城镇中高收入20%
105        城镇高收入20%
106        农村低收入20%
107        农村中低收入20%
108        农村中收入20%
109        农村中高收入20%
110        农村高收入20%
111        资本
112        居民
113        企业
114        地方政府
115        中央政府
116        生产补贴
117        生产税
118        国内商品的增值税
119        进口关税
120        进口商品的消费税
121        进口商品的增值税
122        国内商品的消费税
123        收入税
124        ROW
125        流入自北京
126        流入自天津
127        流入自河北
128        流入自山西
129        流入自内蒙古
130        流入自辽宁
131        流入自吉林
132        流入自黑龙江
133        流入自上海
134        流入自江苏
135        流入自浙江
136        流入自安徽
137        流入自福建
138        流入自江西
139        流入自山东
140        流入自河南
141        流入自湖北
142        流入自湖南
143        流入自广东
144        流入自广西
145        流入自海南
146        流入自重庆
147        流入自四川
148        流入自贵州
149        流入自云南
150        流入自西藏
151        流入自陕西
152        流入自甘肃
153        流入自青海
154        流入自宁夏
155        流入自新疆
156        流入自URC
157        固定资本形成
158        存货变动
159        总计
/
;
SETS
PS(RSAM)       Production Sectors /01*50/
CC(RSAM)       Commodities /51*100/
LB(RSAM)       Labour /101*110/
KR(RSAM)       Capital Rent /111/
HH(RSAM)       HouseHolds /112/
FM(RSAM)       Firms /113/
LG(RSAM)       Local Government /114/
CG(RSAM)       Central Government /115/
SS(RSAM)       SubSidy /116/
PT(RSAM)       Production Tax /117/
DVT(RSAM)      Domestic Value added Tax /118/
IMPTX(RSAM)    Import Tax /119/
IMCTX(RSAM)    Import Consumption Tax /120/
IMVTX(RSAM)    Import Value added Tax /121/
DCT(RSAM)      Domestic Consumption Tax /122/
DTX(RSAM)      Direct Taxes /123/
ROW(RSAM)      Rest Of THe World /124/
ROC(RSAM)      Rest of China /125*156/
*URC(RSAM)      Unrecorded China /156/
IV(RSAM)       Investment /157/
STK(RSAM)      STocK chANge/158/
SM(RSAM)       Sum or total /159/

FT(RSAM)       Factors /101*111/
HFG(RSAM)      Institutions /112*115/
ITX(RSAM)      Indirect Taxes /116*118/
CTX(RSAM)      Commodity Taxes /119*122/
GTX(RSAM)      Government Taxes /116*123/

EN(PS)         Energy Production Sectors /02*04,12,13,33,26*32/
NEN(PS)        Non-Energy Production Sectors /01,05*11,14*25,34*50/
PG0(PS)        Power Generation energy sectors /26*31/
NPG0(PS)       Non-Power Generation energy sectors /02*04,12,13,33,32/
PG(PS)         Power Generation energy sectors /26*32/
NPG(PS)        Non-Power Generation energy sectors /02*04,12,13,33/
FEN(PS)        Fossil Energy Production Sectors /02*04,12,13,26,33/
NFEN(PS)       Non-Fossil Energy Production Sectors /27*32/
NFPG(PS)       Non-Fossil Power Generation sectors /27*31/
REPG(PS)       Renewable Energy Power Generation and Distribution sectors /29*32/
PS8(PS)        8 main polluting Sectors /11,12,14,15,16,26,37/
NGLN(PS)       Non-green loan sectors /02*04,12,13,27,28,26,33/
ENCC7(CC)      Energy Products /52*54,62,63,82,83/
ENCC(CC)       Energy Products /52*54,62,63,83,76*82/
NENCC(CC)      Non-energy Products /51,55*61,64*75,84*100/
NPGCC(CC)      Non-Power Generation energy products /52*54,62,63,83/
FENCC(CC)      Fossil Energy Products /52*54,62,63,76,83/
NFPGCC(CC)     Non-fossil power generations /77*81/
;
SET ITEMS1  Items /
spee0
sinvps0
/;
SET ITEMS2  Items /
sa0
st0
wpi0
/;
SET FU  Final Users /
01        Total final user
/;
SET CO2S  CO2 Sources /
01        原煤
02        原油
03        天然气
04        加工煤
05        精炼油
06        提炼气
07        工艺过程
08        全部
/;
SET CO2Sref  CO2 references /
TCO2ref
TENCO2ref
TELCO2ref
TNENCO2ref
FDCO2ref
/;
SET TH  Time Horizon of THe Model /2017*2018/
;
*设置动态集
SET AN(TH);
AN(TH)=yes;
SET BY(TH) Base Year /2017/;
SET LP LOOPS of iteration /1*30/;

PARAMETER LAST;
LAST=CARD(TH);
PARAMETER INITYEAR;
INITYEAR=2017;
PARAMETER CURRYEAR;
CURRYEAR=2017;
PARAMETER NUMYEAR(TH);
NUMYEAR(TH) = ORD(TH);
display NUMYEAR;

ALIAS(RSAM,CSAM)
ALIAS(PS,PS1,PS2)
ALIAS(CC,CC1)
ALIAS(HH,HH1)
ALIAS(HFG,HFG1)
ALIAS(ROW,ROW1)
ALIAS(ROC,ROC1)
ALIAS(TH,TH0,TH1)
;
*-----------------------------------
*THe Model Variables and Parameters
*-----------------------------------
PARAMETERS
PROsam50(RSAM,CSAM)                Provincial SAM
PRO_SAM(RSAM,CSAM)                 China SAM data 2017
sa2017(CC,PRO)                     substitution of elasticity of Armington in base year
st2017(CC,PRO)                     substitution of elasticity of CET function in base year
wpi2017(CC,PRO)                    Exogenous World Price Index
sinvps2017(PS,PRO)                 Share of sectoral investment in total investment
spee2017(PS,PRO)                   Substitution of elasticity of energy inputs in base year
elasPS(PS,ITEMS1)                  Subsititution parameters by sector
elasPSPRO(PS,PRO)                  Subsititution parameters by sector
elasCC(CC,ITEMS2)                  Subsititution parameters by product
elasCCPRO(CC,PRO)                  Subsititution parameters by product
CO2(PS,PRO,TH)                     China CARBON data 2017
alphahee(CC,HH,PRO,TH)             Composition of Household consumption of energy
alphahnen(CC,HH,PRO,TH)            Composition of Household consumption of non-energy
shcee(HH,PRO,TH)                   Share of energy consumption in total household consumption

PROsam42(RSAM,CSAM)                Provincial SAM
PROsamREG2017(RSAM,CSAM,PRO)       Provincial SAM by REGion
PROsamREG(RSAM,CSAM,PRO,TH)        Provincial SAM by REGion
PROsamREGs(RSAM,CSAM,PRO,TH)       Provincial SAM by REGion

X0(PS,PRO,TH)                      Activity of domestic production
Q0(CC,PRO,TH)                      Output of production
TABS0(CC,PRO,TH)                   Total ABSorption
QD0(CC,PRO,TH)                     Regional use of own product
DIMP20(CC,PRO,TH)                  Regional flow in
DEXP20(CC,PRO,TH)                  Regional flow out
IDTX0(PRO,TH)                      Total production TaX by province
CMTXQC0(PRO,TH)                    Total ConsuMption TaX by province

sqd(CC,PRO,TH)                     Share of Domestically-used domestic commodity in total domestic commodity
sdexp(CC,ROC,PRO,TH)               Share of domestic export in regional product Q
sdimp(ROC,CC,PRO,TH)               Share of domestic import in regional composite prouct QC
sdimp2(CC,PRO,TH)                  Share of domestic import in regional composite prouct QC
si(CC,PRO,TH)                      Share of Import in total domestic supply (QD+IMP)
shhly(HH,PRO,TH)                   Share of household labour income in total labour income
shhky(HH,PRO,TH)                   Share of household capital income in total capital income
sfmky(PRO,TH)                      Share of firm capital income in total capital income
srwky(PRO,TH)
shhtx(HH,PRO,TH)                   Share of household income tax in total household spending
sfmTHh(HH,PRO,TH)                  Share of firm trANsfer to household
sfmtlg(PRO,TH)                     Share of firm trANsfer to local government
sfmtcg(PRO,TH)                     Share of firm trANsfer to central government
sfms(PRO,TH)                       Share of firm savings in total firm spending
slgtcg(PRO,TH)                     Share of local goverment trANsfer to central government
scgtlg(PRO,TH)                     Share of central government trANsfer to local government
siinv(PRO,TH)                      Share of international investment
sdinv(ROC,PRO,TH)                  Share of domestic investment
stxtlg(GTX,PRO,TH)                 Share of local government tax revenue in total tax revenue
stxtcg(GTX,PRO,TH)                 Share of central government tax revenue in total tax revenue
slgdt(PRO,TH)                      Share of local government debt in total investment
srowdt(PRO,TH)                     Share of ROW debt in total investment
srocdt(ROC,PRO,TH)                 Share of ROC debt in total investment
sinvccpsv(CC,PS,PRO,TH)            Investment matrix
sinvccpsv1(CC,PS,PRO,TH)           Investment matrix
scmtxexp(CTX,PRO,TH)               Share of commodity tax attached to export
siimpexp(PRO,TH)                   Share of international import reexported
siimpfo(ROC,PRO,TH)                Share of international import flowed out
scmtxfo(CTX,ROC,PRO,TH)            Share of commodity tax attached to flow out
sdimpexp(ROC,PRO,TH)               Share of domestic import reexported
sdimpfo(ROC,ROC1,PRO,TH)           Share of domestic import flowed out
alphah(CC,HH,PRO,TH)               Composition of Household consumption
sh(HH,PRO,TH)                      Saving Propensity by Household
alphalg(CC,PRO,TH)                 Composition of Local Government consumption
alphacg(CC,PRO,TH)                 Composition of Central Government consumption
slg(PRO,TH)                        Saving Propensity of Local Government
scg(PRO,TH)                        Saving Propensity of Central Government
slgTHh(HH,PRO,TH)                  Share of Local Government to Housheold
su                                 Substitution elasticity of Utility
sp(PS,PRO,TH)                      Substitution elasticity of Production
st(CC,PRO,TH)                      Substitution elasticity of TrANsformation function
sa(CC,PRO,TH)                      Substitution elasticity of Amington function
alphai(CC,PRO,TH)                  Investment use of commodity
alphas(CC,PRO,TH)                  Stock use of commodity
seninv(PRO,TH)                     Substitution elasticity of energy sectoral investment
sneninv(PRO,TH)                    Substitution elasticity of non-energy sectoral investment
beta(PS,PRO,TH)                    Use Table of intermediate inputs or uses
gamma(PS,PRO,TH)                   Factor Input
gammal(PS,PRO,TH)                  Labour Input
gammak(PS,PRO,TH)                  Capital Input
seninv(PRO,TH)                     Substitution elasticity of energy sectoral investment
sneninv(PRO,TH)                    Substitution elasticity of non-energy sectoral investment
*新增人口增长
NGDP(TH)                           National  GDP
gngdp(TH)                          Growth of national GDP
gnrgdp(TH)                         Growth of national real GDP
NPOP(TH)                           National Population
gnpop0(TH)                         National Projected Growth of population
gnpop(TH)                          National Growth of population
gnpopps(PS,TH)                     National Growth of population by sector
GDP(PRO,TH)                        Provincial GDP
ggdp(TH)                           Growth of Provincial GDP
grgdp(PRO,TH)                      Growth of Provincial real GDP
POP(PRO,TH)                        Provincial Population
gpop0(PRO,TH)                      Projected Growth of Provincial population
gpop(PRO,TH)                       Growth of Provincial population
gpopps(PS,PRO,TH)                  Growth of Provincial population by sector
lpr(PRO,TH)                        Labour participation rate
LPC(PRO,TH)                        Labour participation
lu(PRO,TH)                         Labour unit
glprd(PRO,TH)                      Growth rate of labour productivity
*新增资本折旧率
dep(PRO,TH)                        Depreciation rate of capital
depps(PS,PRO,TH)                   Depreciation rate of capital by sector
*新增资本增长
gk(PRO,TH)                         GrouTH of capital
gkPS(PS,PRO,TH)                    GrowTH of capital by sector
gkpsprd(PS,PRO,TH)                 GrowTH rate of capital productivity by sector

Rdif(PS,PRO,TH)                    Discrepancy of R and RPS
uut(CC,PS,PRO,TH)                  Use Table of intermediate demANd divided by total intermediate input

*新增初始的劳动资本存货
ILS(PRO)                           Initial period labour stock
IKS(PS,PRO)                        Initial period capital stock
ILSPS(PS,PRO)                      Initial period labour stock by sector
IKSPS(PS,PRO)                      Initial period capital stock by sector
delta(CC,PRO,TH)                   Substitution rate of Armington assumption
epsilon(CC,PRO,TH)                 Substitution rate of trANsformation assumption
delta2(CC,PRO,TH)                  Substitution rate of Armington assumption
epsilon2(CC,PRO,TH)                Substitution rate of trANsformation assumption
ut(CC,PS,PRO,TH)                   Use Table of intermediate demANd divided by total intermediate input
vt(PS,CC,PRO,TH)                   Make Table of production supply
rit(ITX,PS,PRO,TH)                 Rate of Indirect Tax
rct(CTX,CC,PRO,TH)                 Rate of Consumption Tax
rimt(CC,PRO,TH)                    Rate of Import Tax
rvat(CC,PRO,TH)                    Rate of Value added Tax on domestic sales
rdt(HH,PRO,TH)                     Rate of Direct Tax by household
sly(HH,PRO,TH)                     Share of Labour Income by Household
sky(HH,PRO,TH)                     Share of Capital Income by Household
IK(PS,PRO)                         Initial period capital stock
AH(HH,PRO,TH)                      Scaling parameter of Cobb-Douglas utility function by household
ALG(PRO,TH)                        Scaling parameter of Cobb-Douglas utility function for Local Government
ACG(PRO,TH)                        Scaling parameter of Cobb-Douglas utility function for Central Government
AI(PRO,TH)                         Scaling parameter of Cobb-Douglas investment function for investor
AP(PS,PRO,TH)                      Scaling parameter of CES production function for producer
AV(PS,PRO,TH)                      Scaling parameter of Cobb-Douglas function of factor inputs
AA(CC,PRO,TH)                      Scaling parameter of Armington function
AT(CC,PRO,TH)                      Scaling parameter of TrANsformation function
AA2(CC,PRO,TH)                     Scaling parameter of Armington function
AT2(CC,PRO,TH)                     Scaling parameter of TrANsformation function
ivs(PRO,TH)                        REGportion of investment in stock
sinvps(PS,PRO,TH)                  Share of sectoral investment in total investment
SINVCCPSV(CC,PS,PRO,TH)            Share of Sectors in Delivery to Investment
AS(PRO,TH)                         Scaling parameter of Cobb-Douglas stock function for investor
betahcee(CC,HH,PRO,TH)             Value share of huosehold uses of energy

THHCM(HH,PRO,TH)                   Total Household consumption
TLGCM(PRO,TH)                      Total Local Government consumption
TCGCM(PRO,TH)                      Total Central Government consumption
wpi(CC,PRO,TH)                     World Price of Import at foreign currency
wpe(CC,PRO,TH)                     World Price of Export at foreign currency
GDP1(PRO,TH)                       GDP by Production meTHod
GDP2(PRO,TH)                       GDP by income meTHod
GDP3(PRO,TH)                       GDP by expenditure meTHod
NGDP1(PRO,TH)                      Nominial GDP by production meTHod
NGDP2(PRO,TH)                      Nominial GDP by income meTHod
NGDP3(PRO,TH)                      Nominial GDP by expenditure meTHod

*嵌套
beta(PS,PRO,TH)                    Use Table of intermediate inputs or uses
gamma(PS,PRO,TH)                   Factor Input
gammal(PS,PRO,TH)                  Labour Input
gammak(PS,PRO,TH)                  Capital Input
shcc(HH,PRO,TH)                    Substitution elasticity of energy consumption
*非能源+电力
utnee(PS,PRO,TH)                   Use Table of intermediate inputs or uses of non-energy-ele
utneecc(CC,PS,PRO,TH)
*能源+电力
utee(PS,PRO,TH)                    Use Table of intermediate inputs or uses of energy-ele
spee(PS,PRO,TH)
APEE(PS,PRO,TH)                    Scaling parameter of CES production function of energy uses for producer
AHCEE(HH,PRO,TH)                   Scaling parameter of CES consumption function for consumer
*能源
betaee(CC,PS,PRO,TH)               Use Table of intermediate inputs or uses of energy
betae(PS,PRO,TH)                   Use Table of intermediate inputs or uses of energy
spen(PS,PRO,TH)
APEN(PS,PRO,TH)
betaen(CC,PS,PRO,TH)               Use Table of intermediate inputs or uses of energy
*-------------------------
* Carbon Module
*-------------------------
cofCO2CCPS2017(CC,PS)              Coefficients of CO2 EMissions of sectors by commodity ANd sector
cofCO2CCPS(CC,PS,PRO,TH)           Coefficients of CO2 EMissions of sectors by commodity ANd sector
cofCO2CC2017(CC,FU)                Coefficients of CO2 EMissions of final users by commodity ANd final user
CO2CCPS(CC,PS,PRO,TH)              Coefficients of CO2 EMissions by product ANd by sector
PSCO2(PS,PRO,TH)                   Emissions of CO2 by sector
cofCO2CC(CC,PRO,TH)                Coefficients of CO2 EMissions by Source ANd Sector
CO2refs(CO2Sref,PRO,TH)            Reference of CO2 emissions
ENCO2PSref(PS,PRO,TH)              Reference of CO2 emissions from energy use by sector
ELCO2PSref(PS,PRO,TH)              Reference of CO2 emissions from electricity use by sector
NENCO2ref(PS,PRO,TH)               Reference of CO2 emissions from non-energy use by sector
B1S1TCO2ref(PRO,TH)                Reference of total CO2 emissions by scenario
CO2ref(PRO,TH)                     CO2 EMissions in reference year
CO2refPS(PS,PRO,TH)                CO2 EMissions in reference year by sector
tcer(PRO,TH)                       Target of carbon emissions reduction
tcerPS(PS,PRO,TH)                  Target of carbon emissions reduction by sector
FPENPSref(PS,PRO,TH)               Free permit in reference for energy use by sector
FPNENPSref(PS,PRO,TH)              Free permit in reference for non-energy use by sector
FPFDref(PRO,TH)                    Free permit in reference by final demANd
TRCO2(PRO,TH)                      Tax Rate on CO2
FIXedCO2ref(PRO,TH)                Fixed Reference of total CO2 emissions

SWET(PRO,TH)                       Switch on Emissions Trading (SWET=1=ET|SWET=0=No ET)
*------------------------------------------
* Automomous Energy Efficiency Improvement
*------------------------------------------
AEEI0(PRO,TH)                      Automomous Energy Efficiency Improvement
AEEI(PS,PRO,TH)                    Automomous Energy Efficiency Improvement by sector
AEEI19(PRO,TH)                     Automomous Energy Efficiency Improvement
AEEI20(PRO,TH)                     Automomous Energy Efficiency Improvement
AEEI21(PRO,TH)                     Automomous Energy Efficiency Improvement
AEEI23(PRO,TH)                     Automomous Energy Efficiency Improvement
AEEICC0(CC,PRO,TH)                 Automomous Energy Efficiency Improvement on energy products
AEEICC(CC,PRO,TH)                  Automomous Energy Efficiency Improvement on energy products

SWCTR(PRO,TH)                      SWitch on Carbon Tax Recycle

TIMP(PRO,TH)                       Total import in value
TEXP(PRO,TH)                       Total export in value
TC(PRO,TH)                         Total consumption in value
TENCO2(PRO,TH)                     Total CO2 emissions from energy use
TELCO2(PRO,TH)                     Total CO2 emissions from electricity use
TNENCO2(PRO,TH)                    Total CO2 emissions from non-energy use
FPEN(PRO,TH)                       Free Permits for energy
FPNEN(PRO,TH)                      Free Permits for non-energy
FPFD(PRO,TH)                       Free Permits for Final DemANd
CPI(PRO,TH)                        Consumer Price Index
NNGDP(PRO,TH)                      GDP in constANt price
NTC(PRO,TH)                        Total consumption in constANt price
NTINV(PRO,TH)                      Total investment in constANt price
TINVSC(PRO,TH)                     Total investment ANd stock chANge in constANt price
NIMP(PRO,TH)                       Nominial import
NEXP(PRO,TH)                       Nominial export
PPI(PRO,TH)                        Producer Price Index

XCH(PS,PRO,TH)                     Share of output by sector
KCH(PS,PRO,TH)                     Share of KSPS
SLS(PS,PRO,TH)                     Share of LSPS

QX1(CC,PRO,TH)                     To check equivalence of THe two sides of THe PC function
QC1(CC,PRO,TH)                     To check equivalence of THe two sides of THe PC function
DEXP1(CC,PRO,TH)                   To check total domestic flow out
DIMP1(CC,PRO,TH)                   To check total domestic flow in
IIMP1(CC,PRO,TH)                   To check total domestic flow in
;
VARIABLES
LST(PS,PRO,TH)
KST(PS,PRO,TH)
LS(PRO,TH)                         Total Labour Supply or endowment
KS(PRO,TH)                         Capital Supply
TKS(PRO,TH)                        Total Capital Supply or endowment
*KS(PS,PRO,TH)                      Capital Supply by sector and region
LSPS(PS,PRO,TH)                    Labour Stock or endowment by sector
KSPS(PS,PRO,TH)                    Capital Stock by sector

THHC(HH,PRO,TH)                    Total Household consumption
HCEE(HH,PRO,TH)                    Household consumption for energy
HCNEN(HH,PRO,TH)                   Household consumption for non-energy
CHCEE(HH,PRO,TH)                   Cost of Household energy consumption
HHT(HH,PRO,TH)                     Households trANsactions wiTH Households
HDT(HH,PRO,TH)                     Households Direct Tax
HHCM(CC,HH,PRO,TH)                 Household Consumption
HHCM1(CC,HH,PRO,TH)                Household Consumption of energy product
HHCM2(CC,HH,PRO,TH)                Household Consumption of non-energy product
HHTX(HH,PRO,TH)                    Direct TaXes of household
HHS(HH,PRO,TH)                     Household Savings
HHE(HH,PRO,TH)                     Household Expenditure
HHY(HH,PRO,TH)                     Household Income

IDTX(ITX,PS,PRO,TH)                InDirect TaX by producer
QX(CC,PS,PRO,TH)                   Use table or Intermediate demand of commodity by producer
LPS(PS,PRO,TH)                     Labour demANd by producer
LY(PS,PRO,TH)                      Labour factor income by producer
KPS(PS,PRO,TH)                     Capital demANd by producer
KY(PS,PRO,TH)                      Capital factor income by producer
X(PS,PRO,TH)                       Activity of domestic production
XQ(PS,CC,PRO,TH)                   Make table
CMT(CTX,CC,PRO,TH)                 ConsuMption TaX by type ANd commodity
CMTXQC(CTX,CC,PRO,TH)              ConsuMption TaX by type ANd commodity
CMTXEXP(CTX,PRO,TH)                ConsuMption TaX by type
CMTXFO(CTX,ROC,PRO,TH)             ConsuMption TaX by type
IIMP(CC,PRO,TH)                    International IMPort
IIMPEXP(PRO,TH)                    International IMPort
IIMPFO(ROC,PRO,TH)                 International IMPort
DIMP(ROC,CC,PRO,TH)                Domestic IMPort
DIMP2(CC,PRO,TH)                   Domestic IMPort
DIMPEXP(ROC,PRO,TH)                Domestic IMPort
DIMPFO(ROC,ROC1,PRO,TH)            Domestic IMPort
HHLY(HH,PRO,TH)                    Household labour income from expenditure
TLE(PRO,TH)                        Total Labour Expenditure
TLY(PRO,TH)                        Total Labour Income from factor
HHKY(HH,PRO,TH)                    Household capital income from expenditure
FMKY(PRO,TH)                       Firm capital income from expenditure
RWKY(PRO,TH)                       ROW capital income from expenditure
TKE(PRO,TH)                        Total Capital Expenditure
TKY(PRO,TH)                        Total Capital Income
FMTHH(HH,PRO,TH)                   Firm trANsfer To Household
FMTLG(PRO,TH)                      Firm trANsfer To Local Government
FMTCG(PRO,TH)                      Firm trANsfer To Central Government
FMS(PRO,TH)                        Firm savings
FME(PRO,TH)                        Firm expenditure
FMY(PRO,TH)                        Firm income
LGCM(CC,PRO,TH)                    Local Government Consumption
LGTCG(PRO,TH)                      Local Government TrANsfer to Central Government
LGTHH(HH,PRO,TH)                   Local Government TrANsfer To HouseHold
LGS(PRO,TH)                        Local Government Savings
LGE(PRO,TH)                        Local Government Expenditure
LGY(PRO,TH)                        Local Government Income
LGDT(PRO,TH)                       Local Government Debt
CGCM(CC,PRO,TH)                    Central Government Consumption
CGTLG(PRO,TH)                      Central Government Transfer to Local Government
CGS(PRO,TH)                        Central Government Savings
CGE(PRO,TH)                        Central Government Expenditure
CGY(PRO,TH)                        Central Government Income
TXTLG(GTX,PRO,TH)                  Local Government Tax revenue
TXTCG(GTX,PRO,TH)                  Central Government Tax revenue
TXE(GTX,PRO,TH)                    Total Tax Expenditure
TXY(GTX,PRO,TH)                    Total Tax income
IEXP(CC,PRO,TH)                    International EXPort
TIEXP(PRO,TH)                      Total International EXPort
TIIMP(PRO,TH)                      Total International IMPort
DEXP(CC,ROC,PRO,TH)                Domestic EXPort
DEXP2(CC,PRO,TH)                   Domestic EXPort
DINV(ROC,PRO,TH)                   Domestic Investment
TDEXP(ROC,PRO,TH)                  Total Domestic EXPort
TDIMP(ROC,PRO,TH)                  Total Domestic IMPort
TABS(CC,PRO,TH)                    Total ABSorption
INV(PRO,TH)                        Investment by commodity
INVCCV(CC,PRO,TH)                  Investment by commodity
INVPSV(PS,PRO,TH)                  Investment by producer
IINV(PRO,TH)                       International Investment
ROWDT(PRO,TH)                      ROW Debt
ROCDT(ROC,PRO,TH)                  ROC Debt
U(PS,PRO,TH)                       Use of composite intermediate input
V(PS,PRO,TH)                       Use of composite factor input
Q(CC,PRO,TH)                       Quantity of domestically-produced commodity
QD(CC,PRO,TH)                      Quantity of domestically-produced commodity sold in domestic market
QDDEXP(CC,PRO,TH)                  QD+DEXP for use of CET function
QDDIMP(CC,PRO,TH)                  QD+DIMP for use of Armington
QC(CC,PRO,TH)                      Quantity of Composite commodity supplied to or consumed in domestic market
QCD(CC,PRO,TH)                     Quantity of Composite commodity demANded for or consumed in domestic market
UY(HH,PRO,TH)                      Utility by household
PC(CC,PRO,TH)                      Relative Price of Composite commodity sold in domestic market
PX(PS,PRO,TH)                      Price for activity of domestic production
PU(PS,PRO,TH)                      Price of composite intermediate input
PV(PS,PRO,TH)                      Price of composite factor input
PQ(CC,PRO,TH)                      Price of domestically-produced commodity
PQD(CC,PRO,TH)                     Price for domestically-produced commodity sold in domestic market
PQDDEXP(CC,PRO,TH)                 Price for domestic commodity
PQDDIMP(CC,PRO,TH)                 Price for domestically-produced commodity sold in domestic market
PIEXP(CC,PRO,TH)                   Price of International EXPort at local currency
PDEXP(CC,PRO,TH)                   Price of Domestic EXPort at local currency
PDEXP2(CC,ROC,PRO,TH)              Price of Domestic EXPort at local currency
PIIMP(CC,PRO,TH)                   Price of International IMPort at local currency
PDIMP(CC,PRO,TH)                   Price of Domestic IMPort at local currency
PDIMP2(ROC,CC,PRO,TH)              Price of Domestic IMPort at local currency
EXR(PRO,TH)                        EXchANge Rate
CX(PS,PRO,TH)                      Cost of producer
PUY(HH,PRO,TH)                     Price of Utility or aggREGate consumption by household
BT(PRO,TH)                         BalANce of Trade

TSAV(PRO,TH)                       Total SAVings
TINV(PRO,TH)                       Total INVestment
INVCCPSV(CC,PS,PRO,TH)             Investment by boTH Commodity ANd Sector (in volum)
INVCC(CC,PRO,TH)                   Investment by commodity
INVCCV(CC,PRO,TH)                  Investment by commodity in Volume
INVPS(PS,PRO,TH)                   Investment to sector
INVPSV(PS,PRO,TH)                  Investment to sector in Volume
INVF(PRO,TH)                       Investment to abroad
INVS(PRO,TH)                       Investment in Stock
SC(CC,PRO,TH)                      Stock ChANge by commodity
TSCE(PRO,TH)                       Total Stock ChANge Expenditure
TSCY(PRO,TH)                       Total Stock ChANge income
PINVPS(PS,PRO,TH)                  Price of Investment by sector

QX(CC,PS,PRO,TH)                   Use table or Intermediate demANd of commodity by producer
XC(PS,CC,PRO,TH)                   Make table
LPS(PS,PRO,TH)                     Labour demANd by producer
KPS(PS,PRO,TH)                     Capital demANd by producer
DVAT(PS,PRO,TH)                    Direct Taxes

PCFD(CC,PRO,TH)                    Relative Price of Composite commodity sold in domestic market for Final DemANd except for export
PIEXPFD(CC,PRO,TH)                 Relative Price of Composite commodity sold in domestic market for Final DemANd for international export
PDEXPFD(CC,PRO,TH)                 Relative Price of Composite commodity sold in domestic market for Final DemANd for domestic export
PEXP(CC,PRO,TH)                    Price of EXPort at local currency
PIMP(CC,PRO,TH)                    Price of IMPort at local currency
W(PRO,TH)                          Wage rate
R(PRO,TH)                          Rental rate
WPS(PS,PRO,TH)                     Wage rate by sector
RPS(PS,PRO,TH)                     Rental rate by sector
FLI(CC,PRO,TH)                     Flow In

RGDP(PRO,TH)                       Real GDP
ADJgdp(PRO,TH)                     Adjuster of GDP

*-------------------------
* Energy Module
*-------------------------
*嵌套
*EE=能源+电力
CXEE0(PS,PRO,TH)                   Unit cost of energy input of production by product
CXEE(PS,PRO,TH)                    Unit cost of energy input of production by product ANd by sector
UEE(PS,PRO,TH)                     Energy Input of production by sector
QXEE0(CC,PS,PRO,TH)                Energy Input of production by product ANd by sector
QXEE(CC,PS,PRO,TH)                 Energy Input of production by product ANd by sector
QXNEN(CC,PS,PRO,TH)                Non-Energy Input of production by product ANd by sector
UEN(PS,PRO,TH)                     Energy Input of production by sector
UNEN(PS,PRO,TH)                    Non-Energy Input of production by sector
PQXEE0(CC,PRO,TH)                  Price of energy input by product
PQXEE(CC,PRO,TH)                   Price of energy input by product
PQXEEPS(CC,PS,PRO,TH)              Price of energy input by product ANd by sector
PQXNEN0(CC,PRO,TH)                 Price of non-energy production by product
PQXNEN(CC,PRO,TH)                  Price of non-energy input by product
PQXNENPS(CC,PS,PRO,TH)             Price of non-energy input by product ANd by sector

*-------------------------
* Carbon Module
*-------------------------
ENCO2CCPS(CC,PS,PRO,TH)            Emissions of CO2 by sector
ENCO2(PS,PRO,TH)                   Sectoral CO2 emissions of energy
ELCO2(PS,PRO,TH)                   Sectoral CO2 emissions of THermel power
NENCO2(PS,PRO,TH)                  Sectoral CO2 emissions of non-energy
FDCO2(PRO,TH)                      CO2 emissions of final demANds
TCO2(PRO,TH)                       National CO2 emissions
ENTRCO2(PRO,TH)                    Endogenous carbon tax
PCO2(PRO,TH)                       Price Carbon Permits
PCO2ccps(CC,PS,PRO,TH)             Carbon cost of each energy
PCO2ps(PS,PRO,TH)                  Carbon cost by sector
PCO2CLUB(PRO,TH)                   Carbon cost by club of sectors
PCO2FD(PRO,TH)                     Carbon cost of final user for energy ANd cement
PCO2FDcc(CC,PRO,TH)                Carbon cost of final user for energy ANd cement by commodity
TXCO2PS(PS,PRO,TH)                 Tax of CO2 by sector
TXENCO2(PRO,TH)                    Tax of Energy CO2
TXNENCO2(PRO,TH)                   Tax of Non-energy CO2
TXFDCO2(PRO,TH)                    Tax of Final use CO2
TXCO2FD(PRO,TH)                    Net Tax of Final use CO2
TXCO2(PRO,TH)                      Tax of CO2

;
*-----------------------------------------------------------------数据读入------
*THe Data Files
*-----------------------------------------------------------------数据读入------
$libinclude xlimport PROsamREGs Multi_regional_CGE_data.XLSX SAM!A1
PROsamREG(RSAM,CSAM,PRO,TH) = PROsamREGs(RSAM,CSAM,PRO,"2017");
PROsamREG(RSAM,CSAM,PRO,TH)$(ORD(PRO)>31) = 0;

*-------------------------------------------------------------------------------
cofCO2CCPS(CC,PS,PRO,TH) = 0;
cofCO2CCPS("52",PS,PRO,TH) = 0.198611124;
cofCO2CCPS("53",PS,PRO,TH) = 0.000471606;
cofCO2CCPS("54",PS,PRO,TH) = 0.054700484;
cofCO2CCPS("62",PS,PRO,TH) = 0.03085982;
cofCO2CCPS("63",PS,PRO,TH) = 0.364658469;
cofCO2CCPS("83",PS,PRO,TH) = 0.017271146;
cofCO2CCPS("65","15",PRO,TH) = 0.011549848*1;
*cofCO2CCPS(CC,PS,PRO,TH) = 0;
*全国单位化石能源碳排放系数（百万吨/亿元）
*原煤        43        0.198611124
*原油        44        0.000471606
*天然气      45        0.054700484
*精炼油      50        0.03085982
*加工煤      51        0.364658469
*提炼气      68        0.017271146
*工艺过程    54        0.011549848

*-------------------------------------------------------------------------------
cofCO2CC("52",PRO,TH) = 0.9126394403;
cofCO2CC("53",PRO,TH) = 0.0000;
cofCO2CC("54",PRO,TH) = 0.4068842519;
cofCO2CC("62",PRO,TH) = 0.0198961522;
cofCO2CC("63",PRO,TH) = 0.0326136195;
cofCO2CC("83",PRO,TH) = 0.0314039291;
cofCO2CC("65",PRO,TH) = 0.0000;
*cofCO2CC(CC,PRO,TH) = 0;
*原煤        43        0.9126394403
*原油        44        0.0000
*天然气      45        0.4068842519
*精炼油      50        0.0198961522
*加工煤      51        0.0326136195
*提炼气      68        0.0314039291
*工艺过程    54        0.0000
*-------------------------------------------------------------------------------

$libinclude xlimport sa2017 Multi_regional_CGE_data.xlsx sa2017!A1:AG52
$libinclude xlimport st2017 Multi_regional_CGE_data.xlsx st2017!A1:AG52
$libinclude xlimport spee2017 Multi_regional_CGE_data.xlsx spee2017!A1:AG52
sa(CC,PRO,TH) = sa2017(CC,PRO);
st(CC,PRO,TH) = st2017(CC,PRO);
spee(PS,PRO,TH) = spee2017(PS,PRO);

$libinclude xlimport NPOP Multi_regional_CGE_data.xlsx Projections!b1:d2
$libinclude xlimport gnpop0 Multi_regional_CGE_data.xlsx Projections!b3:d4
*$libinclude xlimport GDP Analyses.xlsx Projections!a5:ar6
$libinclude xlimport gngdp Multi_regional_CGE_data.xlsx Projections!b7:d8
POP(PRO,TH) = NPOP(TH);
gpop0(PRO,TH) = gnpop0(TH);
ggdp(TH) = gngdp(TH);

*$libinclude xlimport CO2refs ANalyses.xlsx BAU1ref!a3:a8
**$libinclude xlimport FPENPSref ANalyses20220810.xlsx BAU1ref!a230:e280
**$libinclude xlimport FPNENPSref ANalyses20220810.xlsx BAU1ref!a283:e333
**$libinclude xlimport FPFDref ANalyses20220810.xlsx BAU1ref!a336:e338

*$libinclude xlimport B1S1TCO2ref ANalyses1020-phr.xlsx BAU1ref!a250:a251
**$libinclude xlimport ENCO2PSref ANalyses20220810.xlsx BAU1ref!a120:e170
**$libinclude xlimport FIXedCO2ref ANalyses20220810.xlsx BAU1ref!a346:e347

**FPENPSref(PS,PRO,TH) = 1.0*FPENPSref(PS,PRO,TH);
**FPNENPSref(PS,PRO,TH) = 1.0*FPNENPSref(PS,PRO,TH);
**FPFDref(PRO,TH) = 1.0*FPFDref(PRO,TH);

FIXedCO2ref(PRO,TH) = 0;
ENCO2PSref(PS,PRO,TH) = 0;
FPENPSref(PS,PRO,TH) = 0;
FPNENPSref(PS,PRO,TH) = 0;
FPFDref(PRO,TH) = 0;
FPENPSref(PS,PRO,TH) = 1.0*FPENPSref(PS,PRO,TH);
FPNENPSref(PS,PRO,TH) = 1.0*FPNENPSref(PS,PRO,TH);
FPFDref(PRO,TH) = 1.0*FPFDref(PRO,TH);

*----------------------------------
* Calibrations
*----------------------------------
su = 0.8;
sp(PS,PRO,TH) = 0.8;
st(CC,PRO,TH) = 0.8;
sa(CC,PRO,TH) = 0.8;
wpi(CC,PRO,TH) = 1;
wpe(CC,PRO,TH) = 1;

shcc(HH,PRO,TH) = 3.0;
spee(PS,PRO,TH) = 3;

* Column 1 -----------------------------
QX.L(CC,PS,PRO,TH) = PROsamREG(CC,PS,PRO,TH);
QXEE0.L(CC,PS,PRO,TH)$ENCC(CC) = QX.L(CC,PS,PRO,TH);
QXEE.L(CC,PS,PRO,TH)$ENCC(CC) = QX.L(CC,PS,PRO,TH);
QXNEN.L(CC,PS,PRO,TH)$(NENCC(CC)) = QX.L(CC,PS,PRO,TH);

U.L(PS,PRO,TH) = SUM(CC,QX.L(CC,PS,PRO,TH));
UEE.L(PS,PRO,TH) = SUM(CC$ENCC(CC),QX.L(CC,PS,PRO,TH));
UNEN.L(PS,PRO,TH) = SUM(CC$(NENCC(CC)),QX.L(CC,PS,PRO,TH));

LPS.L(PS,PRO,TH) = SUM(LB,PROsamREG(LB,PS,PRO,TH));
LY.L(PS,PRO,TH) = SUM(LB,PROsamREG(LB,PS,PRO,TH));
LST.L(PS,PRO,TH) = LY.L(PS,PRO,TH);
LSPS.L(PS,PRO,TH) = LST.L(PS,PRO,TH);
LS.L(PRO,TH) = SUM(PS,LSPS.L(PS,PRO,TH));
KY.L(PS,PRO,TH) = SUM(KR,PROsamREG(KR,PS,PRO,TH));
KPS.L(PS,PRO,TH) = KY.L(PS,PRO,TH);
KPS.L(PS,PRO,TH) = KY.L(PS,PRO,TH)/0.1;
KST.L(PS,PRO,TH) = KPS.L(PS,PRO,TH);
KSPS.L(PS,PRO,TH) = KST.L(PS,PRO,TH);
KS.L(PRO,TH) = SUM(PS,KSPS.L(PS,PRO,TH));
*初始劳动存货赋值
ILS(PRO)= LS.L(PRO,"2017");
ILSPS(PS,PRO) = LSPS.L(PS,PRO,"2017");
*初始资本存货赋值
IKS(PS,PRO) = KSPS.L(PS,PRO,"2017");
IKSPS(PS,PRO) = KSPS.L(PS,PRO,"2017");
WPS.L(PS,PRO,TH) = (LPS.L(PS,PRO,TH)/LSPS.L(PS,PRO,TH))$(LSPS.L(PS,PRO,TH)<>0);
W.L(PRO,TH) = (SUM(PS,LPS.L(PS,PRO,TH))/SUM(PS,LSPS.L(PS,PRO,TH)))$(SUM(PS,LSPS.L(PS,PRO,TH))<>0);
RPS.L(PS,PRO,TH) = (SUM(KR,PROsamREG(KR,PS,PRO,TH))/KSPS.L(PS,PRO,TH))$(KSPS.L(PS,PRO,TH)<>0);
R.L(PRO,TH) = (SUM((KR,PS),PROsamREG(KR,PS,PRO,TH))/SUM(PS,KSPS.L(PS,PRO,TH)))$(SUM(PS,KSPS.L(PS,PRO,TH))<>0);
Rdif(PS,PRO,TH) = (RPS.L(PS,PRO,TH)/R.L(PRO,TH))$(R.L(PRO,TH)<>0);
IDTX.L(ITX,PS,PRO,TH) = PROsamREG(ITX,PS,PRO,TH);
X.L(PS,PRO,TH) = SUM(CC,QX.L(CC,PS,PRO,TH))+LY.L(PS,PRO,TH)+KY.L(PS,PRO,TH)+SUM(ITX,IDTX.L(ITX,PS,PRO,TH));
X0(PS,PRO,TH) = X.L(PS,PRO,TH);
* Column 2 -----------------------------
XQ.L(PS,CC,PRO,TH) = PROsamREG(PS,CC,PRO,TH);
Q0(CC,PRO,TH) = SUM(PS,XQ.L(PS,CC,PRO,TH));
CMTXQC.L(CTX,CC,PRO,TH) = PROsamREG(CTX,CC,PRO,TH);
CMT.L(CTX,CC,PRO,TH)= CMTXQC.L(CTX,CC,PRO,TH);
IIMP.L(CC,PRO,TH) = SUM(ROW,PROsamREG(ROW,CC,PRO,TH));
DIMP.L(ROC,CC,PRO,TH) = PROsamREG(ROC,CC,PRO,TH);
DIMP2.L(CC,PRO,TH) = SUM(ROC,DIMP.L(ROC,CC,PRO,TH));
DIMP20(CC,PRO,TH) = DIMP2.L(CC,PRO,TH);
TABS.L(CC,PRO,TH) = SUM(PS,XQ.L(PS,CC,PRO,TH))+SUM(CTX,CMTXQC.L(CTX,CC,PRO,TH))+IIMP.L(CC,PRO,TH)+SUM(ROC,DIMP.L(ROC,CC,PRO,TH));
TABS0(CC,PRO,TH) = TABS.L(CC,PRO,TH);
* Column 3 -----------------------------
HHLY.L(HH,PRO,TH) = SUM(LB,PROsamREG(HH,LB,PRO,TH));
TLE.L(PRO,TH) = SUM(HH,HHLY.L(HH,PRO,TH));
TLY.L(PRO,TH) = SUM(PS,LY.L(PS,PRO,TH));
* Column 4 -----------------------------
HHKY.L(HH,PRO,TH) = SUM(KR,PROsamREG(HH,KR,PRO,TH));
FMKY.L(PRO,TH) = SUM((FM,KR),PROsamREG(FM,KR,PRO,TH));
RWKY.L(PRO,TH) = SUM((ROW,KR),PROsamREG(ROW,KR,PRO,TH));
TKE.L(PRO,TH) = SUM(HH,HHKY.L(HH,PRO,TH));
TKY.L(PRO,TH) = SUM(PS,KY.L(PS,PRO,TH));
* Column 5 -----------------------------
LGTHH.L(HH,PRO,TH) = SUM(LG,PROsamREG(HH,LG,PRO,TH));
HHY.L(HH,PRO,TH) = HHLY.L(HH,PRO,TH)+HHKY.L(HH,PRO,TH)+LGTHH.L(HH,PRO,TH);
HHCM.L(CC,HH,PRO,TH) = PROsamREG(CC,HH,PRO,TH);
HHCM1.L(CC,HH,PRO,TH)$ENCC(CC) = HHCM.L(CC,HH,PRO,TH);
HHCM2.L(CC,HH,PRO,TH)$NENCC(CC) = HHCM.L(CC,HH,PRO,TH);
HCEE.L(HH,PRO,TH) = SUM(CC,HHCM1.L(CC,HH,PRO,TH));
HCNEN.L(HH,PRO,TH) = SUM(CC,HHCM2.L(CC,HH,PRO,TH));
THHC.L(HH,PRO,TH) = HCEE.L(HH,PRO,TH)+HCNEN.L(HH,PRO,TH);
HHTX.L(HH,PRO,TH) = SUM(DTX,PROsamREG(DTX,HH,PRO,TH));
HHS.L(HH,PRO,TH) = SUM(IV,PROsamREG(IV,HH,PRO,TH));
HHE.L(HH,PRO,TH) = SUM(CC,HHCM.L(CC,HH,PRO,TH))+HHTX.L(HH,PRO,TH)+HHS.L(HH,PRO,TH);
* Column 6 -----------------------------
FMTHH.L(HH,PRO,TH) = SUM(FM,PROsamREG(HH,FM,PRO,TH));
FMTLG.L(PRO,TH) = SUM((LG,FM),PROsamREG(LG,FM,PRO,TH));
FMTCG.L(PRO,TH) = SUM((CG,FM),PROsamREG(CG,FM,PRO,TH));
FMS.L(PRO,TH) = SUM((IV,FM),PROsamREG(IV,FM,PRO,TH));
FME.L(PRO,TH) = SUM(HH,FMTHH.L(HH,PRO,TH))+FMTLG.L(PRO,TH)+FMTCG.L(PRO,TH)+FMS.L(PRO,TH);
FMY.L(PRO,TH) = FMKY.L(PRO,TH);
* Column 7 -----------------------------
LGCM.L(CC,PRO,TH) = SUM(LG,PROsamREG(CC,LG,PRO,TH));
LGTHH.L(HH,PRO,TH) = SUM(LG,PROsamREG(HH,LG,PRO,TH));
LGTCG.L(PRO,TH) = SUM((CG,LG),PROsamREG(CG,LG,PRO,TH));
LGS.L(PRO,TH) = SUM((IV,LG),PROsamREG(IV,LG,PRO,TH));
LGE.L(PRO,TH) =  SUM(CC,LGCM.L(CC,PRO,TH))+SUM(HH,LGTHH.L(HH,PRO,TH))+LGTCG.L(PRO,TH)+LGS.L(PRO,TH);
CGTLG.L(PRO,TH) = SUM((LG,CG),PROsamREG(LG,CG,PRO,TH));
TXTLG.L(GTX,PRO,TH) = SUM(LG,PROsamREG(LG,GTX,PRO,TH));
LGDT.L(PRO,TH) = SUM((LG,IV),PROsamREG(LG,IV,PRO,TH));
LGY.L(PRO,TH) = FMTLG.L(PRO,TH)+CGTLG.L(PRO,TH)+SUM(GTX,TXTLG.L(GTX,PRO,TH))+LGDT.L(PRO,TH);
* Column 8 -----------------------------
CGCM.L(CC,PRO,TH) = SUM(CG,PROsamREG(CC,CG,PRO,TH));
CGTLG.L(PRO,TH) = SUM((LG,CG),PROsamREG(LG,CG,PRO,TH));
CGS.L(PRO,TH) = SUM((IV,CG),PROsamREG(IV,CG,PRO,TH));
CGE.L(PRO,TH) = SUM(CC,CGCM.L(CC,PRO,TH))+CGTLG.L(PRO,TH)+CGS.L(PRO,TH);
TXTCG.L(GTX,PRO,TH) = SUM(CG,PROsamREG(CG,GTX,PRO,TH));
CGY.L(PRO,TH) = FMTCG.L(PRO,TH)+LGTCG.L(PRO,TH)+SUM(GTX,TXTCG.L(GTX,PRO,TH));
* Column 9 -----------------------------
TXTLG.L(GTX,PRO,TH) = SUM(LG,PROsamREG(LG,GTX,PRO,TH));
TXTCG.L(GTX,PRO,TH) = SUM(CG,PROsamREG(CG,GTX,PRO,TH));
TXE.L(GTX,PRO,TH) = TXTLG.L(GTX,PRO,TH)+TXTCG.L(GTX,PRO,TH);
CMTXEXP.L(CTX,PRO,TH) = SUM(ROW,PROsamREG(CTX,ROW,PRO,TH));
CMTXFO.L(CTX,ROC,PRO,TH) = PROsamREG(CTX,ROC,PRO,TH);
TXY.L(GTX,PRO,TH) =  SUM(ITX$(ORD(ITX) EQ 1),SUM(PS,IDTX.L(ITX,PS,PRO,TH)))$(ORD(GTX) EQ 1)
                    +SUM(ITX$(ORD(ITX) EQ 2),SUM(PS,IDTX.L(ITX,PS,PRO,TH)))$(ORD(GTX) EQ 2)
                    +SUM(ITX$(ORD(ITX) EQ 3),SUM(PS,IDTX.L(ITX,PS,PRO,TH)))$(ORD(GTX) EQ 3)
                    +SUM(CTX$(ORD(CTX) EQ 1),SUM(CC,CMTXQC.L(CTX,CC,PRO,TH))+CMTXEXP.L(CTX,PRO,TH)+SUM(ROC,CMTXFO.L(CTX,ROC,PRO,TH)))$(ORD(GTX) EQ 4)
                    +SUM(CTX$(ORD(CTX) EQ 2),SUM(CC,CMTXQC.L(CTX,CC,PRO,TH))+CMTXEXP.L(CTX,PRO,TH)+SUM(ROC,CMTXFO.L(CTX,ROC,PRO,TH)))$(ORD(GTX) EQ 5)
                    +SUM(CTX$(ORD(CTX) EQ 3),SUM(CC,CMTXQC.L(CTX,CC,PRO,TH))+CMTXEXP.L(CTX,PRO,TH)+SUM(ROC,CMTXFO.L(CTX,ROC,PRO,TH)))$(ORD(GTX) EQ 6)
                    +SUM(CTX$(ORD(CTX) EQ 4),SUM(CC,CMTXQC.L(CTX,CC,PRO,TH))+CMTXEXP.L(CTX,PRO,TH)+SUM(ROC,CMTXFO.L(CTX,ROC,PRO,TH)))$(ORD(GTX) EQ 7)
                    +SUM(HH,HHTX.L(HH,PRO,TH)) $(ORD(GTX) EQ 8);
* Column 10 -----------------------------
IEXP.L(CC,PRO,TH) = SUM(ROW,PROsamREG(CC,ROW,PRO,TH));
CMTXEXP.L(CTX,PRO,TH) = SUM(ROW,PROsamREG(CTX,ROW,PRO,TH));
IIMPEXP.L(PRO,TH) = SUM((ROW,ROW1),PROsamREG(ROW,ROW1,PRO,TH));
DIMPEXP.L(ROC,PRO,TH) = SUM(ROW,PROsamREG(ROC,ROW,PRO,TH));
IINV.L(PRO,TH) = SUM((IV,ROW),PROsamREG(IV,ROW,PRO,TH));
INVF.L(PRO,TH) = SUM((ROW,IV),PROsamREG(ROW,IV,PRO,TH));

TIEXP.L(PRO,TH) = SUM(CC,IEXP.L(CC,PRO,TH))+SUM(CTX,CMTXEXP.L(CTX,PRO,TH))+IIMPEXP.L(PRO,TH)+SUM(ROC,DIMPEXP.L(ROC,PRO,TH))+IINV.L(PRO,TH);
IIMPFO.L(ROC,PRO,TH) = SUM(ROW,PROsamREG(ROW,ROC,PRO,TH));
ROWDT.L(PRO,TH) = SUM((ROW,IV),PROsamREG(ROW,IV,PRO,TH));
TIIMP.L(PRO,TH) = SUM(CC,IIMP.L(CC,PRO,TH))+IIMPEXP.L(PRO,TH)+SUM(ROC,IIMPFO.L(ROC,PRO,TH))+ROWDT.L(PRO,TH);
* Column 11 -----------------------------
DEXP.L(CC,ROC,PRO,TH) = PROsamREG(CC,ROC,PRO,TH);
DEXP2.L(CC,PRO,TH) = SUM(ROC,DEXP.L(CC,ROC,PRO,TH));
DEXP20(CC,PRO,TH) = DEXP2.L(CC,PRO,TH);
CMTXFO.L(CTX,ROC,PRO,TH) = PROsamREG(CTX,ROC,PRO,TH);
IIMPFO.L(ROC,PRO,TH) = SUM(ROW,PROsamREG(ROW,ROC,PRO,TH));
DIMPFO.L(ROC,ROC1,PRO,TH) = PROsamREG(ROC,ROC1,PRO,TH);
DINV.L(ROC,PRO,TH) = SUM(IV,PROsamREG(IV,ROC,PRO,TH));
TDEXP.L(ROC,PRO,TH) = SUM(CC,DEXP.L(CC,ROC,PRO,TH))+SUM(CTX,CMTXFO.L(CTX,ROC,PRO,TH))+IIMPFO.L(ROC,PRO,TH)+SUM(ROC1,DIMPFO.L(ROC1,ROC,PRO,TH))+DINV.L(ROC,PRO,TH);
ROCDT.L(ROC,PRO,TH) = SUM(IV,PROsamREG(ROC,IV,PRO,TH));
TDIMP.L(ROC,PRO,TH) = SUM(CC,DIMP.L(ROC,CC,PRO,TH))+DIMPEXP.L(ROC,PRO,TH)+SUM(ROC1,DIMPFO.L(ROC,ROC1,PRO,TH))+ROCDT.L(ROC,PRO,TH);
* Column 12 -----------------------------
INVCC.L(CC,PRO,TH) = SUM(IV,PROsamREG(CC,IV,PRO,TH));
INVCCV.L(CC,PRO,TH) = INVCC.L(CC,PRO,TH);
LGDT.L(PRO,TH) = SUM((LG,IV),PROsamREG(LG,IV,PRO,TH));
ROWDT.L(PRO,TH) = SUM((ROW,IV),PROsamREG(ROW,IV,PRO,TH));
INVS.L(PRO,TH) = SUM((STK,IV),PROsamREG(STK,IV,PRO,TH));
TINV.L(PRO,TH) = SUM(CC,INVCCV.L(CC,PRO,TH))+LGDT.L(PRO,TH)+ROWDT.L(PRO,TH)+SUM(ROC,ROCDT.L(ROC,PRO,TH))+INVS.L(PRO,TH);
TSAV.L(PRO,TH) = SUM(HH,HHS.L(HH,PRO,TH))+FMS.L(PRO,TH)+LGS.L(PRO,TH)+CGS.L(PRO,TH)+IINV.L(PRO,TH)+SUM(ROC,DINV.L(ROC,PRO,TH));
INV.L(PRO,TH) = SUM(CC,INVCCV.L(CC,PRO,TH));
sinvps(PS,PRO,TH) = (KY.L(PS,PRO,TH)/SUM(PS1,KY.L(PS1,PRO,TH)))$(SUM(PS1,KY.L(PS1,PRO,TH))<>0);

INVPS.L(PS,PRO,TH) = sinvps(PS,PRO,TH)*SUM(CC,INVCCV.L(CC,PRO,TH));
INVPSV.L(PS,PRO,TH) = INVPS.L(PS,PRO,TH);
INVCCPSV.L(CC,PS,PRO,TH) = INVCCV.L(CC,PRO,TH)*sinvps(PS,PRO,TH);
sinvccpsv(CC,PS,PRO,TH) = (INVCCPSV.L(CC,PS,PRO,TH)/INVPSV.L(PS,PRO,TH))$(INVPSV.L(PS,PRO,TH)<>0);
INVF.L(PRO,TH) = SUM((ROW,IV),PROsamREG(ROW,IV,PRO,TH));
INVS.L(PRO,TH) = SUM((STK,IV),PROsamREG(STK,IV,PRO,TH));

* Column 13 -----------------------------
SC.L(CC,PRO,TH) = SUM(STK,PROsamREG(CC,STK,PRO,TH));
TSCE.L(PRO,TH) = SUM(CC,SC.L(CC,PRO,TH));
TSCY.L(PRO,TH) = INVS.L(PRO,TH);

Q.L(CC,PRO,TH) = SUM(PS,XQ.L(PS,CC,PRO,TH));
QD.L(CC,PRO,TH) = Q.L(CC,PRO,TH)-IEXP.L(CC,PRO,TH)-SUM(ROC,DEXP.L(CC,ROC,PRO,TH));
QD0(CC,PRO,TH) = QD.L(CC,PRO,TH);
QDDEXP.L(CC,PRO,TH) = QD.L(CC,PRO,TH)+SUM(ROC,DEXP.L(CC,ROC,PRO,TH));
QC.L(CC,PRO,TH) = QD.L(CC,PRO,TH)+SUM(CTX,CMTXQC.L(CTX,CC,PRO,TH))+IIMP.L(CC,PRO,TH)+SUM(ROC,DIMP.L(ROC,CC,PRO,TH));
QCD.L(CC,PRO,TH) = SUM(PS,QX.L(CC,PS,PRO,TH))+SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH);
QDDIMP.L(CC,PRO,TH) = QD.L(CC,PRO,TH)+SUM(ROC,DIMP.L(ROC,CC,PRO,TH));
rvat(CC,PRO,TH) = (SUM(CTX$(ORD(CTX)=4),CMTXQC.L(CTX,CC,PRO,TH))/QDDIMP.L(CC,PRO,TH))$(QDDIMP.L(CC,PRO,TH)<>0);
V.L(PS,PRO,TH) = LY.L(PS,PRO,TH)+KY.L(PS,PRO,TH);
U.L(PS,PRO,TH) = SUM(CC,QX.L(CC,PS,PRO,TH));

PX.L(PS,PRO,TH) = 1;
PC.L(CC,PRO,TH) = 1;
PU.L(PS,PRO,TH) = 1;
PV.L(PS,PRO,TH) = 1;
PQ.L(CC,PRO,TH) = 1;
PQD.L(CC,PRO,TH) = 1;
PIEXP.L(CC,PRO,TH) = 1;
PIIMP.L(CC,PRO,TH) = 1;
PQDDEXP.L(CC,PRO,TH) = 1;
PQDDIMP.L(CC,PRO,TH) = 1;
PDEXP.L(CC,PRO,TH) = 1;
PDIMP.L(CC,PRO,TH) = 1;
PDEXP2.L(CC,ROC,PRO,TH) = 1;
PDIMP2.L(ROC,CC,PRO,TH) = 1;
EXR.L(PRO,TH) = 1;
PUY.L(HH,PRO,TH) = 1;
BT.L(PRO,TH) = 0;

X.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
U.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
INVCCV.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00;
RPS.LO(PS,PRO,TH)$(ORD(TH)>0) = 0;
*$ontext
X.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
U.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
UEE.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
UNEN.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
V.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00000;
LPS.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00;
KPS.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00;
Q.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00000;
QD.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00000;
QC.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00000;
QXEE0.LO(CC,PS,PRO,TH)$(ORD(TH)>0) = 0.00;
QXEE.LO(CC,PS,PRO,TH)$(ORD(TH)>0) = 0.00;
IEXP.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00;
IIMP.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00;
HHCM.LO(CC,HH,PRO,TH)$(ORD(TH)>0) = 0.00;
HHCM1.LO(CC,HH,PRO,TH)$(ORD(TH)>0) = 0.00;
HHCM2.LO(CC,HH,PRO,TH)$(ORD(TH)>0) = 0.00;
INVCCV.LO(CC,PRO,TH)$(ORD(TH)>0) = 0.00;
DVAT.LO(PS,PRO,TH)$(ORD(TH)>0) = 0.00;
INVF.LO(PRO,TH)$(ORD(TH)>0) = 0.00;
*$offtext
*$ontext
PX.LO(PS,PRO,TH) = 0;
PC.LO(CC,PRO,TH)$(ORD(TH)>0) = 0;
PCFD.LO(CC,PRO,TH)$(ORD(TH)>0) = 0;
PIEXP.LO(CC,PRO,TH) = 0;
PIEXPFD.LO(CC,PRO,TH)$(ORD(TH)>0) = 0;
PDEXP.LO(CC,PRO,TH) = 0;
PDEXPFD.LO(CC,PRO,TH)$(ORD(TH)>0) = 0;
PU.LO(PS,PRO,TH)$(ORD(TH)>0) = 0;
PV.LO(PS,PRO,TH)$(ORD(TH)>0) = 0;
PQ.LO(CC,PRO,TH) = 0;
PQD.LO(CC,PRO,TH) = 0;
PIIMP.LO(CC,PRO,TH) = 0;
WPS.LO(PS,PRO,TH) = 0;
KSPS.LO(PS,PRO,TH)$(ORD(TH)>0) = 0;
RPS.LO(PS,PRO,TH)$(ORD(TH)>0) = 0;
PQXEE0.LO(CC,PRO,TH)$(ORD(TH)>0) = 0;
PQXEE.LO(CC,PRO,TH)$(ORD(TH)>0) = 0;
PQXEEPS.LO(CC,PS,PRO,TH)$(ORD(TH)>0) = 0;
CHCEE.LO(HH,PRO,TH)$(ORD(TH)>0) = 0.00;
*$offtext

PCFD.L(CC,PRO,TH) = 1;
PIEXPFD.L(CC,PRO,TH) = 1;
PDEXPFD.L(CC,PRO,TH) = 1;
PQXEE0.L(CC,PRO,TH) = 1;
PQXEE.L(CC,PRO,TH) = 1;
PQXEEPS.L(CC,PS,PRO,TH) = 1;
PQXNEN0.L(CC,PRO,TH) = 1;
PQXNEN.L(CC,PRO,TH) = 1;
PQXNENPS.L(CC,PS,PRO,TH) = 1;
CXEE0.L(PS,PRO,TH)=1;
CXEE.L(PS,PRO,TH)=1;

PINVPS.L(PS,PRO,TH) = SUM(CC,PC.L(CC,PRO,TH)*sinvccpsv(CC,PS,PRO,TH));

*callibration 参数校准------------------------
*资本折旧率为对部门的投资除以资本
alphah(CC,HH,PRO,TH) = (HHCM.L(CC,HH,PRO,TH)/HHE.L(HH,PRO,TH))$(HHE.L(HH,PRO,TH)<>0);
alphahee(CC,HH,PRO,TH)$ENCC(CC) = (HHCM.L(CC,HH,PRO,TH)/HCEE.L(HH,PRO,TH))$(HCEE.L(HH,PRO,TH)<>0);
alphahnen(CC,HH,PRO,TH)$NENCC(CC) = (HHCM.L(CC,HH,PRO,TH)/HCNEN.L(HH,PRO,TH))$(HCNEN.L(HH,PRO,TH)<>0);
sh(HH,PRO,TH) = (HHS.L(HH,PRO,TH)/HHE.L(HH,PRO,TH))$(HHE.L(HH,PRO,TH)<>0);
alphalg(CC,PRO,TH) = (LGCM.L(CC,PRO,TH)/LGE.L(PRO,TH))$(LGE.L(PRO,TH)<>0);
alphacg(CC,PRO,TH) = (CGCM.L(CC,PRO,TH)/CGE.L(PRO,TH))$(CGE.L(PRO,TH)<>0);
slg(PRO,TH) = (LGS.L(PRO,TH)/LGE.L(PRO,TH))$(LGE.L(PRO,TH)<>0);
scg(PRO,TH) = (CGS.L(PRO,TH)/CGE.L(PRO,TH))$(CGE.L(PRO,TH)<>0);
slgthh(HH,PRO,TH) = (LGTHH.L(HH,PRO,TH)/LGE.L(PRO,TH))$(LGE.L(PRO,TH)<>0);
alphai(CC,PRO,TH) = (INVCCV.L(CC,PRO,TH)/TINV.L(PRO,TH))$(TINV.L(PRO,TH)<>0);
alphas(CC,PRO,TH) = (SC.L(CC,PRO,TH)/INVS.L(PRO,TH))$(INVS.L(PRO,TH)<>0);
rit(ITX,PS,PRO,TH) = (IDTX.L(ITX,PS,PRO,TH)/X.L(PS,PRO,TH))$(X.L(PS,PRO,TH)<>0);
*------------------------------------------------------------------间接税设置--
*间接税税率冲击设置
rct(CTX,CC,PRO,TH) = ((CMTXQC.L(CTX,CC,PRO,TH)/IIMP.L(CC,PRO,TH))$(IIMP.L(CC,PRO,TH) NE 0)+0)$(ORD(CTX)<4)
                    +((CMTXQC.L(CTX,CC,PRO,TH)/QDDIMP.L(CC,PRO,TH))$(QDDIMP.L(CC,PRO,TH) NE 0)+0)$(ORD(CTX)=4)
;
rdt(HH,PRO,TH) = (HHTX.L(HH,PRO,TH)/HHY.L(HH,PRO,TH))$(HHY.L(HH,PRO,TH)<>0);
rimt(CC,PRO,TH) = (SUM(CTX$(ORD(CTX) GE 1 AND ORD(CTX) LE 3),CMTXQC.L(CTX,CC,PRO,TH))/IIMP.L(CC,PRO,TH))$(IIMP.L(CC,PRO,TH) NE 0)+0$(IIMP.L(CC,PRO,TH) EQ 0);
beta(PS,PRO,TH) = ((PU.L(PS,PRO,TH)*U.L(PS,PRO,TH)**(1/sp(PS,PRO,TH)))
              /(PU.L(PS,PRO,TH)*U.L(PS,PRO,TH)**(1/sp(PS,PRO,TH))+PV.L(PS,PRO,TH)*V.L(PS,PRO,TH)**(1/sp(PS,PRO,TH)))
              )$(U.L(PS,PRO,TH)<>0 OR V.L(PS,PRO,TH)<>0)
;
betaee(CC,PS,PRO,TH) =  ((PQXEEPS.L(CC,PS,PRO,TH)*QXEE.L(CC,PS,PRO,TH)**(1/spee(PS,PRO,TH)))
                     /SUM(CC1,PQXEEPS.L(CC1,PS,PRO,TH)*QXEE.L(CC1,PS,PRO,TH)**(1/spee(PS,PRO,TH)))
                    )$(QXEE.L(CC,PS,PRO,TH) NE 0)
                   +0$(QXEE.L(CC,PS,PRO,TH) EQ 0)
;
gamma(PS,PRO,TH) = ((PV.L(PS,PRO,TH)*V.L(PS,PRO,TH)**(1/sp(PS,PRO,TH)))
               /(PU.L(PS,PRO,TH)*U.L(PS,PRO,TH)**(1/sp(PS,PRO,TH))+PV.L(PS,PRO,TH)*V.L(PS,PRO,TH)**(1/sp(PS,PRO,TH)))
               )$(U.L(PS,PRO,TH)<>0 OR V.L(PS,PRO,TH)<>0)
;
gammal(PS,PRO,TH) = ((WPS.L(PS,PRO,TH)*LPS.L(PS,PRO,TH))/(PV.L(PS,PRO,TH)*V.L(PS,PRO,TH))
                )$(V.L(PS,PRO,TH)<>0)
;
*gammak(PS,PRO,TH) = 1-gammal(PS,PRO,TH)
gammak(PS,PRO,TH) = ((RPS.L(PS,PRO,TH)*KPS.L(PS,PRO,TH))/(PV.L(PS,PRO,TH)*V.L(PS,PRO,TH))
                )$(V.L(PS,PRO,TH)<>0)
;
delta(CC,PRO,TH) =  (((1+rvat(CC,PRO,TH))*PQDDIMP.L(CC,PRO,TH)*QDDIMP.L(CC,PRO,TH)**(1/sa(CC,PRO,TH)))
                           /((1+rvat(CC,PRO,TH))*PQDDIMP.L(CC,PRO,TH)*QDDIMP.L(CC,PRO,TH)**(1/sa(CC,PRO,TH))
                          +((1+rimt(CC,PRO,TH))*PIIMP.L(CC,PRO,TH))*IIMP.L(CC,PRO,TH)**(1/sa(CC,PRO,TH)))
                          )$(QDDIMP.L(CC,PRO,TH)<>0 AND IIMP.L(CC,PRO,TH)<>0)
                       +0$(QDDIMP.L(CC,PRO,TH)=0 AND IIMP.L(CC,PRO,TH)=0)
;
epsilon(CC,PRO,TH) =  ((PQDDEXP.L(CC,PRO,TH)*QDDEXP.L(CC,PRO,TH)**(1/st(CC,PRO,TH)))
                              /(PQDDEXP.L(CC,PRO,TH)*QDDEXP.L(CC,PRO,TH)**(1/st(CC,PRO,TH))+PIEXP.L(CC,PRO,TH)*IEXP.L(CC,PRO,TH)**(1/st(CC,PRO,TH)))
                             )$(QDDEXP.L(CC,PRO,TH)<>0 AND IEXP.L(CC,PRO,TH)<>0)
                            +0$(QDDEXP.L(CC,PRO,TH)=0 AND IEXP.L(CC,PRO,TH)=0)
;
delta2(CC,PRO,TH) =  (((1+rvat(CC,PRO,TH))*PQD.L(CC,PRO,TH)*QD.L(CC,PRO,TH)**(1/sa(CC,PRO,TH)))
                            /((1+rvat(CC,PRO,TH))*PQD.L(CC,PRO,TH)*QD.L(CC,PRO,TH)**(1/sa(CC,PRO,TH))
                           +((1+rvat(CC,PRO,TH))*PDIMP.L(CC,PRO,TH))*DIMP2.L(CC,PRO,TH)**(1/sa(CC,PRO,TH)))
                           )$(QD.L(CC,PRO,TH)<>0 AND DIMP2.L(CC,PRO,TH)<>0)
                        +0$(QD.L(CC,PRO,TH)=0 AND DIMP2.L(CC,PRO,TH)=0)
;
epsilon2(CC,PRO,TH) =  ((PQD.L(CC,PRO,TH)*QD.L(CC,PRO,TH)**(1/st(CC,PRO,TH)))
                               /(PQD.L(CC,PRO,TH)*QD.L(CC,PRO,TH)**(1/st(CC,PRO,TH))+PDEXP.L(CC,PRO,TH)*DEXP2.L(CC,PRO,TH)**(1/st(CC,PRO,TH)))
                               )$(QD.L(CC,PRO,TH)<>0 AND DEXP2.L(CC,PRO,TH)<>0)
                              +0$(QD.L(CC,PRO,TH)=0 AND DEXP2.L(CC,PRO,TH)=0)
;
ut(CC,PS,PRO,TH) = (QX.L(CC,PS,PRO,TH)/U.L(PS,PRO,TH))$(U.L(PS,PRO,TH)<>0);
vt(PS,CC,PRO,TH) = (XQ.L(PS,CC,PRO,TH)/X.L(PS,PRO,TH))$(X.L(PS,PRO,TH)<>0);
utneecc(CC,PS,PRO,TH) = (QXNEN.L(CC,PS,PRO,TH)/UNEN.L(PS,PRO,TH))$(UNEN.L(PS,PRO,TH) NE 0)+0;
utee(PS,PRO,TH)= (UEE.L(PS,PRO,TH)/U.L(PS,PRO,TH))$(U.L(PS,PRO,TH) NE 0)+0;
utnee(PS,PRO,TH) = (UNEN.L(PS,PRO,TH)/U.L(PS,PRO,TH))$(U.L(PS,PRO,TH) NE 0)+0;

shcee(HH,PRO,TH)= (HCEE.L(HH,PRO,TH)/THHC.L(HH,PRO,TH))$(THHC.L(HH,PRO,TH)<>0)+0$(THHC.L(HH,PRO,TH)=0);
betahcee(CC,HH,PRO,TH) =  ((PCFD.L(CC,PRO,TH)*HHCM1.L(CC,HH,PRO,TH)**(1/shcc(HH,PRO,TH)))/SUM(CC1,PCFD.L(CC1,PRO,TH)*HHCM1.L(CC1,HH,PRO,TH)**(1/shcc(HH,PRO,TH)))
                      )$(HHCM1.L(CC,HH,PRO,TH)<>0)
                     +0$(HHCM1.L(CC,HH,PRO,TH)=0)
;
AHCEE(HH,PRO,TH) =  (HCEE.L(HH,PRO,TH)/SUM(CC,betahcee(CC,HH,PRO,TH)*HHCM1.L(CC,HH,PRO,TH)**(1-1/shcc(HH,PRO,TH)))**(shcc(HH,PRO,TH)/(shcc(HH,PRO,TH)-1))
                )$(SUM(CC,betahcee(CC,HH,PRO,TH))<>0)
               +0$(SUM(CC,betahcee(CC,HH,PRO,TH))=0)
;
CHCEE.L(HH,PRO,TH) = ((1/AHCEE(HH,PRO,TH))*SUM(CC,betahcee(CC,HH,PRO,TH)**shcc(HH,PRO,TH)*(PCFD.L(CC,PRO,TH)**(1-shcc(HH,PRO,TH))))**(1/(1-shcc(HH,PRO,TH)))
                     )$(AHCEE(HH,PRO,TH)<>0 AND shcc(HH,PRO,TH)<>1)
;

sly(HH,PRO,TH) = (HHLY.L(HH,PRO,TH)/SUM(HH1,HHLY.L(HH1,PRO,TH)))$(SUM(HH1,HHLY.L(HH1,PRO,TH))<>0);
sky(HH,PRO,TH) = (HHKY.L(HH,PRO,TH)/SUM(HH1,HHKY.L(HH1,PRO,TH)))$(SUM(HH1,HHKY.L(HH1,PRO,TH))<>0);
AH(HH,PRO,TH) = HHE.L(HH,PRO,TH)/PROD(CC,HHCM.L(CC,HH,PRO,TH)**alphah(CC,HH,PRO,TH));
ALG(PRO,TH) = LGE.L(PRO,TH)/PROD(CC,LGCM.L(CC,PRO,TH)**alphalg(CC,PRO,TH));
ACG(PRO,TH) = CGE.L(PRO,TH)/PROD(CC,CGCM.L(CC,PRO,TH)**alphacg(CC,PRO,TH));
AI(PRO,TH) = TINV.L(PRO,TH)/PROD(CC,INVCCV.L(CC,PRO,TH)**alphai(CC,PRO,TH));
AP(PS,PRO,TH) = (X.L(PS,PRO,TH)/(beta(PS,PRO,TH)*U.L(PS,PRO,TH)**(1-1/sp(PS,PRO,TH))
                                +gamma(PS,PRO,TH)*V.L(PS,PRO,TH)**(1-1/sp(PS,PRO,TH)))**(sp(PS,PRO,TH)/(sp(PS,PRO,TH)-1))
                )$(U.L(PS,PRO,TH)<>0 AND V.L(PS,PRO,TH)<>0)
;
APEE(PS,PRO,TH) =  (UEE.L(PS,PRO,TH)/SUM(CC,betaee(CC,PS,PRO,TH)*QXEE.L(CC,PS,PRO,TH)**(1-1/spee(PS,PRO,TH))
                                        )**(spee(PS,PRO,TH)/(spee(PS,PRO,TH)-1))
                   )$(SUM(CC,betaee(CC,PS,PRO,TH))<>0)
                  +0$(SUM(CC,betaee(CC,PS,PRO,TH))=0)
;
AV(PS,PRO,TH) =  (V.L(PS,PRO,TH)/(LPS.L(PS,PRO,TH)**gammal(PS,PRO,TH)*KPS.L(PS,PRO,TH)**gammak(PS,PRO,TH))
                 )$(LPS.L(PS,PRO,TH)<>0 AND KPS.L(PS,PRO,TH)<>0)
;
AA(CC,PRO,TH) =  (QC.L(CC,PRO,TH)/(delta(CC,PRO,TH)*QDDIMP.L(CC,PRO,TH)**(1-1/sa(CC,PRO,TH))
                                  +(1-delta(CC,PRO,TH))*IIMP.L(CC,PRO,TH)**(1-1/sa(CC,PRO,TH)))**(sa(CC,PRO,TH)/(sa(CC,PRO,TH)-1))
                 )$(QDDIMP.L(CC,PRO,TH)<>0 AND IIMP.L(CC,PRO,TH)<>0)
                +0$(QDDIMP.L(CC,PRO,TH)=0 AND IIMP.L(CC,PRO,TH)=0)
;
AT(CC,PRO,TH) =  (Q.L(CC,PRO,TH)/(epsilon(CC,PRO,TH)*QDDEXP.L(CC,PRO,TH)**(1-1/st(CC,PRO,TH))
                                 +(1-epsilon(CC,PRO,TH))*IEXP.L(CC,PRO,TH)**(1-1/st(CC,PRO,TH)))**(st(CC,PRO,TH)/(st(CC,PRO,TH)-1))
                 )$(QDDEXP.L(CC,PRO,TH)<>0 AND IEXP.L(CC,PRO,TH) <>0)
                +0$(QDDEXP.L(CC,PRO,TH)=0 AND IEXP.L(CC,PRO,TH)=0)
;
AA2(CC,PRO,TH) =  (QDDIMP.L(CC,PRO,TH)/(delta2(CC,PRO,TH)*QD.L(CC,PRO,TH)**(1-1/sa(CC,PRO,TH))
                                       +(1-delta2(CC,PRO,TH))*DIMP2.L(CC,PRO,TH)**(1-1/sa(CC,PRO,TH)))**(sa(CC,PRO,TH)/(sa(CC,PRO,TH)-1))
                  )$(QD.L(CC,PRO,TH)<>0 AND DIMP2.L(CC,PRO,TH)<>0)
                 +0$(QD.L(CC,PRO,TH)=0 OR DIMP2.L(CC,PRO,TH)=0)
;
AT2(CC,PRO,TH) =  (QDDEXP.L(CC,PRO,TH)/(epsilon2(CC,PRO,TH)*QD.L(CC,PRO,TH)**(1-1/st(CC,PRO,TH))
                                       +(1-epsilon2(CC,PRO,TH))*DEXP2.L(CC,PRO,TH)**(1-1/st(CC,PRO,TH)))**(st(CC,PRO,TH)/(st(CC,PRO,TH)-1))
                  )$(QD.L(CC,PRO,TH)<>0 AND DEXP2.L(CC,PRO,TH)<>0)
                 +0$(QD.L(CC,PRO,TH)=0 OR DEXP2.L(CC,PRO,TH) =0)
;
ivs(PRO,TH) = (INVS.L(PRO,TH)/TINV.L(PRO,TH))$(TINV.L(PRO,TH)<>0);

CX.L(PS,PRO,TH) =  ((1/AP(PS,PRO,TH))*(beta(PS,PRO,TH)**sp(PS,PRO,TH)*(PU.L(PS,PRO,TH)**(1-sp(PS,PRO,TH)))
                                      +gamma(PS,PRO,TH)**sp(PS,PRO,TH)*(PV.L(PS,PRO,TH)**(1-sp(PS,PRO,TH))))**(1/(1-sp(PS,PRO,TH)))
                   )$(AP(PS,PRO,TH)<>0)
;
CXEE0.L(PS,PRO,TH) =  ((1/APEE(PS,PRO,TH))*SUM(CC,betaee(CC,PS,PRO,TH)**spee(PS,PRO,TH)*(PQXEEPS.L(CC,PS,PRO,TH)**(1-spee(PS,PRO,TH))))**(1/(1-spee(PS,PRO,TH)))
                      )$(SUM(CC,betaee(CC,PS,PRO,TH)) NE 0)
                     +0$(SUM(CC,betaee(CC,PS,PRO,TH)) EQ 0)
;
CXEE.L(PS,PRO,TH) = CXEE0.L(PS,PRO,TH)
;

sqd(CC,PRO,TH) = (QD.L(CC,PRO,TH)/Q.L(CC,PRO,TH))$(Q.L(CC,PRO,TH)<>0);
sdexp(CC,ROC,PRO,TH) = (DEXP.L(CC,ROC,PRO,TH)/DEXP2.L(CC,PRO,TH))$(DEXP2.L(CC,PRO,TH)<>0);
sdimp(ROC,CC,PRO,TH) = (DIMP.L(ROC,CC,PRO,TH)/DIMP2.L(CC,PRO,TH))$(DIMP2.L(CC,PRO,TH)<>0);
sdimp2(CC,PRO,TH) = (DIMP2.L(CC,PRO,TH)/QCD.L(CC,PRO,TH))$(QCD.L(CC,PRO,TH)<>0);
si(CC,PRO,TH) = ((QC.L(CC,PRO,TH)-QD.L(CC,PRO,TH))/QC.L(CC,PRO,TH))$(QC.L(CC,PRO,TH)<>0);
shhly(HH,PRO,TH) = (HHLY.L(HH,PRO,TH)/TLE.L(PRO,TH))$(TLE.L(PRO,TH)<>0);
shhky(HH,PRO,TH) = (HHKY.L(HH,PRO,TH)/TKE.L(PRO,TH))$(TKE.L(PRO,TH)<>0);
sfmky(PRO,TH) = (FMKY.L(PRO,TH)/TKE.L(PRO,TH))$(TKE.L(PRO,TH)<>0);
srwky(PRO,TH) = (RWKY.L(PRO,TH)/TKE.L(PRO,TH))$(TKE.L(PRO,TH)<>0);
shhtx(HH,PRO,TH) = (HHTX.L(HH,PRO,TH)/HHE.L(HH,PRO,TH))$(HHE.L(HH,PRO,TH)<>0);
sfmTHh(HH,PRO,TH) = (FMTHH.L(HH,PRO,TH)/FME.L(PRO,TH))$(FME.L(PRO,TH) NE 0);
sfmtlg(PRO,TH) = (FMTLG.L(PRO,TH)/FME.L(PRO,TH))$(FME.L(PRO,TH) NE 0);
sfmtcg(PRO,TH) = (FMTCG.L(PRO,TH)/FME.L(PRO,TH))$(FME.L(PRO,TH) NE 0);
sfms(PRO,TH) = (FMS.L(PRO,TH)/FME.L(PRO,TH))$(FME.L(PRO,TH) NE 0);
slgtcg(PRO,TH) = (LGTCG.L(PRO,TH)/LGY.L(PRO,TH))$(LGY.L(PRO,TH)<>0);
scgtlg(PRO,TH) = (CGTLG.L(PRO,TH)/CGY.L(PRO,TH))$(CGY.L(PRO,TH)<>0);
siinv(PRO,TH) = (IINV.L(PRO,TH)/TIEXP.L(PRO,TH))$(TIEXP.L(PRO,TH)<>0);
sdinv(ROC,PRO,TH) = (DINV.L(ROC,PRO,TH)/TDEXP.L(ROC,PRO,TH))$(TDEXP.L(ROC,PRO,TH)<>0)+0$(TDEXP.L(ROC,PRO,TH)=0);
stxtlg(GTX,PRO,TH) = (TXTLG.L(GTX,PRO,TH)/TXE.L(GTX,PRO,TH))$(TXE.L(GTX,PRO,TH) NE 0);
stxtcg(GTX,PRO,TH) = (TXTCG.L(GTX,PRO,TH)/TXE.L(GTX,PRO,TH))$(TXE.L(GTX,PRO,TH) NE 0);
scmtxexp(CTX,PRO,TH) = (CMTXEXP.L(CTX,PRO,TH)/TIEXP.L(PRO,TH))$(TIEXP.L(PRO,TH)<>0);
siimpexp(PRO,TH) = (IIMPEXP.L(PRO,TH)/TIIMP.L(PRO,TH))$(TIIMP.L(PRO,TH)<>0);
siimpfo(ROC,PRO,TH) = (IIMPFO.L(ROC,PRO,TH)/TIIMP.L(PRO,TH))$(TIIMP.L(PRO,TH)<>0);
sCMTXFO(CTX,ROC,PRO,TH) = (CMTXFO.L(CTX,ROC,PRO,TH)/TDEXP.L(ROC,PRO,TH))$(TDEXP.L(ROC,PRO,TH)<>0)+0$(TDEXP.L(ROC,PRO,TH)=0);
sdimpexp(ROC,PRO,TH) = (DIMPEXP.L(ROC,PRO,TH)/TDIMP.L(ROC,PRO,TH))$(TDIMP.L(ROC,PRO,TH)<>0)+0$(TDIMP.L(ROC,PRO,TH)=0);
sdimpfo(ROC,ROC1,PRO,TH) = (DIMPFO.L(ROC,ROC1,PRO,TH)/TDIMP.L(ROC,PRO,TH))$(TDIMP.L(ROC,PRO,TH)<>0)+0$(TDIMP.L(ROC,PRO,TH)=0);
slgdt(PRO,TH) = (LGDT.L(PRO,TH)/TINV.L(PRO,TH))$(TINV.L(PRO,TH)<>0);
srowdt(PRO,TH) = (ROWDT.L(PRO,TH)/TINV.L(PRO,TH))$(TINV.L(PRO,TH)<>0);
srocdt(ROC,PRO,TH) = (ROCDT.L(ROC,PRO,TH)/TINV.L(PRO,TH))$(TINV.L(PRO,TH)<>0);
*--------------------------------
* Carbon Module
*--------------------------------
* tcer=0, no target for reduction of carbon emissions
* tcer<>0, imposed target for reduction of carbon emissions
*-----------------------------------------------------------
tcer(PRO,TH) = 0.0;
tcerPS(PS,PRO,TH) = 0.0;
* ------------------
* Emissions trading
* ------------------
ENCO2CCPS.L(CC,PS,PRO,TH) = QXEE.L(CC,PS,PRO,TH)*cofCO2CCPS(CC,PS,PRO,TH);
ENCO2.L(PS,PRO,TH) = SUM(CC,ENCO2CCPS.L(CC,PS,PRO,TH));
ELCO2.L(PS,PRO,TH) = 0;
NENCO2.L(PS,PRO,TH) = SUM(CC,QXNEN.L(CC,PS,PRO,TH)*cofCO2CCPS(CC,PS,PRO,TH));
FDCO2.L(PRO,TH) = SUM(CC,(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)+IEXP.L(CC,PRO,TH)+SUM(ROC,DEXP.L(CC,ROC,PRO,TH)))*cofCO2CC(CC,PRO,TH));
TCO2.L(PRO,TH) = SUM(PS,ENCO2.L(PS,PRO,TH))+SUM(PS,ELCO2.L(PS,PRO,TH))+SUM(PS,NENCO2.L(PS,PRO,TH))+FDCO2.L(PRO,TH);
CO2ref(PRO,TH) = TCO2.L(PRO,TH);
CO2refPS(PS,PRO,TH) = ENCO2.L(PS,PRO,TH);

* -----------------------------------------------------------
* Carbon prices ANd incremental costs on energy ANd lANd use
* -----------------------------------------------------------
PCO2.L(PRO,TH) = 0;
PCO2CLUB.L(PRO,TH) = 0;
PCO2ccps.L(CC,PS,PRO,TH) = 0;
PCO2ps.L(PS,PRO,TH) = 0;
PCO2FD.L(PRO,TH) = 0;
PCO2FDcc.L(CC,PRO,TH) = 0;
TXCO2PS.L(PS,PRO,TH) = 0;
TXENCO2.L(PRO,TH) = 0;
TXNENCO2.L(PRO,TH) = 0;
TXFDCO2.L(PRO,TH) = 0;
TXCO2FD.L(PRO,TH) = 0;
TXCO2.L(PRO,TH) = TXENCO2.L(PRO,TH)+TXNENCO2.L(PRO,TH)+TXFDCO2.L(PRO,TH);
CO2refPS(PS,PRO,TH) = ENCO2.L(PS,PRO,"2017");

PCO2ccps.FX(CC,PS,PRO,TH)$(ORD(CC) NE 02 AND ORD(CC) NE 03 AND ORD(CC) NE 04 AND ORD(CC) NE 12 AND ORD(CC) NE 13 AND ORD(CC) NE 33 AND ORD(CC) NE 26) = 0;
* ------------------------------------
* Switch on/off endonegous carbong tax
* ------------------------------------
TRCO2(PRO,TH)$(ORD(TH)>1) = 0.0;
ENTRCO2.FX(PRO,TH) = 0;

SWET(PRO,TH) = 0;
PCO2CLUB.FX(PRO,TH)$(ORD(TH)>100*SWET(PRO,TH)) = 0;

*SWCTR(PRO,TH)$(ORD(TH)>4) = 1;
SWCTR(PRO,TH) = 0;

*------------------------------------
*EX TECH 能源技术进步
*------------------------------------
AEEI0(PRO,TH) = 0.028;
AEEI(PS,PRO,TH) = 0.0;
AEEICC0(CC,PRO,TH)$ENCC7(CC) = 0.0;
LOOP(TH,
APEE(PS,PRO,TH)$(ORD(TH)>1)=(1+AEEI(PS,PRO,TH))*APEE(PS,PRO,TH-1);
AEEICC(CC,PRO,TH)$(ORD(TH)>1) = (1-AEEICC0(CC,PRO,TH))**ORD(TH);
AEEICC(CC,PRO,TH)$(ORD(TH)=1) = 1;
);

*动态设置
*———————————————————————————————动态化设置————
*------------------------------
*Dynamic module
*------------------------------
*人口增长率
gpop(PRO,TH) = 0.003;
gpopps(PS,PRO,TH) = 0.003;
*资本增长率
gk(PRO,TH) = 0.002;
gkps(PS,PRO,TH) = 0.002;
*资本折旧率
dep(PRO,TH) = 0.05;
*资本折旧率为对部门的投资除以资本
depps(PS,PRO,TH) = (INVPSV.L(PS,PRO,TH)/KSPS.L(PS,PRO,TH))$(KSPS.L(PS,PRO,TH)<>0);

*--------------------------------
* Factor Productivity
*--------------------------------
glprd(PRO,TH) = 0.0;
gkpsprd(PS,PRO,TH) = 0.0;
*--------------------------------
* GDP
*--------------------------------
RGDP.L(PRO,TH) = SUM(PS,SUM(CC,vt(PS,CC,PRO,TH)*PQ.L(CC,PRO,"2017")/PC.L(CC,PRO,TH))*X.L(PS,PRO,TH))-SUM((CC,PS),QX.L(CC,PS,PRO,TH))
;
RGDP.FX(PRO,"2017") = RGDP.L(PRO,"2017");
*RGDP.FX(PRO,TH) = RGDP.L(PRO,"2017");
ADJgdp.L(PRO,TH) = 0;
* ------- When Running BAU0, ADJgdp.FX(PRO,TH)=0 --------
* ------- When Running BAU1, ADJgdp.FX(PRO,TH)<>0 --------
* ------- When Not running BAU, ADJgdp.FX(PRO,TH)=0 -----
ADJgdp.FX(PRO,"2017") = 0.0;
ADJgdp.FX(PRO,TH) = 0.0;
GDP(PRO,TH) = RGDP.L(PRO,TH);

*设置基准----------------------------
*PC.L(CC,PRO,TH) = 1.2;
W.L(PRO,TH) = 1;
*W.FX(PRO,TH) = 1;
*RPS.FX(PS,PRO,TH) = 2*RPS.L(PS,PRO,TH);
EXR.FX(PRO,TH) = 1;

X.FX(PS,PRO,TH)$(X0(PS,PRO,TH)=0) = 0;
KPS.FX(PS,PRO,TH)$(X0(PS,PRO,TH)=0) = 0;
RPS.FX(PS,PRO,TH)$(X0(PS,PRO,TH)=0) = 1;
PV.FX(PS,PRO,TH)$(X0(PS,PRO,TH)=0) = 1;
PC.FX(CC,PRO,TH)$(TABS0(CC,PRO,TH)=0) = 1;
PQ.FX(CC,PRO,TH)$(TABS0(CC,PRO,TH)=0) = 1;
PQD.FX(CC,PRO,TH)$(TABS0(CC,PRO,TH)=0) = 1;
PQDDEXP.FX(CC,PRO,TH)$(Q0(CC,PRO,TH)=0 AND SUM(ROC,sdexp(CC,ROC,PRO,TH))=0) = 1;

HHCM1.FX(CC,HH,PRO,TH)$NENCC(CC) = 0;
HHCM2.FX(CC,HH,PRO,TH)$ENCC(CC) = 0;

INVPSV.FX(PS,PRO,TH)$(X0(PS,PRO,TH)=0) = 0;

*----------------------------------
*Equations
*----------------------------------
*$INCLUDE Equations20220908.txt
*----------------------------------
*Equations
*----------------------------------
Equations
EQX(CC,PS,PRO,TH)
ELPS(PS,PRO,TH)
EKPS(PS,PRO,TH)
EIDTX(ITX,PS,PRO,TH)
EX(PS,PRO,TH)
EXQ(PS,CC,PRO,TH)
EHHLY(HH,PRO,TH)
ETLE(PRO,TH)
ETLY(PRO,TH)
EHHKY(HH,PRO,TH)
EFMKY(PRO,TH)
ERWKY(PRO,TH)
ETKE(PRO,TH)
ETKY(PRO,TH)

EHHY(HH,PRO,TH)
EHHE(HH,PRO,TH)
ETHHC(HH,PRO,TH)
EHCEE(HH,PRO,TH)
EHCNEN(HH,PRO,TH)
EHHCM(CC,HH,PRO,TH)
EHHCM1(CC,HH,PRO,TH)
EHHCM2(CC,HH,PRO,TH)
ECHCEE(HH,PRO,TH)
EHHTX(HH,PRO,TH)
EHHS(HH,PRO,TH)

EFMTHH(HH,PRO,TH)
EFMTLG(PRO,TH)
EFMTCG(PRO,TH)
EFMS(PRO,TH)
EFME(PRO,TH)
EFMY(PRO,TH)
ELGCM(CC,PRO,TH)
ELGTHH(HH,PRO,TH)
ELGTCG(PRO,TH)
ELGS(PRO,TH)
ELGE(PRO,TH)
ELGY(PRO,TH)
ECGCM(CC,PRO,TH)
ECGTLG(PRO,TH)
ECGS(PRO,TH)
ECGE(PRO,TH)
ECGY(PRO,TH)
ETXTLG(GTX,PRO,TH)
ETXTCG(GTX,PRO,TH)
ETXE(GTX,PRO,TH)
ETXY(GTX,PRO,TH)
EIEXP(CC,PRO,TH)
ECMTXEXP(CTX,PRO,TH)
EIINV(PRO,TH)
ETIEXP(PRO,TH)
ETIIMP(PRO,TH)
EIIMPEXP(PRO,TH)
EIIMPFO(ROC,PRO,TH)
EDEXP(CC,ROC,PRO,TH)
EDEXP2(CC,PRO,TH)
ECMTXFO(CTX,ROC,PRO,TH)
ECMTXQC(CTX,CC,PRO,TH)
ECMT(CTX,CC,PRO,TH)
EIIMP(CC,PRO,TH)
EDIMP(ROC,CC,PRO,TH)
EDIMP2(CC,PRO,TH)
EDINV(ROC,PRO,TH)
ETDEXP(ROC,PRO,TH)
ETDIMP(ROC,PRO,TH)
EDIMPEXP(ROC,PRO,TH)
EDIMPFO(ROC,ROC1,PRO,TH)
ELGDT(PRO,TH)
EROWDT(PRO,TH)
EROCDT(ROC,PRO,TH)
*----------
ELS0(PRO,TH)
ELS(PRO,TH)
ELSPS0(PS,PRO,TH)
ELSPS(PS,PRO,TH)
EKS0(PRO,TH)
EKS(PRO,TH)
EIKSPS(PS,PRO,TH)
EKSPS(PS,PRO,TH)
ERGDP(PRO,TH)
EADJgdp(PRO,TH)

*----------
ETSAV(PRO,TH)
ETINV(PRO,TH)
EINVCCV(CC,PRO,TH)
EINV(PRO,TH)
EINVPS(PS,PRO,TH)
EINVPSV(PS,PRO,TH)
EINVF(PRO,TH)
EINVS(PRO,TH)
ESC(CC,PRO,TH)
ETSCE(PRO,TH)
ETSCY(PRO,TH)

EU(PS,PRO,TH)
EV(PS,PRO,TH)
EQ(CC,PRO,TH)
EQD(CC,PRO,TH)
EQDDEXP(CC,PRO,TH)
EQDDIMP(CC,PRO,TH)
EQC(CC,PRO,TH)
EQCD(CC,PRO,TH)
EUY(HH,PRO,TH)

EPC(CC,PRO,TH)
EPCFD(CC,PRO,TH)
EPIEXPFD(CC,PRO,TH)
EPDEXPFD(CC,PRO,TH)
EPX(PS,PRO,TH)
EPU(PS,PRO,TH)
EPV(PS,PRO,TH)
EPQ(CC,PRO,TH)
EPQD(CC,PRO,TH)
EPQDDEXP(CC,PRO,TH)
EPQDDIMP(CC,PRO,TH)
EPIEXP(CC,PRO,TH)
EPDEXP(CC,PRO,TH)
EPDEXP2(CC,ROC,PRO,TH)
EPIIMP(CC,PRO,TH)
EPDIMP(CC,PRO,TH)
EPDIMP2(ROC,CC,PRO,TH)
EEXR(PRO,TH)
EW(PRO,TH)
ER(PRO,TH)
EWPS(PS,PRO,TH)
ERPS(PS,PRO,TH)
ECX(PS,PRO,TH)
EPUY(HH,PRO,TH)
EBT(PRO,TH)
*energy-ele
ECXEE0(PS,PRO,TH)
ECXEE(PS,PRO,TH)
EUEE(PS,PRO,TH)
EQXEE0(CC,PS,PRO,TH)
EQXEE(CC,PS,PRO,TH)
EQXNEN(CC,PS,PRO,TH)
EUNEN(PS,PRO,TH)
EPQXEE0(CC,PRO,TH)
EPQXEE(CC,PRO,TH)
EPQXEEPS(CC,PS,PRO,TH)
EPQXNEN0(CC,PRO,TH)
EPQXNEN(CC,PRO,TH)
EPQXNENPS(CC,PS,PRO,TH)
EPINVPS(PS,PRO,TH)

*carbon module
EENCO2CCPS(CC,PS,PRO,TH)
EENCO2(PS,PRO,TH)
EELCO2(PS,PRO,TH)
ENENCO2(PS,PRO,TH)
EFDCO2(PRO,TH)
ETCO2(PRO,TH)
EPCO2(PRO,TH)
EPCO2ccps(CC,PS,PRO,TH)
EPCO2ps(PS,PRO,TH)
EPCO2CLUB(PRO,TH)
EPCO2FD(PRO,TH)
EPCO2FDcc(CC,PRO,TH)

ETXCO2PS(PS,PRO,TH)
ETXENCO2(PRO,TH)
ETXNENCO2(PRO,TH)
ETXFDCO2(PRO,TH)
ETXCO2FD(PRO,TH)
ETXCO2(PRO,TH)

EENTRCO2(PRO,TH)
;
*------------------------------------------
* New Capital
*------------------------------------------
*劳动的初始设置
ELS0(PRO,TH)$(ORD(TH) EQ 1 AND AN(TH))..
    LS(PRO,TH) =E= ILS(PRO)
;
ELS(PRO,TH)$(ORD(TH) GE 2 AND ORD(TH) LE CARD(TH) AND AN(TH))..
    LS(PRO,TH) =E= ((1+gpop(PRO,TH-1))*LS(PRO,TH-1))$(ORD(TH) LE CARD(TH))
;
ELSPS0(PS,PRO,TH)$(ORD(TH) EQ 1 AND AN(TH))..
    LSPS(PS,PRO,TH) =E= ILSPS(PS,PRO)
;
ELSPS(PS,PRO,TH)$(ORD(TH) GE 2 AND ORD(TH) LE LAST AND AN(TH))..
    LSPS(PS,PRO,TH) =E= ((1+glprd(PRO,TH-1)+gpopps(PS,PRO,TH-1))*LSPS(PS,PRO,TH-1))$(ORD(TH) LE CARD(TH))
;
*资本的初始设置
EKS0(PRO,TH)$(ORD(TH) EQ 1 AND AN(TH))..
    KS(PRO,TH) =E= SUM(PS,IKS(PS,PRO))
;
EKS(PRO,TH)$(ORD(TH) GE 2 AND ORD(TH) LE CARD(TH) AND AN(TH))..
    KS(PRO,TH) =E= ((1+gk(PRO,TH))*SUM(PS,INVPSV(PS,PRO,TH-1))+(1-dep(PRO,TH-1))*KS(PRO,TH-1))$(ORD(TH) LE CARD(TH))
;
EIKSPS(PS,PRO,TH)$(ORD(TH) EQ 1 AND AN(TH))..
    KSPS(PS,PRO,TH) =E= IKSPS(PS,PRO)
;
EKSPS(PS,PRO,TH)$(ORD(TH) GE 2 AND ORD(TH) LE LAST AND AN(TH))..
    KSPS(PS,PRO,TH) =E=  (1+ADJgdp(PRO,TH))*(INVPSV(PS,PRO,TH-1)+(1+gkpsprd(PS,PRO,TH-1)-depps(PS,PRO,TH-1))*KSPS(PS,PRO,TH-1))
;
ERGDP(PRO,TH)$(AN(TH) AND ORD(TH)>1)..
    RGDP(PRO,TH) =E= SUM(PS,SUM(CC,vt(PS,CC,PRO,TH)*PQ(CC,PRO,"2017"))*X(PS,PRO,TH))-SUM((CC,PS),PC(CC,PRO,"2017")*QX(CC,PS,PRO,TH))
;
EADJgdp(PRO,AN)..
    RGDP(PRO,AN) =E= GDP(PRO,AN)
;

* Zero profit condition,or production GDP = income GDP, to determine production level X
EX(PS,PRO,TH)$(AN(TH) AND (X0(PS,PRO,TH)<>0))..
    (1-SUM(ITX,rit(ITX,PS,PRO,TH)))*PX(PS,PRO,TH) =E= CX(PS,PRO,TH)
                      +(SUM(CC,PCO2ccps(CC,PS,PRO,TH)*cofCO2CCPS(CC,PS,PRO,TH)*QX(CC,PS,PRO,TH)/X(PS,PRO,TH)))$(AP(PS,PRO,TH)<>0)
                      -(PCO2ps(PS,PRO,TH)*FPENPSref(PS,PRO,TH))/X(PS,PRO,TH)
                      -(PCO2ps(PS,PRO,TH)*FPNENPSref(PS,PRO,TH))/X(PS,PRO,TH)
;
EU(PS,PRO,AN)$(X0(PS,PRO,AN)<>0)..
    U(PS,PRO,AN) =E= (X(PS,PRO,AN)/AP(PS,PRO,AN))*(beta(PS,PRO,AN)*AP(PS,PRO,AN)*CX(PS,PRO,AN)/PU(PS,PRO,AN))**sp(PS,PRO,AN)
;
EV(PS,PRO,AN)$(X0(PS,PRO,AN)<>0)..
    V(PS,PRO,AN) =E= (X(PS,PRO,AN)/AP(PS,PRO,AN))*(gamma(PS,PRO,AN)*AP(PS,PRO,AN)*CX(PS,PRO,AN)/PV(PS,PRO,AN))**sp(PS,PRO,AN)
;
EXQ(PS,CC,PRO,AN)..
    XQ(PS,CC,PRO,AN) =E= vt(PS,CC,PRO,AN)*X(PS,PRO,AN)
;
EQX(CC,PS,PRO,AN)..
    QX(CC,PS,PRO,AN) =E= QXEE(CC,PS,PRO,AN)+QXNEN(CC,PS,PRO,AN)
*    QX(CC,PS,PRO,AN) =E= ut(CC,PS,PRO,AN)*U(PS,PRO,AN)
;
ELPS(PS,PRO,AN)..
*    LPS(PS,PRO,AN) =E= gammal(PS,PRO,AN)*PV(PS,PRO,AN)*V(PS,PRO,AN)/WPS(PS,PRO,AN)
    LPS(PS,PRO,AN) =E= gammal(PS,PRO,AN)*PV(PS,PRO,AN)*V(PS,PRO,AN)/W(PRO,AN)
;
EKPS(PS,PRO,AN)..
    KPS(PS,PRO,AN) =E= gammak(PS,PRO,AN)*PV(PS,PRO,AN)*V(PS,PRO,AN)/RPS(PS,PRO,AN)
;
EIDTX(ITX,PS,PRO,AN)..
    IDTX(ITX,PS,PRO,AN) =E= rit(ITX,PS,PRO,AN)*PX(PS,PRO,AN)*X(PS,PRO,AN)
;

EHHLY(HH,PRO,AN)..
    HHLY(HH,PRO,AN) =E= shhly(HH,PRO,AN)*TLE(PRO,AN)
;
ETLE(PRO,AN)..
    TLE(PRO,AN) =E= TLY(PRO,AN)
;
ETLY(PRO,AN)..
    TLY(PRO,AN) =E= W(PRO,AN)*SUM(PS,LPS(PS,PRO,AN))
;
EHHKY(HH,PRO,AN)..
    HHKY(HH,PRO,AN) =E= shhky(HH,PRO,AN)*TKE(PRO,AN)
;
EFMKY(PRO,AN)..
    FMKY(PRO,AN) =E= sfmky(PRO,AN)*TKE(PRO,AN)
;
ERWKY(PRO,AN)..
    RWKY(PRO,AN) =E= srwky(PRO,AN)*TKE(PRO,AN)
;
ETKE(PRO,AN)..
    TKE(PRO,AN) =E= TKY(PRO,AN)
;
ETKY(PRO,AN)..
    TKY(PRO,AN) =E= SUM(PS,RPS(PS,PRO,AN)*KPS(PS,PRO,AN))
;
* Accounting of household incomes ANd expenditures
EHHY(HH,PRO,AN)..
    HHY(HH,PRO,AN) =E= HHLY(HH,PRO,AN)+HHKY(HH,PRO,AN)+FMTHH(HH,PRO,AN)+LGTHH(HH,PRO,AN);
;
EHHE(HH,PRO,AN)..
    HHE(HH,PRO,AN) =E= HHY(HH,PRO,AN)
;
ETHHC(HH,PRO,AN)..
    THHC(HH,PRO,AN) =E= HHE(HH,PRO,AN)-HHTX(HH,PRO,AN)-HHS(HH,PRO,AN)
;
EHCEE(HH,PRO,AN)..
    HCEE(HH,PRO,AN) =E= shcee(HH,PRO,AN)*THHC(HH,PRO,AN)
;
EHCNEN(HH,PRO,AN)..
    HCNEN(HH,PRO,AN) =E= (1-shcee(HH,PRO,AN))*THHC(HH,PRO,AN)
;
EHHCM(CC,HH,PRO,AN)..
    HHCM(CC,HH,PRO,AN) =E= HHCM1(CC,HH,PRO,AN)+HHCM2(CC,HH,PRO,AN)
*    HHCM(CC,HH,PRO,AN) =E= alphah(CC,HH,PRO,AN)*HHY(HH,PRO,AN)/PCFD(CC,PRO,AN)
;
EHHCM1(CC,HH,PRO,AN)$ENCC(CC)..
    HHCM1(CC,HH,PRO,AN) =E= alphah(CC,HH,PRO,AN)*HHY(HH,PRO,AN)/PCFD(CC,PRO,AN)
;
EHHCM2(CC,HH,PRO,AN)$NENCC(CC)..
    HHCM2(CC,HH,PRO,AN) =E= alphah(CC,HH,PRO,AN)*HHY(HH,PRO,AN)/PCFD(CC,PRO,AN)
;
ECHCEE(HH,PRO,AN)..
    CHCEE(HH,PRO,AN) =E=  ((1/AHCEE(HH,PRO,AN))*SUM(CC,betahcee(CC,HH,PRO,AN)**shcc(HH,PRO,AN)*(PCFD(CC,PRO,AN)**(1-shcc(HH,PRO,AN))))**(1/(1-shcc(HH,PRO,AN)))
                          )$(SUM(CC,betahcee(CC,HH,PRO,AN))<>0)
                         +0$(SUM(CC,betahcee(CC,HH,PRO,AN))=0)
;
EHHTX(HH,PRO,AN)..
    HHTX(HH,PRO,AN) =E= shhtx(HH,PRO,AN)*HHE(HH,PRO,AN)
;
EHHS(HH,PRO,AN)..
    HHS(HH,PRO,AN) =E= sh(HH,PRO,AN)*HHE(HH,PRO,AN)
;

EFMTHH(HH,PRO,AN)..
    FMTHH(HH,PRO,AN) =E= sfmTHh(HH,PRO,AN)*FME(PRO,AN)
;
EFMTLG(PRO,AN)..
    FMTLG(PRO,AN) =E= sfmtlg(PRO,AN)*FME(PRO,AN)
;
EFMTCG(PRO,AN)..
    FMTCG(PRO,AN) =E= sfmtcg(PRO,AN)*FME(PRO,AN)
;
EFMS(PRO,AN)..
    FMS(PRO,AN) =E= sfms(PRO,AN)*FME(PRO,AN)
;
EFME(PRO,AN)..
    FME(PRO,AN) =E= FMY(PRO,AN)
;
EFMY(PRO,AN)..
    FMY(PRO,AN) =E= FMKY(PRO,AN)
;
ELGCM(CC,PRO,AN)..
    LGCM(CC,PRO,AN) =E= alphalg(CC,PRO,AN)*LGE(PRO,AN)/PC(CC,PRO,AN)
;
ELGTHH(HH,PRO,AN)..
    LGTHH(HH,PRO,AN) =E= slgTHh(HH,PRO,AN)*LGE(PRO,AN)
;
ELGTCG(PRO,AN)..
    LGTCG(PRO,AN) =E= slgtcg(PRO,AN)*LGY(PRO,AN)
;
ELGS(PRO,AN)..
    LGS(PRO,AN) =E= slg(PRO,AN)*LGY(PRO,AN)
;
ELGE(PRO,AN)..
    LGE(PRO,AN) =E= LGY(PRO,AN)
;
ELGY(PRO,AN)..
    LGY(PRO,AN) =E=  FMTLG(PRO,AN)+CGTLG(PRO,AN)+SUM(GTX,TXTLG(GTX,PRO,AN))+LGDT(PRO,AN)
                    +TXCO2(PRO,AN)*(1-SWCTR(PRO,AN))
;
ECGCM(CC,PRO,AN)..
    CGCM(CC,PRO,AN) =E= alphacg(CC,PRO,AN)*CGY(PRO,AN)/PC(CC,PRO,AN)
;
ECGTLG(PRO,AN)..
    CGTLG(PRO,AN) =E= scgtlg(PRO,AN)*CGY(PRO,AN)
;
ECGS(PRO,AN)..
    CGS(PRO,AN) =E= scg(PRO,AN)*CGY(PRO,AN)
;
ECGE(PRO,AN)..
    CGE(PRO,AN) =E= CGY(PRO,AN)
;
ECGY(PRO,AN)..
    CGY(PRO,AN) =E=  FMTCG(PRO,AN)+LGTCG(PRO,AN)+SUM(GTX,TXTCG(GTX,PRO,AN))
*                +TXCO2(PRO,AN)*(1-SWCTR(PRO,AN))
;
ETXTLG(GTX,PRO,AN)..
    TXTLG(GTX,PRO,AN) =E= stxtlg(GTX,PRO,AN)*TXE(GTX,PRO,AN)
;
ETXTCG(GTX,PRO,AN)..
    TXTCG(GTX,PRO,AN) =E= stxtcg(GTX,PRO,AN)*TXE(GTX,PRO,AN)
;
ETXE(GTX,PRO,AN)..
    TXE(GTX,PRO,AN) =E= TXY(GTX,PRO,AN)
;
ETXY(GTX,PRO,AN)..
    TXY(GTX,PRO,AN) =E=
                         SUM(ITX$(ORD(ITX) EQ 1),SUM(PS,IDTX(ITX,PS,PRO,AN)))$(ORD(GTX) EQ 1)
                        +SUM(ITX$(ORD(ITX) EQ 2),SUM(PS,IDTX(ITX,PS,PRO,AN)))$(ORD(GTX) EQ 2)
                        +SUM(ITX$(ORD(ITX) EQ 3),SUM(PS,IDTX(ITX,PS,PRO,AN)))$(ORD(GTX) EQ 3)
                        +SUM(CTX$(ORD(CTX) EQ 1),SUM(CC,CMTXQC(CTX,CC,PRO,AN))+CMTXEXP(CTX,PRO,AN)+SUM(ROC,CMTXFO(CTX,ROC,PRO,AN)))$(ORD(GTX) EQ 4)
                        +SUM(CTX$(ORD(CTX) EQ 2),SUM(CC,CMTXQC(CTX,CC,PRO,AN))+CMTXEXP(CTX,PRO,AN)+SUM(ROC,CMTXFO(CTX,ROC,PRO,AN)))$(ORD(GTX) EQ 5)
                        +SUM(CTX$(ORD(CTX) EQ 3),SUM(CC,CMTXQC(CTX,CC,PRO,AN))+CMTXEXP(CTX,PRO,AN)+SUM(ROC,CMTXFO(CTX,ROC,PRO,AN)))$(ORD(GTX) EQ 6)
                        +SUM(CTX$(ORD(CTX) EQ 4),SUM(CC,CMTXQC(CTX,CC,PRO,AN))+CMTXEXP(CTX,PRO,AN)+SUM(ROC,CMTXFO(CTX,ROC,PRO,AN)))$(ORD(GTX) EQ 7)
                        +SUM(HH,HHTX(HH,PRO,AN))$(ORD(GTX) EQ 8)
;
*-----------------------
* Savings ANd Investment
*-----------------------
ETSAV(PRO,AN)..
    TSAV(PRO,AN) =E= SUM(HH,HHS(HH,PRO,AN))+FMS(PRO,AN)+LGS(PRO,AN)+CGS(PRO,AN)+IINV(PRO,AN)+SUM(ROC,DINV(ROC,PRO,AN))
;
ETINV(PRO,TH)$AN(TH)..
    TINV(PRO,TH) =E=  TSAV(PRO,TH)
                     +TXCO2(PRO,TH-1)*SWCTR(PRO,TH)
;
EINVCCV(CC,PRO,AN)..
    INVCCV(CC,PRO,AN) =E= alphai(CC,PRO,AN)*TINV(PRO,AN)/PC(CC,PRO,AN)
;
EINV(PRO,AN)..
    INV(PRO,AN) =E= SUM(CC,PC(CC,PRO,AN)*INVCCV(CC,PRO,AN))
;
EINVPS(PS,PRO,AN)..
    INVPS(PS,PRO,AN) =E= INV(PRO,AN)*sinvps(PS,PRO,AN)
;
EINVPSV(PS,PRO,AN)$(X0(PS,PRO,AN)<>0)..
    INVPSV(PS,PRO,AN) =E= INVPS(PS,PRO,AN)/PINVPS(PS,PRO,AN)
;
EPINVPS(PS,PRO,AN)..
    PINVPS(PS,PRO,AN) =E= SUM(CC,PC(CC,PRO,AN)*sinvccpsv(CC,PS,PRO,AN))
;
EINVS(PRO,AN)..
    INVS(PRO,AN) =E= ivs(PRO,AN)*TINV(PRO,AN)
;
EINVF(PRO,AN)..
    INVF(PRO,AN) =E= TINV(PRO,AN)-SUM(CC,PC(CC,PRO,AN)*INVCCV(CC,PRO,AN))-INVS(PRO,AN)
;
ESC(CC,PRO,AN)..
    SC(CC,PRO,AN) =E= alphas(CC,PRO,AN)*INVS(PRO,AN)/PC(CC,PRO,AN)
;
ETSCE(PRO,AN)..
    TSCE(PRO,AN) =E= TSCY(PRO,AN)
;
ETSCY(PRO,AN)..
    TSCY(PRO,AN) =E= INVS(PRO,AN)
;
EQ(CC,PRO,AN)..
    Q(CC,PRO,AN) =E= SUM(PS,XQ(PS,CC,PRO,AN))
;
EQDDEXP(CC,PRO,AN)..
    QDDEXP(CC,PRO,AN) =E=  ((Q(CC,PRO,AN)/AT(CC,PRO,AN))*(epsilon(CC,PRO,AN)*AT(CC,PRO,AN)*PQ(CC,PRO,AN)/PQDDEXP(CC,PRO,AN))**st(CC,PRO,AN))$(AT(CC,PRO,AN)<>0)
                      +Q(CC,PRO,AN)$(AT(CC,PRO,AN)=0)
;
EIEXP(CC,PRO,AN)..
    IEXP(CC,PRO,AN) =E=  ((Q(CC,PRO,AN)/AT(CC,PRO,AN))*((1-epsilon(CC,PRO,AN))*AT(CC,PRO,AN)*PQ(CC,PRO,AN)/PIEXPFD(CC,PRO,AN))**st(CC,PRO,AN))$(AT(CC,PRO,AN) NE 0)
                    +0$(AT(CC,PRO,AN)=0)
;
ECMTXEXP(CTX,PRO,AN)..
    CMTXEXP(CTX,PRO,AN) =E= scmtxexp(CTX,PRO,AN)*TIEXP(PRO,AN)
;
EIINV(PRO,AN)..
    IINV(PRO,AN) =E= siinv(PRO,AN)*TIEXP(PRO,AN)
;
ETIEXP(PRO,AN)..
    TIEXP(PRO,AN) =E= TIIMP(PRO,AN)
;
ETIIMP(PRO,AN)..
    TIIMP(PRO,AN) =E= SUM(CC,PIIMP(CC,PRO,AN)*IIMP(CC,PRO,AN))+IIMPEXP(PRO,AN)+SUM(ROC,IIMPFO(ROC,PRO,AN))+ROWDT(PRO,AN)
;
EIIMPEXP(PRO,AN)..
    IIMPEXP(PRO,AN) =E= siimpexp(PRO,AN)*TIIMP(PRO,AN)
;
EIIMPFO(ROC,PRO,AN)..
    IIMPFO(ROC,PRO,AN) =E= siimpfo(ROC,PRO,AN)*TIIMP(PRO,AN)
;
ECMTXQC(CTX,CC,PRO,AN)..
    CMTXQC(CTX,CC,PRO,AN) =E=  (rct(CTX,CC,PRO,AN)*PIIMP(CC,PRO,AN)*IIMP(CC,PRO,AN))$(ORD(CTX)<4)
                              +(rvat(CC,PRO,AN)*PQDDIMP(CC,PRO,AN)*QDDIMP(CC,PRO,AN))$(ORD(CTX)=4)
;
ECMT(CTX,CC,PRO,AN)..
    CMT(CTX,CC,PRO,AN) =E=  CMTXQC(CTX,CC,PRO,AN)
;
EIIMP(CC,PRO,AN)..
    IIMP(CC,PRO,AN) =E=  ((QC(CC,PRO,AN)/AA(CC,PRO,AN))*((1-delta(CC,PRO,AN))*AA(CC,PRO,AN)*PC(CC,PRO,AN)/((1+rimt(CC,PRO,AN))*PIIMP(CC,PRO,AN)))**sa(CC,PRO,AN)
                     )$(AA(CC,PRO,AN) NE 0)
                    +0$(AA(CC,PRO,AN) EQ 0)
;
EDIMP(ROC,CC,PRO,AN)..
    DIMP(ROC,CC,PRO,AN) =E=  sdimp(ROC,CC,PRO,AN)*DIMP2(CC,PRO,AN)*PDIMP(CC,PRO,AN)/PDIMP2(ROC,CC,PRO,AN)
;
EDIMP2(CC,PRO,AN)..
    DIMP2(CC,PRO,AN) =E=  ((QDDIMP(CC,PRO,AN)/AA2(CC,PRO,AN))*((1-delta2(CC,PRO,AN))*AA2(CC,PRO,AN)*PQDDIMP(CC,PRO,AN)/(PDIMP(CC,PRO,AN)))**sa(CC,PRO,AN)
                      )$(QD0(CC,PRO,AN)<>0 AND DIMP20(CC,PRO,AN)<>0)
                     +QDDIMP(CC,PRO,AN)$(QD0(CC,PRO,AN)=0 AND DIMP20(CC,PRO,AN)<>0)
                     +0$(DIMP20(CC,PRO,AN)=0)
;
EDEXP(CC,ROC,PRO,AN)..
    DEXP(CC,ROC,PRO,AN) =E=  sdexp(CC,ROC,PRO,AN)*DEXP2(CC,PRO,AN)*PDEXPFD(CC,PRO,AN)/PDEXP2(CC,ROC,PRO,AN)
;
EDEXP2(CC,PRO,AN)..
    DEXP2(CC,PRO,AN) =E=  ((QDDEXP(CC,PRO,AN)/AT2(CC,PRO,AN))*((1-epsilon2(CC,PRO,AN))*AT2(CC,PRO,AN)*PQDDEXP(CC,PRO,AN)/PDEXPFD(CC,PRO,AN))**st(CC,PRO,AN)
                      )$(QD0(CC,PRO,AN)<>0 AND DEXP20(CC,PRO,AN)<>0)
                     +QDDEXP(CC,PRO,AN)$(QD0(CC,PRO,AN)=0 AND DEXP20(CC,PRO,AN)<>0)
                     +0$(DEXP20(CC,PRO,AN)=0)
;
ECMTXFO(CTX,ROC,PRO,AN)..
    CMTXFO(CTX,ROC,PRO,AN) =E= sCMTXFO(CTX,ROC,PRO,AN)*TDEXP(ROC,PRO,AN)
;
EDINV(ROC,PRO,AN)..
    DINV(ROC,PRO,AN) =E=  TDIMP(ROC,PRO,AN)-SUM(CC,PDEXPFD(CC,PRO,AN)*DEXP(CC,ROC,PRO,AN))
                         -SUM(CTX,CMTXFO(CTX,ROC,PRO,AN))-IIMPFO(ROC,PRO,AN)-SUM(ROC1,DIMPFO(ROC1,ROC,PRO,AN))
;
ETDEXP(ROC,PRO,AN)..
    TDEXP(ROC,PRO,AN) =E= TDIMP(ROC,PRO,AN)
;
ETDIMP(ROC,PRO,AN)..
    TDIMP(ROC,PRO,AN) =E=  SUM(CC,PDIMP(CC,PRO,AN)*DIMP(ROC,CC,PRO,AN))+DIMPEXP(ROC,PRO,AN)
                      +SUM(ROC1,DIMPFO(ROC,ROC1,PRO,AN))+ROCDT(ROC,PRO,AN)
;
EDIMPEXP(ROC,PRO,AN)..
    DIMPEXP(ROC,PRO,AN) =E= sdimpexp(ROC,PRO,AN)*TDIMP(ROC,PRO,AN)
;
EDIMPFO(ROC,ROC1,PRO,AN)..
    DIMPFO(ROC,ROC1,PRO,AN) =E= sdimpfo(ROC,ROC1,PRO,AN)*TDIMP(ROC,PRO,AN)
;
ELGDT(PRO,AN)..
    LGDT(PRO,AN) =E= slgdt(PRO,AN)*TINV(PRO,AN)
;
EROWDT(PRO,AN)..
    ROWDT(PRO,AN) =E= srowdt(PRO,AN)*TINV(PRO,AN)
;
EROCDT(ROC,PRO,AN)..
    ROCDT(ROC,PRO,AN) =E= srocdt(ROC,PRO,AN)*TINV(PRO,AN)
;
EQD(CC,PRO,AN)..
    QD(CC,PRO,AN) =E=  ((QDDEXP(CC,PRO,AN)/AT2(CC,PRO,AN))*(epsilon2(CC,PRO,AN)*AT2(CC,PRO,AN)*PQDDEXP(CC,PRO,AN)/PQD(CC,PRO,AN))**st(CC,PRO,AN)
                   )$(QD0(CC,PRO,AN)<>0 AND DEXP20(CC,PRO,AN)<>0)
                  +QDDEXP(CC,PRO,AN)$(QD0(CC,PRO,AN)<>0 AND DEXP20(CC,PRO,AN)=0)
                  +0$(QD0(CC,PRO,AN)=0)
;
EQDDIMP(CC,PRO,AN)..
    QD(CC,PRO,AN) =E=  ((QDDIMP(CC,PRO,AN)/AA2(CC,PRO,AN))*(delta2(CC,PRO,AN)*AA2(CC,PRO,AN)*PQDDIMP(CC,PRO,AN)/PQD(CC,PRO,AN))**sa(CC,PRO,AN)
                   )$(QD0(CC,PRO,AN)<>0 AND DIMP20(CC,PRO,AN)<>0)
                  +QDDIMP(CC,PRO,AN)$(QD0(CC,PRO,AN)<>0 AND DIMP20(CC,PRO,AN)=0)
                  +(QDDIMP(CC,PRO,AN)+QD(CC,PRO,AN)-sdimp2(CC,PRO,AN)*QCD(CC,PRO,AN)*PC(CC,PRO,AN)/PQDDIMP(CC,PRO,AN))$(QD0(CC,PRO,AN)=0 AND DIMP20(CC,PRO,AN)<>0)
                  +(QDDIMP(CC,PRO,AN)+QD(CC,PRO,AN))$(QD0(CC,PRO,AN)=0 AND AA(CC,PRO,AN)=0 AND DIMP20(CC,PRO,AN)=0)
;
EQC(CC,PRO,AN)..
    QDDIMP(CC,PRO,AN) =E=  ((QC(CC,PRO,AN)/AA(CC,PRO,AN))
                        *(delta(CC,PRO,AN)*AA(CC,PRO,AN)*PC(CC,PRO,AN)/((1+rvat(CC,PRO,AN))*PQDDIMP(CC,PRO,AN))
                         )**sa(CC,PRO,AN)
                        )$(AA(CC,PRO,AN)<>0)
                       +(QC(CC,PRO,AN)/(1+rvat(CC,PRO,AN)))$(AA(CC,PRO,AN)=0)
;
EQCD(CC,PRO,AN)..
    QCD(CC,PRO,AN) =E= SUM(PS,QX(CC,PS,PRO,AN))+SUM(HH,HHCM(CC,HH,PRO,AN))+LGCM(CC,PRO,AN)+CGCM(CC,PRO,AN)+INVCCV(CC,PRO,AN)+SC(CC,PRO,AN)
;
EUY(HH,PRO,AN)..
    UY(HH,PRO,AN) =E= AH(HH,PRO,AN)*SUM(CC,alphah(CC,HH,PRO,AN)*(HHCM(CC,HH,PRO,AN)**(1-1/su)))**(su/(su-1))
;
* Constraints of commodities, to determine prices of commodities in domestic markets
EPC(CC,PRO,AN)..
    QC(CC,PRO,AN) =E= QCD(CC,PRO,AN)
;
EPX(PS,PRO,AN)..
    PX(PS,PRO,AN) =E= SUM(CC,vt(PS,CC,PRO,AN)*PQ(CC,PRO,AN))
;
EPU(PS,PRO,AN)$(X0(PS,PRO,AN)<>0)..
    PU(PS,PRO,AN) =E= SUM(CC,QX(CC,PS,PRO,AN)*PC(CC,PRO,AN))/U(PS,PRO,AN)
;
EPV(PS,PRO,AN)$(X0(PS,PRO,AN)<>0)..
    PV(PS,PRO,AN) =E=  (1/AV(PS,PRO,AN))*(W(PRO,AN)/gammal(PS,PRO,AN))**gammal(PS,PRO,AN)*(RPS(PS,PRO,AN)/gammak(PS,PRO,AN))**gammak(PS,PRO,AN)
;
EPQ(CC,PRO,AN)..
    PQ(CC,PRO,AN) =E=  ((1/AT(CC,PRO,AN))*(epsilon(CC,PRO,AN)**st(CC,PRO,AN)*((PQDDEXP(CC,PRO,AN))**(1-st(CC,PRO,AN)))
                                          +(1-epsilon(CC,PRO,AN))**st(CC,PRO,AN)*((PIEXPFD(CC,PRO,AN))**(1-st(CC,PRO,AN)))
                                          )**(1/(1-st(CC,PRO,AN)))
                       )$(AT(CC,PRO,AN) NE 0)
                      +(PQDDEXP(CC,PRO,AN))$(AT(CC,PRO,AN) EQ 0)
;
EPQDDEXP(CC,PRO,AN)$(Q0(CC,PRO,AN)<>0 OR SUM(ROC,sdexp(CC,ROC,PRO,AN))<>0)..
    PQDDEXP(CC,PRO,AN) =E=  ((1/AT2(CC,PRO,AN))*(epsilon2(CC,PRO,AN)**st(CC,PRO,AN)*((PQD(CC,PRO,AN))**(1-st(CC,PRO,AN)))
                                                +(1-epsilon2(CC,PRO,AN))**st(CC,PRO,AN)*((PDEXPFD(CC,PRO,AN))**(1-st(CC,PRO,AN)))
                                                )**(1/(1-st(CC,PRO,AN)))
                            )$(QD0(CC,PRO,AN)<>0 AND DEXP20(CC,PRO,AN)<>0)
                           +PQD(CC,PRO,AN)$(QD0(CC,PRO,AN)<>0 AND DEXP20(CC,PRO,AN)=0)
                           +PDEXPFD(CC,PRO,AN)$(QD0(CC,PRO,AN)=0 AND DEXP20(CC,PRO,AN)<>0)
                           +1$(QD0(CC,PRO,AN)=0 AND DEXP20(CC,PRO,AN)=0)
;
EPQDDIMP(CC,PRO,AN)..
     PC(CC,PRO,AN) =E=  ((1/AA(CC,PRO,AN))*(delta(CC,PRO,AN)**sa(CC,PRO,AN)*(((1+rvat(CC,PRO,AN))*PQDDIMP(CC,PRO,AN))**(1-sa(CC,PRO,AN)))
                                           +(1-delta(CC,PRO,AN))**sa(CC,PRO,AN)*(((1+rimt(CC,PRO,AN))*PIIMP(CC,PRO,AN))**(1-sa(CC,PRO,AN)))
                                           )**(1/(1-sa(CC,PRO,AN)))
                        )$(AA(CC,PRO,AN) NE 0)
                       +(PQDDIMP(CC,PRO,AN)+PC(CC,PRO,AN)-PDIMP(CC,PRO,AN))$(AA(CC,PRO,AN)=0)
;
EPQD(CC,PRO,AN)..
     PQDDIMP(CC,PRO,AN) =E=  ((1/AA2(CC,PRO,AN))*(delta2(CC,PRO,AN)**sa(CC,PRO,AN)*((PQD(CC,PRO,AN))**(1-sa(CC,PRO,AN)))
                                                 +(1-delta2(CC,PRO,AN))**sa(CC,PRO,AN)*((PDIMP(CC,PRO,AN))**(1-sa(CC,PRO,AN)))
                                                 )**(1/(1-sa(CC,PRO,AN)))
                             )$(QD0(CC,PRO,AN)<>0 AND DIMP20(CC,PRO,AN)<>0)
                            +PQD(CC,PRO,AN)$(QD0(CC,PRO,AN)<>0 AND DIMP20(CC,PRO,AN)=0)
                            +(PQD(CC,PRO,AN)+PQDDIMP(CC,PRO,AN)-1)$(QD0(CC,PRO,AN)=0)
;
EPIEXP(CC,PRO,AN)..
    PIEXP(CC,PRO,AN) =E= PC(CC,PRO,AN)
;
EPDEXP(CC,PRO,AN)..
    PDEXP(CC,PRO,AN) =E= PC(CC,PRO,AN)
;
EPDEXP2(CC,ROC,PRO,AN)..
    PDEXP2(CC,ROC,PRO,AN) =E= PDEXP(CC,PRO,AN)
;
EPIIMP(CC,PRO,AN)..
    PIIMP(CC,PRO,AN) =E= EXR(PRO,AN)*wpi(CC,PRO,AN)
;
EPDIMP(CC,PRO,AN)..
    PDIMP(CC,PRO,AN) =E=  PC(CC,PRO,AN)$(AA(CC,PRO,AN)<>0 OR QD0(CC,PRO,AN)<>0)
                         +PIIMP(CC,PRO,AN)$(AA(CC,PRO,AN)=0 AND QD0(CC,PRO,AN)=0 AND DIMP20(CC,PRO,AN)<>0)
                         +1$(AA(CC,PRO,AN)=0 AND QD0(CC,PRO,AN)=0 AND DIMP20(CC,PRO,AN)=0)
;
EPDIMP2(ROC,CC,PRO,AN)..
    PDIMP2(ROC,CC,PRO,AN) =E= PDIMP(CC,PRO,AN)
;
* Trade closure
EEXR(PRO,AN)..
    SUM(CC,PIEXPFD(CC,PRO,AN)*IEXP(CC,PRO,AN))+SUM(CTX,CMTXEXP(CTX,PRO,AN))+SUM(ROC,DIMPEXP(ROC,PRO,AN))+IINV(PRO,AN)
    =E=
    SUM(CC,PIIMP(CC,PRO,AN)*IIMP(CC,PRO,AN))+SUM(ROC,IIMPFO(ROC,PRO,AN))+ROWDT(PRO,AN)
;
* Constraint of labour, or labour market clearANce, to determine wage rate
EW(PRO,AN)..
    SUM(PS,LPS(PS,PRO,AN)) =E= SUM(PS,LSPS(PS,PRO,AN))
*    SUM(PS,LPS(PS,PRO,AN)) =E= LS(PRO,AN)
;
* Constraint of capital, or capital market clearANce, to determine rental rate
ER(PRO,AN)..
    SUM(PS,KPS(PS,PRO,AN)) =E= SUM(PS,KSPS(PS,PRO,AN))
*    SUM(PS,KPS(PS,PRO,AN)) =E= KS(PRO,AN)
;
* Constraint of labour, or labour market clearANce, to determine sectoral wage rate
EWPS(PS,PRO,AN)..
    WPS(PS,PRO,AN) =E= W(PRO,AN)
*    LPS(PS,PRO,AN) =E= LSPS(PS,PRO,AN)
;
* Constraint of capital, or capital market clearANce, to determine rental rate
ERPS(PS,PRO,AN)..
*    RPS(PS,PRO,AN) =E= R(PRO,AN)
    KPS(PS,PRO,AN) =E= KSPS(PS,PRO,AN)
;
* Cost of production
ECX(PS,PRO,AN)$(X0(PS,PRO,AN)<>0)..
    CX(PS,PRO,AN) =E= (1/AP(PS,PRO,AN))*(beta(PS,PRO,AN)**sp(PS,PRO,AN)*(PU(PS,PRO,AN)**(1-sp(PS,PRO,AN)))+gamma(PS,PRO,AN)**sp(PS,PRO,AN)*(PV(PS,PRO,AN)**(1-sp(PS,PRO,AN))))**(1/(1-sp(PS,PRO,AN)))
;
* Price of utility or aggregate consumption or Price index as numeraire
EPUY(HH,PRO,AN)..
    PUY(HH,PRO,AN) =E= (1/AH(HH,PRO,AN))*SUM(CC,(alphah(CC,HH,PRO,AN)**su)*(PC(CC,PRO,AN)**(1-su)))**(1/(1-su))
;
* BalANce
EBT(PRO,AN)..
    BT(PRO,AN) =E=  SUM(PS,SUM(CC,vt(PS,CC,PRO,AN)*PQ(CC,PRO,AN))*X(PS,PRO,AN))
                   +SUM((CTX,CC),CMTXQC(CTX,CC,PRO,AN))
                   +SUM(CC,PIIMP(CC,PRO,AN)*IIMP(CC,PRO,AN))
                   +SUM(CC,SUM(ROC,PDIMP(CC,PRO,AN)*DIMP(ROC,CC,PRO,AN)))
                   -SUM((PS,CC),PC(CC,PRO,AN)*QX(CC,PS,PRO,AN))
                   -SUM(CC,PC(CC,PRO,AN)*(SUM(HH,HHCM(CC,HH,PRO,AN))+LGCM(CC,PRO,AN)+CGCM(CC,PRO,AN)+INVCCV(CC,PRO,AN)+SC(CC,PRO,AN)))
                   -SUM(CC,PIEXPFD(CC,PRO,AN)*IEXP(CC,PRO,AN))
                   -SUM(CC,SUM(ROC,PDEXPFD(CC,PRO,AN)*DEXP(CC,ROC,PRO,AN)))
;

*--------------------------------
*Energy-related & elec Module
*--------------------------------
*能源商品+电力商品中间投入复合商品数量
EUEE(PS,PRO,TH)$(AN(TH) AND ORD(TH)>0)..
    UEE(PS,PRO,TH) =E=  utee(PS,PRO,TH)*U(PS,PRO,TH)
;
*非能源+电力商品中间投入复合商品数量
EUNEN(PS,PRO,TH)$(AN(TH) AND ORD(TH)>0)..
    UNEN(PS,PRO,TH) =E=  utnee(PS,PRO,TH)*U(PS,PRO,TH)
;
*能源商品+电力商品中间投入数量
EQXEE0(CC,PS,PRO,AN)..
    QXEE0(CC,PS,PRO,AN) =E=  ((UEE(PS,PRO,AN)/APEE(PS,PRO,AN))*(betaee(CC,PS,PRO,AN)*APEE(PS,PRO,AN)*CXEE0(PS,PRO,AN)/PQXEE(CC,PRO,AN))**spee(PS,PRO,AN)
                             )$(APEE(PS,PRO,AN)<>0)
                            +0$(APEE(PS,PRO,AN)=0)
;
EQXEE(CC,PS,PRO,AN)..
    QXEE(CC,PS,PRO,AN) =E=  ((UEE(PS,PRO,AN)/APEE(PS,PRO,AN))*(betaee(CC,PS,PRO,AN)*APEE(PS,PRO,AN)*CXEE(PS,PRO,AN)/PQXEEPS(CC,PS,PRO,AN))**spee(PS,PRO,AN)
                            )$(APEE(PS,PRO,AN)<>0)
                           +0$(APEE(PS,PRO,AN)=0)
;
*非能源+电力商品中间投入数量
EQXNEN(CC,PS,PRO,TH)$(AN(TH) AND ORD(TH)>0)..
    QXNEN(CC,PS,PRO,TH) =E=  utneecc(CC,PS,PRO,TH)*UNEN(PS,PRO,TH)
;
*生产部门能源+电力复合商品投入成本
ECXEE0(PS,PRO,AN)..
    CXEE0(PS,PRO,AN) =E=  ((1/APEE(PS,PRO,AN))*SUM(CC,betaee(CC,PS,PRO,AN)**spee(PS,PRO,AN)*(PQXEE(CC,PRO,AN)**(1-spee(PS,PRO,AN))))**(1/(1-spee(PS,PRO,AN)))
                          )$(SUM(CC,betaee(CC,PS,PRO,AN))<>0)
                         +0$(SUM(CC,betaee(CC,PS,PRO,AN))=0)
;
ECXEE(PS,PRO,AN)..
    CXEE(PS,PRO,AN) =E=  ((1/APEE(PS,PRO,AN))*SUM(CC,betaee(CC,PS,PRO,AN)**spee(PS,PRO,AN)*(PQXEEPS(CC,PS,PRO,AN)**(1-spee(PS,PRO,AN))))**(1/(1-spee(PS,PRO,AN)))
                         )$(SUM(CC,betaee(CC,PS,PRO,AN))<>0)
                        +0$(SUM(CC,betaee(CC,PS,PRO,AN))=0)
;
*能源商品中间投入价格
EPQXEE0(CC,PRO,AN)..
    PQXEE0(CC,PRO,AN) =E= (PC(CC,PRO,AN))$ENCC(CC)
;
*能源商品中间投入总成本(含碳成本)
EPQXEE(CC,PRO,AN)..
    PQXEE(CC,PRO,AN) =E=  (
                           PQXEE0(CC,PRO,AN)
                          +SUM(PS,PCO2ccps(CC,PS,PRO,AN))*cofCO2CC(CC,PRO,AN)
                          )$ENCC(CC)
;
EPQXEEPS(CC,PS,PRO,AN)..
    PQXEEPS(CC,PS,PRO,AN) =E=  (
                                PQXEE0(CC,PRO,AN)
                               +PCO2ccps(CC,PS,PRO,AN)*cofCO2CCPS(CC,PS,PRO,AN)
                               )$ENCC(CC)
;
*非能源+电力商品中间投入价格
EPQXNEN0(CC,PRO,AN)..
    PQXNEN0(CC,PRO,AN) =E= (PC(CC,PRO,AN))$(NOT ENCC(CC))
;
EPQXNENPS(CC,PS,PRO,AN)..
    PQXNENPS(CC,PS,PRO,AN) =E=  PQXNEN0(CC,PRO,AN)
                               +(PCO2ccps(CC,PS,PRO,AN)*cofCO2CCPS(CC,PS,PRO,AN))$(ORD(CC)=15)
;
EPCFD(CC,PRO,TH)$(AN(TH) AND ORD(TH)>0)..
    PCFD(CC,PRO,TH) =E=  PC(CC,PRO,TH)
                        +(PCO2FDcc(CC,PRO,TH)*cofCO2CC(CC,PRO,TH))$ENCC(CC)
;
EPIEXPFD(CC,PRO,AN)..
    PIEXPFD(CC,PRO,AN) =E=  PIEXP(CC,PRO,AN)
;
EPDEXPFD(CC,PRO,AN)..
    PDEXPFD(CC,PRO,AN) =E=  PDEXP(CC,PRO,AN)
;
*--------------------------------
* Carbon Module
*--------------------------------
*化石能源消耗产生的排放
EENCO2CCPS(CC,PS,PRO,AN)..
    ENCO2CCPS(CC,PS,PRO,AN) =E= QXEE(CC,PS,PRO,AN)*cofCO2CCPS(CC,PS,PRO,AN)
;
*生产活动化石能源中间投入产生的碳排放
EENCO2(PS,PRO,AN)..
    ENCO2(PS,PRO,AN) =E= SUM(CC,ENCO2CCPS(CC,PS,PRO,AN))
;
*生产活动中电力中间投入产生的碳排放
EELCO2(PS,PRO,AN)..
    ELCO2(PS,PRO,AN) =E= 0
;
*生产活动非化石能源产生的碳排放
ENENCO2(PS,PRO,AN)..
    NENCO2(PS,PRO,AN) =E= SUM(CC,QXNEN(CC,PS,PRO,AN)*cofCO2CCPS(CC,PS,PRO,AN))
;
*最终使用活动消耗能源产生的碳排放
EFDCO2(PRO,AN)..
    FDCO2(PRO,AN) =E= SUM(CC,(SUM(HH,HHCM(CC,HH,PRO,AN)))*cofCO2CC(CC,PRO,AN))
;
ETCO2(PRO,AN)..
    TCO2(PRO,AN) =E=  SUM(PS,ENCO2(PS,PRO,AN))
                     +SUM(PS,ELCO2(PS,PRO,AN))
                     +SUM(PS,NENCO2(PS,PRO,AN))
                     +FDCO2(PRO,AN)
;
*碳排放供给和区域碳排放需求相等，决定碳价格
EPCO2(PRO,AN)..
    CO2ref(PRO,AN)*(1-tcer(PRO,AN)) =G= SUM(PS,ENCO2(PS,PRO,AN))
* When full ET
*         B1S1TCO2ref(PRO,AN) =G= TCO2(PRO,AN)
;
*单位化石能源消费的碳成本
EPCO2ccps(CC,PS,PRO,AN)..
    PCO2ccps(CC,PS,PRO,AN) =E=  0
                               +(1-SWET(PRO,AN))*TRCO2(PRO,AN)
                               +(1-SWET(PRO,AN))*ENTRCO2(PRO,AN)
                               +(SWET(PRO,AN)*TRCO2(PRO,AN))$(NOT PS8(PS))
                               +(SWET(PRO,AN)*PCO2CLUB(PRO,AN))$PS8(PS)
* When full ET
*                             +PCO2(PRO,AN)
;
*单位化石能源消费的碳成本
EPCO2ps(PS,PRO,AN)..
    PCO2ps(PS,PRO,AN) =E=   0
                           +(1-SWET(PRO,AN))*TRCO2(PRO,AN)
                           +(1-SWET(PRO,AN))*ENTRCO2(PRO,AN)
                           +(SWET(PRO,AN)*TRCO2(PRO,AN))$(NOT PS8(PS))
                           +(SWET(PRO,AN)*PCO2CLUB(PRO,AN))$PS8(PS)
* When full ET
*                             +PCO2(PRO,AN)
;
*单位化石能源最终消费的碳成本
EPCO2FDcc(CC,PRO,AN)..
    PCO2FDcc(CC,PRO,AN) =E=
                              ENTRCO2(PRO,AN)$(ORD(CC)=02 OR ORD(CC)=03 OR ORD(CC)=04 OR ORD(CC)=09 OR ORD(CC)=10 OR ORD(CC)=27)
                             +TRCO2(PRO,AN)$(ORD(CC)=02 OR ORD(CC)=03 OR ORD(CC)=04 OR ORD(CC)=09 OR ORD(CC)=10 OR ORD(CC)=27)
                             +0$(ORD(CC)<>02 AND ORD(CC)<>03 AND ORD(CC)<>04 AND ORD(CC)<>09 AND ORD(CC)<>10 AND ORD(CC)<>27)
* When full ET
*                             +PCO2(PRO,AN)
;
EPCO2FD(PRO,AN)..
    PCO2FD(PRO,AN) =E=  ENTRCO2(PRO,AN)
                       +TRCO2(PRO,AN)
* When full ET
*                             +PCO2(PRO,AN)
;
EPCO2CLUB(PRO,AN)..
* When not emissions trading
*         SUM(PS$(ORD(PS)=07 OR ORD(PS)=08 OR ORD(PS)=10 OR ORD(PS)=11 OR ORD(PS)=13 OR ORD(PS)=14 OR ORD(PS)=22 OR ORD(PS)=26),CO2refPS(PS,PRO,AN)*(1-tcerPS(PS,PRO,AN)))
* When emissions trading
         SUM(PS$PS8(PS),ENCO2PSref(PS,PRO,AN))
     =G= SUM(PS$PS8(PS),ENCO2(PS,PRO,AN))
;
ETXCO2PS(PS,PRO,AN)..
         TXCO2PS(PS,PRO,AN) =E=  PCO2ps(PS,PRO,AN)*(ENCO2(PS,PRO,AN)-FPENPSref(PS,PRO,AN))
                                +PCO2ps(PS,PRO,AN)*(NENCO2(PS,PRO,AN)-FPNENPSref(PS,PRO,AN))
;
ETXENCO2(PRO,AN)..
         TXENCO2(PRO,AN) =E= SUM((CC,PS),PCO2ccps(CC,PS,PRO,AN)*ENCO2CCPS(CC,PS,PRO,AN))
;
ETXNENCO2(PRO,AN)..
         TXNENCO2(PRO,AN) =E= SUM(PS,SUM(CC$(ORD(CC)=15),PCO2ccps(CC,PS,PRO,AN)*NENCO2(PS,PRO,AN)))
;
ETXFDCO2(PRO,AN)..
         TXFDCO2(PRO,AN) =E= SUM(CC,PCO2FDcc(CC,PRO,AN)*cofCO2CC(CC,PRO,AN)*SUM(HH,HHCM(CC,HH,PRO,AN)))
;
ETXCO2FD(PRO,AN)..
         TXCO2FD(PRO,AN) =E=  TXFDCO2(PRO,AN)-PCO2FD(PRO,AN)*FPFDref(PRO,AN)
;
ETXCO2(PRO,AN)..
         TXCO2(PRO,AN) =E=  TXENCO2(PRO,AN)
                           +TXNENCO2(PRO,AN)
                           +TXFDCO2(PRO,AN)
                           -SUM(PS,PCO2ps(PS,PRO,AN)*FPENPSref(PS,PRO,AN))
                           -SUM(PS,PCO2ps(PS,PRO,AN)*FPNENPSref(PS,PRO,AN))
                           -PCO2FD(PRO,AN)*FPFDref(PRO,AN)
;
EENTRCO2(PRO,AN)..
        FIXedCO2ref(PRO,AN) =G= TCO2(PRO,AN)
;
*-------------------------------------
* THe model
*-------------------------------------
Model PDCGE_C_B0S1
/
EHHLY.HHLY
ETLE.TLE
ETLY.TLY
EHHKY.HHKY
EFMKY.FMKY
ETKE.TKE
ETKY.TKY

EHHY.HHY
EHHE.HHE
ETHHC.THHC
EHCEE.HCEE
EHCNEN.HCNEN
EHHCM.HHCM
EHHCM1.HHCM1
EHHCM2.HHCM2
ECHCEE.CHCEE
EHHTX.HHTX
EHHS.HHS

EFMTHH.FMTHH
EFMTLG.FMTLG
EFMTCG.FMTCG
EFMS.FMS
EFME.FME
EFMY.FMY
ELGCM.LGCM
ELGTHH.LGTHH
ELGTCG.LGTCG
ELGS.LGS
ELGE.LGE
ELGY.LGY
ECGCM.CGCM
ECGTLG.CGTLG
ECGS.CGS
ECGE.CGE
ECGY.CGY
ETXTLG.TXTLG
ETXTCG.TXTCG
ETXE.TXE
ETXY.TXY
EIEXP.IEXP
ECMTXEXP.CMTXEXP
EIINV.IINV
ETIEXP.TIEXP
ETIIMP.TIIMP
EIIMPEXP.IIMPEXP
EIIMPFO.IIMPFO
EDEXP.DEXP
EDEXP2.DEXP2
ECMTXFO.CMTXFO
EIIMP.IIMP
EDIMP.DIMP
EDIMP2.DIMP2
EDINV.DINV
ETDEXP.TDEXP
ETDIMP.TDIMP
EDIMPEXP.DIMPEXP
EDIMPFO.DIMPFO
ELGDT.LGDT
EROWDT.ROWDT
EROCDT.ROCDT

ELS0.LS
ELS.LS
ELSPS0.LSPS
ELSPS.LSPS
*EKS0.KS
*EKS.KS
EIKSPS.KSPS
EKSPS.KSPS
ERGDP.RGDP
EADJgdp.ADJgdp

ETSAV.TSAV
ETINV.TINV
EINVCCV.INVCCV
EINV.INV
EINVPS.INVPS
EINVPSV.INVPSV
EINVF.INVF
EINVS.INVS
ESC.SC
ETSCE.TSCE
ETSCY.TSCY

EX.X
EU.U
EV.V
EXQ.XQ
EQX.QX
ELPS.LPS
EKPS.KPS
EIDTX.IDTX
ECMTXQC.CMTXQC
ECMT.CMT
EQ.Q
EQD.QD
EQDDEXP.QDDEXP
EQDDIMP.QDDIMP
EQC.QC
EQCD.QCD

EPIIMP.PIIMP
EPDIMP.PDIMP
EPDIMP2.PDIMP2
EPC.PC
EPX.PX
EPU.PU
EPV.PV
EPQ.PQ
EPQD.PQD
EPQDDEXP.PQDDEXP
EPQDDIMP.PQDDIMP
EPIEXP.PIEXP
EPDEXP.PDEXP
EPDEXP2.PDEXP2
EEXR.EXR
ERWKY.RWKY
EW.W
*ER.R
*EWPS.WPS
ERPS.RPS
ECX.CX
EBT.BT
*--------------------------------
*energy module
*--------------------------------
ECXEE0.CXEE0
ECXEE.CXEE
EUEE.UEE
EQXEE0.QXEE0
EQXEE.QXEE
EQXNEN.QXNEN
EUNEN.UNEN
EPQXEE0.PQXEE0
EPQXEE.PQXEE
EPQXEEPS.PQXEEPS
EPQXNEN0.PQXNEN0
EPQXNENPS.PQXNENPS
EPCFD.PCFD
EPIEXPFD.PIEXPFD
EPDEXPFD.PDEXPFD
EPINVPS.PINVPS

*--------------------------------
*Carbon  Module
*--------------------------------
EENCO2CCPS.ENCO2CCPS
EENCO2.ENCO2
EELCO2.ELCO2
ENENCO2.NENCO2
EFDCO2.FDCO2
ETCO2.TCO2
*EPCO2.PCO2
EPCO2ccps.PCO2ccps
EPCO2ps.PCO2ps
EPCO2CLUB.PCO2CLUB
EPCO2FD.PCO2FD
EPCO2FDcc.PCO2FDcc
ETXCO2PS.TXCO2PS
ETXENCO2.TXENCO2
ETXNENCO2.TXNENCO2
ETXFDCO2.TXFDCO2
ETXCO2FD.TXCO2FD
ETXCO2.TXCO2
/
;
*-------------------------------------
* THe Dynamic Run
*-------------------------------------
* Main loop on time -------------START
*-------------------------------------
AN(TH) = 0;
LOOP(TH0$(ORD(TH0) EQ CURRYEAR-INITYEAR+1),
AN(TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1)=yes;
* Solving model
*-------------------------------------
PDCGE_C_B0S1.WORKSPACE=800;
OPTIONS MCP=PATH;
SOLVE PDCGE_C_B0S1 USING MCP;

*-------------------------------------
* Fixing lagged value for next period
*-------------------------------------
LS.FX(PRO,TH)$(ORD(TH) LE CURRYEAR-INITYEAR+1) = LS.L(PRO,TH);
LSPS.FX(PS,PRO,TH)$(ORD(TH) LE CURRYEAR-INITYEAR+1) = LSPS.L(PS,PRO,TH);
KSPS.FX(PS,PRO,TH)$(ORD(TH) LE CURRYEAR-INITYEAR+1) = KSPS.L(PS,PRO,TH);
PQ.FX(CC,PRO,TH)$(ORD(TH) LE CURRYEAR-INITYEAR+1) = PQ.L(CC,PRO,TH);
PC.FX(CC,PRO,TH)$(ORD(TH) LE CURRYEAR-INITYEAR+1) = PC.L(CC,PRO,TH);
INVPSV.FX(PS,PRO,TH)$(ORD(TH) LE CURRYEAR-INITYEAR+1) = INVPSV.L(PS,PRO,TH);

*-------------------------------------
CURRYEAR=CURRYEAR+1;
display CURRYEAR;
*-------------------------------------
$ontext
*-------------------------------------
* Starting Values for Next Period Run  设置下一期运行的起始值
*-------------------------------------
IDTX.L(ITX,PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IDTX.L(ITX,PS,PRO,TH-1);
LS.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LS.L(PRO,TH-1);
LSPS.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LSPS.L(PS,PRO,TH-1);
KS.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = KS.L(PRO,TH-1);
KSPS.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = KSPS.L(PS,PRO,TH-1);
QX.L(CC,PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = QX.L(CC,PS,PRO,TH-1);
LPS.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LPS.L(PS,PRO,TH-1);
LY.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LY.L(PS,PRO,TH-1);
KPS.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = KPS.L(PS,PRO,TH-1);
KY.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = KY.L(PS,PRO,TH-1);
X.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = X.L(PS,PRO,TH-1);
XQ.L(PS,CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = XQ.L(PS,CC,PRO,TH-1);
CMTXQC.L(CTX,CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CMTXQC.L(CTX,CC,PRO,TH-1);
CMT.L(CTX,CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CMT.L(CTX,CC,PRO,TH-1);
CMTXEXP.L(CTX,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CMTXEXP.L(CTX,PRO,TH-1);
CMTXFO.L(CTX,ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CMTXFO.L(CTX,ROC,PRO,TH-1);
IIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IIMP.L(CC,PRO,TH-1);
IIMPEXP.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IIMPEXP.L(PRO,TH-1);
IIMPFO.L(ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IIMPFO.L(ROC,PRO,TH-1);
DIMP.L(ROC,CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = DIMP.L(ROC,CC,PRO,TH-1);
DIMPEXP.L(ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = DIMPEXP.L(ROC,PRO,TH-1);
DIMPFO.L(ROC,ROC1,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = DIMPFO.L(ROC,ROC1,PRO,TH-1);
HHLY.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHLY.L(HH,PRO,TH-1);
TLE.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TLE.L(PRO,TH-1);
TLY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TLY.L(PRO,TH-1);
HHKY.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHKY.L(HH,PRO,TH-1);
FMKY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FMKY.L(PRO,TH-1);
RWKY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = RWKY.L(PRO,TH-1);
TKE.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TKE.L(PRO,TH-1);
TKY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TKY.L(PRO,TH-1);

HHY.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHY.L(HH,PRO,TH-1);
HHE.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHE.L(HH,PRO,TH-1);
THHC.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = THHC.L(HH,PRO,TH-1);
HCEE.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HCEE.L(HH,PRO,TH-1);
HCNEN.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HCNEN.L(HH,PRO,TH-1);
HHCM.L(CC,HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHCM.L(CC,HH,PRO,TH-1);
HHCM1.L(CC,HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHCM1.L(CC,HH,PRO,TH-1);
HHCM2.L(CC,HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHCM2.L(CC,HH,PRO,TH-1);
CHCEE.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CHCEE.L(HH,PRO,TH-1);
HHTX.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHTX.L(HH,PRO,TH-1);
HHS.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = HHS.L(HH,PRO,TH-1);

FMTHH.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FMTHH.L(HH,PRO,TH-1);
FMTLG.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FMTLG.L(PRO,TH-1);
FMTCG.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FMTCG.L(PRO,TH-1);
FMS.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FMS.L(PRO,TH-1);
FME.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FME.L(PRO,TH-1);
FMY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = FMY.L(PRO,TH-1);
LGCM.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGCM.L(CC,PRO,TH-1);
LGTCG.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGTCG.L(PRO,TH-1);
LGTHH.L(HH,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGTHH.L(HH,PRO,TH-1);
LGS.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGS.L(PRO,TH-1);
LGE.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGE.L(PRO,TH-1);
LGY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGY.L(PRO,TH-1);
LGDT.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = LGDT.L(PRO,TH-1);
CGCM.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CGCM.L(CC,PRO,TH-1);
CGTLG.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CGTLG.L(PRO,TH-1);
CGS.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CGS.L(PRO,TH-1);
CGE.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CGE.L(PRO,TH-1);
CGY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CGY.L(PRO,TH-1);
TXTLG.L(GTX,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXTLG.L(GTX,PRO,TH-1);
TXTCG.L(GTX,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXTCG.L(GTX,PRO,TH-1);
TXE.L(GTX,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXE.L(GTX,PRO,TH-1);
TXY.L(GTX,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXY.L(GTX,PRO,TH-1);
IEXP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IEXP.L(CC,PRO,TH-1);
IINV.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IINV.L(PRO,TH-1);
TIEXP.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TIEXP.L(PRO,TH-1);
TIIMP.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TIIMP.L(PRO,TH-1);
DEXP.L(CC,ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = DEXP.L(CC,ROC,PRO,TH-1);
DINV.L(ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = DINV.L(ROC,PRO,TH-1);
TDEXP.L(ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TDEXP.L(ROC,PRO,TH-1);
TDIMP.L(ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TDIMP.L(ROC,PRO,TH-1);
INVPSV.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = INVPSV.L(PS,PRO,TH-1);
INVCCPSV.L(CC,PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = INVCCPSV.L(CC,PS,PRO,TH-1);
INVCCV.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = INVCCV.L(CC,PRO,TH-1);
INV.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = INV.L(PRO,TH-1);
IINV.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = IINV.L(PRO,TH-1);
ROWDT.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = ROWDT.L(PRO,TH-1);
ROCDT.L(ROC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = ROCDT.L(ROC,PRO,TH-1);
INVS.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = INVS.L(PRO,TH-1);
TINV.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TINV.L(PRO,TH-1);
TSAV.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TSAV.L(PRO,TH-1);
SC.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = SC.L(CC,PRO,TH-1);
TSCE.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TSCE.L(PRO,TH-1);
TSCY.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TSCY.L(PRO,TH-1);
U.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = U.L(PS,PRO,TH-1);
V.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = V.L(PS,PRO,TH-1);
Q.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = Q.L(CC,PRO,TH-1);
QD.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = QD.L(CC,PRO,TH-1);
QDDEXP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = QDDEXP.L(CC,PRO,TH-1);
QDDIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = QDDIMP.L(CC,PRO,TH-1);
QC.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = QC.L(CC,PRO,TH-1);
QCD.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = QCD.L(CC,PRO,TH-1);
PIIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PIIMP.L(CC,PRO,TH-1);
PDIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PDIMP.L(CC,PRO,TH-1);
PC.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PC.L(CC,PRO,TH-1);
PX.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PX.L(PS,PRO,TH-1);
PU.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PU.L(PS,PRO,TH-1);
PV.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PV.L(PS,PRO,TH-1);
PQ.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PQ.L(CC,PRO,TH-1);
PQD.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PQD.L(CC,PRO,TH-1);
PQDDEXP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PQDDEXP.L(CC,PRO,TH-1);
PQDDIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PQDDIMP.L(CC,PRO,TH-1);
PIEXP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PIEXP.L(CC,PRO,TH-1);
PIEXPFD.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PIEXPFD.L(CC,PRO,TH-1);
PDEXP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PDEXP.L(CC,PRO,TH-1);
PDEXPFD.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PDEXPFD.L(CC,PRO,TH-1);
PIIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PIIMP.L(CC,PRO,TH-1);
PDIMP.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PDIMP.L(CC,PRO,TH-1);
EXR.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = EXR.L(PRO,TH-1);
CX.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = CX.L(PS,PRO,TH-1);
W.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = W.L(PRO,TH-1);
R.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = R.L(PRO,TH-1);
WPS.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = W.L(PRO,TH-1);
RPS.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = RPS.L(PS,PRO,TH-1);
BT.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = BT.L(PRO,TH-1);

ENCO2CCPS.L(CC,PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = ENCO2CCPS.L(CC,PS,PRO,TH-1);
ENCO2.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = ENCO2.L(PS,PRO,TH-1);
TCO2.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TCO2.L(PRO,TH-1);
PCO2.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PCO2.L(PRO,TH-1);
PCO2ccps.L(CC,PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PCO2ccps.L(CC,PS,PRO,TH-1);
PCO2ps.L(PS,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PCO2ps.L(PS,PRO,TH-1);
PCO2CLUB.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PCO2CLUB.L(PRO,TH-1);
PCO2FD.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PCO2FD.L(PRO,TH-1);
PCO2FDcc.L(CC,PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = PCO2FDcc.L(CC,PRO,TH-1);
TXENCO2.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXENCO2.L(PRO,TH-1);
TXNENCO2.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXNENCO2.L(PRO,TH-1);
TXFDCO2.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXFDCO2.L(PRO,TH-1);
TXCO2FD.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXCO2FD.L(PRO,TH-1);
TXCO2.L(PRO,TH)$(ORD(TH) EQ CURRYEAR-INITYEAR+1) = TXCO2.L(PRO,TH-1);
$offtext
*-------------------------------------

AN(TH)=no;
);
AN(TH)$(ORD(TH) GE 2 ANd ORD(TH) LE CURRYEAR-INITYEAR+1)=yes;
* main loop on time --------------------END
THHCM(HH,PRO,TH) = SUM(CC,HHCM.L(CC,HH,PRO,TH));
TLGCM(PRO,TH) = SUM(CC,LGCM.L(CC,PRO,TH));
TCGCM(PRO,TH) = SUM(CC,CGCM.L(CC,PRO,TH));
IDTX0(PRO,TH) = SUM((ITX,PS),IDTX.L(ITX,PS,PRO,TH));
CMTXQC0(PRO,TH) = SUM((CTX,CC),CMTXQC.L(CTX,CC,PRO,TH));

NGDP1(PRO,TH) = SUM(PS,PX.L(PS,PRO,TH)*X.L(PS,PRO,TH))-SUM((CC,PS),PC.L(CC,PRO,TH)*QX.L(CC,PS,PRO,TH))
;
NGDP2(PRO,TH) =
                 SUM(PS,W.L(PRO,TH)*LPS.L(PS,PRO,TH))
                +SUM(PS,RPS.L(PS,PRO,TH)*KSPS.L(PS,PRO,TH))
                +SUM(PS,SUM(ITX,rit(ITX,PS,PRO,TH))*PX.L(PS,PRO,TH)*X.L(PS,PRO,TH))
                +TXENCO2.L(PRO,TH)
                +TXNENCO2.L(PRO,TH)
                -SUM(PS,PCO2ps.L(PS,PRO,TH)*FPENPSref(PS,PRO,TH))
                -SUM(PS,PCO2ps.L(PS,PRO,TH)*FPNENPSref(PS,PRO,TH))
;
NGDP3(PRO,TH) =
                 SUM(CC,PC.L(CC,PRO,TH)*SUM(HH,HHCM.L(CC,HH,PRO,TH))+PC.L(CC,PRO,TH)*(LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)))
                +SUM(CC,PIEXPFD.L(CC,PRO,TH)*IEXP.L(CC,PRO,TH))
                +SUM(CC,SUM(ROC,PDEXPFD.L(CC,PRO,TH)*DEXP.L(CC,ROC,PRO,TH)))
                -SUM((CTX,CC),CMTXQC.L(CTX,CC,PRO,TH))
                -SUM(CC,PIIMP.L(CC,PRO,TH)*IIMP.L(CC,PRO,TH))
                -SUM(CC,SUM(ROC,PDIMP.L(CC,PRO,TH)*DIMP.L(ROC,CC,PRO,TH)))
;
grgdp(PRO,TH)$(ORD(TH)>1) = ((RGDP.L(PRO,TH)/RGDP.L(PRO,TH-1)-1)*100)$(RGDP.L(PRO,TH-1)<>0);
* Balance
BT.L(PRO,TH) =  SUM(PS,PX.L(PS,PRO,TH)*X.L(PS,PRO,TH))
               +SUM((CTX,CC),CMTXQC.L(CTX,CC,PRO,TH))
               +SUM(CC,PIIMP.L(CC,PRO,TH)*IIMP.L(CC,PRO,TH))
               +SUM(CC,SUM(ROC,PDIMP.L(CC,PRO,TH)*DIMP.L(ROC,CC,PRO,TH)))
               -SUM((PS,CC),PC.L(CC,PRO,TH)*QX.L(CC,PS,PRO,TH))
               -SUM(CC,PC.L(CC,PRO,TH)*SUM(HH,HHCM.L(CC,HH,PRO,TH))+PC.L(CC,PRO,TH)*(LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)))
               -SUM(CC,PIEXPFD.L(CC,PRO,TH)*IEXP.L(CC,PRO,TH))
               -SUM(CC,SUM(ROC,PDEXPFD.L(CC,PRO,TH)*DEXP.L(CC,ROC,PRO,TH)))
;
TIMP(PRO,TH) = SUM(CC,SUM(CTX$(ORD(CTX)<4),(1+CMTXQC.L(CTX,CC,PRO,TH))*PIIMP.L(CC,PRO,TH)*IIMP.L(CC,PRO,TH)));
TEXP(PRO,TH) = SUM(CC,PIEXPFD.L(CC,PRO,TH)*IEXP.L(CC,PRO,TH))-SUM(CC,SUM(CTX$(ORD(CTX)=4),CMTXQC.L(CTX,CC,PRO,TH)*PQD.L(CC,PRO,TH)*QD.L(CC,PRO,TH)));
TC(PRO,TH) = SUM(CC,PC.L(CC,PRO,TH)*(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)));
TINVSC(PRO,TH) = SUM(CC,PC.L(CC,PRO,TH)*(INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)));
TENCO2(PRO,TH) = SUM(PS,ENCO2.L(PS,PRO,TH));
TELCO2(PRO,TH) = SUM(PS,ELCO2.L(PS,PRO,TH));
TNENCO2(PRO,TH) = SUM(PS,NENCO2.L(PS,PRO,TH));
FPEN(PRO,TH) = SUM(PS,PCO2ps.L(PS,PRO,TH)*FPENPSref(PS,PRO,TH));
FPNEN(PRO,TH) = SUM(PS,PCO2ps.L(PS,PRO,TH)*FPNENPSref(PS,PRO,TH));
FPFD(PRO,TH) = PCO2FD.L(PRO,TH)*FPFDref(PRO,TH);
CPI(PRO,TH) =  (SUM(CC,PC.L(CC,PRO,TH)*(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)+IEXP.L(CC,PRO,TH)+SUM(ROC,DEXP.L(CC,ROC,PRO,TH))))
               /SUM(CC,(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)+IEXP.L(CC,PRO,TH)+SUM(ROC,DEXP.L(CC,ROC,PRO,TH))))
               )$(SUM(CC,(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)+IEXP.L(CC,PRO,TH)+SUM(ROC,DEXP.L(CC,ROC,PRO,TH))))<>0)
;
PPI(PRO,TH) =  (SUM(PS,PX.L(PS,PRO,TH)*X.L(PS,PRO,TH))/SUM(PS,X.L(PS,PRO,TH)))$(SUM(PS,X.L(PS,PRO,TH))<>0)
;
NNGDP(PRO,TH) =  SUM(CC,PC.L(CC,PRO,"2017")*(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)+IEXP.L(CC,PRO,TH)+SUM(ROC,DEXP.L(CC,ROC,PRO,TH))))
            +SUM(CC,PIEXPFD.L(CC,PRO,"2017")*IEXP.L(CC,PRO,TH))
            +SUM(CC,SUM(ROC,PDEXP.L(CC,PRO,"2017")*DEXP.L(CC,ROC,PRO,"2017")))
            -SUM((CTX,CC),CMTXQC.L(CTX,CC,PRO,"2017"))
            -SUM(CC,PIIMP.L(CC,PRO,"2017")*IIMP.L(CC,PRO,"2017"))
            -SUM(CC,SUM(ROC,PDIMP.L(CC,PRO,"2017")*DIMP.L(ROC,CC,PRO,"2017")))
;
NTC(PRO,TH) = SUM(CC,PC.L(CC,PRO,"2017")*(SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)));
NTINV(PRO,TH) = SUM(CC,PC.L(CC,PRO,"2017")*(INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH)));
NIMP(PRO,TH) = SUM(CC,(SUM(CTX$(ORD(CTX)<4),(1+CMTXQC.L(CTX,CC,PRO,TH))*PIIMP.L(CC,PRO,"2017"))*IIMP.L(CC,PRO,TH)));
NEXP(PRO,TH) = SUM(CC,PIEXPFD.L(CC,PRO,"2017")*IEXP.L(CC,PRO,TH))-SUM(CC,SUM(CTX$(ORD(CTX)=4),CMTXQC.L(CTX,CC,PRO,TH)*PQD.L(CC,PRO,"2017")*QD.L(CC,PRO,TH)));

XCH(PS,PRO,TH) = (X.L(PS,PRO,TH)/X.L(PS,PRO,"2017"))$(X.L(PS,PRO,"2017")<>0);
KCH(PS,PRO,TH) = (KSPS.L(PS,PRO,TH)/KSPS.L(PS,PRO,"2017"))$(KSPS.L(PS,PRO,"2017")<>0);

QX1(CC,PRO,TH) = SUM(PS,QX.L(CC,PS,PRO,TH));
QC1(CC,PRO,TH) = QX1(CC,PRO,TH)+SUM(HH,HHCM.L(CC,HH,PRO,TH))+LGCM.L(CC,PRO,TH)+CGCM.L(CC,PRO,TH)+INVCCV.L(CC,PRO,TH)+SC.L(CC,PRO,TH);
DEXP1(CC,PRO,TH) =SUM(ROC,DEXP.L(CC,ROC,PRO,TH));
DIMP1(CC,PRO,TH) =SUM(ROC,DIMP.L(ROC,CC,PRO,TH));
IIMP1(CC,PRO,TH) = ((QC.L(CC,PRO,TH)/AA(CC,PRO,TH))
                    *((1-delta(CC,PRO,TH))*AA(CC,PRO,TH)*PC.L(CC,PRO,TH)/((1+rimt(CC,PRO,TH))*PIIMP.L(CC,PRO,TH)))**sa(CC,PRO,TH))$(AA(CC,PRO,TH) NE 0)


Execute_Unload 'MR_ST.gdx';
$exit



