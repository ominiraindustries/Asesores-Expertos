/*
    FOREX MEGADROID PRO XE v1.2
    v1.01ee (educated & enhanced)+ bbrain unplugged v11
    Now with Xtra Educated full logic customization!
    Default reference numbers changed
    fxharvest mods added for advanced trading
    
    Main Credits to: Don, bbrain, fxharvest
    Also Thanks to: qingyang2005, copycat, xpertadvisor, Rio
    from Indo-Investasi forum
*/

#property copyright "Forex MegaDroid Team"
#property link      "http://www.forex-megadroid.com"

#include <WinUser32.mqh>
#include <stdlib.mqh>

#import "kernel32.dll"
   int   GetCurrentProcessId();
   void  GetLocalTime(int& TimeArray[]);
   int   GetTimeZoneInformation(int& TZInfoArray[]);
#import

extern string Version = "1.01ee+bbrv11+fxhB+XE_v1.2";
extern string _1 = "---- System Parameters ----";
extern bool Stealth = TRUE;
extern bool Aggressive = TRUE;
extern double GmtOffset = 0.0;
extern bool NFA = FALSE; //1.01
extern bool AutoLocalGmtOffset = TRUE;
extern bool AutoServerGmtOffset = TRUE;
extern int S1_Reference = 40008015;
extern int S2_Reference = 16023042;
extern string _2 = "---- Comment Position -----";
extern int TopPadding = 30;
extern int LeftPadding = 20;
extern color TextColor1 = CadetBlue;
extern color TextColor2 = SkyBlue;
extern string _3 = "--- Strategy Parameters ---";
extern int Slippage = 3;
extern bool SendEmails = FALSE;
extern double LotSize = 0.1;
extern double RiskLevel = 0.1;
extern bool RecoveryMode = TRUE;
extern string _4 = "---- Advanced Parameters ---";
extern bool RiskSharingEnabled = TRUE;
extern bool UseForceClose = FALSE;
extern int ForceCloseOnGmtHour = 8;
extern bool UseBreakEven = FALSE;
extern int SetBreakEvenAt = 6;
extern double BreakEvenShift = 1.0;
extern bool UseTimedStopLoss = FALSE;
extern int OrderOpenedMinute1 = 60;
extern int StopLossPips1 = 40;
extern int OrderOpenedMinute2 = 120;
extern int StopLossPips2 = 30;
extern int OrderOpenedMinute3 = 180;
extern int StopLossPips3 = 20;
extern int OrderOpenedMinute4 = 240;
extern int StopLossPips4 = 10;
extern string _5 = "-------- Max Spread --------";
extern string _6 = "-1:Disable 0.0:Default >0.0:Limit";
extern double MaxSpread = 0;
extern string _7 = "---- Trade Time Periods ----";
extern bool TradeSunday = FALSE;
extern bool TradeFriday = TRUE;
extern bool TradeNFP = TRUE;
extern bool TradeMonthEnd = FALSE;
extern bool OverrideTradeTimes = FALSE;
extern int S1_StartHour = 21;
extern int S1_EndHour = 23;
extern int S2_StartHour = 22;
extern int S2_EndHour = 23;
extern string _8 = "--- Advanced Droid Tactics ---";
extern bool TradeGMT2 = FALSE;
extern bool TradeGMT4 = FALSE;
extern bool TradeGMT6 = FALSE;
extern bool TradeGMT8 = FALSE;
extern bool TradeGMT_2 = FALSE;
extern bool TradeGMT_4 = FALSE;
extern bool TradeGMT_6 = FALSE;
extern bool TradeGMT_8 = FALSE;
extern string _9 = "------ Logic Selection -----";
extern string _10 = "1:EU 2:EC 3:EG 4:UC 5:CUSTOM";
extern int Logic = 1;
extern bool OverrideDefaultLogic = FALSE;
extern string _11 = "CUSTOM S1 Logic Parameters";
extern int S1_TakeProfit = 10;
extern int S1_StopLoss = 150;
extern int S1_MinStopLoss = 40;
extern int S1_TrailingStop = 0;
extern int S1_RSI_M15_Period = 6;
extern int S1_RSI_M1_Period = 20;
extern int S1_CCI_Period = 8;
extern double S1_OverBought_RSI_M15 = 70.0;
extern double S1_OverSold_RSI_M15 = 30.0;
extern double S1_OverBought_RSI_M1 = 70.0;
extern double S1_OverSold_RSI_M1 = 30.0;
extern double S1_TradeOpenedInHr = 1.0;
extern double S1_TradeOpenedMaxHr = 12.0;
extern double S1_Unknown1 = 1.0;
extern double S1_Unknown2 = 1.0;
extern int S1_MaxSpread = 4;
extern string _12 = "0: PERIOD_M5, 1: PERIOD_M15";
extern int S1_TimeFrame = 1;
extern string _13 = "CUSTOM S2 Logic Parameters";
extern int S2_TakeProfit = 15;
extern int S2_StopLoss = 150;
extern int S2_MinStopLoss = 30;
extern double S2_StopLossMultiplier = 2.0;
extern int S2_TrailingStop = 0;
extern int S2_BarCount = 36;
extern int S2_CCI_FastPeriod = 168;
extern int S2_CCI_SlowPeriod = 275;
extern double S2_TradeOpenedInHr1 = 1.0;
extern double S2_TradeOpenedInHr10 = 10.0;
extern double S2_TradeOpenedInHr12 = 12.0;
extern int S2_MaxSpread = 4;
extern string _14 = "0: PERIOD_M5, 1: PERIOD_M15";
extern int S2_TimeFrame = 0;
int Gcount = 0;
bool gi_208 = FALSE;
double gd_212 = 1000.0;
double gd_220 = 0.2;
bool gi_228 = FALSE;
bool gi_240 = TRUE;
bool gi_244 = TRUE;
bool gi_248 = TRUE;
int gi_252 = 3;
int g_timeframe_256 = PERIOD_M15;
int gi_260 = 10;
int gi_264 = 50;
int gi_268 = 200;
int gi_272 = 20;
int gi_276 = 0;
int gi_280 = 16711680;
int gi_284 = 255;
int g_period_288 = 6;
int g_period_292 = 20;
int g_period_296 = 8;
double gd_300 = 70.0;
double gd_308 = 30.0;
double gd_316 = 64.0;
double gd_324 = 36.0;
bool gi_332 = TRUE;
bool gi_336 = TRUE;
bool gi_340 = TRUE;
int gi_344 = 12;
bool gi_348 = TRUE;
int gi_352 = 20;
bool gi_356 = TRUE;
bool gi_360 = FALSE;
double gd_364 = 1.0;
double gd_372 = 24.0;
bool gi_380 = TRUE;
double gd_384 = 1.0;
double gd_392 = 1.0;
bool gi_400 = FALSE;
int gi_404 = 0;
bool gi_408 = TRUE;
bool gi_412 = TRUE;
int gi_416 = 21;
int gi_420 = 1;
int gi_424 = 21;
int gi_428 = 0;
int g_timeframe_432 = PERIOD_M5;
int gi_436 = 35;
int gi_440 = 60;
int gi_444 = 200;
int gi_448 = 20;
double gd_452 = 1.0;
int gi_460 = 0;
int gi_464 = 16748574;
int gi_468 = 9639167;
int gi_472 = 36;
int g_period_476 = 168;
int g_period_480 = 275;
bool gi_484 = TRUE;
bool gi_488 = FALSE;
bool gi_492 = TRUE;
double gd_496 = 1.0;
double gd_504 = 12.0;
double gd_512 = 24.0;
bool gi_520 = FALSE;
bool gi_524 = FALSE;
int gi_528 = 0;
bool gi_532 = TRUE;
bool gi_536 = TRUE;
int gi_540 = 21;
int gi_544 = 4;
int gi_548 = 21;
int gi_552 = 0;
bool gi_556 = TRUE;
int gi_560;
int servertime;
int GMT_time;
double GMT_Hour;
int gi_580;
int g_spread_584;
int g_spread_588;
int g_stoplevel_592;
double gd_596;
double gd_604;
int gi_612 = 1;
double gd_616;
bool gi_624 = FALSE;
int gi_628 = 0;
int gi_632 = 0;
string gs_636;
string gs_644;
string gs_652;
int gi_660 = 0;
int gi_664 = 0;
int gi_668 = 0;
int gi_672;
int gi_676;
int gi_680 = 0;
double g_irsi_684;
double g_irsi_692;
double g_irsi_700;
double g_irsi_708;
double g_icci_716;
double g_icci_724;
double g_icci_732;
double g_ima_756;
bool gi_764 = TRUE;
bool gi_768 = TRUE;
double g_ihigh_772 = 0.0;
double g_ilow_780 = 0.0;
bool gi_788 = FALSE;
int gi_792 = 0;
int gi_796 = 0;
int gi_800 = 0;
int gi_804 = 0;
int gi_808;
int gi_812;
int gi_816 = 0;
int gi_820 = 0;
int gi_824;
int gi_828 = 0;
int gi_832 = 0;
int g_ticket_836 = 0;
int g_datetime_840 = 0;
int g_ticket_844 = 0;
int g_datetime_848 = 0;
int gi_852 = 0;
double g_icci_856;
double g_icci_864;
double g_ihigh_872;
double g_ilow_880;
double g_ihigh_888;
double g_ilow_896;
bool gi_904 = FALSE;
int gi_908 = 0;
int gi_912 = 0;
int gi_916 = 0;
int gi_920 = 0;
int gi_924;
int gi_928;
int g_ticket_932 = -1;
int gi_936;
int gi_940;
int g_datetime_944;
int g_datetime_948;
double g_ord_open_price_952;
int g_ticket_960 = -1;
int gi_964;
int gi_968;
int g_datetime_972;
int g_datetime_976;
double g_ord_open_price_980;
double gd_988 = 0.0;
double gd_996 = 0.0;
bool gi_1004 = FALSE;
bool gi_1008;
bool gi_1012;
int gi_1016;
int g_count_1024 = 0;
int g_ticket_1020 = -2;
int g_ticket_1024 = -2;
double g_ord_profit_1028 = 0.0;
double g_ord_profit_1036 = 0.0;
int g_ticket_1044 = -2;
int g_ticket_1048 = -2;
double g_ord_profit_1052 = 0.0;
double g_ord_profit_1060 = 0.0;
bool gi_1068 = FALSE;
int g_datetime_1076 = 0;
int g_datetime_1080 = 0;
bool gi_1084 = TRUE;
int g_datetime_1088 = 0;
int g_datetime_1092 = 0;
string gsa_1096[] = {".", "..", "...", "....", "....."};
double GMT2; //g_hour_1300;
double GMT4; //g_hour_1308;
double GMT6; //g_hour_1316;
double GMT8; //g_hour_1324;
double GMT_2; //g_hour_1332;
double GMT_4; //g_hour_1340;
double GMT_6; //g_hour_1348;
double GMT_8; //g_hour_1356;
string g_comment_1364; //comment

string my_symbol ="";

void SetSymbol(){
   my_symbol = StringSubstr(Symbol(), 0, 6);
   if (Logic < 1 || Logic > 5) Logic = 1;
   if( OverrideDefaultLogic || ( my_symbol != "EURUSD" && my_symbol != "EURCHF" && my_symbol != "EURGBP" && my_symbol != "USDCHF") )
   {
      if (Logic == 1) my_symbol = "EURUSD";
      if (Logic == 2) my_symbol = "EURCHF";
      if (Logic == 3) my_symbol = "EURGBP";
      if (Logic == 4) my_symbol = "USDCHF";
      if (Logic == 5) my_symbol = "CUSTOM";
   }
}

int S1_CheckSymbol() {
   if (my_symbol == "EURUSD")
   {
      gi_260 = 10;
      gi_268 = 150;
      gi_272 = 40;
      gi_276 = 0;
      g_period_288 = 6;
      g_period_292 = 20;
      g_period_296 = 8;
      gd_300 = 70.0;
      gd_308 = 30.0;
      gd_316 = 70.0;
      gd_324 = 30.0;
      gd_364 = 1.0;
      gd_372 = 12.0;
      gd_384 = 1.0;
      gd_392 = 1.0;
      gi_404 = 4;
      gi_416 = 21;
      gi_420 = 23;
      gi_424 = 21;
      gi_428 = 23;
      g_timeframe_256 = PERIOD_M15;
      return(1);
   }
   
   if (my_symbol == "EURCHF")
   {
      gi_260 = 10;
      gi_268 = 120;
      gi_272 = 40;
      gi_276 = 0;
      g_period_288 = 6;
      g_period_292 = 20;
      g_period_296 = 8;
      gd_300 = 70.0;
      gd_308 = 30.0;
      gd_316 = 64.0;
      gd_324 = 36.0;
      gd_364 = 1.0;
      gd_372 = 4.0;
      gd_384 = 1.0;
      gd_392 = 1.0;
      gi_404 = 6;
      gi_416 = 21;
      gi_420 = 0;
      gi_424 = 21;
      gi_428 = 23;
      g_timeframe_256 = PERIOD_M5;
      return(1);
   }
            
   if (my_symbol == "EURGBP")
   {
      gi_260 = 6;
      gi_268 = 120;
      gi_272 = 40;
      gi_276 = 0;
      g_period_288 = 6;
      g_period_292 = 20;
      g_period_296 = 16;
      gd_300 = 70.0;
      gd_308 = 30.0;
      gd_316 = 64.0;
      gd_324 = 36.0;
      gd_364 = 1.0;
      gd_372 = 3.0;
      gd_384 = 1.0;
      gd_392 = 1.0;
      gi_404 = 6;
      gi_416 = 21;
      gi_420 = 0;
      gi_424 = 21;
      gi_428 = 23;
      g_timeframe_256 = PERIOD_M5;
      return(1);
   }

   if (my_symbol == "USDCHF")
   {
      gi_260 = 10;
      gi_268 = 150;
      gi_272 = 30;
      gi_276 = 0;
      g_period_288 = 6;
      g_period_292 = 20;
      g_period_296 = 8;
      gd_300 = 70.0;
      gd_308 = 30.0;
      gd_316 = 70.0;
      gd_324 = 30.0;
      gd_364 = 1.0;
      gd_372 = 12.0;
      gd_384 = 1.0;
      gd_392 = 1.0;
      gi_404 = 6;
      gi_416 = 21;
      gi_420 = 23;
      gi_424 = 21;
      gi_428 = 23;
      g_timeframe_256 = PERIOD_M5;
      return(1);
   }
   
   if (my_symbol == "CUSTOM")
   {
      gi_260 = S1_TakeProfit;
      gi_268 = S1_StopLoss;
      gi_272 = S1_MinStopLoss;
      gi_276 = S1_TrailingStop;
      g_period_288 = S1_RSI_M15_Period;
      g_period_292 = S1_RSI_M1_Period;
      g_period_296 = S1_CCI_Period;
      gd_300 = S1_OverBought_RSI_M15;
      gd_308 = S1_OverSold_RSI_M15;
      gd_316 = S1_OverBought_RSI_M1;
      gd_324 = S1_OverSold_RSI_M1;
      gd_364 = S1_TradeOpenedInHr;
      gd_372 = S1_TradeOpenedMaxHr;
      gd_384 = S1_Unknown1;
      gd_392 = S1_Unknown2;
      gi_404 = S1_MaxSpread;
      gi_416 = 21;
      gi_420 = 23;
      gi_424 = 21;
      gi_428 = 23;
      g_timeframe_256 = PERIOD_M5;
      if (S1_TimeFrame != 0) {
        g_timeframe_256 = PERIOD_M15;
      }
      return(1);
      
   }
   return(0);
}

int S2_CheckSymbol()
{
   if (my_symbol == "EURUSD")
   {
      gi_436 = 15;
      gi_444 = 150;
      gi_448 = 30;
      gd_452 = 2.0;
      gi_460 = 0;
      gi_472 = 36;
      g_period_476 = 168;
      g_period_480 = 275;
      gd_496 = 1.0;
      gd_504 = 10.0;
      gd_512 = 12.0;
      gi_528 = 4;
      gi_540 = 22;
      gi_544 = 23;
      gi_548 = 22;
      gi_552 = 23;
      g_timeframe_432 = PERIOD_M5;
      return(1);
   }
         
   if (my_symbol == "EURCHF")
   {
      gi_436 = 15;
      gi_444 = 150;
      gi_448 = 40;
      gd_452 = 2.0;
      gi_460 = 0;
      gi_472 = 12;
      g_period_476 = 46;
      g_period_480 = 275;
      gd_496 = 1.0;
      gd_504 = 2.0;
      gd_512 = 5.0;
      gi_528 = 6;
      gi_540 = 22;
      gi_544 = 0;
      gi_548 = 22;
      gi_552 = 0;
      g_timeframe_432 = PERIOD_M5;
      return(1);
   }
            
   if (my_symbol == "EURGBP")
   {
      gi_436 = 6;
      gi_444 = 120;
      gi_448 = 60;
      gd_452 = 1.0;
      gi_460 = 0;
      gi_472 = 12;
      g_period_476 = 168;
      g_period_480 = 275;
      gd_496 = 1.0;
      gd_504 = 10.0;
      gd_512 = 12.0;
      gi_528 = 5;
      gi_540 = 22;
      gi_544 =23;
      gi_548 = 22;
      gi_552 = 23;
      g_timeframe_432 = PERIOD_M5;
      return(1);
   }
   
   if (my_symbol == "USDCHF")
   {
      gi_436 = 10;
      gi_444 = 100;
      gi_448 = 60;
      gd_452 = 3.0;
      gi_460 = 0;
      gi_472 = 12;
      g_period_476 = 70;
      g_period_480 = 275;
      gd_496 = 1.0;
      gd_504 = 4.0;
      gd_512 = 18.0;
      gi_528 = 5;
      gi_540 = 22;
      gi_544 = 23;
      gi_548 = 22;
      gi_552 = 23;
      g_timeframe_432 = PERIOD_M5;
      return(1);
   }
   
   if (my_symbol == "CUSTOM")
   {   
      gi_436 = S2_TakeProfit;
      gi_444 = S2_StopLoss;
      gi_448 = S2_MinStopLoss;
      gd_452 = S2_StopLossMultiplier;
      gi_460 = S2_TrailingStop;
      gi_472 = S2_BarCount;
      g_period_476 = S2_CCI_FastPeriod;
      g_period_480 = S2_CCI_SlowPeriod;
      gd_496 = S2_TradeOpenedInHr1;
      gd_504 = S2_TradeOpenedInHr10;
      gd_512 = S2_TradeOpenedInHr12;
      gi_528 = S2_MaxSpread;
      gi_540 = 22;
      gi_544 = 23;
      gi_548 = 22;
      gi_552 = 23;
      g_timeframe_432 = PERIOD_M5;
      if (S2_TimeFrame != 0) {
        g_timeframe_432 = PERIOD_M15;
      }
      return(1);
   }         
            
   return(0);
}

int init() {
   SetSymbol();
   if (gi_556) gi_560 = 0;
   else gi_560 = 1;
   if (gi_240 && !IsTesting()) Increment();
   gi_676 = LeftPadding;
   gi_672 = TopPadding;
   GetPos(0, gi_676, gi_672);
   gi_664 = 0;
   gi_660 = 0;
   gs_636 = "MegaDroidPro" + " XE " + " v1.2 " + " Symbol: " + Symbol();
   PrintLN(gs_636, TextColor2);
   PrintSep();
   ObjectsRedraw();
   for (int l_count_0 = 0; !IsStopped() && !IsConnected(); l_count_0++) {
      PrintLN("Waiting for connection" + PPrint(l_count_0), TextColor1, 2, 2);
      ObjectsRedraw();
      Sleep(150);
   }
   PrintLN("Authentication...", TextColor1, 2, 2);
   ObjectsRedraw();
   gi_628 = 16384;
   PrintResponse(gi_628, 2, 2);
   PrintSep();
   ObjectsRedraw();
   bool li_4 = FALSE;
   bool li_8 = FALSE;
   li_4 = S1_CheckSymbol();
   li_8 = S2_CheckSymbol();

   if (OverrideTradeTimes) //v0.7
   {
      gi_416 = S1_StartHour;
      gi_420 = S1_EndHour;
      gi_424 = S1_StartHour;
      gi_428 = S1_EndHour;

      gi_540 = S2_StartHour;
      gi_544 = S2_EndHour;
      gi_548 = S2_StartHour;
      gi_552 = S2_EndHour;
   }
   
   if (li_4) {
      gi_244 = TRUE;
      if (Aggressive) gi_248 = li_8;
      else gi_248 = FALSE;
   } else {
      if (li_8) {
         gi_244 = FALSE;
         gi_248 = TRUE;
      } else {
         gi_248 = FALSE;
         gi_244 = FALSE;
      }
   }
   if (!gi_244 && !gi_248) {
      gs_644 = "Error:";
      gs_652 = "This currency is not supported!";
   } else {
      gs_644 = "Aggressive:";
      gs_652 = BPrint(gi_244 && gi_248);
      if (Aggressive && !(gi_244 && gi_248)) gs_652 = gs_652 + " (not supported)";
   }
   PrintLN(gs_644);
   PrintLN(gs_652, TextColor2, gi_664, gi_660 - 1, 5 * (StringLen(gs_644) + 1));
   PrintSep();
   ObjectsRedraw();
   if (!gi_244 && !gi_248) MessageBox("You have selected the wrong currency pair!", gs_636 + ": Warning", MB_ICONEXCLAMATION);
   gd_616 = gd_212;
   gi_632 = 0;
   if (!IsTesting()) gi_624 = TRUE;
   return (0);
}

int deinit() {
   if (gi_240 && !IsTesting()) Decrement();
   switch (UninitializeReason()) {
   case REASON_CHARTCLOSE:
   case REASON_REMOVE:
      Deleteobjects(0, gi_668);
      gi_668 = 0;
      break;
   case REASON_RECOMPILE:
   case REASON_CHARTCHANGE:
   case REASON_PARAMETERS:
   case REASON_ACCOUNT:
      Deleteobjects(1, gi_668);
      gi_668 = 1;
   }
   return (0);
}

int s1_direction() {
   if (g_icci_716 >= 0.0 || g_irsi_684 >= 50.0) gi_832 = servertime;
   if (g_icci_716 <= 0.0 || g_irsi_684 <= 50.0) gi_828 = servertime;
   if (gi_832 > 0 && servertime - gi_832 > 3600.0 * gd_384) return (2);
   if (gi_828 > 0 && servertime - gi_828 > 3600.0 * gd_384) return (3);
   if (gi_832 == 0 || gi_828 == 0) return (0);
   return (1);
}

void s1_dayRange() {
   int l_shift_0;
   if (servertime - gi_580 < 3600.0 * gi_344) l_shift_0 = iBarShift(NULL, g_timeframe_256, gi_580 - 86400);
   else l_shift_0 = iBarShift(NULL, g_timeframe_256, gi_580);
   g_ihigh_772 = iHigh(NULL, g_timeframe_256, iHighest(NULL, g_timeframe_256, MODE_HIGH, l_shift_0 - gi_560, gi_560));
   g_ilow_780 = iLow(NULL, g_timeframe_256, iLowest(NULL, g_timeframe_256, MODE_LOW, l_shift_0 - gi_560, gi_560));
}

void s1_setRules() {
   int li_0;
   HideTestIndicators(TRUE);
   g_irsi_684 = iRSI(NULL, g_timeframe_256, g_period_288, PRICE_CLOSE, gi_560);
   g_irsi_692 = iRSI(NULL, g_timeframe_256, g_period_288, PRICE_CLOSE, gi_560 + 1);
   g_irsi_700 = iRSI(NULL, g_timeframe_256, g_period_288, PRICE_CLOSE, gi_560 + 2);
   if (gi_332) g_irsi_708 = iRSI(NULL, PERIOD_M1, g_period_292, PRICE_CLOSE, gi_560);
   g_icci_716 = iCCI(NULL, g_timeframe_256, g_period_296, PRICE_TYPICAL, gi_560);
   g_icci_724 = iCCI(NULL, g_timeframe_256, g_period_296, PRICE_TYPICAL, gi_560 + 1);
   g_icci_732 = iCCI(NULL, g_timeframe_256, g_period_296, PRICE_TYPICAL, gi_560 + 2);
   g_ima_756 = iMA(NULL, g_timeframe_256, g_period_296, 0, MODE_SMA, PRICE_MEDIAN, gi_560);
   if (gi_348) {
      if (g_irsi_684 >= 50 - gi_352 / 2 && g_irsi_684 <= gi_352 / 2 + 50) {
         gi_764 = TRUE;
         gi_768 = TRUE;
      }
   }
   if (gi_340) s1_dayRange();
   if (gi_380) {
      li_0 = gi_816;
      gi_816 = s1_direction();
      if (li_0 != gi_816) {
         gi_820 = li_0;
         if (gi_816 == 1) gi_824 = servertime + 3600.0 * gd_392;
      }
   }
   if (gi_404 > 0) {
      if (g_spread_584 > gi_404 * gd_596) {
         if (g_spread_588 < g_spread_584) {
            Print("Strategy1: Safe spread limit exceeded: spread = ", g_spread_584);
            if (gi_408) Print("Strategy1: Using DayDirection filter");
         }
         gi_788 = TRUE;
      } else gi_788 = FALSE;
   }
   HideTestIndicators(FALSE);
   if (gi_788) {
      gi_808 = gi_424;
      gi_812 = gi_428;
      return;
   }
   gi_808 = gi_416;
   gi_812 = gi_420;
}

int s1_openBuyRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (!gi_764) return (0);
   if (gi_788 && !gi_408) return (0);
   if (gi_380) {
      if (gi_816 == 2) return (0);
      if (servertime <= gi_824)
         if (gi_820 == 2) return (0);
   }
   if (gi_400 || gi_788) {
      if (servertime - gi_580 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_256, gi_580 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_256, gi_580);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_256, gi_580);
         l_shift_20 = gi_560;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_256, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_256, l_shift_20);
      if (l_iclose_0 < l_iclose_8) return (0);
   }
   return (s1_Buy(Ask, g_icci_716, g_irsi_684, g_irsi_708, g_ima_756, gd_308, gd_324, gi_260 * gd_596 * Point, gi_336, gi_332));
}

int s1_openSellRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (!gi_768) return (0);
   if (gi_788 && !gi_408) return (0);
   if (gi_380) {
      if (gi_816 == 3) return (0);
      if (servertime <= gi_824)
         if (gi_820 == 3) return (0);
   }
   if (gi_400 || gi_788) {
      if (servertime - gi_580 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_256, gi_580 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_256, gi_580);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_256, gi_580);
         l_shift_20 = gi_560;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_256, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_256, l_shift_20);
      if (l_iclose_0 > l_iclose_8) return (0);
   }
   return (s1_Sell(Bid, g_icci_716, g_irsi_684, g_irsi_708, g_ima_756, gd_300, gd_316, gi_260 * gd_596 * Point, gi_336, gi_332));
}

bool s1_closeBuyRule() {
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_260 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_260 * Point * gd_596, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_796 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_796 * Point * gd_596, Digits)) return (TRUE);
   }
   if (gi_360) {
      if (g_ticket_836 != OrderTicket()) {
         g_datetime_840 = OrderOpenTime();
         g_ticket_836 = OrderTicket();
      }
      if (g_icci_716 >= 0.0 || g_irsi_684 >= 50.0) g_datetime_840 = servertime;
      if (g_icci_732 < g_icci_724 && g_irsi_700 < g_irsi_692) g_datetime_840 = iTime(NULL, g_timeframe_256, gi_560);
      if (servertime - g_datetime_840 > 3600.0 * gd_364 && OrderProfit() < 0.0) return (TRUE);
   }
   if (gi_356) {
      if (servertime - OrderOpenTime() > 3600.0 * gd_364) {
         if (g_icci_716 > 0.0 && g_irsi_684 > 50.0 && OrderProfit() > 0.0) return (TRUE);
         if (servertime - OrderOpenTime() > 3600.0 * gd_372) return (TRUE);
      }
   }
   return (FALSE);
}

bool s1_closeSellRule() {
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_260 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_260 * Point * gd_596, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_804 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_804 * Point * gd_596, Digits)) return (TRUE);
   }
   if (gi_360) {
      if (g_ticket_844 != OrderTicket()) {
         g_datetime_848 = OrderOpenTime();
         g_ticket_844 = OrderTicket();
      }
      if (g_icci_716 <= 0.0 || g_irsi_684 <= 50.0) g_datetime_848 = servertime;
      if (g_icci_732 > g_icci_724 && g_irsi_700 > g_irsi_692) g_datetime_848 = iTime(NULL, g_timeframe_256, gi_560);
      if (servertime - g_datetime_848 > 3600.0 * gd_364 && OrderProfit() < 0.0) return (TRUE);
   }
   if (gi_356) {
      if (servertime - OrderOpenTime() > 3600.0 * gd_364) {
         if (g_icci_716 < 0.0 && g_irsi_684 < 50.0 && OrderProfit() > 0.0) return (TRUE);
         if (servertime - OrderOpenTime() > 3600.0 * gd_372) return (TRUE);
      }
   }
   return (FALSE);
}

int s1_openBuy() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (g_ilow_780 > 0.0) {
      gi_796 = (Bid - g_ilow_780 + Point * gd_596) / Point;
      if (gi_268 > 0 && gi_796 > gi_268 * gd_596) gi_796 = gi_268 * gd_596;
      if (gi_796 < gi_272 * gd_596) gi_796 = gi_272 * gd_596;
   } else gi_796 = gi_272 * gd_596;
   if (gi_796 < g_stoplevel_592) gi_796 = g_stoplevel_592;
   if (Stealth) gi_792 = gi_264 * gd_596;
   else gi_792 = gi_260 * gd_596;
   if (gi_792 < g_stoplevel_592) gi_792 = g_stoplevel_592;
   ld_8 = NormalizeDouble(Bid - gi_796 * Point, Digits);
   ld_0 = NormalizeDouble(Ask + gi_792 * Point, Digits);
   return (openOrder(OP_BUY, gd_604, Ask, ld_0, ld_8, S1_Reference, gi_280, 0));
}

int s1_openSell() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (g_ihigh_772 > 0.0) {
      gi_804 = (g_ihigh_772 - Ask + Point * gd_596) / Point;
      if (gi_268 > 0 && gi_804 > gi_268 * gd_596) gi_804 = gi_268 * gd_596;
      if (gi_804 < gi_272 * gd_596) gi_804 = gi_272 * gd_596;
   } else gi_804 = gi_272 * gd_596;
   if (gi_804 < g_stoplevel_592) gi_804 = g_stoplevel_592;
   if (Stealth) gi_800 = gi_264 * gd_596;
   else gi_800 = gi_260 * gd_596;
   if (gi_800 < g_stoplevel_592) gi_800 = g_stoplevel_592;
   ld_8 = NormalizeDouble(Ask + gi_804 * Point, Digits);
   ld_0 = NormalizeDouble(Bid - gi_800 * Point, Digits);
   return (openOrder(OP_SELL, gd_604, Bid, ld_0, ld_8, S1_Reference, gi_284, 0));
}

int s1_buyControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_792 < g_stoplevel_592) gi_792 = g_stoplevel_592;
         l_ord_takeprofit_0 = NormalizeDouble(Ask + gi_792 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_796 < g_stoplevel_592) gi_796 = g_stoplevel_592;
         l_ord_stoploss_8 = NormalizeDouble(Bid - gi_796 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Green);
   }
   if (s1_closeBuyRule()) {
      li_ret_16 = closeOrder(0, Violet);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (UseForceClose)
      if (ForceClose()) return (-1);
   if (UseBreakEven)
      if (BreakEven()) return (OrderTicket());
   if (UseTimedStopLoss)
      if (TimedStoploss() == -1) return (-1);
   if (gi_276 > 0) {
      if (Bid - OrderOpenPrice() > Point * gd_596 * gi_276) {
         if (OrderStopLoss() < Bid - Point * gd_596 * gi_276 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - Point * gd_596 * gi_276, Digits), OrderTakeProfit(), 0, Green);
         }
      }
   }
   return (OrderTicket());
}

int s1_sellControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_800 < g_stoplevel_592) gi_800 = g_stoplevel_592;
         l_ord_takeprofit_0 = NormalizeDouble(Bid - gi_800 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_804 < g_stoplevel_592) gi_804 = g_stoplevel_592;
         l_ord_stoploss_8 = NormalizeDouble(Ask + gi_804 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Red);
   }
   if (s1_closeSellRule()) {
      li_ret_16 = closeOrder(1, Violet);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (UseForceClose)
      if (ForceClose()) return (-1);
   if (UseBreakEven)
      if (BreakEven()) return (OrderTicket());
   if (UseTimedStopLoss)
      if (TimedStoploss() == -1) return (-1);
   if (gi_276 > 0) {
      if (OrderOpenPrice() - Ask > Point * gd_596 * gi_276) {
         if (OrderStopLoss() > Ask + Point * gd_596 * gi_276 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + Point * gd_596 * gi_276, Digits), OrderTakeProfit(), 0, Red);
         }
      }
   }
   return (OrderTicket());
}

void s2_setRules() {
   HideTestIndicators(TRUE);
   if (gi_484 || gi_492) g_icci_856 = iCCI(NULL, g_timeframe_432, g_period_476, PRICE_TYPICAL, gi_560);
   if (gi_488) g_icci_864 = iCCI(NULL, g_timeframe_432, g_period_480, PRICE_TYPICAL, gi_560);
   g_ihigh_872 = iHigh(NULL, g_timeframe_432, iHighest(NULL, g_timeframe_432, MODE_HIGH, gi_472, 1));
   g_ilow_880 = iLow(NULL, g_timeframe_432, iLowest(NULL, g_timeframe_432, MODE_LOW, gi_472, 1));
   if (gi_528 > 0) {
      if (g_spread_584 > gi_528 * gd_596) {
         if (g_spread_588 < g_spread_584) {
            Print("Strategy2: Safe spread limit exceeded: spread = ", g_spread_584);
            if (gi_532) Print("Strategy2: Using DayDirection filter");
         }
         gi_904 = TRUE;
      } else gi_904 = FALSE;
   }
   HideTestIndicators(TRUE);
   if (gi_904) {
      gi_924 = gi_548;
      gi_928 = gi_552;
      return;
   }
   gi_924 = gi_540;
   gi_928 = gi_544;
}

int s2_openBuyRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (gi_904 && !gi_532) return (0);
   if (gi_524 || gi_904) {
      if (servertime - gi_580 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_432, gi_580 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_432, gi_580);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_432, gi_580);
         l_shift_20 = gi_560;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_432, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_432, l_shift_20);
      if (l_iclose_0 < l_iclose_8) return (0);
   }
   return (s2_Buy(Ask, Bid, g_icci_856, g_icci_864, g_ilow_880, g_ihigh_872, gi_484, gi_488));
}

int s2_openSellRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (gi_904 && !gi_532) return (0);
   if (gi_524 || gi_904) {
      if (servertime - gi_580 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_432, gi_580 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_432, gi_580);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_432, gi_580);
         l_shift_20 = gi_560;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_432, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_432, l_shift_20);
      if (l_iclose_0 > l_iclose_8) return (0);
   }
   return (s2_Sell(Ask, Bid, g_icci_856, g_icci_864, g_ilow_880, g_ihigh_872, gi_484, gi_488));
}

bool s2_closeBuyRule() {
   double l_ord_profit_0;
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_436 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_436 * Point * gd_596, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_912 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_912 * Point * gd_596, Digits)) return (TRUE);
   }
   if (gi_492) {
      if (g_ticket_932 != OrderTicket()) {
         gi_936 = 0;
         gi_940 = 0;
         g_datetime_948 = OrderOpenTime();
         g_datetime_944 = g_datetime_948;
         g_ticket_932 = OrderTicket();
         g_ord_open_price_952 = OrderOpenPrice();
      }
      l_ord_profit_0 = OrderProfit();
      if (Ask > g_ord_open_price_952) {
         gi_936 += servertime - g_datetime_944;
         g_datetime_944 = servertime;
      } else {
         gi_940 += servertime - g_datetime_944;
         g_datetime_944 = servertime;
      }
      if (servertime - g_datetime_948 > 3600.0 * gd_496) {
         if (g_icci_856 > 0.0 && l_ord_profit_0 > 0.0 && gi_936 < gi_940) return (TRUE);
         if (g_icci_856 > 100.0 && l_ord_profit_0 > 0.0) return (TRUE);
         if (servertime - g_datetime_948 > 3600.0 * gd_504 && l_ord_profit_0 > 0.0) return (TRUE);
         if (servertime - g_datetime_948 > 3600.0 * gd_512) return (TRUE);
      }
   }
   if (gi_520) return (Bid >= g_ihigh_872);
   return (Bid >= g_ihigh_888);
}

bool s2_closeSellRule() {
   double l_ord_profit_0;
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_436 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_436 * Point * gd_596, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_920 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_920 * Point * gd_596, Digits)) return (TRUE);
   }
   if (gi_492) {
      if (g_ticket_960 != OrderTicket()) {
         gi_964 = 0;
         gi_968 = 0;
         g_datetime_976 = OrderOpenTime();
         g_datetime_972 = g_datetime_976;
         g_ticket_960 = OrderTicket();
         g_ord_open_price_980 = OrderOpenPrice();
      }
      l_ord_profit_0 = OrderProfit();
      if (Bid < g_ord_open_price_980) {
         gi_964 += servertime - g_datetime_972;
         g_datetime_972 = servertime;
      } else {
         gi_968 += servertime - g_datetime_972;
         g_datetime_972 = servertime;
      }
      if (servertime - g_datetime_976 > 3600.0 * gd_496) {
         if (g_icci_856 < 0.0 && l_ord_profit_0 > 0.0 && gi_964 < gi_968) return (TRUE);
         if (g_icci_856 < -100.0 && l_ord_profit_0 > 0.0) return (TRUE);
         if (servertime - g_datetime_976 > 3600.0 * gd_504 && l_ord_profit_0 > 0.0) return (TRUE);
         if (servertime - g_datetime_976 > 3600.0 * gd_512) return (TRUE);
      }
   }
   if (gi_520) return (Ask <= g_ilow_880);
   return (Ask <= g_ilow_896);
}

int s2_openBuy() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (gd_452 > 0.0) {
      gi_912 = gd_452 * (g_ihigh_872 - g_ilow_880) / Point;
      if (gi_444 > 0 && gi_912 > gi_444 * gd_596) gi_912 = gi_444 * gd_596;
      if (gi_912 < gi_448 * gd_596) gi_912 = gi_448 * gd_596;
   } else gi_912 = gi_448 * gd_596;
   if (gi_912 < g_stoplevel_592) gi_912 = g_stoplevel_592;
   if (Stealth) gi_908 = gi_440 * gd_596;
   else gi_908 = gi_436 * gd_596;
   if (gi_908 < g_stoplevel_592) gi_908 = g_stoplevel_592;
   ld_8 = NormalizeDouble(Bid - gi_912 * Point, Digits);
   ld_0 = NormalizeDouble(Ask + gi_908 * Point, Digits);
   return (openOrder(OP_BUY, gd_604, Ask, ld_0, ld_8, S2_Reference, gi_464, 0));
}

int s2_openSell() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (gd_452 > 0.0) {
      gi_920 = gd_452 * (g_ihigh_872 - g_ilow_880) / Point;
      if (gi_444 > 0 && gi_920 > gi_444 * gd_596) gi_920 = gi_444 * gd_596;
      if (gi_920 < gi_448 * gd_596) gi_920 = gi_448 * gd_596;
   } else gi_920 = gi_448 * gd_596;
   if (gi_920 < g_stoplevel_592) gi_920 = g_stoplevel_592;
   if (Stealth) gi_916 = gi_440 * gd_596;
   else gi_916 = gi_436 * gd_596;
   if (gi_916 < g_stoplevel_592) gi_916 = g_stoplevel_592;
   ld_8 = NormalizeDouble(Ask + gi_920 * Point, Digits);
   ld_0 = NormalizeDouble(Bid - gi_916 * Point, Digits);
   return (openOrder(OP_SELL, gd_604, Bid, ld_0, ld_8, S2_Reference, gi_468, 0));
}

int s2_buyControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_908 < g_stoplevel_592) gi_908 = g_stoplevel_592;
         l_ord_takeprofit_0 = NormalizeDouble(Ask + gi_908 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_912 < g_stoplevel_592) gi_912 = g_stoplevel_592;
         l_ord_stoploss_8 = NormalizeDouble(Bid - gi_912 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Green);
   }
   if (s2_closeBuyRule()) {
      li_ret_16 = closeOrder(0, Violet);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (gi_460 > 0) {
      if (Bid - OrderOpenPrice() > Point * gd_596 * gi_460) {
         if (OrderStopLoss() < Bid - Point * gd_596 * gi_460 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - Point * gd_596 * gi_460, Digits), OrderTakeProfit(), 0, Green);
         }
      }
   }
   return (OrderTicket());
}

int s2_sellControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_916 < g_stoplevel_592) gi_916 = g_stoplevel_592;
         l_ord_takeprofit_0 = NormalizeDouble(Bid - gi_916 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_920 < g_stoplevel_592) gi_920 = g_stoplevel_592;
         l_ord_stoploss_8 = NormalizeDouble(Ask + gi_920 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Red);
   }
   if (s2_closeSellRule()) {
      li_ret_16 = closeOrder(1, Violet);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (gi_460 > 0) {
      if (OrderOpenPrice() - Ask > Point * gd_596 * gi_460) {
         if (OrderStopLoss() > Ask + Point * gd_596 * gi_460 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + Point * gd_596 * gi_460, Digits), OrderTakeProfit(), 0, Red);
         }
      }
   }
   return (OrderTicket());
}

int waitForContext() {
   for (int l_count_0 = 0; IsTradeContextBusy() && l_count_0 < 20; l_count_0++) Sleep(15);
   if (l_count_0 >= 20) Print("Trade context is busy more than ", DoubleToStr(15 * l_count_0 / 1000, 2), " seconds");
   else
      if (l_count_0 > 0) Print("Trade context was busy ", DoubleToStr(15 * l_count_0 / 1000, 2), " seconds");
   return (l_count_0);
}

int openOrder(int a_cmd_0, double a_lots_4, double a_price_12, double a_price_20, double a_price_28, int a_magic_36, color a_color_40, bool ai_44) {
   int l_error_68;
   double l_price_48 = 0;
   double l_price_56 = 0;
   if (!ai_44) {
      l_price_48 = a_price_20;
      l_price_56 = a_price_28;
   }
   waitForContext();
   int l_ticket_64 = OrderSend(Symbol(), a_cmd_0, a_lots_4, a_price_12, Slippage * gd_596, l_price_56, l_price_48, g_comment_1364, a_magic_36, 0, a_color_40);
   if (l_ticket_64 > 0) {
      if (ai_44) {
         if (OrderSelect(l_ticket_64, SELECT_BY_TICKET)) {
            waitForContext();
            OrderModify(l_ticket_64, OrderOpenPrice(), a_price_28, a_price_20, 0, a_color_40);
         }
      }
      if (SendEmails) SendMail(gs_636, "Open " + OpPrint(a_cmd_0) + ": [" + Symbol() + "] " + NormalizeDouble(a_price_12, Digits));
   } else {
      l_error_68 = GetLastError();
      if (!ai_44) return (openOrder(a_cmd_0, a_lots_4, a_price_12, a_price_20, a_price_28, a_magic_36, a_color_40, 1));
      Print(OpPrint(a_cmd_0) + " operation failed - error(", l_error_68, "): ", ErrorDescription(l_error_68));
   }
   return (l_ticket_64);
}

int closeOrder(int ai_0, color a_color_4) {
   double l_price_8;
   int l_error_20;
   for (int l_count_16 = 0; l_count_16 < 20; l_count_16++) {
      if (waitForContext() > 5) RefreshRates();
      if (ai_0 == 0) l_price_8 = Bid;
      else l_price_8 = Ask;
      if (OrderClose(OrderTicket(), OrderLots(), l_price_8, Slippage * gd_596, a_color_4)) return (-1);
      l_error_20 = GetLastError();
      Print("Order close operation failed - error(", l_error_20, "): ", ErrorDescription(l_error_20));
      RefreshRates();
   }
   Print("Order close operation failed");
   return (OrderTicket());
}

double MMLots(double ad_0, double ad_8, int &ai_16) {
   return (NormalizeLots(ad_0 * ad_8 / MarketInfo(Symbol(), MODE_MARGINREQUIRED) / (AccountLeverage() / 100.0), ai_16));
}

double NormalizeLots(double ad_0, int &ai_8) {
   double l_lotstep_20 = MarketInfo(Symbol(), MODE_LOTSTEP);
   double l_minlot_28 = MarketInfo(Symbol(), MODE_MINLOT);
   double l_maxlot_36 = MarketInfo(Symbol(), MODE_MAXLOT);
   double ld_ret_12 = MathCeil(ad_0 / l_lotstep_20) * l_lotstep_20;
   ai_8 = 0;
   if (ld_ret_12 < l_minlot_28) {
      ld_ret_12 = l_minlot_28;
      ai_8 = -1;
   }
   if (ld_ret_12 > l_maxlot_36) {
      ld_ret_12 = l_maxlot_36;
      ai_8 = 1;
   }
   return (ld_ret_12);
}

int start() {
   int li_4;
   int li_8;
   if (!gi_244 && !gi_248) return (0);
   if (Bars < 100) {
      Print("Bars less than 100");
      return (0);
   }
   if (gi_240 && !IsTesting()) gi_612 = Quantity();
   if (gi_624) {
      gi_624 = FALSE;
      li_4 = RecoverTrades();
      Print("Orders in history: ", li_4, " profit made: ", DoubleToStr(gd_988, 2));
   }
   if (gi_208 && RiskLevel > 0.0) {
      if (gi_228) while (AccountBalance() < gd_616 / (gd_220 + 1.0)) gd_616 /= (gd_220 + 1.0);
      while (AccountBalance() > gd_616) gd_616 *= (gd_220 + 1.0);
      gd_604 = MMLots(RiskLevel, gd_616 / gi_612, li_8);
   } else {
      if (RiskLevel > 0.0) {
         gd_604 = MMLots(RiskLevel, AccountFreeMargin() / gi_612, li_8);
         if (RecoveryMode) gd_604 = RecoveryLot(gd_604);
      } else gd_604 = NormalizeLots(LotSize, li_8);
   }
   double ld_12 = NormalizeDouble(MarketInfo(Symbol(), MODE_MARGINREQUIRED) * gd_604, 8);
   
   if(MaxSpread > 0){
      g_spread_588 = MaxSpread * gd_596;
   } else {
      g_spread_588 = g_spread_584;
   }
      
   Refresh(0);
   gi_1004 = NormalizeDouble(AccountFreeMargin() / gi_612, 8) < ld_12;
   gi_1016 = IsTradeTime(Symbol(), TimeYear(GMT_time), TimeMonth(GMT_time), TimeDay(GMT_time), gi_252);
   if (NFA) RefreshOrders(); //1.01
   if (gi_244) run_Strategy1();
   Refresh(1);
   gi_1004 = NormalizeDouble(AccountFreeMargin() / gi_612, 8) < ld_12;
   if (gi_248) run_Strategy2();
   if (IsTesting() && !IsVisualMode()) return (0);
   GetPos(0, gi_676, gi_672);
   gi_664 = 0;
   gi_660 = 0;
   PrintLN(gs_636, TextColor2);
   PrintSep();
   PrintResponse(gi_628);
   PrintSep();
   PrintLN(gs_644);
   PrintLN(gs_652, TextColor2, gi_664, gi_660 - 1, 5 * (StringLen(gs_644) + 1));
   PrintSep();
   PrintLN("Logic: ");
   PrintLN(my_symbol, TextColor2, gi_664, gi_660 - 1, 40);
   PrintSep();
   string ls_20 = DoubleToStr(GmtOffset, 1);
   if (!IsTesting()) ls_20 = StringConcatenate(ls_20, " (", GMPrint(gi_632), ")");
   PrintLN("ServerTime:");
   PrintLN(TimeToStr(servertime), TextColor2, gi_664, gi_660 - 1, 60);
   PrintLN("UtcTime:");
   PrintLN(TimeToStr(GMT_time), TextColor2, gi_664, gi_660 - 1, 45);
   PrintLN("GmtOffset:");
   PrintLN(ls_20, TextColor2, gi_664, gi_660 - 1, 55);
   if (OverrideTradeTimes) {
      PrintLN("Using Custom TradeTime", TextColor1);
   }
   PrintSep();
   PrintLN("Digits:");
   PrintLN(Digits, TextColor2, gi_664, gi_660 - 1, 35);
   PrintLN("Spread:");
   PrintLN(StringConcatenate(DoubleToStr(g_spread_584 / gd_596, 1), " (", g_spread_584, " pips)"), TextColor2, gi_664, gi_660 - 1, 40);
   PrintLN("Max Spread:");
   if (MaxSpread < 0) {
      PrintLN("Disabled", TextColor2, gi_664, gi_660 - 1, 60);
   } else if (MaxSpread == 0) {
      PrintLN("Defaults", TextColor2, gi_664, gi_660 - 1, 60);
   } else if (MaxSpread > 0) {
      PrintLN(StringConcatenate(g_spread_588, " pips"), TextColor2, gi_664, gi_660 -1, 60);
   }
   PrintSep();
   if (gi_240 && !IsTesting() && RiskSharingEnabled) {
      PrintLN("Nodes running:");
      PrintLN(gi_612, TextColor2, gi_664, gi_660 - 1, 75);
      PrintSep();
   }
   PrintLN("Lot:");
   PrintLN(DoubleToStr(gd_604, 2), TextColor2, gi_664, gi_660 - 1, 25);
   switch (li_8) {
   case 1:
      PrintLN("Maximum Lot size exeeded!");
      break;
   case -1:
      PrintLN("Minimum Lot size exeeded!");
   }
   if (gi_1068 != gi_1004) {
      if (gi_1004) Print("Not enough money! Available margin = ", DoubleToStr(AccountFreeMargin() / gi_612, 2), ", Required margin = ", DoubleToStr(ld_12, 2));
      gi_1068 = gi_1004;
   }
   if (gi_1004) {
      PrintSep();
      PrintLN("Not enough money!");
      PrintLN("Available margin =");
      PrintLN(DoubleToStr(AccountFreeMargin() / gi_612, 2), TextColor2, gi_664, gi_660 - 1, 90);
      PrintLN("Required margin =");
      PrintLN(DoubleToStr(ld_12, 2), TextColor2, gi_664, gi_660 - 1, 90);
   }
   PrintSep();
   if (IsTesting()) PrintLN("Backtesting");
   else PrintLN("Trading!");
   PrintSep();
   if (gi_244 && gi_380) {
      if (gi_816 == 0) PrintLN("Analyzing market");
      else PrintLN(DPrint(gi_816) + " detected");
      if (servertime <= gi_824 && gi_816 != gi_820 && gi_820 != 0) PrintLN(DPrint(gi_820) + " fading: " + TimeToStr(gi_824 - servertime, TIME_SECONDS));
   } else PrintLN(CPrint(gi_1008 || gi_1012, "Running", "Collecting Data"));
   if (NFA && g_count_1024 > 0) {  //1.01
      PrintSep();
      PrintLN("Waiting for trades to close: ");
      PrintLN(g_count_1024, TextColor2, gi_668, gi_664 - 1, 125);
   }
   if (g_ticket_1020 >= 0 || g_ticket_1024 >= 0 || g_ticket_1044 >= 0 || g_ticket_1024 >= 0) {
      PrintSep();
      if (g_ticket_1020 >= 0) PrintLN("Strategy1: Long position open");
      if (g_ticket_1024 >= 0) PrintLN("Strategy1: Short position open");
      if (g_ticket_1044 >= 0) PrintLN("Strategy2: Long position open");
      if (g_ticket_1048 >= 0) PrintLN("Strategy2: Short position open");
   }
   Deleteobjects(gi_664, gi_668);
   gi_668 = gi_664 - 1;
   ObjectsRedraw();
   return (0);
}

void run_Strategy1() {
   int l_day_of_week_8;
   gi_1008 = TRUE;
   if (g_ticket_1020 == -2) {
      g_ticket_1020 = Recover(S1_Reference, OP_BUY);
      if (g_ticket_1020 >= 0) {
         OrderSelect(g_ticket_1020, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy1: Order found:");
      }
   }
   if (g_ticket_1024 == -2) {
      g_ticket_1024 = Recover(S1_Reference, OP_SELL);
      if (g_ticket_1024 >= 0) {
         OrderSelect(g_ticket_1024, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy1: Order found:");
      }
   }
   s1_setRules();
   if ((gi_808 < gi_812 && (GMT_Hour >= gi_808 && GMT_Hour <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT_Hour >= gi_808 || GMT_Hour <= gi_812 - 1)) {
      g_comment_1364 = "s1:0";
      gi_1008 = TRUE;
   } else gi_1008 = FALSE;
   if (!gi_1008 && TradeGMT2) {
      if ((gi_808 < gi_812 && (GMT2 >= gi_808 && GMT2 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT2 >= gi_808 || GMT2 <= gi_812 - 1)) {
         g_comment_1364 = "s1:2";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT4) {
      if ((gi_808 < gi_812 && (GMT4 >= gi_808 && GMT4 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT4 >= gi_808 || GMT4 <= gi_812 - 1)) {
         g_comment_1364 = "s1:4";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT6) {
      if ((gi_808 < gi_812 && (GMT6 >= gi_808 && GMT6 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT6 >= gi_808 || GMT6 <= gi_812 - 1)) {
         g_comment_1364 = "s1:6";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT8) {
      if ((gi_808 < gi_812 && (GMT8 >= gi_808 && GMT8 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT8 >= gi_808 || GMT8 <= gi_812 - 1)) {
         g_comment_1364 = "s1:8";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT_2) {
      if ((gi_808 < gi_812 && (GMT_2 >= gi_808 && GMT_2 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT_2 >= gi_808 || GMT_2 <= gi_812 - 1)) {
         g_comment_1364 = "s1:-2";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT_4) {
      if ((gi_808 < gi_812 && (GMT_4 >= gi_808 && GMT_4 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT_4 >= gi_808 || GMT_4 <= gi_812 - 1)) {
         g_comment_1364 = "s1:-4";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT_6) {
      if ((gi_808 < gi_812 && (GMT_6 >= gi_808 && GMT_6 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT_6 >= gi_808 || GMT_6 <= gi_812 - 1)) {
         g_comment_1364 = "s1:-6";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   if (!gi_1008 && TradeGMT_8) {
      if ((gi_808 < gi_812 && (GMT_8 >= gi_808 && GMT_8 <= gi_812 - 1)) || (gi_808 >= gi_812 && GMT_8 >= gi_808 || GMT_8 <= gi_812 - 1)) {
         g_comment_1364 = "s1:-8";
         gi_1008 = TRUE;
      } else gi_1008 = FALSE;
   }
   
   if (gi_1008 && gi_412) {
      l_day_of_week_8 = TimeDayOfWeek(GMT_time);
      if (l_day_of_week_8 == 0) {
         if (!TradeSunday) gi_1008 = FALSE;
      } else {
         if (l_day_of_week_8 == 5) {
            if (!TradeFriday) gi_1008 = FALSE;
            else {
               if (!TradeNFP && TimeDay(GMT_time) < 8) gi_1008 = FALSE;
               else
                  if (GMT_Hour >= gi_808) gi_1008 = FALSE;
            }
         } else {
            if (l_day_of_week_8 == 1 && gi_808 >= gi_812 && GMT_Hour <= gi_812 - 1) {
               if (!TradeSunday) gi_1008 = FALSE;
            } else
               if (l_day_of_week_8 > 5) gi_1008 = FALSE;
         }
      }
   }
   if (g_ticket_1020 >= 0) {
      if (OrderSelect(g_ticket_1020, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_1020 = s1_buyControl();
         else g_ticket_1020 = -1;
         g_ord_profit_1028 = OrderProfit();
         if (g_ticket_1020 < 0) CountBalance(g_ord_profit_1028);
      } else {
         g_ticket_1020 = -2;
         g_ord_profit_1028 = 0;
      }
   }
   if (g_ticket_1024 >= 0) {
      if (OrderSelect(g_ticket_1024, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_1024 = s1_sellControl();
         else g_ticket_1024 = -1;
         g_ord_profit_1036 = OrderProfit();
         if (g_ticket_1024 < 0) CountBalance(g_ord_profit_1036);
      } else {
         g_ticket_1024 = -2;
         g_ord_profit_1036 = 0;
      }
   }
   int li_0 = s1_openBuyRule();
   int li_4 = s1_openSellRule();
   if (!gi_1008 || !gi_1016 || gi_1004) return;
   if (NFA && !FIFOrule()) return; //1.01
   if (g_datetime_1076 != iTime(NULL, g_timeframe_256, gi_560) && li_0 && g_ticket_1020 < 0) {
      g_ticket_1020 = s1_openBuy();
      if (g_ticket_1020 < 0) return;
      g_datetime_1076 = iTime(NULL, g_timeframe_256, gi_560);
      if (gi_348) {
         gi_764 = FALSE;
         gi_768 = TRUE;
      }
      gi_680++;
      return;
   }
   if (g_datetime_1080 != iTime(NULL, g_timeframe_256, gi_560) && li_4 && g_ticket_1024 < 0) {
      g_ticket_1024 = s1_openSell();
      if (g_ticket_1024 >= 0) {
         g_datetime_1080 = iTime(NULL, g_timeframe_256, gi_560);
         if (gi_348) {
            gi_764 = TRUE;
            gi_768 = FALSE;
         }
         gi_680++;
      }
   }
}

void run_Strategy2() {
   int l_day_of_week_8;
   gi_1012 = TRUE;
   if (g_ticket_1044 == -2) {
      g_ticket_1044 = Recover(S2_Reference, OP_BUY);
      if (g_ticket_1044 >= 0) {
         OrderSelect(g_ticket_1044, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy2: Order found:");
      }
   }
   if (g_ticket_1048 == -2) {
      g_ticket_1048 = Recover(S2_Reference, OP_SELL);
      if (g_ticket_1048 >= 0) {
         OrderSelect(g_ticket_1048, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy2: Order found:");
      }
   }
   s2_setRules();
   if ((gi_924 < gi_928 && (GMT_Hour >= gi_924 && GMT_Hour <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT_Hour >= gi_924 || GMT_Hour <= gi_928 - 1)) {
      g_comment_1364 = "s2:0";
      gi_1012 = TRUE;
   } else gi_1012 = FALSE;
   if (!gi_1012 && TradeGMT2) {
      if ((gi_924 < gi_928 && (GMT2 >= gi_924 && GMT2 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT2 >= gi_924 || GMT2 <= gi_928 - 1)) {
         g_comment_1364 = "s2:2";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT4) {
      if ((gi_924 < gi_928 && (GMT4 >= gi_924 && GMT4 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT4 >= gi_924 || GMT4 <= gi_928 - 1)) {
         g_comment_1364 = "s2:4";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT6) {
      if ((gi_924 < gi_928 && (GMT6 >= gi_924 && GMT6 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT6 >= gi_924 || GMT6 <= gi_928 - 1)) {
         g_comment_1364 = "s2:6";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT8) {
      if ((gi_924 < gi_928 && (GMT8 >= gi_924 && GMT8 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT8 >= gi_924 || GMT8 <= gi_928 - 1)) {
         g_comment_1364 = "s2:8";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT_2) {
      if ((gi_924 < gi_928 && (GMT_2 >= gi_924 && GMT_2 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT_2 >= gi_924 || GMT_2 <= gi_928 - 1)) {
         g_comment_1364 = "s2:-2";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT_4) {
      if ((gi_924 < gi_928 && (GMT_4 >= gi_924 && GMT_4 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT_4 >= gi_924 || GMT_4 <= gi_928 - 1)) {
         g_comment_1364 = "s2:-4";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT_6) {
      if ((gi_924 < gi_928 && (GMT_6 >= gi_924 && GMT_6 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT_6 >= gi_924 || GMT_6 <= gi_928 - 1)) {
         g_comment_1364 = "s2:-6";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (!gi_1012 && TradeGMT_8) {
      if ((gi_924 < gi_928 && (GMT_8 >= gi_924 && GMT_8 <= gi_928 - 1)) || (gi_924 >= gi_928 && GMT_8 >= gi_924 || GMT_8 <= gi_928 - 1)) {
         g_comment_1364 = "s2:-8";
         gi_1012 = TRUE;
      } else gi_1012 = FALSE;
   }
   if (gi_1012 && gi_536) {
      l_day_of_week_8 = TimeDayOfWeek(GMT_time);
      if (l_day_of_week_8 == 0) {
         if (!TradeSunday) gi_1012 = FALSE;
      } else {
         if (l_day_of_week_8 == 5) {
            if (!TradeFriday) gi_1012 = FALSE;
            else {
               if (!TradeNFP && TimeDay(GMT_time) < 8) gi_1012 = FALSE;
               else
                  if (GMT_Hour >= gi_924) gi_1012 = FALSE;
            }
         } else {
            if (l_day_of_week_8 == 1 && gi_924 >= gi_928 && GMT_Hour <= gi_928 - 1) {
               if (!TradeSunday) gi_1012 = FALSE;
            } else
               if (l_day_of_week_8 > 5) gi_1012 = FALSE;
         }
      }
   }
   if (gi_1084 != gi_1012) {
      if (gi_1012) {
         g_ord_profit_1052 = 0;
         g_ord_profit_1060 = 0;
      }
   }
   gi_1084 = gi_1012;
   if (g_ticket_1044 >= 0) {
      if (OrderSelect(g_ticket_1044, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_1044 = s2_buyControl();
         else g_ticket_1044 = -1;
         g_ord_profit_1052 = OrderProfit();
         if (g_ticket_1044 < 0) CountBalance(g_ord_profit_1052);
      } else {
         g_ticket_1044 = -2;
         g_ord_profit_1052 = 0;
      }
   }
   if (g_ticket_1048 >= 0) {
      if (OrderSelect(g_ticket_1048, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_1048 = s2_sellControl();
         else g_ticket_1048 = -1;
         g_ord_profit_1060 = OrderProfit();
         if (g_ticket_1048 < 0) CountBalance(g_ord_profit_1060);
      } else {
         g_ticket_1048 = -2;
         g_ord_profit_1060 = 0;
      }
   }
   int li_0 = s2_openBuyRule();
   int li_4 = s2_openSellRule();
   if (!gi_1012 || !gi_1016 || gi_1004) return;
   if (NFA && !FIFOrule()) return;
   if (g_datetime_1088 != iTime(NULL, g_timeframe_432, gi_560) && li_0 && g_ticket_1044 < 0 && g_ord_profit_1052 >= 0.0) {
      g_ticket_1044 = s2_openBuy();
      if (g_ticket_1044 < 0) return;
      g_datetime_1088 = iTime(NULL, g_timeframe_432, gi_560);
      g_ihigh_888 = g_ihigh_872;
      g_ilow_896 = g_ilow_880;
      g_ord_profit_1060 = 0;
      gi_852++;
      return;
   }
   if (g_datetime_1092 != iTime(NULL, g_timeframe_432, gi_560) && li_4 && g_ticket_1048 < 0 && g_ord_profit_1060 >= 0.0) {
      g_ticket_1048 = s2_openSell();
      if (g_ticket_1048 >= 0) {
         g_datetime_1092 = iTime(NULL, g_timeframe_432, gi_560);
         g_ihigh_888 = g_ihigh_872;
         g_ilow_896 = g_ilow_880;
         g_ord_profit_1052 = 0;
         gi_852++;
      }
   }
}

void CountBalance(double ad_0) {
   gd_988 += ad_0;
   if (gd_996 < gd_988) gd_996 = gd_988;
}

double RecoveryLot(double ad_0) {
   int li_8;
   if (gd_996 > gd_988) return (NormalizeLots(2.0 * ad_0, li_8));
   return (ad_0);
}

int RecoverTrades() {
   int l_count_0 = 0;
   for (int l_pos_4 = OrdersHistoryTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      if (OrderSelect(l_pos_4, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderMagicNumber() != S1_Reference && OrderMagicNumber() != S2_Reference) continue;
         if (OrderSymbol() != Symbol()) continue; // bugfix: ensure recovery on same symbol with same magic no.;
         CountBalance(OrderProfit());
         l_count_0++;
      }
   }
   return (l_count_0);
}

int Recover(int a_magic_0, int a_cmd_4) {
   for (int l_pos_8 = OrdersTotal() - 1; l_pos_8 >= 0; l_pos_8--) {
      if (OrderSelect(l_pos_8, SELECT_BY_POS)) {
         if (OrderMagicNumber() == a_magic_0) {
            if (OrderSymbol() == Symbol())
               if (OrderType() == a_cmd_4) return (OrderTicket());
         }
      }
   }
   return (-1);
}

void RefreshOrders() { //1.01
   g_count_1024 = 0;
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      if (OrderSelect(l_pos_0, SELECT_BY_POS)) {
         if (OrderSymbol() == Symbol())
            if (OrderMagicNumber() != S1_Reference && OrderMagicNumber() != S2_Reference) g_count_1024++;
      }
   }
}

bool FIFOrule() { //1.01
   return (g_count_1024 <= 0 && g_ticket_1020 < 0 && g_ticket_1024 < 0 && g_ticket_1044 < 0 && g_ticket_1048 < 0);
}

void Refresh(bool ai_0) {
   double lda_4[1];
   if (ai_0) RefreshRates();
   servertime = TimeCurrent();
   if (!IsTesting() && AutoServerGmtOffset || AutoLocalGmtOffset) {
      gi_632 = 4; //bbr;
      if (gi_632 == 4 && !AutoLocalGmtOffset) gi_632 = 0; //manual
      else GmtOffset = GetGmtOffset();
   }
   GMT_time = servertime - 3600.0 * GmtOffset;
   GMT_Hour = TimeHour(GMT_time);
   
   GMT2 = TimeHour(GMT_time + 7200);  // mods for advanced droid tactics
   GMT4 = TimeHour(GMT_time + 14400);
   GMT6 = TimeHour(GMT_time + 21600);
   GMT8 = TimeHour(GMT_time + 28800);
   GMT_2 = TimeHour(GMT_time - 7200);
   GMT_4 = TimeHour(GMT_time - 14400);
   GMT_6 = TimeHour(GMT_time - 21600);
   GMT_8 = TimeHour(GMT_time - 28800);
   
   gi_580 = servertime - 3600.0 * GMT_Hour - 60 * TimeMinute(GMT_time) - TimeSeconds(GMT_time);
   g_spread_584 = MarketInfo(Symbol(), MODE_SPREAD);

   if (MaxSpread < 0) g_spread_588 = g_spread_584; // no max spread edit

   g_stoplevel_592 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   gd_596 = 0.0001 / Point;
   if (Digits < 4) gd_596 = 100.0 * gd_596;
}

string BPrint(bool ai_0) {
   if (ai_0) return ("True");
   return ("False");
}

string CPrint(bool ai_0, string as_4, string as_12 = "") {
   if (ai_0) return (as_4);
   return (as_12);
}

string OpPrint(int ai_0) {
   switch (ai_0) {
   case 0:
      return ("Buy");
   case 1:
      return ("Sell");
   }
   return ("Order");
}

string GMPrint(int ai_0) {
   switch (ai_0) {
   case 1:
      return ("automatic: server 1");
   case 2:
      return ("automatic: server 2");
   case 4:
      return ("automatic: local");
   }
   return ("manual");
}

string DPrint(int ai_0) {
   switch (ai_0) {
   case 1:
      return ("Correction");
   case 3:
      return ("Upward Impulse");
   case 2:
      return ("Downward Impulse");
   }
   return ("");
}

string PPrint(int ai_0) {
   int li_4 = MathMod(ai_0, 5);
   return (gsa_1096[li_4]);
}

void PrintResponse(int ai_0, int ai_4 = -1, int ai_8 = -1) {
   if (ai_4 == -1) ai_4 = gi_664;
   if (ai_8 == -1) ai_8 = gi_660;
   gi_664 = ai_4;
   gi_660 = ai_8;
   if (ai_0 & 16384 > 0) PrintLN("OK ! All Systems GO !!  \(^_^)/", TextColor1);
   else PrintLN("Authentication failed - error(" + ai_0 + ")", TextColor1);
   if (ai_0 & 512 > 0) PrintLN("Attention: Upgrade available", TextColor1);
   if (ai_0 & 1024 > 0) PrintLN("Error: Upgrade required", TextColor1);
   if (ai_0 & 1 > 0) PrintLN("Error: WinINet initialisation failed", TextColor1);
   if (ai_0 & 2 > 0) PrintLN("Error: WinINet connection failed", TextColor1);
   if (ai_0 & 4 > 0) PrintLN("Error: Invalid account number", TextColor1);
   if (ai_0 & 8 > 0) PrintLN("Error: Invalid account status", TextColor1);
   if (ai_0 & 16 > 0) PrintLN("Error: Dll and Expert versions mismatch", TextColor1);
   if (ai_0 & 128 > 0) PrintLN("Error: Unable to retrieve authentication code", TextColor1);
   if (ai_0 & 256 > 0) PrintLN("Error: Server response failure", TextColor1);
   if (ai_0 & 2048 > 0) PrintLN("Error: Invalid authorisation details", TextColor1);
   if (ai_0 & 4096 > 0) PrintLN("Error: Authorisation declined", TextColor1);
}

string GetObjName(int ai_0) {
   return (StringConcatenate("MegaDroidPro", " lb: ", ai_0));
}

void GetPos(int ai_0, int &ai_4, int &ai_8) {
   string l_name_12 = GetObjName(ai_0);
   if (ObjectFind(l_name_12) == 0) {
      ai_4 = ObjectGet(l_name_12, OBJPROP_XDISTANCE);
      ai_8 = ObjectGet(l_name_12, OBJPROP_YDISTANCE);
   }
}

void PrintLN(string a_text_0, color a_color_8 = -1, int ai_12 = -1, double ad_16 = -1.0, int ai_24 = 0) {
   if (a_color_8 == CLR_NONE) a_color_8 = TextColor1;
   if (ai_12 == -1) ai_12 = gi_664;
   if (ad_16 == -1.0) ad_16 = gi_660;
   string l_name_28 = GetObjName(ai_12);
   if (ObjectFind(l_name_28) != 0) {
      ObjectCreate(l_name_28, OBJ_LABEL, 0, 0, 0);
      ObjectSet(l_name_28, OBJPROP_CORNER, 0);
   }
   ObjectSetText(l_name_28, a_text_0, 8, "Tahoma", a_color_8);
   ObjectSet(l_name_28, OBJPROP_XDISTANCE, gi_676 + ai_24);
   ObjectSet(l_name_28, OBJPROP_YDISTANCE, gi_672 + 14.0 * ad_16);
   if (gi_660 < ad_16 + 1.0) gi_660 = ad_16 + 1.0;
   if (gi_664 < ai_12 + 1) gi_664 = ai_12 + 1;
   if (gi_668 < ai_12) gi_668 = ai_12;
}

void PrintSep(int ai_0 = -1, double ad_4 = -1.0, int ai_12 = 0) {
   if (ai_0 == -1) ai_0 = gi_664;
   if (ad_4 == -1.0) ad_4 = gi_660;
   PrintLN("_______", TextColor2, ai_0, ad_4 - 0.3, ai_12);
   if (gi_660 < ad_4 + 1.0) gi_660 = ad_4 + 1.0;
}

void Deleteobjects(int ai_0, int ai_4) {
   for (int li_8 = ai_0; li_8 <= ai_4; li_8++) ObjectDelete(GetObjName(li_8));
}

bool s1_Buy(double ask, double icci1, double irsi1, double irsi2, double ima1, double gd284, double gd300, double minpips, bool useIMA, bool useRSI)
{
   if (icci1 < 0)
   {
      if ( useIMA )
         if (ima1 - ask < minpips) return(0);

      if ( gd284 > irsi1 ) return(1);
   
      if ( useRSI )
         if (gd300 > irsi2  && irsi1 < 50 ) return(1);
   }
   return (0);
}

bool s1_Sell(double bid, double icci1, double irsi1, double irsi2, double ima1, double gd276, double gd292, double minpip, bool useIMA, bool useRSI)
{
   if (icci1 > 0)
   {
      if ( useIMA )
         if (bid - ima1 < minpip ) return(0);
      
      if ( gd276 < irsi1 ) return(1);
      
      if (useRSI)
         if (gd292 < irsi2  && irsi1 > 50 ) return(1);
   }
   return(0);
}

bool s2_Buy(double ask, double bid, double icci1, double icci2, double ilow, double ihigh, bool useICI1, bool useICI2)
{
   if (ilow < ask ) return(0);
   
   if (useICI1)
      if (icci1 >= 0) return(0);
      
   if (useICI2)
      if (icci2 < icci1) return(0);

   if (ihigh - ilow > ask - bid) return(1);
      
   return(0);
}

bool s2_Sell(double ask, double bid, double icci1, double icci2, double ilow, double ihigh, bool useICI1, bool useICI2)
{
   if (ihigh > bid) return(0);
   
   if (useICI1)
      if (icci1 <= 0) return(0);
   
   if (useICI2)
      if (icci2 > icci1) return(0);

   if (ihigh - ilow > ask - bid) return(1);

   return(0);
}

void Increment()
{
   int PID = GetCurrentProcessId();
   int GPID = GlobalVariableGet("MegaDroid_GVP_PID");
   if (PID != GPID) {
      GlobalVariableSet("MegaDroid_GVP_PID", PID);
      GlobalVariableDel("MegaDroid_GVP_Quantity");
   }
   Gcount = GlobalVariableGet("MegaDroid_GVP_Quantity");
   Gcount++;
   GlobalVariableSet("MegaDroid_GVP_Quantity", Gcount);
}

void Decrement()
{
   int PID = GetCurrentProcessId();
   int GPID = GlobalVariableGet("MegaDroid_GVP_PID");
   if (PID != GPID) {
      GlobalVariableSet("MegaDroid_GVP_PID", PID);
      GlobalVariableDel("MegaDroid_GVP_Quantity");
   }
   Gcount = GlobalVariableGet("MegaDroid_GVP_Quantity");
   Gcount--;
   if (Gcount < 0) Gcount = 0;
   GlobalVariableSet("MegaDroid_GVP_Quantity", Gcount);
}

int Quantity()
{
   if(RiskSharingEnabled){
      int PID = GetCurrentProcessId();
      int GPID = GlobalVariableGet("MegaDroid_GVP_PID");
      if (PID != GPID) {
         GlobalVariableSet("MegaDroid_GVP_PID", PID);
         GlobalVariableDel("MegaDroid_GVP_Quantity");
      }
      Gcount = GlobalVariableGet("MegaDroid_GVP_Quantity");
      GlobalVariableSet("MegaDroid_GVP_Quantity", Gcount);
   }else{
      Gcount=1;
   }
   return(Gcount);
}

bool IsTradeTime(string symb, int year1, int month1, int day1, int ofs)
{   
   if (!TradeMonthEnd) {
      if (day1 > 31 - ofs) return(false);
   }
   return(true);
}

double TimeZoneLocal()
{
   int temp[43];
   switch (GetTimeZoneInformation(temp))
   {
      case 0: return (temp[0] / (-60.0));
      case 1: return (temp[0] / (-60.0));
      case 2: return ((temp[0] + temp[42]) / (-60.0));
   }
   return (0);
}

double TimeZoneServer()
{
int li_0 = (TimeCurrent() - TimeLocal()) / 60;
int li_4 = MathRound(li_0 / 30.0);
li_0 = 30 * li_4;
double dCurBrokerGMTOffset = TimeZoneLocal() + li_0 / 60.0;
return (dCurBrokerGMTOffset);
}

double GetGmtOffset()
{
   return(TimeZoneServer());
}

//mod routines

bool BreakEven() {
   bool l_bool_0 = FALSE;
   if (OrderType() == OP_BUY) {
      if (Bid >= OrderOpenPrice() + gd_596 * Point * SetBreakEvenAt && OrderStopLoss() < OrderOpenPrice()) {
         waitForContext();
         l_bool_0 = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() + BreakEvenShift * gd_596 * Point, Digits), OrderTakeProfit(), 0, Blue);
         if (l_bool_0) Print("MD Mod set breakeven on ticket# ", OrderTicket());
         else Print("MD Mod: error setting breakeven on ticket#", OrderTicket(), ". ", ErrorDescription(GetLastError()));
      }
   }
   if (OrderType() == OP_SELL) {
      if (Ask <= OrderOpenPrice() - gd_596 * Point * SetBreakEvenAt && OrderStopLoss() > OrderOpenPrice() || OrderStopLoss() == 0.0) {
         waitForContext();
         l_bool_0 = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() - BreakEvenShift * gd_596 * Point, Digits), OrderTakeProfit(), 0, CLR_NONE);
         if (l_bool_0) Print("MD Mod set breakeven on ticket# ", OrderTicket());
         else Print("MD Mod: error setting breakeven on ticket#", OrderTicket(), ". ", ErrorDescription(GetLastError()));
      }
   }
   if (l_bool_0) OrderSelect(OrderTicket(), SELECT_BY_TICKET);
   return (l_bool_0);
}

int TimedStoploss() {
   double ld_8;
   bool l_bool_0 = FALSE;
   int li_4 = 60 * (TimeCurrent() - OrderOpenTime());
   if (li_4 >= OrderOpenedMinute4 && OrderOpenedMinute4 != 0) ld_8 = StopLossPips4;
   else {
      if (li_4 >= OrderOpenedMinute3 && OrderOpenedMinute3 != 0) ld_8 = StopLossPips3;
      else {
         if (li_4 >= OrderOpenedMinute2 && OrderOpenedMinute2 != 0) ld_8 = StopLossPips2;
         else {
            if (li_4 >= OrderOpenedMinute1 && OrderOpenedMinute1 != 0) ld_8 = StopLossPips1;
            else return (0);
         }
      }
   }
   if (OrderType() == OP_BUY) {
      if (Bid <= OrderOpenPrice() - ld_8 * gd_596 * Point) {
         if (closeOrder(0, Violet) == -1) {
            Print("MD Mod: ticket#", OrderTicket(), " stopped out @ ", li_4, " minutes");
            return (-1);
         }
         Print("MD Mod: error closing stopped out order#", OrderTicket());
      }
      if (!Stealth && OrderStopLoss() < OrderOpenPrice() - ld_8 * gd_596 * Point) {
         waitForContext();
         l_bool_0 = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() - ld_8 * gd_596 * Point, Digits), OrderTakeProfit(), 0, Red);
         if (l_bool_0) Print("MD Mod stoploss set on ticket# ", OrderTicket(), " @ ", li_4, " minutes");
         else Print("MD Mod: error setting stoploss on ticket#", OrderTicket(), ". ", ErrorDescription(GetLastError()));
      }
   }
   if (OrderType() == OP_SELL) {
      if (Ask >= OrderOpenPrice() + ld_8 * gd_596 * Point) {
         if (closeOrder(1, Violet) == -1) {
            Print("MD Mod: ticket#", OrderTicket(), " stopped out @ ", li_4, " minutes");
            return (-1);
         }
         Print("MD Mod: error closing stopped out order#", OrderTicket());
      }
      if (!Stealth && OrderStopLoss() > OrderOpenPrice() - gd_596 * Point * ld_8 || OrderStopLoss() == 0.0) {
         waitForContext();
         l_bool_0 = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() - gd_596 * Point * ld_8, Digits), OrderTakeProfit(), 0, Red);
         if (l_bool_0) Print("MD Mod stoploss set on ticket# ", OrderTicket(), " @ ", li_4, " minutes");
         else Print("MD Mod: error setting stoploss on ticket#", OrderTicket(), ". ", ErrorDescription(GetLastError()));
      }
   }
   OrderSelect(OrderTicket(), SELECT_BY_TICKET);
   return (OrderTicket());
}

bool ForceClose() {
   if (GMT_Hour == ForceCloseOnGmtHour) {
      if (TimeHour(OrderOpenTime()) != Hour() || (TimeHour(OrderOpenTime()) == Hour() && TimeDay(OrderOpenTime()) != Day())) {
         if (closeOrder(OrderType(), Violet) == -1) {
            Print("MD Mod: order closed at ", TimeToStr(GMT_time), " GMT");
            return (TRUE);
         }
      }
   }
   return (FALSE);
}