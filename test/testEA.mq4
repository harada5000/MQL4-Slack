//+------------------------------------------------------------------+
//|                                                       testEA.mq4 |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property strict


#include <mql4_modules\Slack\Slack.mqh>


int OnInit()
{
   Slack::setAPIKey("your api key");
   if(!Slack::send("Slack module.", "general")) {
      Print("sendSlack method failed.");
      return(INIT_FAILED);
   }
   
   return(INIT_SUCCEEDED);
}


void OnTick()
{
   
}
