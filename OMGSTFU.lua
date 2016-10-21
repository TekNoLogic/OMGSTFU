
local debugf = tekDebug and tekDebug:GetFrame("OMGSTFU")
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end end


local filterstrings = {
	"^Welcome %a+, good you're joining us$",
	"^Welcome back %a+$",
	"^Grats for %a+ on becoming [%a%s]+$",
	"^Congratulations %a+ with your promotion to [%a%s]+$",
	"^Hi %a+, nice to have you in the guild$",
	"^Hi %a+$",
	"^Hi %a+, welcome back$",
	"^Hi again %a+$",
	"^Hello %a+$",
	"^Congratz!!$",
	"^Congratulations %a+!$",
	"^Congratulations %a+ on reaching level %d+$",
	"^Hey %a+ Good job on getting level %d+!$",
	"^%a+, grats on getting level %d+$",
	"^Hey %a+$",
	"^Grats!? %a+$",
	"^Gratz!? %a+$",
	"^Gratz!?$",
	"GRATS ON YOU",
}
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", function(self, event, msg)
	for _,str in pairs(filterstrings) do
		if msg:match(str) then
			Debug("Supressing chat message", msg)
			return true
		end
	end
end
)


-- Gets rid of those stupid "real name" prefixes that some shitty addon adds
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", function(self, event, msg, ...)
	return false, msg:gsub("%([^)]+%): ", ""), ...
end
)


LibStub("tekKonfig-AboutPanel").new(nil, "OMGSTFU")
