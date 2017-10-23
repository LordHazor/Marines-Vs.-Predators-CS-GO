#include <sourcemod>
#include <sdkhooks>
#include <sdktools>
#include <cstrike>

public OnPluginStart()
{
  
	PrintToServer("Marines vs. Predators Downloads - 2017")
}

public OnMapStart()
{
	//AddFileToDownloadsTable("Sound files here");
	//PrecacheSound("Sound Files", true);	
	//PrecacheModel("Marines model here");
  
	PrecacheModel("models/player/mapeadores/morell/predator/predator.mdl");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_body.vmt");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_body.vtf");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_body_n.vtf");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_face.vmt");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_face.vtf");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_face_n.vtf");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_gear.vmt");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_gear.vtf");
	AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_gear_n.vtf");
  AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_numbers.vmt");
  AddFileToDownloadsTable("materials/models/mapeadores/morell/predator/pred_numbers.vtf");
	AddFileToDownloadsTable("models/player/mapeadores/morell/predator/predator.mdl");
	AddFileToDownloadsTable("models/player/mapeadores/morell/predator/predator.dx90.vtx");
	AddFileToDownloadsTable("models/player/mapeadores/morell/predator/predator.phy");
	AddFileToDownloadsTable("models/player/mapeadores/morell/predator/predator.vvd");
}


//© Copyright 2017 Hazor Productions