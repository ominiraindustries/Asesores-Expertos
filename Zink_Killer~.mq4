/*
   G e n e r a t e d  by ex4-to-mq4 decompiler FREEWARE 4.0.509.5
   Website:  HT tp: / / w w W. meT Aquo t es . n et
   E-mail : S upp O r t@ m Et aqUOTe s.N eT
*/
#property copyright "Copyright © 2007, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

extern double Lots = 0.1;
extern int Magic = 12345;
extern int SL = 50;
extern int TP = 50;
extern int TrailingStop = 20;
extern int TimeFrameShorty = 15;
extern int TimeFrameLonger = 60;
extern double Signal = 0.7;
extern bool UsarUltimaBarra = TRUE;
extern bool UseTimetoTrade = FALSE;
extern int Startime = 8;
extern int Endtime = 16;
bool Gi_132 = FALSE;
bool Gi_136 = FALSE;

int init() {
   if (TimeYear(TimeCurrent()) == 2008 && TimeMonth(TimeCurrent()) == 1 && TimeDay(TimeCurrent()) >= 15) {
      Alert("Expert Advisor Expired!!! Please contact : zink_soft@hotmail.com");
      Gi_132 = TRUE;
   }
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   double Lda_0[11];
   double Lda_4[11];
   int Li_8;
   int ticket_12;
   double Ld_16;
   double Ld_24;
   double Ld_32;
   double price_40;
   double price_48;
   double price_56;
   double price_64;
   double Ld_72;
   double Ld_80;
   double Ld_88;
   if (TimeYear(TimeCurrent()) == 2008 && TimeMonth(TimeCurrent()) == 1 && TimeDay(TimeCurrent()) >= 15) {
      Alert("This Expert Advisor Expired!! Please contact: zink_soft@hotmail.com");
      Gi_132 = TRUE;
   }
   if (Gi_132 == FALSE) {
      if (UseTimetoTrade == TRUE) {
         if (TimeHour(TimeCurrent()) > Startime && TimeHour(TimeCurrent()) < Endtime) Gi_136 = TRUE;
         else Gi_136 = FALSE;
      } else Gi_136 = TRUE;
      if (UsarUltimaBarra == TRUE) Li_8 = 0;
      else Li_8 = 1;
      Ld_16 = 0;
      Ld_24 = 0;
      Ld_32 = 0;
      while (Li_8 < 11) {
         if (UsarUltimaBarra == TRUE) Lda_0[Li_8 + 1] = iClose(Symbol(), TimeFrameLonger, Li_8);
         else Lda_0[Li_8] = iClose(Symbol(), TimeFrameLonger, Li_8);
         Li_8++;
      }
      for (Li_8 = 10; Li_8 > 0; Li_8--) {
         if ((Lda_0[Li_8 - 1] - Lda_0[Li_8]) / Point > 0.0 && Li_8 > 1) Ld_16 += (Lda_0[Li_8 - 1] - Lda_0[Li_8]) / Point;
         if ((Lda_0[Li_8 - 1] - Lda_0[Li_8]) / Point < 0.0 && Li_8 > 1) Ld_24 += (Lda_0[Li_8 - 1] - Lda_0[Li_8]) / Point;
      }
      Ld_32 = Ld_16 + MathAbs(Ld_24);
      if (UsarUltimaBarra == TRUE) Li_8 = 0;
      else Li_8 = 1;
      Ld_72 = 0;
      Ld_80 = 0;
      Ld_88 = 0;
      while (Li_8 < 11) {
         if (UsarUltimaBarra == TRUE) Lda_4[Li_8 + 1] = iClose(Symbol(), TimeFrameShorty, Li_8);
         else Lda_4[Li_8] = iClose(Symbol(), TimeFrameShorty, Li_8);
         Li_8++;
      }
      for (Li_8 = 10; Li_8 > 0; Li_8--) {
         if ((Lda_4[Li_8 - 1] - Lda_4[Li_8]) / Point > 0.0 && Li_8 > 1) Ld_72 += (Lda_4[Li_8 - 1] - Lda_4[Li_8]) / Point;
         if ((Lda_4[Li_8 - 1] - Lda_4[Li_8]) / Point < 0.0 && Li_8 > 1) Ld_80 += (Lda_4[Li_8 - 1] - Lda_4[Li_8]) / Point;
      }
      Ld_88 = Ld_72 + MathAbs(Ld_80);
      trailing(Magic);
      if (Ld_16 / Ld_32 > Signal && Ld_72 / Ld_88 > Signal && ScanOpenTrades() == 0 && Gi_136 == TRUE) {
         if (SL == 0) price_40 = 0;
         if (SL > 0) price_40 = Ask - SL * Point;
         if (TP == 0) price_48 = 0;
         if (TP > 0) price_48 = Ask + TP * Point;
         ticket_12 = OrderSend(Symbol(), OP_BUY, Lots, Ask, 3, price_40, price_48, "Zink", Magic, 0, Blue);
         if (ticket_12 > 0) {
            if (OrderSelect(ticket_12, SELECT_BY_TICKET, MODE_TRADES)) {
               Print(" BUY order opened:", OrderOpenPrice());
               OrderSelect(ticket_12, SELECT_BY_TICKET, MODE_TRADES);
            } else Print("Error opening BUY order: ", GetLastError());
         } else Print("Error opening BUY order: ", GetLastError());
      }
      if (MathAbs(Ld_24) / Ld_32 > Signal && MathAbs(Ld_80) / Ld_88 > Signal && ScanOpenTrades() == 0 && Gi_136 == TRUE) {
         if (SL == 0) price_56 = 0;
         if (SL > 0) price_56 = Bid + SL * Point;
         if (TP > 0) price_64 = Bid - TP * Point;
         if (TP == 0) price_64 = 0;
         ticket_12 = OrderSend(Symbol(), OP_SELL, Lots, Bid, 3, price_56, price_64, "Zink", Magic, 0, Red);
         if (ticket_12 > 0) {
            if (OrderSelect(ticket_12, SELECT_BY_TICKET, MODE_TRADES)) {
               Print(" Sell order opened:", OrderOpenPrice());
               OrderSelect(ticket_12, SELECT_BY_TICKET, MODE_TRADES);
            } else Print("Error opening Sell order: ", GetLastError());
         } else Print("Error opening Sell order: ", GetLastError());
      }
      Comment(StringConcatenate("       SERVER TIME: ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS)), StringConcatenate("\n", "                                                     "),
         StringConcatenate("\n", "           TIME FRAME ", TimeFrameLonger), StringConcatenate("\n", "UP ", 100.0 * (Ld_16 / Ld_32), " / ", "DOWN ", 100.0 * (MathAbs(Ld_24) / Ld_32)),
         StringConcatenate("\n", Lda_0[10], " ", Lda_0[9], " ", Lda_0[8], " ", Lda_0[7], " ", Lda_0[6], " ", Lda_0[5], " ", Lda_0[4], " ", Lda_0[3], " ", Lda_0[2], " ", Lda_0[1]),
         StringConcatenate("\n", "                                                         "), StringConcatenate("\n", "           TIME FRAME ", TimeFrameShorty), StringConcatenate("\n",
         "UP ", 100.0 * (Ld_72 / Ld_88), " / ", "DOWN ", 100.0 * (MathAbs(Ld_80) / Ld_88)), StringConcatenate("\n", Lda_4[10], " ", Lda_4[9], " ", Lda_4[8], " ", Lda_4[7],
         " ", Lda_4[6], " ", Lda_4[5], " ", Lda_4[4], " ", Lda_4[3], " ", Lda_4[2], " ", Lda_4[1]), StringConcatenate("\n", "                                                         "),
         StringConcatenate("\n", "==============================================="), StringConcatenate("\n", "                          SIGNAL           "), StringConcatenate("\n",
         "Longer Signal: ", signal(Ld_16 / Ld_32, MathAbs(Ld_24) / Ld_32), "     Shorty Signal: ", signal(Ld_72 / Ld_88, MathAbs(Ld_80) / Ld_88)), StringConcatenate("\n",
         "SIGNAL TO TRADE : ", signalresult(signal(Ld_16 / Ld_32, MathAbs(Ld_24) / Ld_32), signal(Ld_72 / Ld_88, MathAbs(Ld_80) / Ld_88))));
   } else Comment("EXPERT ADVISOR EXPIRED! PLEASE CONTACT: zink_soft@hotmail.com!");
   return (0);
}

int ScanOpenTrades() {
   int order_total_0 = OrdersTotal();
   int count_4 = 0;
   for (int pos_8 = 0; pos_8 <= order_total_0 - 1; pos_8++) {
      OrderSelect(pos_8, SELECT_BY_POS);
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) count_4++;
      if (Magic == 0) count_4++;
   }
   return (count_4);
}

string signal(double Ad_0, double Ad_8) {
   if (Ad_0 > Signal && Ad_8 < Signal) return ("BUY");
   if (Ad_8 > Signal && Ad_0 < Signal) return ("SELL");
   if (Ad_8 < Signal && Ad_0 < Signal) return ("NO TRADE");
   return ("");
}

string signalresult(string As_0, string As_8) {
   if (As_0 == "BUY" && As_8 == "BUY") return ("BUY");
   if (As_0 == "SELL" && As_8 == "SELL") return ("SELL");
   if (As_0 == "NO TRADE" || As_8 == "NO TRADE") return ("NO TRADE");
   return ("");
}

void trailing(int A_magic_0) {
   if (TrailingStop > 0) {
      for (int pos_4 = 0; pos_4 < OrdersTotal(); pos_4++) {
         OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
         if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == A_magic_0) {
            if (Bid - OrderOpenPrice() > Point * TrailingStop)
               if (OrderStopLoss() < Bid - Point * TrailingStop) OrderModify(OrderTicket(), OrderOpenPrice(), Bid - Point * TrailingStop, OrderTakeProfit(), 0, Green);
         }
         if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == A_magic_0) {
            if (OrderOpenPrice() - Ask > Point * TrailingStop)
               if (OrderStopLoss() > Ask + Point * TrailingStop || OrderStopLoss() == 0.0) OrderModify(OrderTicket(), OrderOpenPrice(), Ask + Point * TrailingStop, OrderTakeProfit(), 0, Red);
         }
      }
   }
}
