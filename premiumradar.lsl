integer findinList(list src,list item){
    if(~llListFindList(src, (list)item))
    return TRUE;
    else  
    return FALSE;   
}
list userdata;
default
{
    state_entry()
    {
        llSensorRepeat("", "", AGENT_BY_LEGACY_NAME, 96.0, PI, 3.0);
    }
    sensor(integer num_detected)
    {
        key thisAgent;
        integer agentNum;
        for (agentNum=0; agentNum<num_detected; agentNum++)
        {
            thisAgent = llDetectedKey(agentNum);
            string data = llGetUsername(thisAgent)
            +","
            +llDumpList2String(llGetObjectDetails(thisAgent,[OBJECT_ACCOUNT_LEVEL]),",")
            +","+llGetAgentLanguage(thisAgent);
            if(!findinList(userdata,[data]))
                userdata += data;
        }
        llSetText(llDumpList2String(userdata,"\n"),<0,1,1>,1);
        userdata  = [];     
    }  
}
