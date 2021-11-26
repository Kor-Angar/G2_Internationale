
instance PC_ROCKEFELLER(NPC_DEFAULT)
{
	name[0] = "���������";
	npctype = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 30;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 400;
	attribute[ATR_MANA] = 400;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	exp = 500 * ((level + 1) / 2) * (level + 1);
	exp_next = 500 * ((level + 2) / 2) * (level + 1);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BODYTEX_PLAYER_G1,0,"Hum_Head_Pony",FACE_N_PLAYER,0,itar_pal_h);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill(self,NPC_TALENT_RUNES,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
	PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_MANA_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_MANA_02] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_MANA_03] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_SPEED] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_COMMON] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LIGHT] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FIREBOLT] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ICEBOLT] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] = TRUE;
	PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ZAP] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] = TRUE;
	PLAYER_TALENT_RUNES[SPL_WINDFIST] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SLEEP] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] = TRUE;
	PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FEAR] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ICECUBE] = TRUE;
	PLAYER_TALENT_RUNES[SPL_CHARGEZAP] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] = TRUE;
	PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] = TRUE;
	PLAYER_TALENT_RUNES[SPL_PYROKINESIS] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FIRESTORM] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ICEWAVE] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FULLHEAL] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FIRERAIN] = TRUE;
	PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MASSDEATH] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SHRINK] = TRUE;
	b_setfightskills(self,100);
	EquipItem(self,itmw_2h_pal_sword);
	CreateInvItems(self,itmw_1h_vlk_dagger,1);
	CreateInvItems(self,itmw_1h_mace_l_01,1);
	CreateInvItems(self,itmw_1h_bau_axe,1);
	CreateInvItems(self,itmw_1h_vlk_mace,1);
	CreateInvItems(self,itmw_1h_mace_l_03,1);
	CreateInvItems(self,itmw_1h_bau_mace,1);
	CreateInvItems(self,itmw_1h_vlk_axe,1);
	CreateInvItems(self,itmw_1h_mace_l_04,1);
	CreateInvItems(self,itmw_shortsword1,1);
	CreateInvItems(self,itmw_nagelknueppel,1);
	CreateInvItems(self,itmw_1h_sword_l_03,1);
	CreateInvItems(self,itmw_shortsword2,1);
	CreateInvItems(self,itmw_sense,1);
	CreateInvItems(self,itmw_1h_vlk_sword,1);
	CreateInvItems(self,itmw_1h_nov_mace,1);
	CreateInvItems(self,itmw_2h_bau_axe,1);
	CreateInvItems(self,itmw_2h_axe_l_01,1);
	CreateInvItems(self,itmw_1h_misc_sword,1);
	CreateInvItems(self,itmw_1h_misc_axe,1);
	CreateInvItems(self,itmw_2h_sword_m_01,1);
	CreateInvItems(self,itmw_1h_mil_sword,1);
	CreateInvItems(self,itmw_1h_sld_axe,1);
	CreateInvItems(self,itmw_1h_sld_sword,1);
	CreateInvItems(self,itmw_2h_sld_axe,1);
	CreateInvItems(self,itmw_2h_sld_sword,1);
	CreateInvItems(self,itmw_1h_pal_sword,1);
	CreateInvItems(self,itmw_2h_pal_sword,1);
	CreateInvItems(self,itmw_2h_orcaxe_01,1);
	CreateInvItems(self,itmw_2h_orcaxe_02,1);
	CreateInvItems(self,itmw_2h_orcaxe_03,1);
	CreateInvItems(self,itmw_2h_orcaxe_04,1);
	CreateInvItems(self,itmw_2h_orcmace_01,1);
	CreateInvItems(self,itmw_2h_orcsword_01,1);
	CreateInvItems(self,itmw_2h_orcsword_02,1);
	CreateInvItems(self,itmw_shortsword3,1);
	CreateInvItems(self,itmw_nagelkeule,1);
	CreateInvItems(self,itmw_shortsword4,1);
	CreateInvItems(self,itmw_kriegskeule,1);
	CreateInvItems(self,itmw_richtstab,1);
	CreateInvItems(self,itmw_shortsword5,1);
	CreateInvItems(self,itmw_kriegshammer1,1);
	CreateInvItems(self,itmw_hellebarde,1);
	CreateInvItems(self,itmw_nagelkeule2,1);
	CreateInvItems(self,itmw_schiffsaxt,1);
	CreateInvItems(self,itmw_piratensaebel,1);
	CreateInvItems(self,itmw_schwert,1);
	CreateInvItems(self,itmw_1h_common_01,1);
	CreateInvItems(self,itmw_stabkeule,1);
	CreateInvItems(self,itmw_zweihaender1,1);
	CreateInvItems(self,itmw_steinbrecher,1);
	CreateInvItems(self,itmw_spicker,1);
	CreateInvItems(self,itmw_streitaxt1,1);
	CreateInvItems(self,itmw_schwert1,1);
	CreateInvItems(self,itmw_schwert2,1);
	CreateInvItems(self,itmw_doppelaxt,1);
	CreateInvItems(self,itmw_bartaxt,1);
	CreateInvItems(self,itmw_morgenstern,1);
	CreateInvItems(self,itmw_schwert3,1);
	CreateInvItems(self,itmw_schwert4,1);
	CreateInvItems(self,itmw_1h_special_01,1);
	CreateInvItems(self,itmw_2h_special_01,1);
	CreateInvItems(self,itmw_rapier,1);
	CreateInvItems(self,itmw_rubinklinge,1);
	CreateInvItems(self,itmw_streitkolben,1);
	CreateInvItems(self,itmw_zweihaender2,1);
	CreateInvItems(self,itmw_runenschwert,1);
	CreateInvItems(self,itmw_rabenschnabel,1);
	CreateInvItems(self,itmw_schwert5,1);
	CreateInvItems(self,itmw_inquisitor,1);
	CreateInvItems(self,itmw_streitaxt2,1);
	CreateInvItems(self,itmw_zweihaender3,1);
	CreateInvItems(self,itmw_1h_special_02,1);
	CreateInvItems(self,itmw_2h_special_02,1);
	CreateInvItems(self,itmw_elbastardo,1);
	CreateInvItems(self,itmw_kriegshammer2,1);
	CreateInvItems(self,itmw_meisterdegen,1);
	CreateInvItems(self,itmw_folteraxt,1);
	CreateInvItems(self,itmw_orkschlaechter,1);
	CreateInvItems(self,itmw_schlachtaxt,1);
	CreateInvItems(self,itmw_krummschwert,1);
	CreateInvItems(self,itmw_barbarenstreitaxt,1);
	CreateInvItems(self,itmw_sturmbringer,1);
	CreateInvItems(self,itmw_1h_special_03,1);
	CreateInvItems(self,itmw_2h_special_03,1);
	CreateInvItems(self,itmw_berserkeraxt,1);
	CreateInvItems(self,itmw_drachenschneide,1);
	CreateInvItems(self,itmw_1h_special_04,1);
	CreateInvItems(self,itmw_2h_special_04,1);
	CreateInvItems(self,itmw_1h_blessed_01,1);
	CreateInvItems(self,itmw_1h_blessed_02,1);
	CreateInvItems(self,itmw_1h_blessed_03,1);
	CreateInvItems(self,itmw_2h_blessed_01,1);
	CreateInvItems(self,itmw_2h_blessed_02,1);
	CreateInvItems(self,itmw_2h_blessed_03,1);
	CreateInvItem(self,itar_governor);
	CreateInvItem(self,itar_larius);
	CreateInvItem(self,itar_smith);
	CreateInvItem(self,itar_barkeeper);
	CreateInvItem(self,itar_judge);
	CreateInvItem(self,itar_vlk_l);
	CreateInvItem(self,itar_vlk_m);
	CreateInvItem(self,itar_vlk_h);
	CreateInvItem(self,itar_vlkbabe_l);
	CreateInvItem(self,itar_vlkbabe_m);
	CreateInvItem(self,itar_vlkbabe_h);
	CreateInvItem(self,itar_mil_l);
	CreateInvItem(self,itar_mil_m);
	CreateInvItem(self,itar_pal_m);
	CreateInvItem(self,itar_pal_h);
	CreateInvItem(self,itar_bau_l);
	CreateInvItem(self,itar_bau_m);
	CreateInvItem(self,itar_baubabe_l);
	CreateInvItem(self,itar_baubabe_m);
	CreateInvItem(self,itar_onar);
	CreateInvItem(self,itar_sld_l);
	CreateInvItem(self,itar_sld_m);
	CreateInvItem(self,itar_sld_h);
	CreateInvItem(self,itar_nov_l);
	CreateInvItem(self,itar_kdf_l);
	CreateInvItem(self,itar_kdf_h);
	CreateInvItem(self,itar_leather_l);
	CreateInvItem(self,itar_bdt_m);
	CreateInvItem(self,itar_bdt_h);
	CreateInvItem(self,itar_djg_l);
	CreateInvItem(self,itar_djg_m);
	CreateInvItem(self,itar_djg_h);
	CreateInvItem(self,itar_djg_crawler);
	CreateInvItem(self,itar_djg_babe);
	CreateInvItem(self,itar_xardas);
	CreateInvItem(self,itar_lester);
	CreateInvItem(self,itar_diego);
	CreateInvItem(self,itar_corangar);
	CreateInvItem(self,itar_kdw_h);
	CreateInvItem(self,itar_dementor);
	CreateInvItem(self,itar_blackmage);
	CreateInvItem(self,itar_prisoner);
	CreateInvItem(self,itru_pallight);
	CreateInvItem(self,itru_pallightheal);
	CreateInvItem(self,itru_palholybolt);
	CreateInvItem(self,itru_palmediumheal);
	CreateInvItem(self,itru_palrepelevil);
	CreateInvItem(self,itru_palfullheal);
	CreateInvItem(self,itru_paldestroyevil);
	CreateInvItem(self,itru_light);
	CreateInvItem(self,itru_firebolt);
	CreateInvItem(self,itru_icebolt);
	CreateInvItem(self,itru_lightheal);
	CreateInvItem(self,itru_sumgobskel);
	CreateInvItem(self,itru_instantfireball);
	CreateInvItem(self,itru_zap);
	CreateInvItem(self,itru_sumwolf);
	CreateInvItem(self,itru_windfist);
	CreateInvItem(self,itru_sleep);
	CreateInvItem(self,itru_mediumheal);
	CreateInvItem(self,itru_lightningflash);
	CreateInvItem(self,itru_chargefireball);
	CreateInvItem(self,itru_sumskel);
	CreateInvItem(self,itru_fear);
	CreateInvItem(self,itru_icecube);
	CreateInvItem(self,itru_thunderball);
	CreateInvItem(self,itru_sumgol);
	CreateInvItem(self,itru_harmundead);
	CreateInvItem(self,itru_pyrokinesis);
	CreateInvItem(self,itru_firestorm);
	CreateInvItem(self,itru_icewave);
	CreateInvItem(self,itru_sumdemon);
	CreateInvItem(self,itru_fullheal);
	CreateInvItem(self,itru_firerain);
	CreateInvItem(self,itru_breathofdeath);
	CreateInvItem(self,itru_massdeath);
	CreateInvItem(self,itru_masterofdisaster);
	CreateInvItem(self,itru_armyofdarkness);
	CreateInvItem(self,itru_shrink);
	CreateInvItem(self,itsc_pallight);
	CreateInvItem(self,itsc_pallightheal);
	CreateInvItem(self,itsc_palholybolt);
	CreateInvItem(self,itsc_palmediumheal);
	CreateInvItem(self,itsc_palrepelevil);
	CreateInvItem(self,itsc_palfullheal);
	CreateInvItem(self,itsc_paldestroyevil);
	CreateInvItems(self,itsc_charm,10);
	CreateInvItem(self,itsc_light);
	CreateInvItem(self,itsc_firebolt);
	CreateInvItem(self,itsc_icebolt);
	CreateInvItem(self,itsc_lightheal);
	CreateInvItem(self,itsc_sumgobskel);
	CreateInvItem(self,itsc_instantfireball);
	CreateInvItem(self,itsc_zap);
	CreateInvItem(self,itsc_sumwolf);
	CreateInvItem(self,itsc_windfist);
	CreateInvItem(self,itsc_sleep);
	CreateInvItem(self,itsc_mediumheal);
	CreateInvItem(self,itsc_lightningflash);
	CreateInvItem(self,itsc_chargefireball);
	CreateInvItem(self,itsc_sumskel);
	CreateInvItem(self,itsc_fear);
	CreateInvItem(self,itsc_icecube);
	CreateInvItem(self,itsc_thunderball);
	CreateInvItem(self,itsc_sumgol);
	CreateInvItem(self,itsc_harmundead);
	CreateInvItem(self,itsc_pyrokinesis);
	CreateInvItem(self,itsc_firestorm);
	CreateInvItem(self,itsc_icewave);
	CreateInvItem(self,itsc_sumdemon);
	CreateInvItem(self,itsc_fullheal);
	CreateInvItem(self,itsc_firerain);
	CreateInvItem(self,itsc_breathofdeath);
	CreateInvItem(self,itsc_massdeath);
	CreateInvItem(self,itsc_armyofdarkness);
	CreateInvItem(self,itsc_shrink);
	CreateInvItems(self,itsc_trfsheep,10);
	CreateInvItems(self,itsc_trfscavenger,10);
	CreateInvItems(self,itsc_trfgiantrat,10);
	CreateInvItems(self,itsc_trfgiantbug,10);
	CreateInvItems(self,itsc_trfwolf,10);
	CreateInvItems(self,itsc_trfwaran,10);
	CreateInvItems(self,itsc_trfsnapper,10);
	CreateInvItems(self,itsc_trfwarg,10);
	CreateInvItems(self,itsc_trffirewaran,10);
	CreateInvItems(self,itsc_trflurker,10);
	CreateInvItems(self,itsc_trfshadowbeast,10);
	CreateInvItems(self,itsc_trfdragonsnapper,10);
	CreateInvItem(self,itfo_apple);
	CreateInvItem(self,itfo_cheese);
	CreateInvItem(self,itfo_bacon);
	CreateInvItem(self,itfo_bread);
	CreateInvItem(self,itfo_fish);
	CreateInvItem(self,itfomuttonraw);
	CreateInvItem(self,itfo_stew);
	CreateInvItem(self,itfo_fishsoup);
	CreateInvItem(self,itfo_sausage);
	CreateInvItem(self,itfo_honey);
	CreateInvItem(self,itfo_water);
	CreateInvItem(self,itfo_beer);
	CreateInvItem(self,itfo_booze);
	CreateInvItem(self,itfo_wine);
	CreateInvItem(self,itfo_milk);
	CreateInvItem(self,itpl_swampherb);
	CreateInvItem(self,itpl_mana_herb_01);
	CreateInvItem(self,itpl_mana_herb_02);
	CreateInvItem(self,itpl_mana_herb_03);
	CreateInvItem(self,itpl_health_herb_01);
	CreateInvItem(self,itpl_health_herb_02);
	CreateInvItem(self,itpl_health_herb_03);
	CreateInvItem(self,itpl_dex_herb_01);
	CreateInvItem(self,itpl_strength_herb_01);
	CreateInvItem(self,itpl_speed_herb_01);
	CreateInvItem(self,itpl_mushroom_01);
	CreateInvItem(self,itpl_mushroom_02);
	CreateInvItem(self,itpl_forestberry);
	CreateInvItem(self,itpl_blueplant);
	CreateInvItem(self,itpl_planeberry);
	CreateInvItem(self,itpl_temp_herb);
	CreateInvItem(self,itpl_perm_herb);
	CreateInvItem(self,itke_key_01);
	CreateInvItem(self,itke_key_02);
	CreateInvItem(self,itke_key_03);
	CreateInvItem(self,itke_lockpick);
	CreateInvItems(self,itlstorch,50);
	CreateInvItem(self,itmi_pan);
	CreateInvItem(self,itmi_saw);
	CreateInvItem(self,itmi_brush);
	CreateInvItem(self,itmi_flask);
	CreateInvItem(self,itmi_stomper);
	CreateInvItem(self,itmi_broom);
	CreateInvItem(self,itmi_rake);
	CreateInvItem(self,itmi_hammer);
	CreateInvItem(self,itmi_scoop);
	CreateInvItem(self,itmi_nugget);
	CreateInvItem(self,itmi_joint);
	CreateInvItem(self,itmi_lute);
	CreateInvItems(self,itmi_gold,1000);
	CreateInvItem(self,itmiswordraw);
	CreateInvItem(self,itmiswordrawhot);
	CreateInvItem(self,itmiswordbladehot);
	CreateInvItem(self,itmiswordblade);
	CreateInvItem(self,itmi_runeblank);
	CreateInvItem(self,itmi_sulfur);
	CreateInvItem(self,itmi_quartz);
	CreateInvItem(self,itmi_pitch);
	CreateInvItem(self,itmi_rockcrystal);
	CreateInvItem(self,itmi_aquamarine);
	CreateInvItem(self,itmi_holywater);
	CreateInvItem(self,itmi_coal);
	CreateInvItem(self,itmi_darkpearl);
	CreateInvItem(self,itmi_goldcandleholder);
	CreateInvItem(self,itmi_goldnecklace);
	CreateInvItem(self,itmi_goldcup);
	CreateInvItem(self,itmi_goldchalice);
	CreateInvItem(self,itmi_goldchest);
	CreateInvItem(self,itmi_goldring);
	CreateInvItem(self,itmi_silverchalice);
	CreateInvItem(self,itmi_jewelerychest);
	CreateInvItem(self,itmi_innosstatue);
	CreateInvItem(self,itmi_silverring);
	CreateInvItem(self,itmi_silvercup);
	CreateInvItem(self,itmi_silverplate);
	CreateInvItem(self,itmi_silvernecklace);
	CreateInvItem(self,itmi_silvercandleholder);
	CreateInvItem(self,itmi_sextant);
	CreateInvItem(self,itrw_bow_l_01);
	CreateInvItem(self,itrw_bow_l_02);
	CreateInvItem(self,itrw_bow_l_03);
	CreateInvItem(self,itrw_bow_l_04);
	CreateInvItem(self,itrw_bow_m_01);
	CreateInvItem(self,itrw_bow_m_02);
	CreateInvItem(self,itrw_bow_m_03);
	CreateInvItem(self,itrw_bow_m_04);
	CreateInvItem(self,itrw_bow_h_01);
	CreateInvItem(self,itrw_bow_h_02);
	CreateInvItem(self,itrw_bow_h_03);
	CreateInvItem(self,itrw_bow_h_04);
	CreateInvItem(self,itrw_crossbow_l_01);
	CreateInvItem(self,itrw_crossbow_l_02);
	CreateInvItem(self,itrw_crossbow_m_01);
	CreateInvItem(self,itrw_crossbow_m_02);
	CreateInvItem(self,itrw_crossbow_h_01);
	CreateInvItem(self,itrw_crossbow_h_02);
	CreateInvItems(self,itrw_arrow,1000);
	CreateInvItems(self,itrw_bolt,1000);
	CreateInvItem(self,itam_dex_01);
	CreateInvItem(self,itam_strg_01);
	CreateInvItem(self,itam_hp_01);
	CreateInvItem(self,itam_mana_01);
	CreateInvItem(self,itam_dex_strg_01);
	CreateInvItem(self,itam_hp_mana_01);
	CreateInvItem(self,itam_prot_fire_01);
	CreateInvItem(self,itam_prot_mage_01);
	CreateInvItem(self,itam_prot_edge_01);
	CreateInvItem(self,itam_prot_point_01);
	CreateInvItem(self,itam_prot_total_01);
	CreateInvItem(self,itri_dex_01);
	CreateInvItem(self,itri_dex_02);
	CreateInvItem(self,itri_hp_01);
	CreateInvItem(self,itri_hp_02);
	CreateInvItem(self,itri_str_01);
	CreateInvItem(self,itri_str_02);
	CreateInvItem(self,itri_mana_01);
	CreateInvItem(self,itri_mana_02);
	CreateInvItem(self,itri_dex_strg_01);
	CreateInvItem(self,itri_hp_mana_01);
	CreateInvItem(self,itri_prot_fire_01);
	CreateInvItem(self,itri_prot_fire_02);
	CreateInvItem(self,itri_prot_edge_01);
	CreateInvItem(self,itri_prot_edge_02);
	CreateInvItem(self,itri_prot_mage_01);
	CreateInvItem(self,itri_prot_mage_02);
	CreateInvItem(self,itri_prot_point_01);
	CreateInvItem(self,itri_prot_point_02);
	CreateInvItem(self,itri_prot_total_01);
	CreateInvItem(self,itri_prot_total_02);
	CreateInvItems(self,itpo_mana_01,10);
	CreateInvItems(self,itpo_mana_02,10);
	CreateInvItems(self,itpo_mana_03,10);
	CreateInvItems(self,itpo_health_01,10);
	CreateInvItems(self,itpo_health_02,10);
	CreateInvItems(self,itpo_health_03,10);
	CreateInvItems(self,itpo_perm_str,10);
	CreateInvItems(self,itpo_perm_dex,10);
	CreateInvItems(self,itpo_perm_health,10);
	CreateInvItems(self,itpo_perm_mana,10);
	CreateInvItems(self,itpo_speed,10);
	CreateInvItem(self,itat_meatbugflesh);
	CreateInvItem(self,itat_sheepfur);
	CreateInvItem(self,itat_wolffur);
	CreateInvItem(self,itat_bugmandibles);
	CreateInvItem(self,itat_claw);
	CreateInvItem(self,itat_lurkerclaw);
	CreateInvItem(self,itat_teeth);
	CreateInvItem(self,itat_crawlermandibles);
	CreateInvItem(self,itat_wing);
	CreateInvItem(self,itat_sting);
	CreateInvItem(self,itat_lurkerskin);
	CreateInvItem(self,itat_wargfur);
	CreateInvItem(self,itat_crawlerplate);
	CreateInvItem(self,itat_shadowfur);
	CreateInvItem(self,itat_sharkskin);
	CreateInvItem(self,itat_trollfur);
	CreateInvItem(self,itat_waranfiretongue);
	CreateInvItem(self,itat_shadowhorn);
	CreateInvItem(self,itat_sharkteeth);
	CreateInvItem(self,itat_trolltooth);
	CreateInvItem(self,itat_goblinbone);
	CreateInvItem(self,itat_skeletonbone);
	CreateInvItem(self,itat_demonheart);
	CreateInvItem(self,itat_stonegolemheart);
	CreateInvItem(self,itat_firegolemheart);
	CreateInvItem(self,itat_icegolemheart);
};

