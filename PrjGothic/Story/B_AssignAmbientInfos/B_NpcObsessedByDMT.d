// ***************************************************
//  	B_NpcObsessedByDMT	(Kurzzeitige Bessenheit eines NSCs durch einen Dementor)	
// ***************************************************

var int NpcObsessedByDMT;

////////////////////////
// Alle Besessenen NPCs
////////////////////////

//Alle
var int NpcObsessedByDMT_Brutus;	//Joly: hat sein Buch Anfang 5. Kapitel

//Nur KDF
var int NpcObsessedByDMT_Agon;		//Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Vino;		//Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Malak;		//Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Fernando;	//Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Bromor;	//Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Engrom;	//Joly: hat sein Buch Anfang 4. Kapitel
var int NpcObsessedByDMT_Randolph;	//Joly: hat sein Buch Anfang 4. Kapitel
var int NpcObsessedByDMT_Sekob;		//Joly: hat sein Buch Anfang 5. Kapitel

func void B_DMTWurm ()
{
	//B_AI_Output	(self,	other,	"DIA_NoName_ObsessedByDMT_19_00");	//Wir sehen dich, du Wurm. Du kannst uns nicht entkommen.
	B_AI_Output	(self,	other,	"DIA_NoName_ObsessedByDMT_19_00");	//Мы видим тебя, червь. Тебе не скрыться от нас.
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// B_NpcClearObsessionByDMT	steht bei allen NSCs statt der AI_StopProcessInfos (self);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func void B_NpcClearObsessionByDMT (VAR C_NPC medium)	//Joly: WARUNG:  B_NpcClearObsessionByDMT muЯ in eine Exit Info, die ganz sicher kommt, nachdem B_NpcObsessedByDMT abgefeuert wurde!!!!!!!!!!!!!!
{														
	AI_StopProcessInfos	(medium);

	if (NpcObsessedByDMT == TRUE)
		{
			Npc_RemoveInvItems	(medium, ITAR_Dementor,	1);
			AI_EquipBestArmor (medium);
			NpcObsessedByDMT = FALSE;
			medium.flags = 0;
			B_Attack (medium, other, AR_NONE, 1);
		 	Wld_StopEffect("DEMENTOR_FX");
		 	Snd_Play 	("MFX_FEAR_CAST" );
			B_SCIsObsessed (medium);



		/////////////////////////////////
		// Story SituationsKonsequenzen
		/////////////////////////////////
				
			if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
				{	
					Npc_SetTarget 		(BAU_962_Bauer, other);	AI_StartState 		(BAU_962_Bauer, ZS_Flee, 0, "");
					Npc_SetTarget 		(BAU_964_Bauer, other);	AI_StartState 		(BAU_964_Bauer, ZS_Flee, 0, "");
					Npc_SetTarget 		(BAU_965_Bauer, other);	AI_StartState 		(BAU_965_Bauer, ZS_Flee, 0, "");
					Npc_SetTarget 		(BAU_966_Bauer, other);	AI_StartState 		(BAU_966_Bauer, ZS_Flee, 0, "");
					Npc_SetTarget 		(BAU_967_Bauer, other);	AI_StartState 		(BAU_967_Bauer, ZS_Flee, 0, "");
					Npc_SetTarget 		(BAU_968_Bauer, other);	AI_StartState 		(BAU_968_Bauer, ZS_Flee, 0, "");
					Npc_SetTarget 		(BAU_969_Bauer, other);	AI_StartState 		(BAU_969_Bauer, ZS_Flee, 0, "");
				};		
		};
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// B_NpcObsessedByDMT
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func void b_npcobsessedbydmt(var C_NPC medium)
{
	if(NPCOBSESSEDBYDMT == FALSE)
	{
		Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		CreateInvItems(medium,itar_dementor,1);
		AI_UnequipArmor(medium);
		AI_EquipArmor(medium,itar_dementor);
		AI_PlayAni(medium,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",medium,medium,0,0,0,FALSE);
		NPCOBSESSEDBYDMT = TRUE;
		if(Npc_HasItems(medium,itwr_dementorobsessionbook_mis) == FALSE)
		{
			CreateInvItems(medium,itwr_dementorobsessionbook_mis,1);
		};
		if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(brutus))
		{
			if(MIS_OCGATEOPEN == TRUE)
			{
				B_AI_Output(self,other,"DIA_Brutus_ObsessedByDMT_19_00");	//Открыв ворота, ты оказал большую услугу нашему Хозяину, жалкий смертный. Мы возведем часовню в его честь на твоей могиле.
			}
			else
			{
				b_dmtwurm();
			};
			NPCOBSESSEDBYDMT_BRUTUS = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(engrom))
		{
			B_AI_Output(self,other,"DIA_Engrom_ObsessedByDMT_19_00");	//Поворачивай назад. Пока еще не слишком поздно.
			NPCOBSESSEDBYDMT_ENGROM = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(vino))
		{
			B_AI_Output(self,other,"DIA_Vino_ObsessedByDMT_19_00");	//Скоро мы будем управлять всем. Ты и твоя жалкая магия не представляют опасности для нас.
			NPCOBSESSEDBYDMT_VINO = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(malak))
		{
			B_AI_Output(self,other,"DIA_Malak_ObsessedByDMT_19_00");	//Тебе не спасти эту душу, маг. Он никогда не станет прежним.
			NPCOBSESSEDBYDMT_MALAK = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(sekob))
		{
			B_AI_Output(self,other,"DIA_Sekob_ObsessedByDMT_19_00");	//Брось, маг. Тебе не суждено победить.
			NPCOBSESSEDBYDMT_SEKOB = TRUE;
		}
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(randolph))
		{
			B_AI_Output(self,other,"DIA_Randolph_ObsessedByDMT_19_00");	//Не трать свои усилия на этого слабака. Мы поработим их всех.
			NPCOBSESSEDBYDMT_RANDOLPH = TRUE;
		}
		/*
		else if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(VLK_603_AGON))
		{
			B_AI_Output(self,other,"DIA_Vino_ObsessedByDMT_19_00");	//Скоро мы будем управлять всем. Ты и твоя жалкая магия не представляют опасности для нас.
			NpcObsessedByDMT_Agon = TRUE;
		}
		*/
		else
		{
			b_dmtwurm();
			if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(bromor))
			{
				NPCOBSESSEDBYDMT_BROMOR = TRUE;
			};
			if(Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(fernando))
			{
				NPCOBSESSEDBYDMT_FERNANDO = TRUE;
			};
		};
		b_giveplayerxp(XP_SCFOUNDOBSESSEDNPC);
	}
	else
	{
		b_npcclearobsessionbydmt(medium);
	};
	
	AI_StartState	(self, dia_vino_kap3_exit_info,1,"");
	
};

