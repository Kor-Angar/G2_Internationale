//var int Internationale_DE;
//var int Internationale_ru;
var int Internationale;

func void B_AI_Output(var C_NPC other_self_1,var C_NPC other_self_2,var string DIA_NPC_Description_ID)
{
	//if Internationale_ru == true
	if Internationale == 1
	{
		DIA_NPC_Description_ID = ConcatStrings("Ru_",DIA_NPC_Description_ID);
	}
	//else if Internationale_de == true
	else if Internationale == 2
	{
		DIA_NPC_Description_ID = ConcatStrings("De_",DIA_NPC_Description_ID);
	};
	
    AI_Output(other_self_1,other_self_2,DIA_NPC_Description_ID);
//	PrintScreen(concattext,50,53,FONT_ScreenSmall,3);
//	Snd_Play("DEM_Die");
};


