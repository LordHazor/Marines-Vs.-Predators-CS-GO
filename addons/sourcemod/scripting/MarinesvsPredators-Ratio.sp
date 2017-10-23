#include <sourcemod>
#include <sdktools>

#define terrorist 			2
#define counterTerrorist 	3

public Plugin:myinfo = 
{
	name 		= "MvP-CS:GO Team Ratio",
	author 		= "Hazor/I'm the new guy",
	description = "Team Ratio Plugin By Hazor",
	version 	= "0.1",
	url 		= ""
}

public OnPluginStart()
{

	
	CreateConVar( "mvp_ratio_enable", "1", "Enables the mvp team ratio.", FCVAR_PLUGIN );
	CreateConVar( "mvp_ratio", "3", "The ratio of Predators to Marines. (Default: 1 Preadtor = 3 Marines)", FCVAR_PLUGIN );
	CreateConVar( "mvp_ratio_version", "0.1", "Version", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY );

	AutoExecConfig( true, "MarinesvsPredators-Ratio" );
	
	RegConsoleCmd( "jointeam", mvpTeams );
}

public Action:mvpTeams( client, args )
{

	new teamRatio = GetConVarInt( FindConVar( "mvp_ratio" ) );
	

	if ( ! GetConVarBool( FindConVar( "mvp_ratio_enable" ) ) )
	{
		return Plugin_Continue;
	}
	
	if ( ! client || ! IsClientInGame( client ) || IsFakeClient( client ) )
	{
		return Plugin_Continue;
	}
	
	/*if ( GetUserAdmin( client ) != INVALID_ADMIN_ID )
	{
		return Plugin_Continue;
	}*/
	
	decl String:teamString[3];
	GetCmdArg( 1, teamString, sizeof( teamString ) );
	
	new newTeam = StringToInt(teamString);
	new oldTeam = GetClientTeam(client);
	

	if ( newTeam == counterTerrorist && oldTeam != counterTerrorist )
	{
		new idx			= 0;
		new countTs 	= 0;
		new countCTs 	= 0;
		
		
		for ( idx = 1; idx <= MaxClients; idx++ )
		{
		      if ( IsClientInGame( idx ) )
		      {
				 if ( GetClientTeam( idx ) == terrorist )
		         {
		            countTs++;
		         }
				 
				 if ( GetClientTeam( idx ) == counterTerrorist )
		         {
		            countCTs++;
		         }
		      }      
		}
    
		if ( countCTs < ( ( countTs ) / teamRatio ) || ! countCTs )
		{
			return Plugin_Continue;
		}
		else
		{
    
			ClientCommand( client, "" );
			
			PrintToChat( client, "\x03[SMJT] \x04Not your time to hunt!", teamRatio );

			return Plugin_Handled;
		}		
	}
	
	return Plugin_Continue;
}


//© Copyright 2017 Hazor Productions