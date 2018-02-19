Lua-Bot-Telegram-Api
==============


______________________________________________________________________________________________________________________









Installation
------------



1. Install :

```$ sudo apt-get update && git clone https://github.com/kekobot/LuaApi && cd LuaApi && sudo chmod 777 install.sh && sudo chmod 777 run.sh && ./install.sh```



2. Go to file **bot.lua**


3. Place the token in line **2** | _Do you not have created a token ? [Click here](http://telegram.me/botfather?start=/newbot)_


4. Place Your id in line (**8** or **9**) 


5. start Your code in line **228**


6. start bot Run bot by sending : 


$```./run.sh```


-----------




[methods](https://core.telegram.org/bots/api#available-methods) 
----------






Example for send keyboard
--------



``if (msg.text and msg.text == "/start") then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'keko', callback_data="/keko"},
},
{
{text = 'UserName for keko', url="t.me/ikeko"},
},
}
api("sendMessage",{
    "chat_id="..msg.chat.id,
    "text=[keko](t.me/ikeko)",
    "reply_to_message_id="..msg.message_id,
    "parse_mode=markdown",
    "disable_web_page_preview=true",
    "reply_markup="..JSON.encode(keyboard),
    }) 
end``



Example for edit keyboard
--------------



``
if (data.callback_query and msg.data == '/keko' ) then 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'Good', url="t.me/ikeko"},
}
}
api("editMessageText",{
    "chat_id="..data.callback_query.message.chat.id,
    "text=Good",
    "message_id="..data.callback_query.message.message_id,
    "parse_mode=markdown",
    "disable_web_page_preview=true",
    "reply_markup="..JSON.encode(keyboard),
    })
end
``




Example for send text
--------------


``api("sendMessage",{
    "chat_id="..msg.chat.id,
    "text= Example fro send text",
    "reply_to_message_id="..msg.message_id
    }) ``




_________________________________________________________________________________________________________



License
-------

The MIT License (MIT)

Copyright (TM) 2018 **TshAkE**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
