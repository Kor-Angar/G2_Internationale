//var string TXT_GUILDS[66];
const	string TXT_GUILDS[66] =
{
	"Нет гильдии",
	"Паладин",
	"Ополченец",
	"Горожанин",
	"Маг Огня",
	"Послушник",
	"Охотник на драконов",
	"Наемник",
	"Крестьянин",
	"Бандит",
	"Каторжник",
	"Ищущий",
	"Бродяга",
	"Пират",
	"Маг Воды",
	"GIL_PUBLIC",
	"GIL_SEPERATOR_HUM",
	"Мясной жук",
	"Овца",
	"Гоблин",
	"Скелет гоблина",
	"Вызванный скелет гоблина",
	"Падальщик",
	"Гигантская крыса",
	"Полевой хищник",
	"Кровавая муха",
	"Ящер",
	"Волк",
	"Вызванный волк",
	"Краулер",
	"Луркер",
	"Скелет",
	"Вызванный скелет",
	"Скелет-маг",
	"Зомби",
	"Снеппер",
	"Мракорис",
	"Скелет мракориса",
	"Гарпия",
	"Каменный голем",
	"Огненный голем",
	"Ледяной голем",
	"Вызванный голем",
	"Демон",
	"Вызванный демон",
	"Тролль",
	"Болотная акула",
	"Дракон",
	"Крысокрот",
	"Аллигатор",
	"Болотный голем",
	"Каменный страж",
	"Пантера",
	"Блуждающий огонек",
	"Вызванный страж",
	"Вызванный зомби",
	"GIL_EMPTY_B",
	"GIL_EMPTY_C",
	"GIL_SEPERATOR_ORC",
	"Орк",
	"Дружественный орк",
	"Орк-нежить",
	"Человек-ящер",
	"GIL_EMPTY_X",
	"GIL_EMPTY_Y",
	"GIL_EMPTY_Z"
};

//var string TXT_TALENTS[22];

//MENU_ITEM_TALENT_1_TITLE
const	string TXT_TALENTS[22] =
{
	"",
	"Одноручное",
	"Двуручное",
	"Лук",
	"Арбалет",
	"Отмычки",
	"",
	"Магия",
	"Подкрадывание",
	"",
	"",
	"Акробатика",
	"Карманник",
	"Ковка оружия",
	"Создание рун",
	"Алхимия",
	"Снятие шкур",
	"",
	"",
	"",
	"",
	""
};


//var string TXT_TALENTS_SKILLS[22];


const	string TXT_TALENTS_SKILLS[22] =
{
	"",
	"Новичок|Боец|Мастер",
	"Новичок|Боец|Мастер",
	"Новичок|Стрелок|Мастер",
	"Новичок|Стрелок|Мастер",
	"Не изучено|Изучено",
	"",
	"Не изучено|Круг 1|Круг 2|Круг 3|Круг 4|Круг 5|Круг 6",
	"Не изучено|Изучено",
	"",
	"",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"",
	"",
	"",
	"",
	""
};

var string TXT_INV_CAT[9];


//MENU_ITEM_ATTRIBUTE_1_TITLE
const string TXT_ATTRIBUTE_DESC	[8]	= {

	"HitpointDesc",
	"",
	"ManaDesc",
	"",
	"StrengthDesc",
	"DexterityDesc",
	"",
	""
};

/*
//var string TXT_SPELLS[100];
const	string TXT_SPELLS[100] =
{
	"Святой свет",
	"Малое исцеление",
	"Святая стрела",
	"Среднее исцеление",
	"Изгнание Зла",
	"Большое исцеление",
	"Уничтожение Зла",
	"Секретный телепорт",
	"В порт",
	"В монастырь",
	"К лендлорду",
	"К Ксардасу",
	"К проходу Хориниса",
	"К проходу Долины Рудников",
	"В замок",
	"К старой демонической башне",
	"К таверне",
	"T3",
	"Свет",
	"Огненная стрела",
	"Ледяная стрела",
	"Лечение легких ранений",
	"Вызов скелета гоблина",
	"Огненный шар",
	"Малая молния",
	"Вызов волка",
	"Кулак ветра",
	"Сон",
	"Лечение средних ранений",
	"Молния",
	"Большой огненный шар",
	"Вызов скелета",
	"Страх",
	"Ледяной блок",
	"Шаровая молния",
	"Вызов голема",
	"Уничтожение нежити",
	"Большая огненная буря",
	"Малая огненная буря",
	"Ледяная волна",
	"Вызов демона",
	"Лечение тяжелых ранений",
	"Огненный дождь",
	"Дыхание смерти",
	"Волна смерти",
	"Армия Тьмы",
	"Уменьшение монстра",
	"Превращение в овцу",
	"Превращение в падальщика",
	"Превращение в гигантскую крысу",
	"Превращение в полевого хищника",
	"Превращение в волка",
	"Превращение в ящера",
	"Превращение в снеппера",
	"Превращение в варга",
	"Превращение в огненного ящера",
	"Превращение в луркера",
	"Превращение в мракориса",
	"Превращение в драконьего снеппера",
	"Забвение",
	"Святой удар",
	"Стрела смерти",
	"Шар смерти",
	"Стрела сотрясения",
	"Телепорт зодчих",
	"TXT_SPL_RESERVED_65",
	"TXT_SPL_RESERVED_66",
	"TXT_SPL_RESERVED_67",
	"TXT_SPL_RESERVED_68",
	"TXT_SPL_RESERVED_69",
	"Буря",
	"Смерч",
	"Кулак воды",
	"Ледяное копье",
	"Надувание людей",
	"Гейзер",
	"Водопад",
	"TXT_SPL_RESERVED_77",
	"TXT_SPL_RESERVED_78",
	"TXT_SPL_RESERVED_79",
	"Нашествие насекомых",
	"Рой насекомых",
	"Корень-ловушка",
	"Землетрясение",
	"Вызов стража",
	"Гнев Белиара",
	"Кража энергии",
	"Крик смерти",
	"Вызов зомби",
	"Вызов Мада",
	"TXT_SPL_RESERVED_90",
	"TXT_SPL_RESERVED_91",
	"TXT_SPL_RESERVED_92",
	"TXT_SPL_RESERVED_93",
	"TXT_SPL_RESERVED_94",
	"TXT_SPL_RESERVED_95",
	"TXT_SPL_RESERVED_96",
	"TXT_SPL_RESERVED_97",
	"TXT_SPL_RESERVED_98",
	"TXT_SPL_RESERVED_99"
};
*/

var string MOBNAME_CRATE;
var string MOBNAME_CHEST;
var string MOBNAME_BED;
var string MOBNAME_DOOR;
var string MOBNAME_CAMPFIRE;
var string MOBNAME_TORCH;
var string MOBNAME_TORCHHOLDER;
var string MOBNAME_BARBQ_SCAV;
var string MOBNAME_BARBQ_SHEEP;
var string MOBNAME_BENCH;
var string MOBNAME_ANVIL;
var string MOBNAME_BUCKET;
var string MOBNAME_FORGE;
var string MOBNAME_GRINDSTONE;
var string MOBNAME_WHEEL;
var string MOBNAME_LAB;
var string MOBNAME_BOOKSTAND;
var string MOBNAME_BOOKSBOARD;
var string MOBNAME_CHAIR;
var string MOBNAME_CAULDRON;
var string MOBNAME_SEAT;
var string MOBNAME_THRONE;
var string MOBNAME_PAN;
var string MOBNAME_REPAIR;
var string MOBNAME_WATERPIPE;
var string MOBNAME_SWITCH;
var string MOBNAME_ORE;
var string MOBNAME_WINEMAKER;
var string MOBNAME_ORCDRUM;
var string MOBNAME_STOVE;
var string MOBNAME_INNOS;
var string MOBNAME_RUNEMAKER;
var string MOBNAME_SAW;
var string MOBNAME_ARMCHAIR;
var string MOBNAME_LIBRARYLEVER;
var string MOBNAME_SECRETSWITCH;
var string MOBNAME_BIBLIOTHEK;
var string MOBNAME_VORRATSKAMMER;
var string MOBNAME_SCHATZKAMMER;
var string MOBNAME_IGARAZ;
var string MOBNAME_ALMANACH;
var string MOBNAME_CITY;
var string MOBNAME_TAVERN;
var string MOBNAME_GR_PEASANT;
var string MOBNAME_MONASTERY;
var string MOBNAME_PASSOW;
var string MOBNAME_CITY2;
var string MOBNAME_LIGHTHOUSE;
var string MOBNAME_MONASTERY2;
var string MOBNAME_PRISON;
var string MOBNAME_GR_PEASANT2;
var string MOBNAME_INCITY01;
var string MOBNAME_INCITY02;
var string MOBNAME_INCITY03;
var string MOBNAME_INCITY04;
var string MOBNAME_INCITY05;
var string MOBNAME_BOW_01;
var string MOBNAME_MIX_01;
var string MOBNAME_MIX_02;
var string MOBNAME_SMITH_01;
var string MOBNAME_BAR_01;
var string MOBNAME_BAR_02;
var string MOBNAME_TAVERN_01;
var string MOBNAME_HOTEL_01;
var string MOBNAME_HOTEL_02;
var string MOBNAME_SALANDRIL;
var string MOBNAME_GRAVETEAM_01;
var string MOBNAME_GRAVETEAM_02;
var string MOBNAME_GRAVETEAM_03;
var string MOBNAME_GRAVETEAM_04;
var string MOBNAME_GRAVETEAM_05;
var string MOBNAME_GRAVETEAM_06;
var string MOBNAME_GRAVETEAM_07;
var string MOBNAME_GRAVETEAM_08;
var string MOBNAME_GRAVETEAM_09;
var string MOBNAME_GRAVETEAM_10;
var string MOBNAME_GRAVETEAM_11;
var string MOBNAME_GRAVETEAM_12;
var string MOBNAME_GRAVETEAM_13;
var string MOBNAME_GRAVETEAM_14;
var string MOBNAME_GRAVETEAM_15;
var string MOBNAME_GRAVETEAM_16;
var string MOBNAME_GRAVE_01;
var string MOBNAME_GRAVE_02;
var string MOBNAME_GRAVE_03;
var string MOBNAME_GRAVE_04;
var string MOBNAME_GRAVE_05;
var string MOBNAME_GRAVE_06;
var string MOBNAME_GRAVE_07;
var string MOBNAME_GRAVE_08;
var string MOBNAME_GRAVE_09;
var string MOBNAME_GRAVE_10;
var string MOBNAME_GRAVE_11;
var string MOBNAME_GRAVE_12;
var string MOBNAME_GRAVE_13;
var string MOBNAME_GRAVE_14;
var string MOBNAME_GRAVE_17;
var string MOBNAME_GRAVE_18;
var string MOBNAME_GRAVE_19;
var string MOBNAME_GRAVE_20;
var string MOBNAME_GRAVE_21;
var string MOBNAME_GRAVE_22;
var string MOBNAME_GRAVE_23;
var string MOBNAME_GRAVE_24;
var string MOBNAME_GRAVE_25;
var string MOBNAME_GRAVE_26;
var string MOBNAME_GRAVE_27;
var string MOBNAME_GRAVE_28;
var string MOBNAME_GRAVE_29;
var string MOBNAME_GRAVE_30;
var string MOBNAME_GRAVE_31;
var string MOBNAME_GRAVE_32;
var string MOBNAME_GRAVE_33;
var string MOBNAME_ADDON_IDOL;


var string NAME_SPL_PALLIGHT;
var string NAME_SPL_PALLIGHTHEAL;
var string NAME_SPL_PALHOLYBOLT;
var string NAME_SPL_PALMEDIUMHEAL;
var string NAME_SPL_PALREPELEVIL;
var string NAME_SPL_PALFULLHEAL;
var string NAME_SPL_PALDESTROYEVIL;
var string NAME_SPL_PALTELEPORTSECRET;
var string NAME_SPL_TELEPORTSEAPORT;
var string NAME_SPL_TELEPORTMONASTERY;
var string NAME_SPL_TELEPORTFARM;
var string NAME_SPL_TELEPORTXARDAS;
var string NAME_SPL_TELEPORTPASSNW;
var string NAME_SPL_TELEPORTPASSOW;
var string NAME_SPL_TELEPORTOC;
var string NAME_SPL_TELEPORTOWDEMONTOWER;
var string NAME_SPL_TELEPORTTAVERNE;
var string NAME_SPL_TELEPORT_3;
var string NAME_SPL_LIGHT;
var string NAME_SPL_FIREBOLT;
var string NAME_SPL_ICEBOLT;
var string NAME_SPL_LIGHTHEAL;
var string NAME_SPL_SUMMONGOBLINSKELETON;
var string NAME_SPL_INSTANTFIREBALL;
var string NAME_SPL_ZAP;
var string NAME_SPL_SUMMONWOLF;
var string NAME_SPL_WINDFIST;
var string NAME_SPL_SLEEP;
var string NAME_SPL_MEDIUMHEAL;
var string NAME_SPL_FIRESTORM;
var string NAME_SPL_SUMMONSKELETON;
var string NAME_SPL_FEAR;
var string NAME_SPL_ICECUBE;
var string NAME_SPL_CHARGEZAP;
var string NAME_SPL_LIGHTNINGFLASH;
var string NAME_SPL_SUMMONGOLEM;
var string NAME_SPL_DESTROYUNDEAD;
var string NAME_SPL_CHARGEFIREBALL;
var string NAME_SPL_PYROKINESIS;
var string NAME_SPL_ICEWAVE;
var string NAME_SPL_SUMMONDEMON;
var string NAME_SPL_FULLHEAL;
var string NAME_SPL_FIRERAIN;
var string NAME_SPL_BREATHOFDEATH;
var string NAME_SPL_MASSDEATH;
var string NAME_SPL_ARMYOFDARKNESS;
var string NAME_SPL_SHRINK;
var string NAME_SPL_TRFSHEEP;
var string NAME_SPL_TRFSCAVENGER;
var string NAME_SPL_TRFGIANTRAT;
var string NAME_SPL_TRFGIANTBUG;
var string NAME_SPL_TRFWOLF;
var string NAME_SPL_TRFWARAN;
var string NAME_SPL_TRFSNAPPER;
var string NAME_SPL_TRFWARG;
var string NAME_SPL_TRFFIREWARAN;
var string NAME_SPL_TRFLURKER;
var string NAME_SPL_TRFSHADOWBEAST;
var string NAME_SPL_TRFDRAGONSNAPPER;
var string NAME_SPL_CHARM;
var string NAME_SPL_MASTEROFDISASTER;





var string NAME_PALADIN;
var string NAME_MILIZ;
var string NAME_TORWACHE;
var string NAME_TUERWACHE;
var string NAME_STADTWACHE;
var string NAME_ARBEITER;
var string NAME_RITTER;
var string NAME_WACHE;
var string NAME_BUERGER;
var string NAME_BUERGERIN;
var string NAME_MAGD;
var string NAME_MAGIER;
var string NAME_NOVIZE;
var string NAME_DRACHENJAEGER;
var string NAME_TOTERDRACHENJAEGER;
var string NAME_SOELDNER;
var string NAME_BAUER;
var string NAME_BAEUERIN;
var string NAME_BANDIT;
var string NAME_STRAEFLING;
var string NAME_WAFFENKNECHT;
var string NAME_DEMENTOR;
var string NAME_TOTERNOVIZE;
var string NAME_ANTIPALDIN;
var string NAME_SCHIFFSWACHE;
var string NAME_FLUECHTLING;
var string DIALOG_ENDE;
var string DIALOG_BACK;
var string DIALOG_TRADE;
var string DIALOG_PICKPOCKET;
var string NAME_RING;
var string NAME_AMULETT;
var string NAME_TRANK;
var string NAME_RUNE;
var string NAME_SPRUCHROLLE;
var string NAME_BEUTEL;
var string NAME_BAG;
var string NAME_CURRENCY;
var string PRINT_TRADE_NOT_ENOUGH_GOLD;
var string NAME_VALUE;
var string NAME_MAG_CIRCLE;
var string NAME_MANAKOSTEN;
var string NAME_MANAKOSTENMAX;
var string NAME_MANAPERSEC;
var string NAME_DURATION;
var string NAME_SEC_DURATION;
var string NAME_MANA_NEEDED;
var string NAME_STR_NEEDED;
var string NAME_DEX_NEEDED;
var string NAME_DAM_EDGE;
var string NAME_DAM_POINT;
var string NAME_DAM_FIRE;
var string NAME_DAM_MAGIC;
var string NAME_DAM_FLY;
var string NAME_DAMAGE;
var string NAME_DAMAGE_MAX;
var string NAME_PERMANA;
var string NAME_DAMAGEPERSEC;
var string NAME_PROT_EDGE;
var string NAME_PROT_POINT;
var string NAME_PROT_FIRE;
var string NAME_PROT_MAGIC;
var string NAME_BONUS_HP;
var string NAME_BONUS_MANA;
var string NAME_BONUS_HPMAX;
var string NAME_BONUS_MANAMAX;
var string NAME_BONUS_DEX;
var string NAME_BONUS_STR;
var string NAME_ONEHANDED;
var string NAME_TWOHANDED;
var string NAME_HEALINGPERMANA;
var string NAME_HEALINGPERCAST;
var string NAME_ITMW_1H_COMMON_01;
var string NAME_ITMW_1H_SPECIAL_01;
var string NAME_ITMW_2H_SPECIAL_01;
var string NAME_ITMW_1H_SPECIAL_02;
var string NAME_ITMW_2H_SPECIAL_02;
var string NAME_ITMW_1H_SPECIAL_03;
var string NAME_ITMW_2H_SPECIAL_03;
var string NAME_ITMW_1H_SPECIAL_04;
var string NAME_ITMW_2H_SPECIAL_04;
var string PRINT_GOLDGEGEBEN;
var string PRINT_ITEMGEGEBEN;
var string PRINT_ITEMSGEGEBEN;
var string PRINT_GOLDERHALTEN;
var string PRINT_ITEMERHALTEN;
var string PRINT_ITEMSERHALTEN;
var string PRINT_KOSTEN;
var string PRINT_LP;
var string PRINT_2LP;
var string PRINT_1LP;
var string PRINT_NOTENOUGHLEARNPOINTS;
var string PRINT_NOLEARNOVERPERSONALMAX;
var string PRINT_LEARNSTR;
var string PRINT_LEARNDEX;
var string PRINT_LEARNMANA_MAX;
var string PRINT_LEARNHITPOINTS_MAX;
var string PRINT_LEARNLP;
var string PRINT_LEARNCIRCLE_1;
var string PRINT_LEARNCIRCLE_2;
var string PRINT_LEARNCIRCLE_3;
var string PRINT_LEARNCIRCLE_4;
var string PRINT_LEARNCIRCLE_5;
var string PRINT_LEARNCIRCLE_6;
var string PRINT_LEARN1H;
var string PRINT_LEARN1H_AND_2H;
var string PRINT_LEARN2H;
var string PRINT_LEARN2H_AND_1H;
var string PRINT_LEARNBOW;
var string PRINT_LEARNBOW_AND_CROSSBOW;
var string PRINT_LEARNCROSSBOW;
var string PRINT_LEARNCROSSBOW_AND_BOW;
var string PRINT_LEARNPICKLOCK;
var string PRINT_LEARNSNEAK;
var string PRINT_LEARNACROBAT;
var string PRINT_LEARNPICKPOCKET;
var string PRINT_LEARNSMITH;
var string PRINT_LEARNRUNES;
var string PRINT_LEARNALCHEMY;
var string PRINT_LEARNALCHEMYINNOSEYE;
var string PRINT_LEARNTAKEANIMALTROPHY;
var string PRINT_LEARNPALTELEPORTSECRET;
var string PRINT_LEARNSTR1;
var string PRINT_LEARNSTR5;
var string PRINT_LEARNSTR10;
var string PRINT_LEARNSTR20;
var string PRINT_LEARNDEX1;
var string PRINT_LEARNDEX5;
var string PRINT_LEARNDEX10;
var string PRINT_LEARNDEX20;
var string PRINT_LEARNMANA1;
var string PRINT_LEARNMANA5;
var string PRINT_LEARNMANA10;
var string PRINT_LEARNMANA20;
var string PRINT_LEARN1H1;
var string PRINT_LEARN1H5;
var string PRINT_LEARN1H10;
var string PRINT_LEARN1H20;
var string PRINT_LEARN2H1;
var string PRINT_LEARN2H5;
var string PRINT_LEARN2H10;
var string PRINT_LEARN2H20;
var string PRINT_LEARNBOW1;
var string PRINT_LEARNBOW5;
var string PRINT_LEARNBOW10;
var string PRINT_LEARNBOW20;
var string PRINT_LEARNCROSSBOW1;
var string PRINT_LEARNCROSSBOW5;
var string PRINT_LEARNCROSSBOW10;
var string PRINT_LEARNCROSSBOW20;
var string PRINT_SLEEPOVER;
var string PRINT_SLEEPOVEROBSESSED;
var string PRINT_SMITHSUCCESS;
var string PRINT_RUNESUCCESS;
var string PRINT_ALCHEMYSUCCESS;
var string PRINT_ALCHEMYSUCCESSINNOSEYE;
var string PRINT_PRODITEMSMISSING;
var string PRINT_TABAKSUCCESS;
var string PRINT_JOINTSUCCESS;
var string PRINT_NOINNOSTEARS;
var string PRINT_KEYMISSING;
var string PRINT_PICKLOCKMISSING;
var string PRINT_PICKLOCK_OR_KEYMISSING;
var string PRINT_NEVEROPEN;
var string PRINT_TOOFAR_AWAY;
var string PRINT_WRONGSIDE;
var string PRINT_MISSINGITEM;
var string PRINT_ANOTHERUSER;
var string PRINT_NOPICKLOCKTALENT;
var string PRINT_NOTHINGTOGET;
var string PRINT_NOTHINGTOGET02;
var string PRINT_NOTHINGTOGET03;
var string PRINT_BLESSSTR;
var string PRINT_BLESSDEX;
var string PRINT_BLESSMANA_MAX;
var string PRINT_BLESSHITPOINTS_MAX;
var string PRINT_BLESSMANA;
var string PRINT_BLESSHITPOINTS;
var string PRINT_BLESSMANA_HIT;
var string PRINT_BLESSNONE;
var string PRINT_NOTENOUGHGOLD;
var string BLESS_SWORD;
var string BLESS_SWORD2;
var string PRAY_PALADIN1;
var string PRAY_PALADIN2;
var string PRAY_PALADIN3;
var string PRAY_PALADIN4;
var string PRINT_FULLYHEALED;
var string PRINT_EAT1;
var string PRINT_EAT2;
var string PRINT_EAT3;
var string PRINT_READASTRONOMY;
var string PRINT_GORNSTREASURE;
var string PRINT_KEROLOTHSGELDBEUTEL;
var string PRINT_MALETHBANDITSGOLD;
var string PRINT_DIEGOSTREASURE;
var string PRINT_IRDORATHBOOKDOESNTOPEN;
var string PRINT_IRDORATHBOOKHIDDENKEY;
var string PRINT_FISHLETTER;
var string PRINT_INNOSEYEGIVEN;
var string PRINT_INNOSEYEGET;
var string PRINT_GOTFOURITEMS;
var string PRINT_STR1;
var string PRINT_MANA10;
var string PRINT_DEX2;
var string PRINT_ORCELITERINGEQUIP;
var string PRINT_SCISOBSESSED;
var string PRINT_CLEARSCOBSESSION;
var string PRINT_NUMBERLEFT;
var string PRINT_NOVIZENLEFT;
var string PRINT_DRAGKILLCOUNT;
var string PRINT_SMITH_1H_SPECIAL_01;
var string PRINT_SMITH_2H_SPECIAL_01;
var string PRINT_SMITH_1H_SPECIAL_02;
var string PRINT_SMITH_2H_SPECIAL_02;
var string PRINT_SMITH_1H_SPECIAL_03;
var string PRINT_SMITH_2H_SPECIAL_03;
var string PRINT_SMITH_1H_SPECIAL_04;
var string PRINT_SMITH_2H_SPECIAL_04;
var string NAME_MAGESCROLL;
var string PRINT_FOUNDRING;
var string PRINT_FOUNDAMULETT;
var string PRINT_FOUNDSCROLL;
var string PRINT_FOUNDPOTION;
var string PRINT_FOUNDGOLD10;
var string PRINT_FOUNDGOLD25;
var string PRINT_FOUNDGOLD50;
var string PRINT_FOUNDGOLD100;
var string PRINT_FOUNDGOLD1000;
var string PRINT_FOUNDRUNEBLANK;
var string PRINT_FOUNDORENUGGET;
var string PRINT_FOUNDLOCKPICK;
var string PRINT_HANNASBEUTEL;
var string PRINT_GOTPLANTS;
var string PRINT_NOSWEEPING;
var string PRINT_MANDIBLES;
var string PRINT_BLOODFLY;
var string PRINT_XPGAINED;
var string PRINT_LEVELUP;
var string PRINT_NEWLOGENTRY;
var string PRINT_TELEPORTTOOFARAWAY;
var string PRINT_BIFFSANTEIL;
var string PRINT_BIFFGOLD;
var string text_innoseye_setting;
var string TEXT_INNOSEYE_SETTING_BROKEN;
var string TEXT_INNOSEYE_SETTING_REPAIRED;
var string TEXT_INNOSEYE_GEM;
var string PICKPOCKET_20;
var string PICKPOCKET_40;
var string PICKPOCKET_60;
var string PICKPOCKET_80;
var string PICKPOCKET_100;
var string PICKPOCKET_120;
var string PICKPOCKET_20_FEMALE;
var string PICKPOCKET_40_FEMALE;
var string PICKPOCKET_60_FEMALE;
var string PICKPOCKET_80_FEMALE;
var string PICKPOCKET_100_FEMALE;
var string PICKPOCKET_120_FEMALE;
var string PRINT_POCKET_25;
var string PRINT_POCKET_300;
var string PRINT_POCKET_MIS;
var string PRINT_PICKLOCK_SUCCESS;
var string PRINT_PICKLOCK_UNLOCK;
var string PRINT_PICKLOCK_FAILURE;
var string PRINT_PICKLOCK_BROKEN;
var string PRINT_HITPOINTS_MISSING;
var string PRINT_HITPOINTS_MAX_MISSING;
var string PRINT_MANA_MISSING;
var string PRINT_MANA_MAX_MISSING;
var string PRINT_STRENGTH_MISSING;
var string PRINT_DEXTERITY_MISSING;
var string PRINT_MAGCIRCLES_MISSING;
var string PRINT_MAGCIRCLES_LOW;
var string _STR_MESSAGE_INTERACT_NO_KEY;
var string _STR_MESSAGE_TRADE_FAILURE;
var string STR_INFO_TRADE_ACCEPT;
var string STR_INFO_TRADE_RESET;
var string STR_INFO_TRADE_EXIT;
var string MENU_TEXT_NEEDS_APPLY;
var string MENU_TEXT_NEEDS_RESTART;
var string KAPWECHSEL_1;
var string KAPWECHSEL_1_TEXT;
var string KAPWECHSEL_2;
var string KAPWECHSEL_2_TEXT;
var string KAPWECHSEL_3;
var string KAPWECHSEL_3_TEXT;
var string KAPWECHSEL_4;
var string KAPWECHSEL_4_TEXT;
var string KAPWECHSEL_5;
var string KAPWECHSEL_5_TEXT;
var string KAPWECHSEL_6;
var string KAPWECHSEL_6_TEXT;
var string KAPITELANFANG;

var string PRINT_BOOKSTANDRUNES1;
var string PRINT_BOOKSTANDRUNES2;
var string PRINT_BOOKSTANDRUNES3;

const int YPOS_GoldGiven = 34;
const int YPOS_GoldTaken = 34;
const int YPOS_ItemGiven = 37;
const int YPOS_ItemTaken = 40;
const int YPOS_LOGENTRY = 45;
const int YPOS_LevelUp = 50;
const int YPOS_XPGained = 55;