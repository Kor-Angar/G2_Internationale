
var int Internationale_DE;
var int Internationale_ru;

func void B_AI_Output(var C_NPC other_self_1,var C_NPC other_self_2,var string DIA_NPC_Description_ID)
{
	var string concattext;

	if Internationale_ru == true
	{
		concattext = ConcatStrings("Ru_",DIA_NPC_Description_ID);
	}
	else if Internationale_de == true
	{
		concattext = ConcatStrings("De_",DIA_NPC_Description_ID);
	}
	else
	{
		concattext = DIA_NPC_Description_ID;
	};

    AI_Output(other_self_1,other_self_2,concattext);
//	PrintScreen(concattext,50,53,FONT_ScreenSmall,3);
//	Snd_Play("DEM_Die");
};


