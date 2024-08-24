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
    settings.Add("Main Story", false, "100% NG+")
    settings.SetToolTip("Main Story", "Splits for the main story");
    settings.Add("Valks", false, "100% NG+")
    settings.SetToolTip("Valks", "Splits whenever you gain one of the Valkyrie's helmets");
    settings.Add("Side Stuff", false, "100% NG+")
    settings.SetToolTip("Side Stuff", "Splits whenever you gain 9 skap slag such as certain obj, realm tears completion, completing labors/artifact sets, & unlocking a new realm");

    vars.completedsplits = new List<string>();
    vars.Hundo = new List<string>();
}

init
{
    if (settings["100% NG+"])
    {
        vars.Hundo = new List<string>{
            "Toys",
            "Baldur Fight I"
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
            "Helheim I"
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
            "Mountain 100%"
            "Helheim Story".
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

    //splits whenever skapslag increases by 9 or 18
    if (settings["Side Stuff"] && current.SkapSlag == old.SkapSlag + 5 || 9 || 18 )
    {
        vars.completedsplits.Add(vars.Hundo[0]);
        vars.Hundo.RemoveAt(0);
        return true;
    } else if (settings["Side Stuff"] && current.SkapSlag == old.SkapSlag + 9 && (current.GunnrHelmet || current.KaraHelmet || current.Geirdriful || current.EirHelmet || current.RòtaHelmet || current.OlrunHelmet ||current.GöndulHelmet || current.HildrHelmet == 0))
    {
        return false;
    } else if (settings["Side Stuff"] && current.SkapSlag == old.SkapSlag + 9 && current.ORL == 51 && current.Obj == 3568 && current.MRT != "43/43" )
    {
        return false;
    }
   
    /*if (settings["Side Stuff"] && current.SaveDescript == "" && old.SaveDescript == "")
    {
        vars.completedsplits.inserts(0, "Stone Falls I");
        return true;
    } else if (settings["Side Stuff"] && current.SaveDescript == "" && old.SaveDescript == "")
    {
        vars.completedsplits.inserts(0, "Isle of Death");
        return true;
    } else if (settings["Side Stuff"] && current.SaveDescript == "" && old.SaveDescript == "")
    {
        vars.completedsplits.inserts(0, "Iron Cove");
        return true;
    } else*/ if (settings["Side Stuff"] && current.SaveDescript == "Midgard - Shores of Nine - Return to Týr’s Vault" && old.SaveDescript == "Midgard - Stone Falls - Return to Týr’s Vault")
    {
        vars.completedsplits.inserts(0, "Stone Falls 100%");
        return true;
    } else if (settings["Side Stuff"] && current.SaveDescript == "Midgard - Shores of Nine - Return to Týr’s Vault" && old.SaveDescript == "Midgard - Buri’s Storeroom - Return to Týr’s Vault")
    {
        vars.completedsplits.inserts(0, "Buri's Storeroom");
        return true;
    } else if (settings["Side Stuff"] && current.SaveDescript == "Midgard - Hidden Chamber of Odin - Journey back to the mountain" && old.SaveDescript == "Midgard - Foothills - Journey back to the mountain")
    {
        vars.completedsplits.inserts(0, "Foothills III");
        return true;
    } else if (settings["Side Stuff"] && current.SaveDescript == "Midgard - The Mountain - Journey back to the mountain" && old.SaveDescript == "Midgard - Foothills - Journey back to the mountain")
    {
        vars.completedsplits.inserts(0, "Foothills 100%");
        return true;
    } else if (settings["Side Stuff"] && current.SaveDescript == "Midgard - Hidden Chamber of Odin - Find a new path up to the summit" && old.SaveDescript == "Midgard - The Mountain - Find a new path up to the summit")
    {
        vars.completedsplits.inserts(0, "Mountain II");
        return true;
    } /*else if (settings["Side Stuff"] && current.SaveDescript == "" && old.SaveDescript == "")
    {
        vars.completedsplits.inserts(0, "");
        return true;
    }*/
    
    //Splits whenever you gain helmets
    if (settings["Valks"] && current.GunnrHelmet == 1 && old.GunnrHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Gunnr");
        return true;
    } else if (settings["Valks"] && current.KaraHelmet == 1 && old.KaraHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Kara");
        return true;
    }  else if (settings["Valks"] && current.GeirdrifulHelmet == 1 && old.GeirdrifulHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Geirdriful");
        return true;
    }  else if (settings["Valks"] && current.EirHelmet == 1 && old.EirHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Eir");
        return true;
    } else if (settings["Valks"] && current.RòtaHelmet == 1 && old.RòtaHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Ròta");
        return true;
    } else if (settings["Valks"] && current.OlrunHelmet == 1 && old.OlrunHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Olrun");
        return true;
    } else if (settings["Valks"] && current.GöndulHelmet == 1 && old.GöndulHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Göndul");
        return true;
    } else if (settings["Valks"] && current.SigrunHelmet == 1 && old.SigrunHelmet != 1)
    {
        vars.completedsplits.inserst(0, "Sigrun");
        return true;
    }

    //Splits during certain story points the inserts should give you a clear idea on where that would be
    if (settings["Main Story"] && current.Obj == 678 && old.Obj == 4620)
    {
        vars.completedsplits.inserst(0, "Troll Fight");
        return true;
    } else if (settings["Main Story"] && current.Obj == 698 && old.Obj == 692)
    {
        vars.completedsplits.inserst(0, "River Pass I");
        return true;
    } else if (settings["Main Story"] && current.Obj == 734 && old.Obj == 3701)
    {
        vars.completedsplits.inserst(0, "Alfheim Story");
        return true;
    } else if (settings["Main Story"] && current.Obj == 40077 && old.Obj == 736)
    {
        vars.completedsplits.inserst(0, "Alfheim I");
        return true;
    } else if (settings["Main Story"] && current.Obj == 756 && old.Obj == 43039)
    {
        vars.completedsplits.inserst(0, "Boy is a god!");
        return true;
    } else if (settings["Main Story"] && current.Obj == 1416 && old.Obj == 760)
    {
        vars.completedsplits.inserst(0, "Tyr's Vault Puzzles");
        return true;
    } else if (settings["Main Story"] && current.Obj == 43063 && old.Obj == 1416)
    {
        vars.completedsplits.inserst(0, "Grendel Twins Fight");
        return true;
    }else if (settings["Main Story"] && current.Obj == 21391 && old.Obj == 3574)
    {
        vars.completedsplits.inserst(0, "Into the Giant Snake");
        return true;
    } else if (settings["Main Story"] && current.Obj == 19891 && old.Obj == 19884)
    {
        vars.completedsplits.inserst(0, "Finish");
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

/*
all obj numbers and what their obj is:
0- literally the beginning of the game
674- "hunt with Atreus"
4620- "defeat dauoi kaupmaor"
678- "return to the house"
5347- "defeat the stranger"
8970- "journey to the mountain"
680- "continue towards the mountain"
682- "escape the ruins"
20115- "fight off the reavers"
20118- "escape the ruins"
20120- "throw your axe at the trees"
37223- "proceed through the gate to the mountain"
20401- "continue to the mountain"
686- "hunt with Atreus"
690- "follow the witch"
692- "collect white-petaled flower
698- "get to the boat"
700- "boat towards daylight"
26608- "dock at the bridge"
17325- "investigate the temple"
26864- "make your way to the tower"
17496- "continue towards the mountain"
702- "follow the witch"
706- "follow the witch"
708- "travel to alfheim"
21279- when u get to alfheim
712- after Atreus has the voices cutscenes in alfheim on boat
718- "find a way to get into the temple"
720- "reactivate the ringed temple bridge"
722- "go back up to the Ringed Temple Bridge"
724- when u enter the temple 
726- "find a way into the hive
39433- after u enter the hive in the narrow passage
728- "destroy the hive and claim the light
730- "find a way out of the temple"
732- "return to boat"
3701- "use the sand bowl lift"
734- "return to tyr's temple"
736- "realm travel back to Midgard
40077- "return to the mountain"
40026- when u go into the vanaheim tower
3713- when ur in the vanaheim tower and the obj updates
3699- when light of alfheim quest says complete
3702- "traverse the dark caves"
3704- "ascend the cave shaft"
17494- "free the chain"
18017- "find a way to ascend"
3706- "reach the summit"
3719- when inside the mountain is completed
36974- "return to the witch's cave"
36976- when u dock at witch's cave
43073- "return to the boat
37095- "go to tyr's temple
21412- when a new destination quest is completed
738- "investigate the dead giant"
740- "retrieve a piece of the chisel
742- "find a way to break the ice"
25884- "talk to sindri"
21529- "find a way to the hammer"
21583- "make you way up the hammer"
21585- "release the strap"
21587- " find a way to the hammer's head"
21591- "make you way to the chisel"
744- "retrieve a piece of the chisel"
746- when magic chisel is completed 
9268- "return to the lake of nine
758- "go to tyr's vault"
40985- when it wants you to interact with the sand bowl b/o on controller e on k&m. This is right before modi comes back.
1398- "ask Freya for help"
1400- "use Freya's boat to return home"
7800- "Return to the Realm Travel Room"
1404- "realm travel to helheim
1406- "Reach the bridge keeper"
3578- "defeat the bridge keeper
7808- "return to the realm travel room"
1408- "Deliver the heart to Freya"
1410- when the sickness quest is completed
43039- "enter the boat"
756- "return to tyr's vault"
1414- "retrieve the black rune"
3577- "Deactivate the vaults defenses"
760- "escape the trap"
1416- "retrieve the black rune
43063- "exit tyr's vault"
43060- "go back through the tower"
21328- "Journey back to the mountain"
21330- "Find a new path up to the summit"
21332- "Continue towards the summit"
21334- "Open the bridge to Jotunheim"
21336- "Catch Baldur"
748- "Find a way out of Helheim"
750- "Use the ship"
754- "escape Helheim"
3580- "realm travel back to Midgard"
762- "show tyr's key plans to brok"
764- "locate tyr's mysterious door"
3598- "explore tyr's hidden chamber"
3582- "break the chains"
766- "go back up and flip the temple"
17679- "return to the realm travel room'
18769- "explore the realm between realms"
18771- "take the unity stone to the precipice"
21378- "investigate the Jotunheim tower"
21381- "survive the gauntlet of the realms"
3600- "return to the realm travel room"
3568- "talk to Brok and Sindri"
3571- "return to the serpents horn in Midgard"
3588- "boat into the serpents mouth"
3573- "find mimir's eye"
3574- "return to the realm travel room"
21391- "defeat baldur"
21393- "return to the realm travel room"
19877- "find jotunheim highest peak"
19879- "scatter her ashes"
19884- "return to tyr's temple"
19891- "explore the realms"
*/
