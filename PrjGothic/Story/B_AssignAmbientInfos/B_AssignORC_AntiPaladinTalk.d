
var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		B_AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//���������! ������ �������� �� ������� ������! ������ ����. ������ ������ ����.
		B_AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//��, ������������ ������ ����� �����, ������ ���� ������ ����� ������� �������.
		B_AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//����� � ��� ���� ����� ����������. ���� �� �� ����� ������ ��.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		B_AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//������ �������� ������������� �����, ��������� ������ �������� ��������. �� ������� �� ���� ����. ���������!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		B_AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//��, ������������ �����, ������ ���� ���� ������� ����, �������.
	}
	else
	{
		B_AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//���������! �� ������� ����, �������.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};

