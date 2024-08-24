state("GoW")
{
    //orginal address
    string100 SaveDescript : 0x22C67E0; //Location + objective in string
    int Obj : 0x22C6904; //Objective in int; Null objective = 0
    int Load : 0x22E9DB0; //0 not loading; 257/256 loading
    int Shop : 0x2448448; //0 out of the shop; 2 in the shop
    int Valk : 0x2D43714; //36628 = 0 valks; 38192 all valks
    int SkapSlag : 0x0142B1E0, 0x0, 0x28, 0x20, 0x0, 0x40, 0x17B0; //tracks current Skap Slag
    string5 MRT : 0x01580010, 0x2A8, 0x0; //Tracks the number of odin ravens destroyed in midgard
    int ORL : 0x01425F90, 0x9AC0; //Tracks the number for the labor of odins ravens

    //address for all the helmets of the Valks a lot easier than having the obj number
    int GunnrHelmet : 0x014261C0, 0x230; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int GöndulHelmet : 0x014261C0, 0x270; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int GeirdrifulHelmet : 0x014261C0, 0x2B0; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int KaraHelmet : 0x014261C0, 0x2F0; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int RòtaHelmet : 0x014261C0, 0x330; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int EirHelmet : 0x014261C0, 0x370; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int HildrHelmet : 0x014261C0, 0x3B0; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int OlrunHelmet : 0x014261C0, 0x3F0; //-1 when u dont have the helmet 1 when u do then 0 if u plcae it on the council of the valks
    int SigrunHelmet : 0x014261C0, 0x430; // -1 when u dont have the helmet 1 when u do
}

startup
{
    settings.Add("Split for main game", false);
    settings.Add("Split for Valkyrie%", false);
    vars.PrevObj = -1;
    vars.PrevShop = -1;
    vars.PrevValk = -1;

    settings.Add("100% NG+", false);
    settings.SetToolTip("100% NG+", "Enable this for the other option bellow. IMPORTANT! the stuff bellow is follows TpRedNinja's 100% splits and route so might not line up with your splits");
    settings.Add("Main Story", false, "Main Story splits", "100% NG+");
    settings.SetToolTip("Main Story", "Splits for certain mainstory stuff such as 1st troll fight, completeing the story portion of alfheim, & some other place");
    settings.Add("Valks", false, "Valkyrie splits", "100% NG+");
    settings.SetToolTip("Valks", "Splits whenever you gain one of the Valkyrie's helmets");
    settings.Add("Side Stuff", false, "Collectible splits", "100% NG+");
    settings.SetToolTip("Side Stuff", "Splits whenever you gain 5, 9, or 18 skap slag such as certain obj, realm tears completion, completing labors/artifact sets, & unlocking a new realm");
    settings.Add("Locations", false, "Location splits", "100% NG+");
    settings.SetToolTip("Locations", "Splits when you leave Stone falls after first visit and second visit, Brui storeroom, isle of death, iron cove, when you are at the foothills going into the valkyrie area, after atreus kills modi, then finally when you do the final clumb to the peak for the second time around");
    vars.completedsplits = new List<string>();
    vars.Hundo = new List<string>();
}

init
{
    if (settings["100% NG+"])
    {
        vars.Hundo = new List<string>{
            "Toys",
            "Baldur Fight I",
            "Foothills I",
            "Realm Tear I",
            "Foothills II",
            "Mimir",
            "Volunder Mines",
            "Dragon I",
            "Horns",
            "River Pass II",
            "Chisel",
            "Realm Tear II",
            "Realm Tear III",
            "Northi Stronghold",
            "I think I broke him",
            "Helheim I",
            "Masks",
            "Landsuther Mines",
            "Realm Tear IV",
            "Dead Freight",
            "Realm Tear 5",
            "Dragon II",
            "Anatomy of Hope",
            "Realm Tear VI",
            "Hammer Fall",
            "Tyr's Vault",
            "Cups",
            "Realm Tear VII",
            "Mountain 100%",
            "Helheim Story",
            "Heirloom",
            "Realm Tear VIII",
            "Spoils of War",
            "Dragon III",
            "Realm Tear IX",
            "Konusgard Done",
            "Unfinished Buisness",
            "Ship Heads",
            "Realm Tear X",
            "Unity Stone",
            "Gauntlet of the Realms",
            "Time for Jotunheim...lol jk",
            "Trial I Normal",
            "Trial I Hard",
            "Trial II Normal",
            "Trial II Hard",
            "Trial III Normal",
            "Trial III Hard",
            "Trial IV Normal",
            "Trial IV Hard",
            "Trial V Normal",
            "Trial V Hard",
            "Nifelheim",
            "Hildr",
            "Ivaldi's Workshop",
            "Ivaldi's Protection",
            "Ivaldi's Curse",
            "Council",
            "Realm Tears XIII",
            "Discover",
            "Open",
            "Realm Tear XIV",
            "Baldur fight II",
            "JOTUNHEIM!"
        };
    }
}

onStart
{
    vars.PrevObj = current.Obj;
    vars.PrevValk = current.Valk;
}

start
{
    if (settings["Split for main game"] && current.Obj == 0 && vars.PrevObj != 0){
        return true;
    }
    else if (settings["Split for main game"] && vars.PrevObj == 0){
        vars.PrevObj = current.Obj;
    }
    if (settings["Split for Valkyrie%"] && vars.PrevShop > current.Shop){
        return true;
    }
    else if (settings["Split for Valkyrie%"] && vars.PrevShop != current.Shop){
        vars.PrevShop = current.Shop;
    }
}

split
{
    if (settings["Split for Valkyrie%"] && vars.PrevValk < current.Valk)
    {
        vars.PrevValk = current.Valk;
        return true;
    }
    
    if (settings["Split for main game"] && vars.PrevObj != current.Obj)
    {
        vars.PrevObj = current.Obj;
        return true;
    }

    //splits whenever skapslag increases by 5, 9, or 18
    if (settings["Side Stuff"] && (current.SkapSlag == old.SkapSlag + 5 || current.SkapSlag == old.SkapSlag + 9 || current.SkapSlag == old.SkapSlag + 18))
    {
        vars.completedsplits.Add(vars.Hundo[0]);
        vars.Hundo.RemoveAt(0);
        return true;
    } else if (settings["Side Stuff"] && current.SkapSlag == old.SkapSlag + 9 && (current.GunnrHelmet == 0 || current.KaraHelmet == 0 || current.GeirdrifulHelmet == 0 || current.EirHelmet == 0 || current.RòtaHelmet == 0 || current.OlrunHelmet == 0 || current.GöndulHelmet == 0 || current.HildrHelmet == 0))
    {
        return false;
    } else if (settings["Side Stuff"] && current.SkapSlag == old.SkapSlag + 9 && current.ORL == 51 && current.Obj == 3568 && current.MRT != "43/43" )
    {
        return false;
    }
   
    if (settings[Locations] && current.SaveDescript == "Midgard - Shores of Nine - Return to the Witch's Cave" && old.SaveDescript == "Midgard - Stone Falls - Return to the Witch's Cave")
    {
        vars.completedsplits.inserts(0, "Stone Falls I");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - Iron Cove - Return to Týr’s Vault" && old.SaveDescript == "Midgard - Isle of Death - Return to Týr’s Vault")
    {
        vars.completedsplits.inserts(0, "Isle of Death");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - Shores of Nine - Return to Týr’s Vault" && old.SaveDescript == "Midgard - Iron Cove - Return to Týr’s Vault")
    {
        vars.completedsplits.inserts(0, "Iron Cove");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - Shores of Nine - Return to Týr’s Vault" && old.SaveDescript == "Midgard - Stone Falls - Return to Týr’s Vault")
    {
        vars.completedsplits.inserts(0, "Stone Falls 100%");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - Shores of Nine - Return to Týr’s Vault" && old.SaveDescript == "Midgard - Buri’s Storeroom - Return to Týr’s Vault")
    {
        vars.completedsplits.inserts(0, "Buri's Storeroom");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - Hidden Chamber of Odin - Journey back to the mountain" && old.SaveDescript == "Midgard - Foothills - Journey back to the mountain")
    {
        vars.completedsplits.inserts(0, "Foothills III");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - The Mountain - Journey back to the mountain" && old.SaveDescript == "Midgard - Foothills - Journey back to the mountain")
    {
        vars.completedsplits.inserts(0, "Foothills 100%");
        return true;
    } else if (settings[Locations] && current.SaveDescript == "Midgard - Hidden Chamber of Odin - Find a new path up to the summit" && old.SaveDescript == "Midgard - The Mountain - Find a new path up to the summit")
    {
        vars.completedsplits.inserts(0, "Mountain II");
        return true;
    } 
    
    //Splits whenever you gain helmets
    if (settings["Valks"] && current.GunnrHelmet == 1 && old.GunnrHelmet != 1)
    {
        vars.completedsplits.insert(0, "Gunnr");
        return true;
    } else if (settings["Valks"] && current.KaraHelmet == 1 && old.KaraHelmet != 1)
    {
        vars.completedsplits.insert(0, "Kara");
        return true;
    }  else if (settings["Valks"] && current.GeirdrifulHelmet == 1 && old.GeirdrifulHelmet != 1)
    {
        vars.completedsplits.insert(0, "Geirdriful");
        return true;
    }  else if (settings["Valks"] && current.EirHelmet == 1 && old.EirHelmet != 1)
    {
        vars.completedsplits.insert(0, "Eir");
        return true;
    } else if (settings["Valks"] && current.RòtaHelmet == 1 && old.RòtaHelmet != 1)
    {
        vars.completedsplits.insert(0, "Ròta");
        return true;
    } else if (settings["Valks"] && current.OlrunHelmet == 1 && old.OlrunHelmet != 1)
    {
        vars.completedsplits.insert(0, "Olrun");
        return true;
    } else if (settings["Valks"] && current.GöndulHelmet == 1 && old.GöndulHelmet != 1)
    {
        vars.completedsplits.insert(0, "Göndul");
        return true;
    } else if (settings["Valks"] && current.SigrunHelmet == 1 && old.SigrunHelmet != 1)
    {
        vars.completedsplits.insert(0, "Sigrun");
        return true;
    }

    //Splits during certain story points the inserts should give you a clear idea on where that would be
    if (settings["Main Story"] && current.Obj == 678 && old.Obj == 4620)
    {
        vars.completedsplits.insert(0, "Troll Fight");
        return true;
    } else if (settings["Main Story"] && current.Obj == 698 && old.Obj == 692)
    {
        vars.completedsplits.insert(0, "River Pass I");
        return true;
    } else if (settings["Main Story"] && current.Obj == 734 && old.Obj == 3701)
    {
        vars.completedsplits.insert(0, "Alfheim Story");
        return true;
    } else if (settings["Main Story"] && current.Obj == 40077 && old.Obj == 736)
    {
        vars.completedsplits.insert(0, "Alfheim I");
        return true;
    } else if (settings["Main Story"] && current.Obj == 756 && old.Obj == 43039)
    {
        vars.completedsplits.insert(0, "Boy is a god!");
        return true;
    } else if (settings["Main Story"] && current.Obj == 1416 && old.Obj == 760)
    {
        vars.completedsplits.insert(0, "Tyr's Vault Puzzles");
        return true;
    } else if (settings["Main Story"] && current.Obj == 43063 && old.Obj == 1416)
    {
        vars.completedsplits.insert(0, "Grendel Twins Fight");
        return true;
    }else if (settings["Main Story"] && current.Obj == 21391 && old.Obj == 3574)
    {
        vars.completedsplits.insert(0, "Into the Giant Snake");
        return true;
    } else if (settings["Main Story"] && current.Obj == 19891 && old.Obj == 19884)
    {
        vars.completedsplits.insert(0, "Finish");
        return true;
    }
}


isLoading
{
    return (current.Load != 0);
}

onReset
{
    vars.PrevShop = -1;
}
