instance DIA_SCHWARZMAGIER_HELLO(C_INFO)
{
        npc = dmt_1299_oberdementor_di;
        nr = 5;
        condition = dia_schwarzmagier_hello_condition;
        information = dia_schwarzmagier_hello_info;
        important = TRUE;
};
func int dia_schwarzmagier_hello_condition()
{
        return TRUE;
};
var int sc_knowsmadpsi;
func void dia_schwarzmagier_hello_info()
{
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");  //��� �, ��������� �����, �� ������������� ��������� ����� �� ����� �������.
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");  //��� �� ����� ���� �����������?
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");  //� ����� �������� ��������. ����������� ��������� ������ ������� �� �����. ������������ ���� ���������� ����� ����� ��� ����.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");  //���� ��� �����, � �� ����������� � ������ �������.
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_04");  //�������. ������, ��� �������� ���������� ��� �� ����� �����.
        b_logentry(TOPIC_HALLENVONIRDORATH,TOPIC_HALLENVONIRDORATH_description_157); // "� � ��������� ����. ������ ��� ������ ���� � ���."
        Info_ClearChoices(dia_schwarzmagier_hello);
        Info_AddChoice(dia_schwarzmagier_hello,dia_schwarzmagier_hello_meister_description,dia_schwarzmagier_hello_meister); // "������ ���� � ������ �������."
        Info_AddChoice(dia_schwarzmagier_hello,dia_schwarzmagier_hello_dmt_description,dia_schwarzmagier_hello_dmt); // "� ������� ��� ���� �������� ��� �������� �����?"
        Info_AddChoice(dia_schwarzmagier_hello,dia_schwarzmagier_hello_hintertor_description,dia_schwarzmagier_hello_hintertor); // "� ��� ���������� �� ��� �������� �������� ��� ���?"
        Info_AddChoice(dia_schwarzmagier_hello,dia_schwarzmagier_hello_wer_description,dia_schwarzmagier_hello_wer); // "��� ���� ������?"
        if(SC_KNOWSMADPSI == TRUE)
        {
                Info_AddChoice(dia_schwarzmagier_hello,dia_schwarzmagier_hello_schlaefer_description,dia_schwarzmagier_hello_schlaefer); // "�� ��� �������������� �������."
        };
};
func void dia_schwarzmagier_hello_wer()
{
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");      //��� ���� ������?
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");      //�� �������� ����� ������. ��� ������������ �������� ���������� ���.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");      //�� ��������� �������. �� ���, ��� ��������� ����������� �� ���������� �������������� ������.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");      //�� ����� ������ ����, ��� ����������� � ��� �������.
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_04");      //�������� �����.
};
func void dia_schwarzmagier_hello_hintertor()
{
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");        //� ��� ���������� �� ��� �������� ��������, ��� ���?
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");        //(�������) ����� ����� ���������� ��������� ������������ ��� ����. � �� ��� ���� ����������� ������� ��� �����.
};
func void dia_schwarzmagier_hello_schlaefer()
{
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");        //�� ��� �������������� �������.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");        //��� ���� � ������� �������. ���������� ������ ��� �����. ������ ����� �� ��������� ���.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_02");        //���������� ������� ��� ����������� ��������� ���� ������ � ����, �����������.
        TOPIC_END_DEMENTOREN = TRUE;
        b_giveplayerxp(XP_AMBIENT);
};
func void dia_schwarzmagier_hello_dmt()
{
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");      //� ������� ��� ���� �������� ��� �������� �����?
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");      //��� �����. �� ���� �� �������������, ��� ������������� ��, ��� ���� ������� ���� �������.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");      //�� ����� ���������� �� ���� �����, ����� �� ������� � ���� ���.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");      //����� ���������� ��� �� ��������, ���������� ���� �������� ����. ��� ���� �����, � ���� �����, ����� ��������.
        B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_04");      //��.
};
func void dia_schwarzmagier_hello_meister()
{
        Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
        Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
        Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
        Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
        AI_PlayAni(self,"T_PRACTICEMAGIC5");
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");  //(���������) ������ ��������! � �������� ����.
        B_AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");  //���� ���� ��������, � ���� ��� ������� �� ����.
        if(Npc_HasItems(other,itam_prot_blackeye_mis))
        {
                B_AI_Output(other,self,"DIA_Schwarzmagier_HELLO_meister_15_02");  //(���� ��� ���) ��� ����� ������� ������ ��� � ���� �� ���� ������� �������� ������.
        }
        else
        {
                hero.attribute[ATR_MANA] = 0;
                if(hero.attribute[ATR_HITPOINTS] > 50)
                {
                        hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
                };
                SC_OBSESSIONCOUNTER = 100;
                b_scisobsessed(hero);
        };
        Info_ClearChoices(dia_schwarzmagier_hello);
        Info_AddChoice(dia_schwarzmagier_hello,DIALOG_ENDE,dia_schwarzmagier_hello_back);
};
func void dia_schwarzmagier_hello_back()
{
        AI_StopProcessInfos(self);
        Wld_StopEffect("DEMENTOR_FX");
        self.flags = 0;
        Snd_Play("MFX_FEAR_CAST");
        b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};
