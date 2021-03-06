instance DIA_ENGARDO_EXIT(C_INFO)
{
        npc = sld_841_engardo;
        nr = 999;
        condition = dia_engardo_exit_condition;
        information = dia_engardo_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_engardo_exit_condition()
{
        return TRUE;
};
func void dia_engardo_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ENGARDO_HALLO(C_INFO)
{
        npc = sld_841_engardo;
        nr = 4;
        condition = dia_engardo_hallo_condition;
        information = dia_engardo_hallo_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_engardo_hallo_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
var int chance;
func void dia_engardo_hallo_info()
{
        AKILS_SLDSTILLTHERE = TRUE;
        if(CHANCE == FALSE)
        {
                B_AI_Output(self,other,"DIA_Engardo_HALLO_13_00");        //??, ?????, ?? ???, ??????????? ??????????? ?? ???? ???? ? ?????? ????.
                CHANCE = 1;
                AI_StopProcessInfos(self);
        }
        else if(CHANCE == 1)
        {
                B_AI_Output(self,other,"DIA_Engardo_HALLO_13_01");        //?? ???????? ?? ? ??? ????? ?? ? ?? ?????...
                B_AI_Output(self,other,"DIA_Engardo_HALLO_13_02");        //...??? ???, ???? ?????? ????, ????? ????? ??????. ??????
                CHANCE = 2;
                AI_StopProcessInfos(self);
        }
        else if(CHANCE == 2)
        {
                B_AI_Output(self,other,"DIA_Engardo_HALLO_13_03");        //? ???? ???, ?? ?????? ?? ??? ? ???????, ??? ???? ????? ??????? ???????? (?????) ????? - ??? ????? ??? ??????? ??????.
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
        };
};
instance DIA_ENGARDO_PICKPOCKET(C_INFO)
{
        npc = sld_841_engardo;
        nr = 900;
        condition = dia_engardo_pickpocket_condition;
        information = dia_engardo_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_engardo_pickpocket_condition()
{
        return c_beklauen(34,45);
};
func void dia_engardo_pickpocket_info()
{
        Info_ClearChoices(dia_engardo_pickpocket);
        Info_AddChoice(dia_engardo_pickpocket,DIALOG_BACK,dia_engardo_pickpocket_back);
        Info_AddChoice(dia_engardo_pickpocket,DIALOG_PICKPOCKET,dia_engardo_pickpocket_doit);
};
func void dia_engardo_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_engardo_pickpocket);
};
func void dia_engardo_pickpocket_back()
{
        Info_ClearChoices(dia_engardo_pickpocket);
};
