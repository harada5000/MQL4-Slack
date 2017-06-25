//+------------------------------------------------------------------+
//|                                                        Slack.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+


#ifndef _LOAD_MODULE_SLACK
#define _LOAD_MODULE_SLACK


#include <mql4_modules\Assert\Assert.mqh>
#include <mql4_modules\Web\Web.mqh>


class Slack
{
   private:
      static string api_key;
   public:
      static void setAPIKey(const string value);
      static bool send(const string text, string channel = "general");
};


static string Slack::api_key = "";


static void Slack::setAPIKey(const string value)
{
   Slack::api_key = value;
}


/**
 * 取引情報をSlackへ通知する
 *
 * @param string text 投稿内容
 * @param string channel 投稿先のチャンネル
 *
 * @return bool true:成功, false:失敗
 */
static bool Slack::send(const string text, string channel = "general")
{
   assert(StringLen(Slack::api_key) > 0, "check the slack api key.");
   
   string url = "https://slack.com/api/chat.postMessage";
   string response;
   
   Web::addParameter("token", Slack::api_key);
   Web::addParameter("channel", "%23" + channel);
   Web::addParameter("text", text);
   
   Web::get(url, response);
   Print(response);
   return(StringFind(response, "\"ok\":true", 0) != -1);
}


#endif
