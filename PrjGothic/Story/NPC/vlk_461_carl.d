
instance VLK_461_CARL(NPC_DEFAULT)
{
	name[0] = "????";
	guild = GIL_VLK;
	id = 461;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_mace_l_04);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_L_NORMALBART01,BODYTEX_L,itar_smith);
	Mdl_SetModelFatness(self,0);
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_461;
};


func void rtn_start_461()
{
	ta_smalltalk(20,0,22,0,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
	ta_stand_drinking(22,0,1,0,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
	ta_sleep(1,0,5,0,"NW_CITY_HABOUR_HUT_03_BED_02");
	ta_sit_bench(5,0,6,0,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	ta_smith_fire(6,0,6,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(6,10,6,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(6,20,6,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(6,30,6,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(6,40,6,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(6,50,7,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(7,0,7,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(7,10,7,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(7,20,7,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(7,30,7,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(7,40,7,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(7,50,8,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(8,0,8,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(8,10,8,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(8,20,8,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(8,30,8,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(8,40,8,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(8,50,9,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(9,0,9,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(9,10,9,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(9,20,9,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(9,30,9,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(9,40,9,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(9,50,10,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(10,0,10,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(10,10,10,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(10,20,10,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(10,30,10,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(10,40,10,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(10,50,11,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(11,0,11,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(11,10,11,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(11,20,11,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(11,30,11,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(11,40,11,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(11,50,12,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(12,0,12,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(12,10,12,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(12,20,12,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(12,30,12,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(12,40,12,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(12,50,13,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(13,0,13,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(13,10,13,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(13,20,13,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(13,30,13,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(13,40,13,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(13,50,14,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(14,0,14,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(14,10,14,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(14,20,14,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(14,30,14,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(14,40,14,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(14,50,15,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(15,0,15,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(15,10,15,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(15,20,15,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(15,30,15,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(15,40,15,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(15,50,16,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(16,0,16,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(16,10,16,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(16,20,16,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(16,30,16,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(16,40,16,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(16,50,17,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(17,0,17,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(17,10,17,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(17,20,17,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(17,30,17,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(17,40,17,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(17,50,18,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(18,0,18,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(18,10,18,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(18,20,18,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(18,30,18,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(18,40,18,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(18,50,19,0,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(19,0,19,10,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(19,10,19,20,"NW_CITY_POOR_SMITH_01");
	ta_smith_fire(19,20,19,30,"NW_CITY_POOR_SMITH_02");
	ta_smith_anvil(19,30,19,40,"NW_CITY_POOR_SMITH_01");
	ta_smith_cool(19,40,19,50,"NW_CITY_POOR_SMITH_03");
	ta_smith_anvil(19,50,20,0,"NW_CITY_POOR_SMITH_01");
};

