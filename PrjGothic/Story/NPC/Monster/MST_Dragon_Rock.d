
prototype MST_DEFAULT_DRAGON_ROCK(C_NPC)
{
	name[0] = "???????? ??????";
	guild = GIL_DRAGON;
	aivar[AIV_MM_REAL_ID] = ID_DRAGON_ROCK;
	level = 400;
	bodystateinterruptableoverride = TRUE;
//	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_STRENGTH] = 12;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 95;
	protection[PROT_EDGE] = 95;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_FLY;
	fight_tactic = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MAXDISTTOWP] = 1000;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_DRAGON;
	start_aistate = zs_mm_rtn_dragonrest;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_dragon_rock()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_Rock_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGON_ROCK(MST_DEFAULT_DRAGON_ROCK)
{
	name[0] = "????????";
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_dragon_rock();
	Npc_SetToFistMode(self);
};

