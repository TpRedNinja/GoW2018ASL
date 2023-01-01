state("GoW", "Steam 1.0.12")
{
    string100 CurObj : 0x22C67E0;
    int Load : 0x22E9DB0; 
}

state("GoW", "Epic 1.0.12")
{
    string100 CurObj : 0x22C3C00;
    int Load : 0x22E71D0;
}


init 
{
    switch (modules.First().ModuleMemorySize) 
    {
        case    85839872: version = "Steam 1.0.12";
            break;
        case    85610496: version = "Epic 1.0.12";
            break;
        default:        version = ""; 
            break;
    } 
    vars.PrevObj = "";
}

onStart
{
    vars.PrevObj = current.CurObj;
}

split
{
    if (vars.PrevObj != current.CurObj)
    {
        vars.PrevObj = current.CurObj;
        return true;
    }
}

isLoading
{
    return (current.Load != 0);
}

onReset
{
    vars.PrevObj = "";
}
