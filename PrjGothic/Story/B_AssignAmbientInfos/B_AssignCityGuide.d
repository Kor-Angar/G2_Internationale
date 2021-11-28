func void b_addcityguidechoices()
{
        Info_ClearChoices(dia_cityguide);
        if(!c_isquarternearest(self,Q_UNTERSTADT))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_unterstadt_description,dia_cityguide_unterstadt); // "В нижнюю часть города."
        };
        if(!c_isquarternearest(self,Q_OBERSTADT))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_oberstadt_description,dia_cityguide_oberstadt); // "В верхний квартал."
        };
        if(!c_isquarternearest(self,Q_TEMPEL))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_tempel_description,dia_cityguide_tempel); // "К храму Аданоса."
        };
        if(!c_isquarternearest(self,Q_MARKT))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_markt_description,dia_cityguide_markt); // "На рыночную площадь."
        };
        if(!c_isquarternearest(self,Q_GALGEN))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_galgen_description,dia_cityguide_galgen); // "На площадь правосудия."
        };
        if(!c_isquarternearest(self,Q_KASERNE))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_kaserne_description,dia_cityguide_kaserne); // "К казармам."
        };
        if(!c_isquarternearest(self,Q_HAFEN))
        {
                Info_AddChoice(dia_cityguide,dia_cityguide_hafen_description,dia_cityguide_hafen); // "В портовый квартал."
        };
        Info_AddChoice(dia_cityguide,dia_cityguide_back_description,dia_cityguide_back); // "Спасибо. Именно это я и хотел узнать!"
};
instance DIA_CITYGUIDE(C_INFO)
{
        nr = 700;
        condition = dia_cityguide_condition;
        information = dia_cityguide_info;
        permanent = TRUE;
        description = "Что ты можешь рассказать мне об этом квартале?";
};
func int dia_cityguide_condition()
{
        return TRUE;
};
func void dia_cityguide_info()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_15_00");  //Что ты можешь рассказать мне об этом квартале?
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN");
        };
        b_say(self,other,"$WHERETO");
        b_addcityguidechoices();
};
func void dia_cityguide_back()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_BACK_15_00");     //Спасибо. Именно это я и хотел узнать!
        Info_ClearChoices(dia_cityguide);
};
func void dia_cityguide_unterstadt()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_UNTERSTADT_15_00");       //Как мне попасть в нижнюю часть города?
        if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE_2_GALGEN");
                b_say(self,other,"$GALGEN_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN_2_UNTERSTADT");
        };
        b_addcityguidechoices();
};
func void dia_cityguide_oberstadt()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_OBERSTADT_15_00");        //Как мне попасть в верхний квартал?
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE_2_GALGEN");
                b_say(self,other,"$GALGEN_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_OBERSTADT");
        };
        b_addcityguidechoices();
};
func void dia_cityguide_tempel()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_TEMPEL_15_00");   //Я ищу храм.
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
        }
        else if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT_2_TEMPEL");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN_2_TEMPEL");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE_2_MARKT");
                b_say(self,other,"$MARKT_2_TEMPEL");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
        };
        b_addcityguidechoices();
};
func void dia_cityguide_markt()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_MARKT_15_00");    //Где находится рыночная площадь?
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_MARKT");
        }
        else if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_MARKT");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL_2_MARKT");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN_2_MARKT");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE_2_MARKT");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_MARKT");
        };
        b_addcityguidechoices();
};
func void dia_cityguide_galgen()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_GALGEN_15_00");   //Как мне попасть на площадь Правосудия?
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_GALGEN");
        }
        else if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_GALGEN");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL_2_GALGEN");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT_2_GALGEN");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE_2_GALGEN");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_GALGEN");
        };
        b_addcityguidechoices();
};
func void dia_cityguide_kaserne()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_KASERNE_15_00");  //Где находятся казармы?
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_GALGEN");
                b_say(self,other,"$GALGEN_2_KASERNE");
        }
        else if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_GALGEN");
                b_say(self,other,"$GALGEN_2_KASERNE");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL_2_GALGEN");
                b_say(self,other,"$GALGEN_2_KASERNE");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT_2_KASERNE");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN_2_KASERNE");
        }
        else if(c_npcisinquarter(self) == Q_HAFEN)
        {
                b_say(self,other,"$HAFEN_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_GALGEN");
                b_say(self,other,"$GALGEN_2_KASERNE");
        };
        b_addcityguidechoices();
};
func void dia_cityguide_hafen()
{
        B_AI_Output(other,self,"DIA_CITYGUIDE_HAFEN_15_00");    //Где находится портовый квартал?
        if(c_npcisinquarter(self) == Q_UNTERSTADT)
        {
                b_say(self,other,"$UNTERSTADT_2_HAFEN");
        }
        else if(c_npcisinquarter(self) == Q_OBERSTADT)
        {
                b_say(self,other,"$OBERSTADT_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_HAFEN");
        }
        else if(c_npcisinquarter(self) == Q_TEMPEL)
        {
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_HAFEN");
        }
        else if(c_npcisinquarter(self) == Q_MARKT)
        {
                b_say(self,other,"$MARKT_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_HAFEN");
        }
        else if(c_npcisinquarter(self) == Q_GALGEN)
        {
                b_say(self,other,"$GALGEN_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_HAFEN");
        }
        else if(c_npcisinquarter(self) == Q_KASERNE)
        {
                b_say(self,other,"$KASERNE_2_GALGEN");
                b_say(self,other,"$GALGEN_2_TEMPEL");
                b_say(self,other,"$TEMPEL_2_UNTERSTADT");
                b_say(self,other,"$UNTERSTADT_2_HAFEN");
        };
        b_addcityguidechoices();
};
func void b_assigncityguide(var C_NPC slf)
{
        dia_cityguide.npc = Hlp_GetInstanceID(slf);
};
