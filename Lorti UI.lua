  
  -- // Lorti UI
  -- // Lorti - 2011
  
  -----------------------------
  -- INIT
  -----------------------------
  
  --get the addon namespace
  local addon, ns = ...
  
  --generate a holder for the config data
  local cfg = CreateFrame("Frame")
  
  -----------------------------
  -- CONFIG
  -----------------------------



	MinimapBorderTop:Hide()
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	MiniMapWorldMapButton:Hide()
	GameTimeFrame:Hide()
	GameTimeFrame:UnregisterAllEvents()
	GameTimeFrame.Show = kill

	
	MiniMapTracking:Hide()
	MiniMapTracking.Show = kill
	MiniMapTracking:UnregisterAllEvents()

	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(self, z)
		local c = Minimap:GetZoom()
		if(z > 0 and c < 5) then
			Minimap:SetZoom(c + 1)
		elseif(z < 0 and c > 0) then
			Minimap:SetZoom(c - 1)
		end
	end)
	Minimap:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton" then
			_G.GameTimeFrame:Click()
		elseif btn == "MiddleButton" then
			_G.ToggleDropDownMenu(1, nil, _G.MiniMapTrackingDropDown, self)
		else
			_G.Minimap_OnClick(self)
		end
	end)



     
 local ef=CreateFrame("Frame")
   
      ef:RegisterEvent("ADDON_LOADED")
         ef:SetScript("OnEvent", function(self, event, addon)
             if(addon=="Blizzard_TimeManager") then
                 for i,v in pairs({

		PlayerFrameTexture,
   		TargetFrameTextureFrameTexture,
  		PetFrameTexture,
		PartyMemberFrame1Texture,
		PartyMemberFrame2Texture,
		PartyMemberFrame3Texture,
		PartyMemberFrame4Texture,
		PartyMemberFrame1PetFrameTexture,
		PartyMemberFrame2PetFrameTexture,
		PartyMemberFrame3PetFrameTexture,
		PartyMemberFrame4PetFrameTexture,
   		FocusFrameTextureFrameTexture,
   		TargetFrameToTTextureFrameTexture,
   		FocusFrameToTTextureFrameTexture,
   		MinimapBorder,
		MiniMapMailBorder,
		MiniMapBattlefieldBorder,
		MiniMapLFGFrameBorder,
		CastingBarFrameBorder,
		FocusFrameSpellBarBorder,
		TargetFrameSpellBarBorder,
		select(1, TimeManagerClockButton:GetRegions()), 
		select(1, GameTimeFrame:GetRegions()),

              }) do
  
                 v:SetVertexColor(.05, .05, .05)
		
	end    
        self:UnregisterEvent("ADDON_LOADED")
        ef:SetScript("OnEvent", nil)
    end
end)
     
          for i,v in pairs({
   		
		BonusActionBarTexture0,
		BonusActionBarTexture1,
                MainMenuBarTexture0,
		MainMenuBarTexture1,
		MainMenuBarTexture2,
		MainMenuBarTexture3,
                MainMenuMaxLevelBar0,
                MainMenuMaxLevelBar1,
		MainMenuMaxLevelBar2,
		MainMenuMaxLevelBar3,
			
              }) do
  
                 v:SetVertexColor(.2, .2, .2)
  
              end 

          for i,v in pairs({
 
		MainMenuBarLeftEndCap,
                MainMenuBarRightEndCap,  

              }) do

                 v:SetVertexColor(.35, .35, .35)
  	      
	      end 


	local s = CreateFrame("Frame")
		s:RegisterEvent("ADDON_LOADED")
         	s:SetScript("OnEvent", function(self, event, addon)
             	if(addon=="Blizzard_ArenaUI") then
		ArenaEnemyFrame1Texture:SetVertexColor(0.1, 0.1, 0.1) ArenaEnemyFrame2Texture:SetVertexColor(0.1, 0.1, 0.1) ArenaEnemyFrame3Texture:SetVertexColor(0.1, 0.1, 0.1) ArenaEnemyFrame4Texture:SetVertexColor(0.1, 0.1, 0.1) ArenaEnemyFrame5Texture:SetVertexColor(0.1, 0.1, 0.1)
		end 
	end)

    cfg.textures = {
    normal            = "Interface\\AddOns\\Lorti UI\\media\\gloss",
    flash             = "Interface\\AddOns\\Lorti UI\\media\\flash",
    hover             = "Interface\\AddOns\\Lorti UI\\media\\hover",
    pushed            = "Interface\\AddOns\\Lorti UI\\media\\pushed",
    checked           = "Interface\\AddOns\\Lorti UI\\media\\checked",
    equipped          = "Interface\\AddOns\\Lorti UI\\media\\gloss_grey",
    buttonback        = "Interface\\AddOns\\Lorti UI\\media\\button_background",
    buttonbackflat    = "Interface\\AddOns\\Lorti UI\\media\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\Lorti UI\\media\\outer_shadow",
  }

  
  
    cfg.background = {
    showbg            = true,  --show an background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.3, g = 0.3, b = 0.3, a = 0.7},
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9},
    classcolored      = false,
    inset             = 5, 
  }


  
  cfg.color = {
    normal            = { r = 0, g = 0, b = 0, a = 0.9},
    equipped          = { r = 0.3, g = 0.55, b = 0.1},
    classcolored      = false,
  }
  
  cfg.hotkeys = {
    show            = true,
    fontsize        = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 }, 
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, 
  }
  
  cfg.macroname = {
    show            = false,
    fontsize        = 12,
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 }, 
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, 
  }
  
  cfg.itemcount = {
    show            = true,
    fontsize        = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, 
  }
  
  cfg.cooldown = {
    spacing         = 0,
  }
  
  cfg.font = "Fonts\\FRIZQT__.TTF"

  ns.cfg = cfg


--[[
local LortiUI = {}
local addon = LortiUI
local version = "1.6.4"
local addonName = "LUI"

addon.fontsDB = {

	["Normal"] = "GameFontNormalLarge",
	["Small"] = "GameFontNormal",
	["Large"] = "GameFontNormalHuge",
}

addon.spellDB = {
   
	-- Higher up = higher display prio
	
	-- immunitys
	"45438", -- Ice Block
	"33786", -- Cyclone
	"642", -- Divine Shield
	"1022", -- Hand of Protection
	"19263", -- Deterrence
	"46924", -- Bladestorm

	-- stuns
	"408", -- Kidney Shot
	"44572", -- Deep Freeze
	"1833", -- Cheap Shot
	"12809", -- Concussion Blow
	"46968", -- Shockwave
	"853", -- Hammer of Justice
	"85388", -- Throwdown
	"5211", -- Bash
	"19503", -- Scatter Shot
	"30283", -- Shadowfury
	"89766", -- Axe Toss
	"22570", -- Maim
	"9005", -- Pounce
	"1776", -- Gouge
	"6770", -- Sap
	"87195", -- Paralysis
	   
	--cc
	"605", -- Mind Control
	"64044", -- Psychic Horror
	"2094", -- Blind
	"118", -- Polymorph
	"51514", -- Hex
	"6789", -- Death Coil
	"5246", -- Intimidating Shout 
	"8122", -- Psychic Scream
	"5484", -- Howl of Terror
	"5782", -- Fear
	"6358", -- Seduction
	"1499", -- Freezing Trap
	"20066", -- Repentance
	"31661", -- Dragon's Breath
	"82691", -- Ring of Frost
	"49203", -- Hungering Cold
   
	-- cc immune


	-- silences
	"1330", -- Garrote - Silence
	"47476", -- Strangulate
	"55021", -- Silenced - Improved Counterspell
	"15487", -- Silence
	"19647", -- Spell Lock
	"34490", -- Silencing Shot
	"28730", -- Arcane Torrent
	

	-- dmg reductions
	"48792", -- Icebound Fortitude
	"48707", -- Anti-Magic Shell
	"33206", -- Pain Suppression
	"47585", -- Dispersion
	"871", -- Shield Wall
	"498", -- Divine Protection


	-- disarms
	"676", -- Disarm
	"51722", -- Dismantle
	

	--dmg buffs  
	"34692", -- The Beast Within
	"31884", -- Avenging Wrath
  

}

addon.f = CreateFrame("Frame", addonName.."mainFrame", UIParent)

-- main update frames
addon.TargetFrame = CreateFrame("Frame", addonName.."_TargetFrame", UIParent)
local tFrame = addon.TargetFrame
tFrame:SetWidth(1)
tFrame:SetHeight(1)
tFrame:SetFrameStrata("DIALOG")
addon.FocusFrame = CreateFrame("Frame", addonName.."_FocusFrame", UIParent)
local fFrame = addon.FocusFrame
fFrame:SetWidth(1)
fFrame:SetHeight(1)
fFrame:SetFrameStrata("DIALOG")
addon.PlayerFrame = CreateFrame("Frame", addonName.."_PlayerFrame", UIParent)
local pFrame = addon.PlayerFrame
pFrame:SetWidth(1)
pFrame:SetHeight(1)
pFrame:SetFrameStrata("DIALOG")
for i = 1, 4 do
	addon["PartyFrame"..i] = CreateFrame("Frame", addonName.."_PartyFrame"..i, UIParent)
	local frame = addon["PartyFrame"..i]
	frame:SetWidth(1)
	frame:SetHeight(1)
	frame:SetFrameStrata("DIALOG")
	-- print("created " .. frame:GetName())
end
for i = 1, 5 do
	addon["ArenaFrame"..i] = CreateFrame("Frame", addonName.."_ArenaFrame"..i, UIParent)
	local frame = addon["ArenaFrame"..i]
	frame:SetWidth(1)
	frame:SetHeight(1)
	frame:SetFrameStrata("DIALOG")
	-- print("created " .. frame:GetName())
end

addon.f:SetScript("OnEvent", function(self, event, ...) 
      if addon[event] then 
         return addon[event](addon, event, ...) 
      end 
end)

-- register events
addon.f:RegisterEvent("PLAYER_ENTERING_WORLD")

-- event functions
function addon:PLAYER_ENTERING_WORLD(event, ...)
	local _, instance = IsInInstance()
	if instance == "raid" then
		addon.f:UnregisterEvent("UNIT_AURA")
		addon.f:UnregisterEvent("PLAYER_TARGET_CHANGED")
		addon.f:UnregisterEvent("PLAYER_FOCUS_CHANGED")
		addon.f:UnregisterEvent("PARTY_MEMBERS_CHANGED")
		tFrame:SetScript("OnUpdate", nil)
		tFrame:Hide()
		fFrame:SetScript("OnUpdate", nil)
		fFrame:Hide()
		for i = 1, 4 do
			local frame = addon["PartyFrame"..i]
			frame:Hide()
			frame:SetScript("OnUpdate", nil)
		end
	else
		addon.f:RegisterEvent("UNIT_AURA")      
		addon.f:RegisterEvent("PLAYER_TARGET_CHANGED")
		addon.f:RegisterEvent("PLAYER_FOCUS_CHANGED")
		addon.f:RegisterEvent("PARTY_MEMBERS_CHANGED")
	end
	
		self.CreateAuraIcons(addonName.."TargetTexture", TargetFramePortrait, TargetFrame, tFrame)
		self.CreateAuraIcons(addonName.."FocusTexture", FocusFramePortrait, FocusFrame, fFrame)
		for i = 1, 4 do
			local frame = _G["PartyMemberFrame"..i]
			if frame then
				self.CreateAuraIcons(addonName.."PartyTexture"..i, frame.portrait, frame, addon["PartyFrame"..i])
			end
		end
end


function addon:ARENA_OPPONENT_UPDATE(event, unit, status)
	if (unit == "arena1" or unit == "arena2" or unit == "arena3" or unit == "arena4" or unit == "arena5") and status == "seen" then
		-- print("found unit: " .. unit)
		for i = 1, 5 do
			local frame = _G["ArenaEnemyFrame"..i]
			local petFrame = _G["ArenaEnemyFrame"..i.."PetFrame"]
			if frame and petFrame then
				self.CreateAuraIcons(addonName.."ArenaTexture"..i, frame.classPortrait, frame, addon["ArenaFrame"..i])
				frame:SetScale(1)
				petFrame:SetScale(1)
			end
		end
	end
end

function addon:UNIT_AURA(event, unit)
	if unit == "target" or unit == "focus" then
		addon.CheckAura(unit)
	end
	if (ArenaEnemyFrame1 or ArenaEnemyFrame2 or ArenaEnemyFrame3 or ArenaEnemyFrame4 or ArenaEnemyFrame5) then
		if unit == "arena1" or unit == "arena2" or unit == "arena3" or unit == "arena4" or unit == "arena5" then 
			addon.CheckAura(unit)
		end
	end
	
	if unit == "party1" or unit == "party2" or unit == "party3" or unit == "party4" then
		if (unit == "party1" and (PartyMemberFrame1:IsVisible())) or
			(unit == "party2" and (PartyMemberFrame2:IsVisible())) or
			(unit == "party3" and (PartyMemberFrame3:IsVisible())) or
			(unit == "party4" and (PartyMemberFrame4:IsVisible())) then
			addon.CheckAura(unit)
		end
	end
end

function addon:PLAYER_TARGET_CHANGED(event)
	if UnitExists("target") then
		-- print("target exists, check aura")
		if addon.PitBull_Loaded then
			if not tFrame.auraIcon then
				-- print("create icon target")
				self.CreateAuraIcons(addonName.."TargetTexture", PitBull4_Frames_target.Portrait, PitBull4_Frames_target.Portrait, tFrame)
			else
			tFrame.auraIcon:SetAllPoints(PitBull4_Frames_target.Portrait)
			-- print("already created target icon")
			end
		end
		addon.CheckAura("target")
	else
		tFrame:Hide()
	end
end

function addon:PLAYER_FOCUS_CHANGED(event)
	if UnitExists("focus") then
		addon.CheckAura("focus")
	else
		fFrame:Hide()
	end
end




-- other functions


function addon.CreateAuraIcons(name, portrait, parent, frame)
	if frame.auraIcon or not (parent and portrait) then return end
	frame.auraIcon = parent:CreateTexture(name, "OVERlAY")
	frame.auraIcon:SetPoint("CENTER", portrait)
	frame.auraIcon:SetAllPoints(portrait)
	if not frame.font then
		addon.CreateFontStrings(name .. "_Font", frame)
	end
	-- print("Created " .. frame.font:GetName())
end

function addon.CreateFontStrings(name, frame)
	local fontString
	for k, v in pairs(addon.fontsDB) do

			fontString = v
	end
	frame.font = frame:CreateFontString(name, "OVERLAY")
	frame.font:SetPoint("CENTER", frame.auraIcon, "CENTER")


	local newfont, size = _G[fontString]:GetFont()
	frame.font:SetFont(newfont, size, "OUTLINE")
	frame.font:SetText("")
	frame.font:SetTextColor(1, 1, 0)
	-- print("Created " .. frame.font:GetName())
end

function addon.SetFontSize(newFont, frame)
	if frame.font then
		local outlineFont, size = _G[newFont]:GetFont()
		frame.font:SetTextColor(1, 1, 0, 1)
		if frame:GetName():find("Party") or frame:GetName():find("Arena") then
			frame.font:SetFont(outlineFont, size/1.3, "OUTLINE")
		else
			frame.font:SetFont(outlineFont, size, "OUTLINE")
		end
	end
end

function addon.HideAll(unit)
	-- print("hide frame " .. unit)
	local frame = addon.GetUnitFrame(unit)
	if not frame then return end
	frame:Hide()
	if frame.auraIcon then
		frame.auraIcon:Hide()
	end
	if frame.font then
		frame.font:SetText("")
	end
end

function addon.CheckAura(unit)
	-- print("check aura " .. unit)
	for idx, spellID in ipairs(addon.spellDB) do
		local spell = GetSpellInfo(spellID)
		if UnitBuff(unit, spell) then
			local _, _, texture, _, _, _, eTime = UnitBuff(unit, spell)
			addon.SetAura(unit, texture, eTime)
			-- print("found buff " .. spell)
			return
		elseif UnitDebuff(unit, spell) then
			local _, _, texture, _, _, _, eTime = UnitDebuff(unit, spell)
			addon.SetAura(unit, texture, eTime)
			-- print("found debuff " .. spell)
			return
		end
	end
	-- print("found no auras")
	addon.HideAll(unit)
end

function addon.SetPortraitTexture(frame, texture)
	if not frame then return end
		SetPortraitToTexture(frame.auraIcon, texture)
end

function addon.SetAura(unit, texture, eTime)
	local frame = addon.GetUnitFrame(unit)
	if not frame then return end
	if not frame.auraIcon then return end
	-- print("updating frame: " .. frame:GetName() .. " tex: " .. texture)
	addon.SetPortraitTexture(frame, texture)
	--addon.SetFontSize(addon.fontsDB, frame)
	frame.texture = texture
	frame.font:SetText(string.format("%.1f", eTime-GetTime()))
	frame.eTime = eTime
	frame.name = unit
	frame:Show()
	frame.auraIcon:Show()
	frame:SetScript("OnUpdate", addon.UpdateTimer)
end


local total = 0.01

function addon.UpdateTimer(self, elapsed)
	total = total + elapsed
	if total >= 0.01 then 
		if self.eTime - GetTime() > 0 and UnitExists(self.name) and self:IsVisible() then
			addon.SetPortraitTexture(self, self.texture)	
			self.font:SetText(string.format("%.1f", self.eTime-GetTime()))
			total = 0
		else
			addon.HideAll(self.name)
		end
	end
end

function addon.GetUnitFrame(unit)
	local frame
	if unit == "target" then
		frame = tFrame
	elseif unit == "focus" then
		frame = fFrame
	elseif unit == "player" then
		frame = pFrame
	elseif unit == "party1" then
		frame = addon.PartyFrame1
	elseif unit == "party2" then
		frame = addon.PartyFrame2
	elseif unit == "party3" then
		frame = addon.PartyFrame3
	elseif unit == "party4" then
		frame = addon.PartyFrame4
	elseif unit == "arena1" then
		frame = addon.ArenaFrame1
	elseif unit == "arena2" then
		frame = addon.ArenaFrame2
	elseif unit == "arena3" then
		frame = addon.ArenaFrame3
	elseif unit == "arena4" then
		frame = addon.ArenaFrame4
	elseif unit == "arena5" then
		frame = addon.ArenaFrame5
	end	
	return frame
end

]]
