--<--------------> Config <----------------->--
local token = "TOKEN" -- Your Token {Get On : t.me/BotFather }
if token == "TOKEN" then 
 print("NOT TOKEN")
 return false
end
local admins = { -- Id Sudos For Bot 
  439144684,
  0,
}
--<------------> End Config <--------------->--
URL = require('socket.url')
JSON = require("JSON")
HTTPS = require('ssl.https')
redis = require('redis')
client = Redis.connect('127.0.0.1', 6379)
---------------- Functions ----------------
local TELE_URL = "https://api.telegram.org/bot"..token
function is_admin(msg)
local var = false
for k,v in pairs(admins) do
if msg.from.id == v then
var = true
end
end
return var
end
function Request(url)
local dat, res = HTTPS.request(url)
local tab = JSON.decode(dat)
if not tab.ok then
return false, tab.description
end
return tab
end
local function api(method,parameters)  
ikeko = coroutine.create(function(method,parameters)
local keko = ''
local par_keko = ''
if parameters then 
par_keko = '?'
else 
par_keko = ''
end
if method then 
if parameters then 
for k,v in pairs(parameters) do
if v:match("(text=)(.*)") then 
local textt = {string.match(v, "^(text=)(.*)$")} 
par_keko = par_keko.."&"..textt[1]..URL.escape(textt[2])
else
par_keko = par_keko.."&"..v
end
end
end
keko = Request(TELE_URL..'/'..method..par_keko)
return keko
else 
print("not method")
end
print("not method")
end)
coroutine.resume(ikeko,method,parameters)
end
local function getMe()
local url = TELE_URL .. '/getMe'
return Request(url)
end
function getUpdates(offset)
local url = TELE_URL .. '/getUpdates?timeout=20'
if offset then
url = url .. '&offset=' .. offset
end
return Request(url)
end
bot = getMe()
bot = bot.result
time_update = time_update or 0
bot_start = 'keko'
for i=1, #admins do 
api("sendMessage",{
"chat_id="..admins[i],
"text=Bot Start :\n {Id Bot = "..bot.id.." \n Bot UserName = "..bot.username.."}",
}) 
end
print("Bot Start : {Id Bot = "..bot.id.." \n Bot UserName = @"..bot.username.."}\n")
----------------- end functions ---------------
-----------------------------------------------------------------------------------------------
--  BY: t.me/ikeko       ---       KEKO JSON              ---          BY: t.me/ikeko        --
-----------------------------------------------------------------------------------------------
function load_keko(fileName) 
	local keko = io.open(fileName)
	if not keko then
	return {}
	end
	local keko2 = keko:read('*all')
	keko:close()
	local keko3 = JSON.decode(keko2)
	return keko3
end
function save_keko(fileName, data) 
	local keko = JSON.encode(data)
	local keko2 = io.open(fileName, 'w')
	keko2:write(keko)
	keko2:close()
end
local bot_id = 'data'
function kekoSet(keko, keko2)
  local keko3 = 'keko_'..bot_id..'.json'
  if (keko and keko2 and keko3) then 
  local keko_data = load_keko(keko3)
  if not keko_data then
  keko_data = {}
  save_keko(keko3, keko_data)
  end
      
  keko_data[tostring(keko)] = {
  keko = keko2
  }
  save_keko(keko3, keko_data)
  end
  if not keko then print('no keko') end
  if not keko2 then print('no keko2') end
  if not keko3 then print('no keko3') end
  end
  function kekoGet(keko)
  local keko3 = 'keko_'..bot_id..'.json'
  local keko_text = nil 
  local keko_data = load_keko(keko3)
  if keko_data then 
  if keko_data[tostring(keko)] then 
  keko_text = keko_data[tostring(keko)].keko
    end
  end
  return keko_text
  end
  function kekoDel(keko)
    local keko3 = 'keko_'..bot_id..'.json'
    if (keko) then 
    local keko_data = load_keko(keko3)
    if not keko_data then
    data = {}
    save_keko(keko3, keko_data)
    end
    keko_data[tostring(keko)] = {
    keko = nil
    }
    save_keko(keko3, keko_data)
    end
  end
  function kekoDel1(keko)
    local keko3 = 'keko_'..bot_id..'.json'
    if (keko) then 
    local keko_data = load_keko(keko3)
    if not keko_data then
    data = {}
    save_keko(keko3, keko_data)
    end
    if keko_data[tostring(keko)].keko then
    keko_data[tostring(keko)] = {
    keko = nil
    }
  end
  if #keko_data[tostring(keko)] == 1 then 
       for k,v in pairs(keko_data[tostring(keko)]) do
       table.remove(keko_data[tostring(keko)],k)
      end
    end
    save_keko(keko3, keko_data)
    end
  end
function kekoSetl(keko, keko2)
  local keko3 = 'keko_'..bot_id..'.json'
  if (keko and keko2 and keko3) then 
  local keko_data = load_keko(keko3)
  if not keko_data then
  keko_data = {}
  save_keko(keko3, keko_data)
  end
  if not (keko_data[tostring(keko)]) then 
	keko_data[tostring(keko)] = {}
	end
 table.insert(keko_data[tostring(keko)], keko2)
	save_keko(keko3, keko_data)
	end
  if not keko then print('no keko') end
  if not keko2 then print('no keko2') end
  if not keko3 then print('no keko3') end
end
function kekoGetl(keko)
  local keko3 = 'keko_'..bot_id..'.json'
  local keko_text = nil 
  local keko_data = load_keko(keko3)
  if keko_data then 
  keko_text = keko_data[tostring(keko)]
  end
  return keko_text
  end
  function kekoC(keko)
    local keko3 = 'keko_'..bot_id..'.json'
    local keko_text = nil 
    local keko_data = load_keko(keko3)
    if keko_data then 
    keko_text2 = keko_data[tostring(keko)]
    if keko_text2 then 
    for i=1, #keko_text2 do 
    keko_text = i
    end
  end
end
  return keko_text
    end
-----------------------------------------------------------------------------------------------
--  BY: t.me/ikeko       ---      End KEKO JSON              ---          BY: t.me/ikeko     --
-----------------------------------------------------------------------------------------------  

function keko_msg(data)
print(JSON.encode(data))
local msg = ''
if data.message then
msg = data.message
else if data.callback_query then 
msg = data.callback_query 
end
end
if data then -- do not delete
-- start (code or bot) 
  
if (msg.text and msg.text == "/start") then -- Example fro send keyboard
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
end

if (data.callback_query and msg.data == '/keko' ) then -- example fro edit keyboard
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

-- end (code or bot)		
end -- end for if data | do not delete
end -- end for keko_msg | do not delete
-----------------{ GetUpdate }---------------
if bot_start == 'keko' then 
while bot_start do 
local getUpdatesnow = getUpdates(time_update+1) 
if getUpdatesnow then
for i,v in ipairs(getUpdatesnow.result) do
keko_msg(v)
time_update = v.update_id
end
end
end
end
---------------{ End GetUpdate }---------------
--[[  
This file was written by keko | t.me/ikeko
powered by the "Tshake Team" | t.me/TshAkETEAM
]]
