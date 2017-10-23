#include <sourcemod>
#include <sdkhooks>
#include <sdktools>
#include <cstrike>

new Handle:Cvar_Enable;


#define PLUGIN_VERSION "0.2"

public Plugin:myinfo = 
{
	name = "Marines vs. Predators - CS:GO",
	author = "Hazor/I'm The New Guy",
	description = "Marines vs. Predators Mod!",
	version = PLUGIN_VERSION,
	url = "Website link here"
};

public OnPluginStart()
{

	HookEvent("player_spawn", PlayerSpawnEvent);
  
	Cvar_Enable = CreateConVar("mvp_enable", "1", "Enable/disable Marines vs. Predators Mod", FCVAR_PLUGIN);
  
	PrintToServer("Marines vs. Predators v0.1 - 2017")
}


public PlayerSpawnEvent(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"))
	
	if (GetClientTeam(client) == 3)
	{	
		if (GetConVarInt(Cvar_Enable) == 1)
		{
			SetEntityModel(client,"models/player/techknow/predator_v2/predator.mdl");
			SetEntityRenderMode(client,  RENDER_TRANSCOLOR);
			SetEntityRenderColor(client, 255, 255, 255, 50);
			SetEntityHealth(client, 500);
		 //EmitSoundToClient(client, "");
			SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.3);	
			PrintToChat(client,"It's Time To Hunt!");
		}
		for(new i = 0; i < 4; i++)
		{
			new weapon = GetPlayerWeaponSlot(client, i);
			if(weapon != -1)
			{
				SetEntityRenderMode(weapon,  RENDER_TRANSCOLOR);
				SetEntityRenderColor(weapon, 100, 100, 100, 100);
			}
		}
	}
	else if (GetClientTeam(client) == 2)
	{
		SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.0);
	//SetEntityModel(client,"models/player/.mdl Add Marine Here");
		SetEntityRenderColor(client, 255, 255, 255, 255);
		SetEntityHealth(client, 100);
	}
}


//© Copyright 2017 Hazor Productions