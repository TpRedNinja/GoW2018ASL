state("GoW", "Steam 1.0.13")
{
    //string100 LocalObj : 0x22C67E0; //Location + objective in string
    int Obj : 0x22C6904; //Objective in int; Null objective = 0
    int Load : 0x22E9DB0; //0 not loading; 257/256 loading
    int Shop : 0x2448448; //0 out of the shop; 2 in the shop
    int Valk : 0x2D43714; //36628 = 0 valks; 38192 all valks
}

startup
{
    settings.Add("Split for main game", false);
    settings.Add("Split for Valkyrie%", false);
    vars.PrevObj = -1;
    vars.PrevShop = -1;
    vars.PrevValk = -1;
}

init 
{
    switch (modules.First().ModuleMemorySize) 
    {
        case    85839872: version = "Steam 1.0.12";
            break;
        default:        version = ""; 
            break;
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
}


isLoading
{
    return (current.Load != 0);
}

onReset
{
    vars.PrevShop = -1;
}
