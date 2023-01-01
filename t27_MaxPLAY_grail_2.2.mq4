//+------------------------------------------------------------------+
//|                                            t27_MaxPLAY_grail.mq4 |
//|                                                          tommy27 |
//|                                         SKYPE:      t.o.m.m.y.27 |
//|                                          MAIL:   tommy27@mail.ru |
//+------------------------------------------------------------------+
#property copyright "tommy27"
#property link      "tommy27@mail.ru"
#define BEGIN_PROFIT -999999999        // Начальный профит

extern string comment="1";
extern double Lot=0.1;
extern bool Start_CCI_Filtr=false;
extern int Start_CCI_level=90;
extern bool Stop_CCI_Filtr=false;
extern int Stop_CCI_level=0;
extern int CCI_period=100;
extern bool Dolivki=false;
extern bool DolivLevel=false;
extern bool Martini=false;
extern double VirtSL = 0;
extern double VirtTP = 0;
extern bool Tral=false;
extern double TrailingStart  = 0;           // Уровень профита - Стартовый уровень трала
extern double TrailingStop   = 47;          // Фиксированный размер трала в пунктах
extern double TrailingStep   = 1.5;         // Шаг трала пунктах


double gdProfit    = BEGIN_PROFIT;     // Суммарный профит выбранных позиций
int    ord,
       i=1,
       order_type,
       NumberOfTry=5,
       Slippage = 10;
double profit,sline,CCI,LOT;
#include <stdlib.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
if(GlobalVariableCheck("stop")){GlobalVariableDel("stop");}
LOT=Lot;   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
////////////////OPENORDER позаимствовал у SilverKZ :)))
void OPENORDER(string symbol, double  Lots, string ord)
{
   int error,err;
   while (true)
   {  
      error=true;
      if (ord=="Buy") 
         {
          error=OrderSend(symbol,OP_BUY, Lots,NormalizeDouble(MarketInfo(symbol,MODE_ASK),MarketInfo(symbol,MODE_DIGITS)),Slippage,0,0,comment,0,0,Blue); //Bid-SL*Point,Ask+TP*Point         
         }
      if (ord=="Sell")
         {
          error=OrderSend(symbol,OP_SELL,Lots,NormalizeDouble(MarketInfo(symbol,MODE_BID),MarketInfo(symbol,MODE_DIGITS)),Slippage,0,0,comment,0,0,Red); //Ask+SL*Point,Bid-TP*Point        
         }
      if (error==-1)
      {  
         Print("Error  " ,GetLastError()," ",symbol);
         err++;Sleep(2000);RefreshRates();
      }
      if (error!=-1 || err >100) return;
   }
  return;
} 
////////////////////
bool CloseAll()
{ 
   bool error=true;
   int  err,nn,OT;
   for (int j = OrdersTotal()-1; j >= 0; j--)
     {
      if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderComment()==comment)
         {
           OT = OrderType();
           if (OT<2) 
           {
             while(true)
               {
                if (OT==OP_BUY)  error=OrderClose(OrderTicket(),OrderLots(),
                                                  NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID),MarketInfo(OrderSymbol(),MODE_DIGITS)),3,Blue);
                if (OT==OP_SELL) error=OrderClose(OrderTicket(),OrderLots(),
                                                  NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK),MarketInfo(OrderSymbol(),MODE_DIGITS)),3,Red);
                if (error) break;
                else
                  {
                   err++;
                   if (err>10) break;
                   Sleep(1000);
                   RefreshRates();
                  }                                
               }
            }
  
         }
      }   
   return(1);
}
//Функция определения какой ордер открыт BUY/SELL и возвращает 1-бай, 2-сел
int OrdersType() 
{
 double LotBUY,LotSELL;
 int BUY=0,SELL=0,i, k=OrdersTotal();
 for (i=0; i<k; i++) 
    {
     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) 
       {
        if (OrderType()==OP_BUY&&OrderComment()==comment) 
          {
           return(1);          
          }
        }   
     if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
       {            
        if (OrderType()==OP_SELL&&OrderComment()==comment) 
          {
           return(2);           
          }
        }      
    }
  
}
int BuyorSell()
{
 if (((iClose(Symbol(),0,i)>iClose(Symbol(),0,i+1)) && (iClose(Symbol(),0,i+2)>iClose(Symbol(),0,i+1)) && (iClose(Symbol(),0,i+3)>iClose(Symbol(),0,i+2))) &&
        ((iLow(Symbol(),0,i)>iLow(Symbol(),0,i+1)) && (iLow(Symbol(),0,i+2)>iLow(Symbol(),0,i+1)) && (iLow(Symbol(),0,i+3)>iLow(Symbol(),0,i+2))))
      {
       return(1);
      }
if (((iClose(Symbol(),0,i)<iClose(Symbol(),0,i+1)) && (iClose(Symbol(),0,i+2)<iClose(Symbol(),0,i+1)) && (iClose(Symbol(),0,i+3)<iClose(Symbol(),0,i+2))) &&
        ((iHigh(Symbol(),0,i)<iHigh(Symbol(),0,i+1)) && (iHigh(Symbol(),0,i+2)<iHigh(Symbol(),0,i+1)) && (iHigh(Symbol(),0,i+3)<iHigh(Symbol(),0,i+2))))
      {
       return(2);
      }
  return(0);    
}

int MyOrdersTotal()
 {
  int MyOrders = 0,
  i,k=OrdersTotal();
  for (i=0; i<k; i++)
     {
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
         if (OrderComment()==comment ) 
           {
            MyOrders++;
            return(MyOrders);
           }
        } 
     }
  return(0);
 }       
//////////////////////////////////
datetime TimeOpenLastPos(string sym="", int op=-1, int mn=-1) {
  datetime oot;
  int      i, k=OrdersTotal();
 
  if (sym=="") sym=Symbol();
  for (i=0; i<k; i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)&&OrderComment()==comment) {
      if (OrderSymbol()==sym) {
        if (OrderType()==OP_BUY || OrderType()==OP_SELL) {
          if (op<0 || OrderType()==op) {
            if (mn<0 || OrderMagicNumber()==mn) {
              if (oot<OrderOpenTime()) oot=OrderOpenTime();
            }
          }
        }
      }
    }
  }
  return(oot);
}
//+----------------------------------------------------------------------------+
//|  Автор    : Ким Игорь В. aka KimIV,  http://www.kimiv.ru                   |
//+----------------------------------------------------------------------------+
//|  Версия   : 01.02.2008                                                     |
//|  Описание : Возвращает одно из двух значений взависимости от условия.      |
//+----------------------------------------------------------------------------+
string IIFs(bool condition, string ifTrue, string ifFalse) {
  if (condition) return(ifTrue); else return(ifFalse);
}

//+----------------------------------------------------------------------------+
//|  Автор    : Ким Игорь В. aka KimIV,  http://www.kimiv.ru                   |
//+----------------------------------------------------------------------------+
//|  Версия   : 19.02.2008                                                     |
//|  Описание : Возвращает суммарный профит открытых позиций в пунктах         |
//+----------------------------------------------------------------------------+
//|  Параметры:                                                                |
//|    sy - наименование инструмента   (""   - любой символ,                   |
//|                                     NULL - текущий символ)                 |
//|    op - операция                   (-1   - любая позиция)                  |
//|    mn - MagicNumber                (-1   - любой магик)                    |
//+----------------------------------------------------------------------------+
int GetProfitOpenPosInPoint(string sy="", int op=-1, int mn=-1) {
  double p;
  int    i, k=OrdersTotal(), pr=0;

  if (sy=="0") sy=Symbol();
  for (i=0; i<k; i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)&&OrderComment()==comment) {
      if ((OrderSymbol()==sy || sy=="") && (op<0 || OrderType()==op)) {
        if (mn<0 || OrderMagicNumber()==mn) {
          p=MarketInfo(OrderSymbol(), MODE_POINT);
          if (p==0) if (StringFind(OrderSymbol(), "JPY")<0) p=0.0001; else p=0.01;
          if (OrderType()==OP_BUY) {
            pr+=(MarketInfo(OrderSymbol(), MODE_BID)-OrderOpenPrice())/p;
          }
          if (OrderType()==OP_SELL) {
            pr+=(OrderOpenPrice()-MarketInfo(OrderSymbol(), MODE_ASK))/p;
          }
        }
      }
    }
  }
  return(pr);
}
//+----------------------------------------------------------------------------+
//|  Автор    : Ким Игорь В. aka KimIV,  http://www.kimiv.ru                   |
//+----------------------------------------------------------------------------+
//|  Версия   : 19.02.2008                                                     |
//|  Описание : Возвращает суммарный профит открытых позиций в валюте депозита |
//+----------------------------------------------------------------------------+
//|  Параметры:                                                                |
//|    sy - наименование инструмента   (""   - любой символ,                   |
//|                                     NULL - текущий символ)                 |
//|    op - операция                   (-1   - любая позиция)                  |
//|    mn - MagicNumber                (-1   - любой магик)                    |
//+----------------------------------------------------------------------------+
double GetProfitOpenPosInCurrency(string sy="", int op=-1, int mn=-1) {
  double p=0;
  int    i, k=OrdersTotal();

  if (sy=="0") sy=Symbol();
  for (i=0; i<k; i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)&&OrderComment()==comment) {
      if ((OrderSymbol()==sy || sy=="") && (op<0 || OrderType()==op)) {
        if (OrderType()==OP_BUY || OrderType()==OP_SELL) {
          if (mn<0 || OrderMagicNumber()==mn) {
             p+=OrderProfit()+OrderCommission()+OrderSwap();
          }
        }
      }
    }
  }
  return(p);
}
////////////////////////
void F_buy()
     {
     if(Start_CCI_Filtr&&BuyorSell()==1&&CCI<-Start_CCI_level&&TimeOpenLastPos()<Time[0])
      {
       OPENORDER(Symbol(), Lot, "Buy"); 
      }
     if(!Start_CCI_Filtr&&BuyorSell()==1)
      {
       OPENORDER(Symbol(), Lot, "Buy"); 
      }

return;}
/////////////////////////
void F_sell()
     {
     if(Start_CCI_Filtr&&BuyorSell()==2&&CCI>Start_CCI_level&&TimeOpenLastPos()<Time[0])
      {
       OPENORDER(Symbol(), Lot, "Sell"); 
      } 
     if(!Start_CCI_Filtr&&BuyorSell()==2)
      {
       OPENORDER(Symbol(), Lot, "Sell"); 
      } 
     
return;} 
/////////////////////////
void Trailing()
     {
      double pr=GetProfitOpenPosInPoint();
     if (pr-TrailingStop>=TrailingStart) 
      {
      if (gdProfit<pr-TrailingStop-TrailingStep) gdProfit=pr-TrailingStop;
      }
      else gdProfit=BEGIN_PROFIT;
     if (gdProfit>=pr) 
      {
      for (int i=0; i<NumberOfTry; i++) {Print ("ВСЁ ОТЛИЧНО ЗАКРЫЛИСЬ ПО ТРАЛЛУ");CloseAll();Lot=LOT;}
      }
 return;}               
////////////////////////////////
void F_cl_buy()
    {
     if(Stop_CCI_Filtr&&OrdersType()==1&&CCI>Stop_CCI_level){CloseAll();Lot=LOT;}
     
     if(!Stop_CCI_Filtr&&OrdersType()==1&&BuyorSell()==2){CloseAll();Lot=LOT;}
return;}
////////////////////////////////
void F_cl_cell()
    {
     if(Stop_CCI_Filtr&&OrdersType()==2&&CCI<-Stop_CCI_level){CloseAll();Lot=LOT;}
     
     if(!Stop_CCI_Filtr&&OrdersType()==2&&BuyorSell()==1){CloseAll();Lot=LOT;}
return;}
//+----------------------------------------------------------------------------+
//|  Автор    : Ким Игорь В. aka KimIV,  http://www.kimiv.ru                   |
//+----------------------------------------------------------------------------+
//|  Версия   : 19.02.2008                                                     |
//|  Описание : Возвращает цену открытия последней открытой позиций.           |
//+----------------------------------------------------------------------------+
//|  Параметры:                                                                |
//|    sy - наименование инструмента   (""   - любой символ,                   |
//|                                     NULL - текущий символ)                 |
//|    op - операция                   (-1   - любая позиция)                  |
//|    mn - MagicNumber                (-1   - любой магик)                    |
//+----------------------------------------------------------------------------+
double PriceOpenLastPos(string sy="", int op=-1, int mn=-1) {
  datetime t;
  double   r=0;
  int      i, k=OrdersTotal();
 
  if (sy=="0") sy=Symbol();
  for (i=0; i<k; i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)&&OrderComment()==comment) {
      if (OrderSymbol()==sy || sy=="") {
        if (OrderType()==OP_BUY || OrderType()==OP_SELL) {
          if (op<0 || OrderType()==op) {
            if (mn<0 || OrderMagicNumber()==mn) {
              if (t<OrderOpenTime()) {
                t=OrderOpenTime();
                r=OrderOpenPrice();
              }
            }
          }
        }
      }
    }
  }
  return(r);
}
//////////////////////////////
int DolivSignal()
 {
  if(OrdersType()==1&&BuyorSell()==1&&TimeOpenLastPos()<Time[0])return(1);
  if(OrdersType()==2&&BuyorSell()==2&&TimeOpenLastPos()<Time[0])return(2);
 return(0);}
  
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
   
   if(GlobalVariableCheck("stop"))return(0);
   if (VirtSL >0)VirtSL=-VirtSL;
   if (VirtSL !=0&&VirtSL>=GetProfitOpenPosInCurrency())
     {
      CloseAll();
      Print ("Закрылись по VirtSL, ПРОИЗОШЛА КРИТИЧЕСКАЯ ПРОСАДКА, РОБОТ ОСТАНОВЛЕН");
      Comment("ПРОИЗОШЛА КРИТИЧЕСКАЯ ПРОСАДКА, РОБОТ ОСТАНОВЛЕН");
      GlobalVariableSet("stop",0);
      return(0);
     }
   if (VirtTP !=0&&VirtTP<=GetProfitOpenPosInCurrency()){CloseAll();Print ("Закрылись по VirtTP");}
   if (Stop_CCI_Filtr && !Start_CCI_Filtr)Stop_CCI_Filtr=false;      
   
   
   CCI= iCCI(Symbol(),0,CCI_period,PRICE_CLOSE,0);
   
   if (MyOrdersTotal()==0)
    {     
     F_buy();
     F_sell();
    }
   if (MyOrdersTotal()>0)
    {
     if(Tral)Trailing();
     F_cl_buy();
     F_cl_cell();
   
     if(Dolivki)
      { 
       if(DolivLevel&&DolivSignal()==1&&PriceOpenLastPos()>Close[0])
        {
         if(Martini){Lot=Lot+LOT;OPENORDER(Symbol(), Lot, "Buy");}
         else OPENORDER(Symbol(), Lot, "Buy"); 
        }
       if(Start_CCI_Filtr&&DolivSignal()==1&&CCI<-Start_CCI_level)
        {
         if(Martini){Lot=Lot+LOT;OPENORDER(Symbol(), Lot, "Buy");}
         else OPENORDER(Symbol(), Lot, "Buy");
        }
       if(!Start_CCI_Filtr&&DolivSignal()==1)
        {
         if(Martini){Lot=Lot+LOT;OPENORDER(Symbol(), Lot, "Buy");}
         else OPENORDER(Symbol(), Lot, "Buy");
        }
       
       if(DolivLevel&&DolivSignal()==2&&PriceOpenLastPos()<Close[0])
        {
         if(Martini){Lot=Lot+LOT;OPENORDER(Symbol(), Lot, "Sell");}
         else OPENORDER(Symbol(), Lot, "Sell");
        }
       if(Start_CCI_Filtr&&DolivSignal()==2&&CCI>Start_CCI_level)
        {
         if(Martini){Lot=Lot+LOT;OPENORDER(Symbol(), Lot, "Sell");}
         else OPENORDER(Symbol(), Lot, "Sell");
        }
       if(!Start_CCI_Filtr&&DolivSignal()==2)
        {
         if(Martini){Lot=Lot+LOT;OPENORDER(Symbol(), Lot, "Sell");}
         else OPENORDER(Symbol(), Lot, "Sell");
        }
     
      }
    
   }

/*string st="TrailingStart="+DoubleToStr(TrailingStart, 2)+" "+AccountCurrency()
             +"TrailingStop="+DoubleToStr(TrailingStop, 2)+" "+AccountCurrency()
             +"  TrailingStep="+DoubleToStr(TrailingStep, 2)+" "+AccountCurrency()
             +"\n"
             +"Current Stop="+IIFs(gdProfit>BEGIN_PROFIT, DoubleToStr(gdProfit, 2)+" "+AccountCurrency(), "None")
             +"  Current Profit="+DoubleToStr(pr, 2)+" "+AccountCurrency()
             ;
    Comment(st);*/
   //потом покрасивше оформить надо, щас некогда 
   
   return(0);
  }
//+------------------------------------------------------------------+