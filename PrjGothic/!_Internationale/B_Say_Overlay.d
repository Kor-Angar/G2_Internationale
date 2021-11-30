func void b_say_overlay(var C_NPC slf,var C_NPC oth,var string text)
{
	if Internationale == 1
	{
		text = ConcatStrings(text,"_Ru");
	}
	else if Internationale == 2
	{
		text = ConcatStrings(text,"_De");
	};
	AI_OutputSVM_Overlay(slf,oth,text);
};