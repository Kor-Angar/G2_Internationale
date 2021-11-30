func void b_say(var C_NPC slf,var C_NPC oth,var string text)
{
	if Internationale == 1
	{
		text = ConcatStrings(text,"_Ru");
	}
	else if Internationale == 2
	{
		text = ConcatStrings(text,"_De");
	};

	AI_OutputSVM(slf,oth,text);
};
