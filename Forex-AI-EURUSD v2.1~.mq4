/*
   G e n e r a t e d  by ex4-to-mq4 decompiler FREEWARE 4.0.509.5
   Website:  h t T p : / /W w W .m e TAqUo T Es. Net
   E-mail : Su ppO rt @ M e Ta qUO TeS .n ET
*/
#property copyright "Copyright © 2008, Gary White"
#property link      "http://www.forex-ai.com"

extern string ModeHelp = "A-Auto, F-Fixed Lot";
extern string Mode = "A";
extern double Lots = 0.1;
extern int LotsMarginForOne = 2000;
extern int LotsDeltaMargin = 2000;
extern int alpha = 114;
extern int beta = 132;
extern int gamma = 156;
extern int delta = 199;
extern string alt_symbol = "CL_CONT";
extern int alt_alpha = 200;
extern int alt_beta = 42;
extern int alt_gamma = 81;
extern int alt_delta = 160;
extern double StopLoss = 90.0;
extern bool ClosePositionsOnly = FALSE;
string Gs_eurusd_160 = "EURUSD";
string Gs_forex_ai_168 = "Forex-Ai";
string Gs_176 = "";
int G_magic_184 = 541;
datetime G_time_188 = 0;
int Gi_unused_192 = 3;
double G_point_196;

int init() {
   if (Point == 0.00001) G_point_196 = 0.0001;
   else {
      if (Point == 0.001) G_point_196 = 0.01;
      else G_point_196 = Point;
   }
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   int ticket_24;
   string Ls_0 = "2009.02.28";
   int str2time_8 = StrToTime(Ls_0);
   if (TimeCurrent() >= str2time_8) {
      Comment("The trial version has been expired! If you have purchased the licensed copy, email: support@forex-ai.com");
      return (0);
   }
   if (Symbol() != Gs_eurusd_160) {
      Comment("This Expert will only work on the EURUSD currency pair");
      return (0);
   }
   if (Period() != PERIOD_H4) {
      Comment("This Expert will only work on the H4 chart, please switch back to H4 otherwise it will not execute the trades properly!!!");
      return (0);
   }
   if (Gs_forex_ai_168 != "Forex-Ai") {
      Comment("Wrong password!");
      return (0);
   }
   if (!AccountNumber() == 279750 || AccountNumber() == 393368) {
   }
   if (ClosePositionsOnly == FALSE) Gs_176 = "The system will trade " + DoubleToStr(GetLotSize(), 2) + " lots.";
   else Gs_176 = "The system will only focus on closing existing positions";
   Gs_176 = Gs_176 + " F:" + Fperceptron();
   Gs_176 = Gs_176 + " A:" + Cperceptron();
   Comment(Gs_176);
   if (Time[0] == G_time_188) return (0);
   G_time_188 = Time[0];
   if (IsTradeAllowed()) {
      RefreshRates();
      Gi_unused_192 = MarketInfo(Gs_eurusd_160, MODE_SPREAD);
   } else {
      G_time_188 = Time[1];
      return (0);
   }
   int ticket_12 = -1;
   int order_total_16 = OrdersTotal();
   for (int pos_20 = 0; pos_20 < order_total_16; pos_20++) {
      OrderSelect(pos_20, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Gs_eurusd_160 && OrderMagicNumber() == G_magic_184) {
         ticket_24 = OrderTicket();
         if (OrderType() == OP_BUY) {
            if (Fperceptron() < 0.0 && Cperceptron() < 0.0) {
               Lots = GetLotSize();
               if (ClosePositionsOnly) {
                  Comment("Closing existing position " + DoubleToStr(Lots, 2) + " lot");
                  OrderClose(ticket_24, Lots, 0, 3, Yellow);
                  Sleep(30000);
               } else {
                  ticket_12 = OrderSend(Symbol(), OP_SELL, 2.0 * Lots, Bid, 3, Ask + StopLoss * G_point_196, 0, "AI", G_magic_184, 0, Red);
                  OrderModify(ticket_12, OrderOpenPrice(), 0, 0, 0, Yellow);
                  Sleep(30000);
                  if (ticket_12 < 0) G_time_188 = Time[1];
                  else OrderCloseBy(ticket_12, ticket_24, Brown);
               }
            } else {
               if (OrderStopLoss() < Bid - StopLoss * G_point_196) {
                  if (!OrderModify(OrderTicket(), OrderOpenPrice(), Bid - StopLoss * G_point_196, 0, 0, Red)) {
                     Sleep(30000);
                     G_time_188 = Time[1];
                  }
               }
            }
         } else {
            if (Fperceptron() > 0.0 && Cperceptron() > 0.0) {
               Lots = GetLotSize();
               if (ClosePositionsOnly) {
                  Comment("Closing existing position " + DoubleToStr(Lots, 2) + " lot");
                  OrderClose(ticket_24, Lots, 0, 3, Yellow);
                  Sleep(30000);
               } else {
                  ticket_12 = OrderSend(Symbol(), OP_BUY, 2.0 * Lots, Ask, 3, 0, 0, "AI", G_magic_184, 0, Blue);
                  OrderModify(ticket_12, OrderOpenPrice(), Bid - StopLoss * G_point_196, 0, 0, Yellow);
                  Sleep(30000);
                  if (ticket_12 < 0) G_time_188 = Time[1];
                  else OrderCloseBy(ticket_12, ticket_24, Black);
               }
            } else {
               if (OrderStopLoss() > Ask + StopLoss * G_point_196) {
                  if (!OrderModify(OrderTicket(), OrderOpenPrice(), Ask + StopLoss * G_point_196, 0, 0, Blue)) {
                     Sleep(30000);
                     G_time_188 = Time[1];
                  }
               }
            }
         }
         return (0);
      }
   }
   if (!ClosePositionsOnly) {
      if (Fperceptron() > 0.0 && Cperceptron() > 0.0) {
         Lots = GetLotSize();
         Comment(Lots + " buy order about to be sent");
         ticket_12 = OrderSend(Symbol(), OP_BUY, Lots, Ask, 3, 0, 0, "AI", G_magic_184, 0, Green);
         Comment("OrderSend failed with error #", GetLastError() + " Bid: " + Bid + " S/L: " + ((Bid - StopLoss * G_point_196)));
         if (ticket_12 < 0) {
            Sleep(10000);
            G_time_188 = Time[1];
         } else OrderModify(ticket_12, OrderOpenPrice(), Bid - StopLoss * G_point_196, 0, 0, Yellow);
      } else {
         if (Fperceptron() < 0.0 && Cperceptron() < 0.0) {
            Lots = GetLotSize();
            ticket_12 = OrderSend(Symbol(), OP_SELL, Lots, Bid, 3, 0, 0, "AI", G_magic_184, 0, Yellow);
            if (ticket_12 < 0) {
               Sleep(10000);
               G_time_188 = Time[1];
            } else OrderModify(ticket_12, OrderOpenPrice(), Ask + StopLoss * G_point_196, 0, 0, Yellow);
         }
      }
   }
   return (0);
}

double Fperceptron() {
   double Ld_0 = alpha - 100;
   double Ld_8 = beta - 100;
   double Ld_16 = gamma - 100;
   double Ld_24 = delta - 100;
   double iac_32 = iAC(Symbol(), 0, 0);
   double iac_40 = iAC(Symbol(), 0, 7);
   double iac_48 = iAC(Symbol(), 0, 14);
   double iac_56 = iAC(Symbol(), 0, 21);
   return (Ld_0 * iac_32 + Ld_8 * iac_40 + Ld_16 * iac_48 + Ld_24 * iac_56);
}

double Cperceptron() {
   double Ld_0 = alt_alpha - 100;
   double Ld_8 = alt_beta - 100;
   double Ld_16 = alt_gamma - 100;
   double Ld_24 = alt_delta - 100;
   double iac_32 = iAC(alt_symbol, 0, 0);
   double iac_40 = iAC(alt_symbol, 0, 7);
   double iac_48 = iAC(alt_symbol, 0, 14);
   double iac_56 = iAC(alt_symbol, 0, 21);
   return (Ld_0 * iac_32 + Ld_8 * iac_40 + Ld_16 * iac_48 + Ld_24 * iac_56);
}

double GetLotSize() {
   double Ld_ret_0;
   if (Mode == "F") Ld_ret_0 = Lots;
   if (Mode == "A") Ld_ret_0 = MathCeil((AccountFreeMargin() - LotsMarginForOne) / LotsDeltaMargin) / 10.0;
   if (Ld_ret_0 < 0.1) Ld_ret_0 = 0.1;
   return (Ld_ret_0);
}
