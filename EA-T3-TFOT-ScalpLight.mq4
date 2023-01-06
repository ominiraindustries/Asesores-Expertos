//+------------------------------------------------------------------+
//|                     TF0T-ScalpLight v0.1                         |
//|                        Copyright 2022                            |
//|          VERSION EDUCATIVA - NO USAR CON DINERO REAL             |
//+------------------------------------------------------------------+
#property copyright "David Martinez"
#property strict

//---- input parameters
extern string       txt0 = "--------- Gestion De Riesgo ---------";
extern int          StopLoss = 150;
extern int          TakeProfit = 23;
extern double       lots = 0.8;
extern double       MaxSPREAD = 50;

extern string       txt1 = "------- Parametros Indicadores ------";
extern int          SMMAPeriod = 60;
extern int          SMMADistance = 20;
extern int          WPRPeriod = 18;

extern string       txt2 = "---Parametros Niveles Indicadores ---";
extern int          WPRAllLevel = 6;
extern int          WPRTopLevel = 10;
extern int          WPRBottomLevel = 13;
extern int          CloseDistance = -5;
extern string       txt3 = "---------- Hora De Entrada ----------";
extern int          OHour = 21;

extern string       txt4 = "----- Magic Number y Comentario -----";
extern int          MagicNumber = 1304079;
extern string       comment = "EA-T3-TFOT-ScapLight";


///////////////////////////////////////////

datetime prevtime = 0;
double   closem15;
double   smmam15;
double   wprm15;
int      brokerstoplevel = 0;
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
   if(Time[0] == prevtime)
      return(0);
   prevtime = Time[0];

   brokerstoplevel = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if(TakeProfit < brokerstoplevel * Point)
      TakeProfit = brokerstoplevel * Point;
   if(StopLoss < brokerstoplevel * Point)
      StopLoss = brokerstoplevel * Point;

   if(Ask - Bid > MaxSPREAD)
     {
      Comment("\n SPREAD IS TOO HIGH ...");
      Print("SPREAD IS TOO HIGH ...");
      return(0);
     }

   int orders = 0;
   if(! IsTradeAllowed())
     {
      again();
      return(0);
     }



//----

   for(int i=OrdersTotal()-1; i >=0; i--)
     {
      int xx = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
        {
         wprm15 = iWPR(NULL, PERIOD_M15, WPRPeriod, 1);
         OrderSelect(i,SELECT_BY_POS, MODE_TRADES);
         orders++;
         if(OrderType() == OP_BUY)
            if(wprm15 > (-WPRBottomLevel) && Bid > NormalizeDouble(closem15 + CloseDistance * Point, Digits))
              {
               RefreshRates();
               OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), 0, Violet);
              }

            else
               if(OrderType() == OP_SELL)
                  if(wprm15 < WPRBottomLevel + (-100) && Ask < NormalizeDouble(closem15 - CloseDistance * Point, Digits))
                    {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), 0, Violet);
                    }

         return(0);
        }
     }

   if(OHour != Hour())
      return(0);



   int ticket = -1;

   if(orders <= 0)
     {
      wprm15 = iWPR(NULL, PERIOD_M15, WPRPeriod, 1);
      closem15 = iClose(NULL, PERIOD_M15, 1);
      smmam15 = iMA(NULL, PERIOD_M15, SMMAPeriod, 0, MODE_SMMA, PRICE_CLOSE, 1);
      if(Signal()  > 0)
        {
         RefreshRates();
         ticket = OrderSend(Symbol(), OP_BUY, lots, Ask, 30, 0, 0, comment, MagicNumber, 0, Blue);
         if(ticket < 0)
           {
            again();
           }
         else
           {
            RefreshRates();
            OrderModify(ticket,OrderOpenPrice(),Bid - NormalizeDouble(StopLoss * Point, Digits), Bid + NormalizeDouble(TakeProfit * Point, Digits), 0, Green);
           }
        }
      else
         if(Signal()  < 0)
           {
            RefreshRates();
            ticket = OrderSend(Symbol(), OP_SELL, lots, Bid, 30, 0, 0, comment, MagicNumber, 0, Red);
            if(ticket < 0)
              {
               again();
              }
            else
              {
               RefreshRates();
               OrderModify(ticket,OrderOpenPrice(), Ask + NormalizeDouble(StopLoss * Point, Digits), Ask - NormalizeDouble(TakeProfit * Point, Digits), 0, Red);
              }
           }
     }
//-- Exit --
   return(0);
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Signal()
  {

   if((closem15 > smmam15 + SMMADistance*Point && wprm15 < WPRTopLevel + (-100) && Bid < closem15 - CloseDistance*Point) || (wprm15 < WPRAllLevel + (-100) && Bid < closem15 - CloseDistance * Point))   //(wprm15 < WPRAllLevel + (-100) && Bid < closem15 - CloseDistance * pipvalue)
      //if(wprm15 < WPRTopLevel + (-100))
      //if(Bid < closem15 - CloseDistance*Point)
      return(1);

   if((closem15 < smmam15 - SMMADistance*Point && wprm15 > (-WPRTopLevel) && Ask > closem15 + CloseDistance*Point) || (wprm15 > (-WPRAllLevel) && Bid > closem15 + CloseDistance * Point))
      //if(wprm15 > (-WPRTopLevel))
      //if(Ask > closem15 + CloseDistance*Point)
      return(-1);

   return(0);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void again()
  {
   prevtime = Time[1];
   Sleep(10000);
  }



//+------------------------------------------------------------------+
