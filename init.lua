local addonName = "GearManagementAddon"
-- to be able to use the left and right arrows in the edit box without rotating your character
for i=1, NUM_CHAT_WINDOWS do
	_G["ChatFrame"..i.."EditBox"]:SetAltArrowKeyMode(false)
end

-- SavedVariablesPerCharacter
GearSet = {}
DataChar = {}
Rules = {}
CharStats = {}


-- other Variables
--shownSets = {}

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[---------------- Slash Commands ------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
SLASH_GSM1 = "/gsm"
SlashCmdList["GSM"] = function(msg)
	UIConfig.TabTwo:SetShown(false)
	UIConfig.TabThree:SetShown(false)
	UIConfig:SetShown(not UIConfig:IsShown())
end 

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------- Tab 1 ----------------------]]--
--[[--------------------- main -----------------------]]--
--[[--------------------------------------------------]]--
UIConfig = CreateFrame("Frame", "GearManager_main", UIParent, "BasicFrameTemplateWithInset");
UIConfig:SetSize(600, 660)
UIConfig:SetPoint("CENTER", UIConfig.TabTwo, "CENTER")
UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY")
UIConfig.title:SetFontObject("GameFontHighlight")
UIConfig.title:SetPoint("LEFT", UIConfig.TitleBg, "LEFT", 5, 0)
UIConfig.title:SetText("My gear management addon - Main")
UIConfig:SetMovable(true)
UIConfig:EnableMouse(true)
UIConfig:RegisterForDrag("LeftButton")

UIConfig.TabButton1 = CreateFrame("Button", "UIConfig_TabButton1", UIConfig, "TabButtonTemplate")
UIConfig.TabButton1:SetPoint("BOTTOMLEFT", UIConfig)
UIConfig.TabButton1:SetSize(100,100)
UIConfig.TabButton1:SetText("Main")
UIConfig.TabButton2 = CreateFrame("Button", "UIConfig_TabButton2", UIConfig, "TabButtonTemplate")
UIConfig.TabButton2:SetPoint("LEFT", UIConfig.TabButton1, "RIGHT")
UIConfig.TabButton2:SetSize(100,100)
UIConfig.TabButton2:SetText("Sets")
UIConfig.TabButton3 = CreateFrame("Button", "UIConfig.TabButton3", UIConfig, "TabButtonTemplate")
UIConfig.TabButton3:SetPoint("LEFT", UIConfig.TabButton2, "RIGHT")
UIConfig.TabButton3:SetSize(100,100)
UIConfig.TabButton3:SetText("Rules")

PanelTemplates_TabResize(UIConfig.TabButton1, 0, nil, UIConfig.TabButton1.minWidth);
PanelTemplates_TabResize(UIConfig.TabButton2, 0, nil, UIConfig.TabButton2.minWidth);
PanelTemplates_TabResize(UIConfig.TabButton3, 0, nil, UIConfig.TabButton3.minWidth);


UIConfig.btn1 = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.btn1:SetPoint("CENTER", UIConfig, "TOP", 0, -70);
UIConfig.btn1:SetSize(140, 40);
UIConfig.btn1:SetText("Create new set");
UIConfig.btn1:SetNormalFontObject("GameFontNormalLarge");
UIConfig.btn1:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.btn2 = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.btn2:SetPoint("CENTER", UIConfig.btn1, "TOP", 0, -70);
UIConfig.btn2:SetSize(140, 40);
UIConfig.btn2:SetText("Create new rule");
UIConfig.btn2:SetNormalFontObject("GameFontNormalLarge");
UIConfig.btn2:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.btn3 = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
UIConfig.btn3:SetPoint("CENTER", UIConfig.btn2, "TOP", 0, -70);
UIConfig.btn3:SetSize(140, 40);
UIConfig.btn3:SetText("Button");
UIConfig.btn3:SetNormalFontObject("GameFontNormalLarge");
UIConfig.btn3:SetHighlightFontObject("GameFontHighlightLarge");

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------- Tab 2 ----------------------]]--
--[[--------------------- Sets -----------------------]]--
--[[--------------------------------------------------]]--
UIConfig.TabTwo = CreateFrame("Frame", "GearManager_tabOne", UIParent, "BasicFrameTemplateWithInset")
UIConfig.TabTwo:SetSize(600, 660)
UIConfig.TabTwo:SetPoint("CENTER", UIConfig, "CENTER")
UIConfig.TabTwo.title = UIConfig.TabTwo:CreateFontString(nil, "OVERLAY")
UIConfig.TabTwo.title:SetFontObject("GameFontHighlight")
UIConfig.TabTwo.title:SetPoint("LEFT", UIConfig.TabTwo.TitleBg, "LEFT", 5, 0)
UIConfig.TabTwo.title:SetText("My gear management addon - Sets")
UIConfig.TabTwo:SetMovable(true)
UIConfig.TabTwo:EnableMouse(true)
UIConfig.TabTwo:RegisterForDrag("LeftButton")

UIConfig.TabTwo.TabButton1 = CreateFrame("Button", "UIConfig_TabTwo.TabButton1", UIConfig.TabTwo, "TabButtonTemplate")
UIConfig.TabTwo.TabButton1:SetPoint("BOTTOMLEFT", UIConfig.TabTwo)
UIConfig.TabTwo.TabButton1:SetSize(100,100)
UIConfig.TabTwo.TabButton1:SetText("Main")
UIConfig.TabTwo.TabButton2 = CreateFrame("Button", "UIConfig_TabTwo.TabButton2", UIConfig.TabTwo, "TabButtonTemplate")
UIConfig.TabTwo.TabButton2:SetPoint("LEFT", UIConfig.TabTwo.TabButton1, "RIGHT")
UIConfig.TabTwo.TabButton2:SetSize(100,100)
UIConfig.TabTwo.TabButton2:SetText("Sets")
UIConfig.TabTwo.TabButton3 = CreateFrame("Button", "UIConfig.TabTwo.Button3", UIConfig.TabTwo, "TabButtonTemplate")
UIConfig.TabTwo.TabButton3:SetPoint("LEFT", UIConfig.TabTwo.TabButton2, "RIGHT")
UIConfig.TabTwo.TabButton3:SetSize(100,100)
UIConfig.TabTwo.TabButton3:SetText("Rules")

PanelTemplates_TabResize(UIConfig.TabTwo.TabButton1, 0, nil, UIConfig.TabTwo.TabButton1.minWidth);
PanelTemplates_TabResize(UIConfig.TabTwo.TabButton2, 0, nil, UIConfig.TabTwo.TabButton2.minWidth);
PanelTemplates_TabResize(UIConfig.TabTwo.TabButton3, 0, nil, UIConfig.TabTwo.TabButton3.minWidth);

UIConfig.TabTwo.btn1 = CreateFrame("Button", "UIConfig.TabTwo.btnCreate", UIConfig.TabTwo, "GameMenuButtonTemplate");
UIConfig.TabTwo.btn1:SetPoint("TOPLEFT", UIConfig.TabTwo, "TOPLEFT", 20, -30);
UIConfig.TabTwo.btn1:SetSize(140, 40);
UIConfig.TabTwo.btn1:SetText("Create Set");
UIConfig.TabTwo.btn1:SetNormalFontObject("GameFontNormalLarge");
UIConfig.TabTwo.btn1:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.TabTwo.btn2 = CreateFrame("Button", "UIConfig.TabTwo.btnSave", UIConfig.TabTwo, "GameMenuButtonTemplate");
UIConfig.TabTwo.btn2:SetPoint("LEFT", UIConfig.TabTwo.btn1, "RIGHT", 5, 0);
UIConfig.TabTwo.btn2:SetSize(140, 40);
UIConfig.TabTwo.btn2:SetText("Save Set");
UIConfig.TabTwo.btn2:SetNormalFontObject("GameFontNormalLarge");
UIConfig.TabTwo.btn2:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.TabTwo.btn3 = CreateFrame("Button", "UIConfig.TabTwo.btnDelete", UIConfig.TabTwo, "GameMenuButtonTemplate");
UIConfig.TabTwo.btn3:SetPoint("LEFT", UIConfig.TabTwo.btn2, "RIGHT", 5, 0);
UIConfig.TabTwo.btn3:SetSize(140, 40);
UIConfig.TabTwo.btn3:SetText("Delete Set");
UIConfig.TabTwo.btn3:SetNormalFontObject("GameFontNormalLarge");
UIConfig.TabTwo.btn3:SetHighlightFontObject("GameFontHighlightLarge");

-- Create new Set Frame - Only creates new name! --
UIConfig.CreateSet = CreateFrame("Frame", "GearManager_createSet", UIParent, "BasicFrameTemplateWithInset")
UIConfig.CreateSet:SetSize(200, 100)
UIConfig.CreateSet:SetPoint("CENTER", UIConfig.TabTwo, "CENTER")
UIConfig.CreateSet.title = UIConfig.CreateSet:CreateFontString(nil, "OVERLAY")
UIConfig.CreateSet.title:SetFontObject("GameFontHighlight")
UIConfig.CreateSet.title:SetPoint("LEFT", UIConfig.CreateSet.TitleBg, "LEFT", 5, 0)
UIConfig.CreateSet.title:SetText("Create new set")
UIConfig.CreateSet:SetMovable(true)
--UIConfig.CreateSet:EnableMouse(true)
--UIConfig.CreateSet:RegisterForDrag("LeftButton")

UIConfig.CreateSet_name = CreateFrame("EditBox", "UIConfig.CreateSet_name", UIConfig.CreateSet, "ChatFrameEditBoxTemplate");
UIConfig.CreateSet_name:SetPoint("CENTER", UIConfig.CreateSet, "CENTER");
UIConfig.CreateSet_name:SetSize(140, 40);
UIConfig.CreateSet_name:SetTextInsets(22, 1, 1, 1)
UIConfig.CreateSet_name:SetText("enter name");


--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------- Tab 3 ----------------------]]--
--[[--------------------- Rules ----------------------]]--
--[[--------------------------------------------------]]--
UIConfig.TabThree = CreateFrame("Frame", "UIConfig.TabThree", UIParent, "BasicFrameTemplateWithInset")
UIConfig.TabThree:SetSize(600, 660)
UIConfig.TabThree:SetPoint("CENTER", UIConfig, "CENTER")
UIConfig.TabThree.title = UIConfig.TabThree:CreateFontString(nil, "OVERLAY")
UIConfig.TabThree.title:SetFontObject("GameFontHighlight")
UIConfig.TabThree.title:SetPoint("LEFT", UIConfig.TabThree.TitleBg, "LEFT", 5, 0)
UIConfig.TabThree.title:SetText("My gear management addon - Rules")
UIConfig.TabThree:SetMovable(true)
UIConfig.TabThree:EnableMouse(true)
UIConfig.TabThree:RegisterForDrag("LeftButton")

UIConfig.TabThree.TabButton1 = CreateFrame("Button", "UIConfig_TabThree.TabButton1", UIConfig.TabThree, "TabButtonTemplate")
UIConfig.TabThree.TabButton1:SetPoint("BOTTOMLEFT", UIConfig.TabThree)
UIConfig.TabThree.TabButton1:SetSize(100,100)
UIConfig.TabThree.TabButton1:SetText("Main")
UIConfig.TabThree.TabButton2 = CreateFrame("Button", "UIConfig_TabThree.TabButton2", UIConfig.TabThree, "TabButtonTemplate")
UIConfig.TabThree.TabButton2:SetPoint("LEFT", UIConfig.TabThree.TabButton1, "RIGHT")
UIConfig.TabThree.TabButton2:SetSize(100,100)
UIConfig.TabThree.TabButton2:SetText("Sets")
UIConfig.TabThree.TabButton3 = CreateFrame("Button", "UIConfig_TabThree.TabButton3", UIConfig.TabThree, "TabButtonTemplate")
UIConfig.TabThree.TabButton3:SetPoint("LEFT", UIConfig.TabThree.TabButton2, "RIGHT")
UIConfig.TabThree.TabButton3:SetSize(100,100)
UIConfig.TabThree.TabButton3:SetText("Rules")

PanelTemplates_TabResize(UIConfig.TabThree.TabButton1, 0, nil, UIConfig.TabThree.TabButton1.minWidth);
PanelTemplates_TabResize(UIConfig.TabThree.TabButton2, 0, nil, UIConfig.TabThree.TabButton2.minWidth);
PanelTemplates_TabResize(UIConfig.TabThree.TabButton3, 0, nil, UIConfig.TabThree.TabButton3.minWidth);

UIConfig.TabThree.btn1 = CreateFrame("Button", "UIConfig.TabThree.btnCreate", UIConfig.TabThree, "GameMenuButtonTemplate");
UIConfig.TabThree.btn1:SetPoint("TOPLEFT", UIConfig.TabThree, "TOPLEFT", 20, -30);
UIConfig.TabThree.btn1:SetSize(140, 40);
UIConfig.TabThree.btn1:SetText("Create Rule");
UIConfig.TabThree.btn1:SetNormalFontObject("GameFontNormalLarge");
UIConfig.TabThree.btn1:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.TabThree.btn2 = CreateFrame("Button", "UIConfig.TabThree.btnSave", UIConfig.TabThree, "GameMenuButtonTemplate");
UIConfig.TabThree.btn2:SetPoint("LEFT", UIConfig.TabThree.btn1, "RIGHT", 5, 0);
UIConfig.TabThree.btn2:SetSize(140, 40);
UIConfig.TabThree.btn2:SetText("-");
UIConfig.TabThree.btn2:SetNormalFontObject("GameFontNormalLarge");
UIConfig.TabThree.btn2:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.TabThree.btn3 = CreateFrame("Button", "UIConfig.TabThree.btnDelete", UIConfig.TabThree, "GameMenuButtonTemplate");
UIConfig.TabThree.btn3:SetPoint("LEFT", UIConfig.TabThree.btn2, "RIGHT", 5, 0);
UIConfig.TabThree.btn3:SetSize(140, 40);
UIConfig.TabThree.btn3:SetText("Delete Rule");
UIConfig.TabThree.btn3:SetNormalFontObject("GameFontNormalLarge");
UIConfig.TabThree.btn3:SetHighlightFontObject("GameFontHighlightLarge");

UIConfig.TabThree.Rules = CreateFrame("Frame", "UIConfig.TabThree.Rules", UIParent, "BasicFrameTemplateWithInset")
UIConfig.TabThree.Rules:SetSize(700, 760)
UIConfig.TabThree.Rules:SetPoint("CENTER", UIConfig, "CENTER")
UIConfig.TabThree.Rules.title = UIConfig.TabThree.Rules:CreateFontString(nil, "OVERLAY")
UIConfig.TabThree.Rules.title:SetFontObject("GameFontHighlight")
UIConfig.TabThree.Rules.title:SetPoint("LEFT", UIConfig.TabThree.Rules.TitleBg, "LEFT", 5, 0)
UIConfig.TabThree.Rules.title:SetText("Create new Rule")
UIConfig.TabThree.Rules:SetMovable(true)
UIConfig.TabThree.Rules:EnableMouse(true)
UIConfig.TabThree.Rules:RegisterForDrag("LeftButton")

UIConfig.TabThree.Rules.ScrollFrame = CreateFrame("ScrollFrame", nil, UIConfig.TabThree.Rules, "UIPanelScrolLFrameTemplate")
UIConfig.TabThree.Rules.ScrollFrame:SetSize(700, 760)
UIConfig.TabThree.Rules.ScrollFrame:SetPoint("TOPRIGHT", UIConfig.TabThree.Rules.InsetBg, "TOPRIGHT", 0, -5)
UIConfig.TabThree.Rules.ScrollFrame:SetPoint("BOTTOMLEFT", UIConfig.TabThree.Rules.InsetBg, "BOTTOMLEFT", 0, 5)
UIConfig.TabThree.Rules.ScrollFrame:SetClipsChildren(true) -- clips child elements into scroll frame - textures are cliped by default!
local child = CreateFrame("Frame", nil, UIConfig.TabThree.Rules.ScrollFrame)

child:SetSize(665, 2000)
UIConfig.TabThree.Rules.ScrollFrame:SetScrollChild(child)

child.bg = child:CreateTexture(nil, "BACKGROUND")
child.bg:SetAllPoints(true)
child.bg:SetColorTexture(1, 0, 0, 1)

f = CreateFrame("Frame", nil, child, "ThinBorderTemplate")
f:SetSize(400, 400)
f:SetPoint("CENTER", child, "CENTER", 0, 0)

--UIConfig.TabThree.Rules.ScrollFrame.ScrollBar:ClearAllPoints()
UIConfig.TabThree.Rules.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", UIConfig.TabThree.Rules.ScrollFrame, "TOPRIGHT", -15, -18)
UIConfig.TabThree.Rules.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.TabThree.Rules.ScrollFrame, "BOTTOMRIGHT", -7, 18)







--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[------------------ First start -------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
UIConfig.TabButton1:Disable()
UIConfig.TabTwo:Hide()
UIConfig.TabThree:Hide()
UIConfig.CreateSet_name:Hide()
UIConfig.CreateSet:Hide()
UIConfig.TabThree.Rules:Hide()

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[-------------------- Scripts ---------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
UIConfig:SetScript("OnDragStart", UIConfig.StartMoving)
UIConfig:SetScript("OnDragStop", UIConfig.StopMovingOrSizing)
UIConfig.TabTwo:SetScript("OnDragStart", UIConfig.TabTwo.StartMoving)
UIConfig.TabTwo:SetScript("OnDragStop", UIConfig.TabTwo.StopMovingOrSizing)
--UIConfig.CreateSet:SetScript("OnDragStart", UIConfig.CreateSet.StartMoving)
--UIConfig.CreateSet:SetScript("OnDragStop", UIConfig.CreateSet.StopMovingOrSizing)
UIConfig.TabThree.Rules:SetScript("OnDragStart", UIConfig.TabThree.Rules.StartMoving)
UIConfig.TabThree.Rules:SetScript("OnDragStop", UIConfig.TabThree.Rules.StopMovingOrSizing)


UIConfig.CreateSet_name:SetScript("OnEditFocusGained", function() UIConfig.CreateSet_name:SetText("") end)
UIConfig.CreateSet_name:SetScript("OnEnterPressed", 
										function() 
											createNewSet(UIConfig.CreateSet_name:GetText())
											UIConfig.CreateSet_name:SetText("")
											UIConfig.CreateSet_name:Hide()
											UIConfig.CreateSet:Hide()
											showGearSets(UIConfig.CreateSet_name:GetText())											
										end
								)
--UIConfig.CreateSet_name:SetScript("OnShow", function() print("editbox shown") UIConfig.CreateSet_name:SetPoint("CENTER", UIConfig.CreateSet, "CENTER") UIConfig.CreateSet_name:SetToplevel(true) end)
--UIConfig.CreateSet_name:SetScript("OnHide", function() print("editbox hidden") end)

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[---------------- Register Events -----------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
UIConfig:RegisterEvent("ADDON_LOADED") -- Fired when saved variables are loaded
UIConfig:RegisterEvent("BAG_UPDATE") -- Fired when new item in bag is found (or item is moved)
UIConfig:RegisterEvent("PLAYER_ENTERING_WORLD")


--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[----------------- Event Handler ------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
function UIConfig:OnEvent(event, arg1)

	if event == "PLAYER_ENTERING_WORLD" then
		print(event)
	end

	if event == "ADDON_LOADED" and arg1 == addonName then
		print(event, " - ", arg1)
		shownSets = {}
	end
 
	if event == "BAG_UPDATE" then 
			scanBag()
			--print("Bag updated!")
			--print(arg1)
			--printItems()
	end

end
UIConfig:SetScript("OnEvent", UIConfig.OnEvent);


--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[------------------- Functions --------------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
function scanBag()   
    -- Iterate over all item slots in all backpacks to get the item informations
    for i=0, 4 do        
        slots = GetContainerNumSlots(i);
		DataChar = {} -- clear the content in the table and save all items again
        for j=1, slots do
            _,_,_,quality,_,_,link,_,_,itemID = GetContainerItemInfo(i, j)
            if itemID ~= nil then
				stats = nil
				_,_,_,itemLevel,_,itemType,itemSubType,_,itemEquipLoc,_,_ = GetItemInfo(link)
				if link  ~= nil then
					stats = GetItemStats(link)
					--for key,value in pairs(stats) do print(key,value) end
				end
				if itemType ~= "Verschiedenes" and itemType ~= "Quest" and itemType ~= "Verbrauchbares" and itemType ~= "Handwerksmaterial" then -- Only shows equipment
					table.insert(DataChar, {itemID, link, itemLevel, itemType, itemSubType, itemEquipLoc, quality, stats})
				end
            end
        end
    end	
end

function printItems()

    for i=1, #DataChar do
        for j=1, 3 do             
			print(DataChar[i][j])			
		end					
    end 
	
end	

function printSets()


end

function getPlayerStats()

	CharStats = {} -- clear the content in the table and save all stats again

	baseManaRegen, castingManaRegen = GetManaRegen()
	inactivePowerRegen, activePowerRegen = GetPowerRegen()
	baseArmor, effectiveArmor, armor, posBuffArmor, negBuffArmor = UnitArmor("player")
	baseAttackPower, posBuffAttackPower, negBuffAttackPower = UnitAttackPower("player")
	attackSpeed, offhandAttackSpeed = UnitAttackSpeed("player")
	minDamage, maxDamage, minOffHandDamage, maxOffHandDamage, physicalBonusPosDamage, physicalBonusNegDamage, percentDamage = UnitDamage("player")
	baseDefense, modifierDefense = UnitDefense("player")
	rangedAttackBase, rangedAttackMod = UnitRangedAttack("player")
	baseAttackPower, posBuffAttackPower, negBuffAttackPower = UnitRangedAttackPower("player")
	rangedAttackSpeed, minRangedDamage, maxRangedDamage, physicalBonusPosRangedDamage, physicalBonusNegRangedDamage, percentRangedDamage = UnitRangedDamage("player")
	statStrength, effectiveStatStrength, posBuffStatStrength, negBuffStatStrength = UnitStat("player", 1)
	statAgility, effectiveStatAgility, posBuffStatAgility, negBuffStatAgility = UnitStat("player", 2)
	statStamina, effectiveStatStamina, posBuffStatStamina, negBuffStatStamina = UnitStat("player", 3)
	statIntellect, effectiveStatIntellect, posBuffStatIntellect, negBuffStatIntellect = UnitStat("player", 4)
	overall, equipped = GetAverageItemLevel()
	
	table.insert(CharStats, {"BlockChance", GetBlockChance()}) -- [1]
	table.insert(CharStats, {"CritChance", GetCritChance()}) -- [2]
	table.insert(CharStats, {"DodgeChance", GetDodgeChance()}) -- [3]	
	table.insert(CharStats, {"Haste", GetHaste()}) -- [4]
	table.insert(CharStats, {"Lifesteal", GetLifesteal()}) -- [5]
	table.insert(CharStats, {"Mastery", GetMastery()}) -- [6]
	table.insert(CharStats, {"MasteryEffect", GetMasteryEffect()}) -- [7]          -- 2 return values?
	table.insert(CharStats, {"MeleeHaste", GetMeleeHaste()}) -- [8]
	table.insert(CharStats, {"ParryChance", GetParryChance()}) -- [9]
	table.insert(CharStats, {"RangedCritChance", GetRangedCritChance()}) -- [10]
	table.insert(CharStats, {"RangedHaste", GetRangedHaste()}) -- [11]
	table.insert(CharStats, {"ShieldBlock", GetShieldBlock()}) -- [12]
	table.insert(CharStats, {"ManaRegen", baseManaRegen, castingManaRegen}) -- [13]
	table.insert(CharStats, {"PowerRegen", inactivePowerRegen, activePowerRegen}) -- [14]
	table.insert(CharStats, {"Armor", baseArmor, effectiveArmor, armor, posBuffArmor, negBuffArmor}) -- [15]
	table.insert(CharStats, {"AttackPower", baseAttackPower, posBuffAttackPower, negBuffAttackPower}) -- [16]
	table.insert(CharStats, {"AttackSpeed", attackSpeed, offhandAttackSpeed}) -- [17]
	table.insert(CharStats, {"Damage", minDamage, maxDamage, minOffHandDamage, maxOffHandDamage, physicalBonusPosDamage, physicalBonusNegDamage, percentDamage}) -- [18]
	table.insert(CharStats, {"Defense", baseDefense, modifierDefense}) -- [19]
	table.insert(CharStats, {"RangedAttack", rangedAttackBase, rangedAttackMod}) -- [20]
	table.insert(CharStats, {"AttackPower", baseAttackPower, posBuffAttackPower, negBuffAttackPower}) -- [21]
	table.insert(CharStats, {"AttackSpeed", rangedAttackSpeed, minRangedDamage, maxRangedDamage, physicalBonusPosRangedDamage, physicalBonusNegRangedDamage, percentRangedDamage}) -- [22]	
	table.insert(CharStats, {"Strength", statStrength, effectiveStatStrength, posBuffStatStrength, negBuffStatStrength}) -- [23]
	table.insert(CharStats, {"Agility", statAgility, effectiveStatAgility, posBuffStatAgility, negBuffStatAgility}) -- [24]
	table.insert(CharStats, {"Stamina", statStamina, effectiveStatStamina, posBuffStatStamina, negBuffStatStamina}) -- [25]
	table.insert(CharStats, {"Intellect", statIntellect, effectiveStatIntellect, posBuffStatIntellect, negBuffStatIntellect}) -- [26]
	table.insert(CharStats, {"MaxHP", UnitHealthMax("player")}) -- [27]
	table.insert(CharStats, {"Ilvl", overall, equipped}) -- [28]
	
end

function checkTable(t, v)
	if #t == 0 then
		return false
	else
		exists = true
		for i = 1, #t, 1 do
			if t[i][1] == v then
				print("already exists")
				return true
			else 
				exists = false
			end
		end
		if exists == false then
			print("created")
			return false
		end
	end
end

function saveNewGearSets(name)

	table.insert(GearSet, {name})

end

-- Creates a new entry for a set
function createNewSet(name)
	
	saveNewGearSets(name)

end

function showGearSets(editBoxSetName)



	for i = 1, #GearSet, 1 do
			set = {}
			if checkTable(shownSets, "TabTwo_set."..i) == false then
				
				TabTwo_set = "TabTwo_set."..i
				name = TabTwo_set
				set[TabTwo_set] = CreateFrame("Frame", TabTwo_set, UIConfig.TabTwo, "ThinBorderTemplate")
				set[TabTwo_set]:SetSize(560, 50)
				fontString = set[TabTwo_set]:CreateFontString(fontString, "ARTWORK", nil)
				fontString:SetPoint("LEFT", set[TabTwo_set], "LEFT", 5, 0)
				fontString:SetFont("Fonts\\FRIZQT__.TTF", 20)
				fontString:SetText(GearSet[i][1])
				fontString:Show()	
				
				set[TabTwo_set].btn1 = CreateFrame("Button", "UIConfig.TabTwo_sets.btn1", set[TabTwo_set], "GameMenuButtonTemplate");
				set[TabTwo_set].btn1:SetPoint("RIGHT", set[TabTwo_set], "RIGHT", -5, 0);
				set[TabTwo_set].btn1:SetSize(0, 40);
				set[TabTwo_set].btn1:SetText("Update rules");
				set[TabTwo_set].btn1:SetNormalFontObject("GameFontNormalLarge");
				set[TabTwo_set].btn1:SetHighlightFontObject("GameFontHighlightLarge");	
				
				set[TabTwo_set].btn2 = CreateFrame("Button", "UIConfig.TabTwo_sets.btn2", set[TabTwo_set].btn1, "GameMenuButtonTemplate");
				set[TabTwo_set].btn2:SetPoint("RIGHT", set[TabTwo_set].btn1, "LEFT", -5, 0);
				set[TabTwo_set].btn2:SetSize(0, 40);
				set[TabTwo_set].btn2:SetText("Show gear");
				set[TabTwo_set].btn2:SetNormalFontObject("GameFontNormalLarge");
				set[TabTwo_set].btn2:SetHighlightFontObject("GameFontHighlightLarge");			
				PanelTemplates_TabResize(set[TabTwo_set].btn1, 0, nil, set[TabTwo_set].btn1.minWidth);
				PanelTemplates_TabResize(set[TabTwo_set].btn2, 0, nil, set[TabTwo_set].btn2.minWidth);
				
				table.insert(shownSets, {TabTwo_set, set[TabTwo_set], set[TabTwo_set].btn1, set[TabTwo_set].btn2})
			end

			if i == 1 then
				shownSets[i][2]:SetPoint("CENTER", UIConfig.TabTwo, "TOP", 0, -100)
			elseif i > 1 then
	
				shownSets[i][2]:SetPoint("CENTER", shownSets[i-1][2], "BOTTOM", 0, -20)
			end
	end


--[[
	print("sets loaded")
	for i = 1, #GearSet, 1 do

			if checkTable(shownSets, "UIConfig.TabTwo_sets"..i) == false then
				--UIConfig.TabTwo_sets = "UIConfig.TabTwo_sets"..i
				
				shownSets["UIConfig.TabTwo_sets."..i] = CreateFrame("Frame", "UIConfig.TabTwo_sets", UIConfig.TabTwo, "ThinBorderTemplate")
				UIConfig.TabTwo_sets:SetSize(560, 50)
				
				fontString = UIConfig.TabTwo_sets:CreateFontString(fontString, "ARTWORK", nil)
				fontString:SetPoint("LEFT", UIConfig.TabTwo_sets, "LEFT", 5, 0)
				fontString:SetFont("Fonts\\FRIZQT__.TTF", 20)
				fontString:SetText(GearSet[i][1])
				fontString:Show()	
				
				UIConfig.TabTwo_sets.btn1 = CreateFrame("Button", "UIConfig.TabTwo_sets.btn1", UIConfig.TabTwo_sets, "GameMenuButtonTemplate");
				UIConfig.TabTwo_sets.btn1:SetPoint("RIGHT", UIConfig.TabTwo_sets, "RIGHT", -5, 0);
				UIConfig.TabTwo_sets.btn1:SetSize(0, 40);
				UIConfig.TabTwo_sets.btn1:SetText("Update rules");
				UIConfig.TabTwo_sets.btn1:SetNormalFontObject("GameFontNormalLarge");
				UIConfig.TabTwo_sets.btn1:SetHighlightFontObject("GameFontHighlightLarge");	
				
				UIConfig.TabTwo_sets.btn2 = CreateFrame("Button", "UIConfig.TabTwo_sets.btn2", UIConfig.TabTwo_sets.btn1, "GameMenuButtonTemplate");
				UIConfig.TabTwo_sets.btn2:SetPoint("RIGHT", UIConfig.TabTwo_sets.btn1, "LEFT", -5, 0);
				UIConfig.TabTwo_sets.btn2:SetSize(0, 40);
				UIConfig.TabTwo_sets.btn2:SetText("Show gear");
				UIConfig.TabTwo_sets.btn2:SetNormalFontObject("GameFontNormalLarge");
				UIConfig.TabTwo_sets.btn2:SetHighlightFontObject("GameFontHighlightLarge");			
				PanelTemplates_TabResize(UIConfig.TabTwo_sets.btn1, 0, nil, UIConfig.TabTwo_sets.btn1.minWidth);
				PanelTemplates_TabResize(UIConfig.TabTwo_sets.btn2, 0, nil, UIConfig.TabTwo_sets.btn2.minWidth);
				
				name = "UIConfig.TabTwo_sets"..i
				table.insert(shownSets, {name, UIConfig.TabTwo_sets})
				
			end
			print(shownSets[1][1])
			if i == 1 then
				shownSets[i][2]:SetPoint("CENTER", UIConfig.TabTwo, "TOP", 0, -100)
			elseif i > 1 then
	
				shownSets[i][2]:SetPoint("CENTER", shownSets[i-1][2], "BOTTOM", 0, -20)
			end
	end
	
--]]	
	
	
end


--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[--------------- MainFrame-Buttons ----------------]]--
--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
UIConfig.btn1:SetScript("OnClick", 
    function(self, button)
		printSets()
    end
)	
UIConfig.btn2:SetScript("OnClick", 
    function(self, button)
		printItems()
    end
)	
UIConfig.btn3:SetScript("OnClick", 
    function(self, button)
		getPlayerStats()
	end
)
UIConfig.TabButton1:SetScript("OnClick",  -- Main
    function(self, button)
		-- Button should be disabled!
    end
)
UIConfig.TabButton2:SetScript("OnClick",  -- Sets
function(self, button)	
		UIConfig.TabTwo:SetPoint(UIConfig:GetPoint())
		UIConfig:Hide()
		UIConfig.TabTwo:Show()
		UIConfig.TabTwo.TabButton1:Enable()
		UIConfig.TabTwo.TabButton2:Disable()
		UIConfig.TabTwo.TabButton3:Enable()
		showGearSets(nil)
    end
)
UIConfig.TabButton3:SetScript("OnClick",  -- Rules
function(self, button)	
		UIConfig.TabThree:SetPoint(UIConfig:GetPoint())
		UIConfig:Hide()
		UIConfig.TabThree:Show()
		UIConfig.TabThree.TabButton1:Enable()
		UIConfig.TabThree.TabButton2:Enable()
		UIConfig.TabThree.TabButton3:Disable()
    end
)

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[----------------- TabTwo-Buttons -----------------]]--
--[[---------------------- Sets ----------------------]]--
--[[--------------------------------------------------]]--

UIConfig.TabTwo.TabButton1:SetScript("OnClick", -- Main
    function(self, button)
		--UIConfig:SetPoint(UIConfig:GetPoint())
		UIConfig.TabTwo:Hide()
		UIConfig:Show()
		UIConfig.TabButton1:Disable()
		UIConfig.TabButton2:Enable()
		UIConfig.TabButton3:Enable()
    end
)
UIConfig.TabTwo.TabButton2:SetScript("OnClick", -- Sets
    function(self, button)
		-- Button should be disabled!
    end
)
UIConfig.TabTwo.TabButton3:SetScript("OnClick", -- Rules
    function(self, button)
		UIConfig.TabThree:SetPoint(UIConfig:GetPoint())
		UIConfig.TabTwo:Hide()
		UIConfig.TabThree:Show()
		UIConfig.TabThree.TabButton1:Enable()
		UIConfig.TabThree.TabButton2:Enable()
		UIConfig.TabThree.TabButton3:Disable()
    end
)


UIConfig.TabTwo.btn1:SetScript("OnClick",   -- Create Set
    function(self, button)
		if #shownSets >= 12 or #GearSet >= 12 then
			print("You have reached the maximum count of sets!")
		else 
			UIConfig.CreateSet:Show()
			UIConfig.CreateSet_name:Show()
			UIConfig.CreateSet_name:SetToplevel(true)
		end	
    end
)

--[[--------------------------------------------------]]--
--[[--------------------------------------------------]]--
--[[---------------- TabThree-Buttons ----------------]]--
--[[---------------------- Rules ---------------------]]--
--[[--------------------------------------------------]]--
UIConfig.TabThree.btn1:SetScript("OnClick", 
    function(self, button)
		UIConfig.TabThree.Rules:SetToplevel(true)
		UIConfig.TabThree.Rules:Show()
    end
)	
UIConfig.TabThree.btn2:SetScript("OnClick", 
    function(self, button)
		
    end
)	
UIConfig.TabThree.btn3:SetScript("OnClick", 
    function(self, button)
		
	end
)


UIConfig.TabThree.TabButton1:SetScript("OnClick", -- Main
    function(self, button)
		--UIConfig:SetPoint(UIConfig:GetPoint())
		UIConfig.TabThree:Hide()
		UIConfig:Show()
		UIConfig.TabButton1:Disable()
		UIConfig.TabButton2:Enable()
		UIConfig.TabButton3:Enable()
    end
)
UIConfig.TabThree.TabButton2:SetScript("OnClick", -- Sets
    function(self, button)
		UIConfig.TabTwo:SetPoint(UIConfig:GetPoint())
		UIConfig.TabTwo:Show()
		UIConfig.TabThree:Hide()
		UIConfig.TabTwo.TabButton1:Enable()
		UIConfig.TabTwo.TabButton2:Disable()
		UIConfig.TabTwo.TabButton3:Enable()
		showGearSets(nil)
    end
)
UIConfig.TabThree.TabButton3:SetScript("OnClick", -- Rules
    function(self, button)
		-- Button should be disabled!
    end
)

