var string PRINT_STR;
var string PRINT_MANA;
var string PRINT_DEX;



func void menu_text_ru()
{
	PRINT_STR = "����";
	PRINT_MANA = "����";
	PRINT_DEX = "��������";
};


func void menu_text_de ()
{
	PRINT_STR = "����";
	PRINT_MANA = "����";
	PRINT_DEX = "��������";
};

func void RU_text ()
{
MOBNAME_CRATE = "����";
MOBNAME_CHEST = "������";
MOBNAME_BED = "�������";
MOBNAME_DOOR = "�����";
MOBNAME_CAMPFIRE = "";
MOBNAME_TORCH = "";
MOBNAME_TORCHHOLDER = "";
MOBNAME_BARBQ_SCAV = "";
MOBNAME_BARBQ_SHEEP = "";
MOBNAME_BENCH = "";
MOBNAME_ANVIL = "����������";
MOBNAME_BUCKET = "����� ��� ����";
MOBNAME_FORGE = "��������� ����";
MOBNAME_GRINDSTONE = "��������� ������";
MOBNAME_WHEEL = "�������";
MOBNAME_LAB = "���� ��������";
MOBNAME_BOOKSTAND = "������� �����";
MOBNAME_BOOKSBOARD = "������� �����";
MOBNAME_CHAIR = "";
MOBNAME_CAULDRON = "";
MOBNAME_SEAT = "";
MOBNAME_THRONE = "";
MOBNAME_PAN = "���������";
MOBNAME_REPAIR = "";
MOBNAME_WATERPIPE = "������";
MOBNAME_SWITCH = "�����������";
MOBNAME_ORE = "������ ����";
MOBNAME_WINEMAKER = "";
MOBNAME_ORCDRUM = "";
MOBNAME_STOVE = "�����";
MOBNAME_INNOS = "������ ������";
MOBNAME_RUNEMAKER = "������ ����";
MOBNAME_SAW = "����";
MOBNAME_ARMCHAIR = "������";
MOBNAME_LIBRARYLEVER = "�����";
MOBNAME_SECRETSWITCH = "";
MOBNAME_BIBLIOTHEK = "����������";
MOBNAME_VORRATSKAMMER = "��������";
MOBNAME_SCHATZKAMMER = "������������";
MOBNAME_IGARAZ = "������ �������";
MOBNAME_ALMANACH = "��������";
MOBNAME_CITY = "�������";
MOBNAME_TAVERN = "�������";
MOBNAME_GR_PEASANT = "��������";
MOBNAME_MONASTERY = "� ���������";
MOBNAME_PASSOW = "������";
MOBNAME_CITY2 = "�������";
MOBNAME_LIGHTHOUSE = "����";
MOBNAME_MONASTERY2 = "�������";
MOBNAME_PRISON = "�������";
MOBNAME_GR_PEASANT2 = "�������";
MOBNAME_INCITY01 = "����";
MOBNAME_INCITY02 = "�������� �������";
MOBNAME_INCITY03 = "������� �������";
MOBNAME_INCITY04 = "�������� �������";
MOBNAME_INCITY05 = "�������� �������";
MOBNAME_BOW_01 = "����� '� ������������ ������'";
MOBNAME_MIX_01 = "����� '������ ������� ������'";
MOBNAME_MIX_02 = "������ ����� ������� '��������� ������'";
MOBNAME_SMITH_01 = "����� '� ������� ����������'";
MOBNAME_BAR_01 = "������� '� ���������� ����������'";
MOBNAME_BAR_02 = "������� '� �������� ���������'";
MOBNAME_TAVERN_01 = "������� '������� ������'";
MOBNAME_HOTEL_01 = "��������� ���� '� ������� ����������'";
MOBNAME_HOTEL_02 = "������� '������� ������'";
MOBNAME_SALANDRIL = "����� '����� ����������'";
MOBNAME_GRAVETEAM_01 = "������� - '������-��, �����������'";
MOBNAME_GRAVETEAM_02 = "����� - '�������'";
MOBNAME_GRAVETEAM_03 = "������ - '��� ����� ������'";
MOBNAME_GRAVETEAM_04 = "��� - '���� ��� �� �����'";
MOBNAME_GRAVETEAM_05 = "���� - '����� ��� ���?'";
MOBNAME_GRAVETEAM_06 = "����� - '�� ���������!'";
MOBNAME_GRAVETEAM_07 = "������� - '��� ������� ������...'";
MOBNAME_GRAVETEAM_08 = "����� - '����������!'";
MOBNAME_GRAVETEAM_09 = "������� ������ - '�������, �� ����� ��������-���������'";
MOBNAME_GRAVETEAM_10 = "������ - '������, ���!'";
MOBNAME_GRAVETEAM_11 = "���� - '����� �� �����, ����� �� ���� ����...'";
MOBNAME_GRAVETEAM_12 = "����� - '��� ������ �������� ������ ��� ��������?'";
MOBNAME_GRAVETEAM_13 = "����� - '��, � ������ ���� ���-���...'";
MOBNAME_GRAVETEAM_14 = "��� - '����� ������� � ������ ��������?'";
MOBNAME_GRAVETEAM_15 = "����������� ???-432 - '��� ����� ��������, �� ����� �� ����'";
MOBNAME_GRAVETEAM_16 = "������� ����� 350-410 - '� ������ ���� � ����'";
MOBNAME_GRAVE_01 = "����� ������ ��� ����� 551-589 - '������, ������ � ���� ��������'";
MOBNAME_GRAVE_02 = "������� 465-480 - '� ������ ����� ���� �������'";
MOBNAME_GRAVE_03 = "������� 525-550";
MOBNAME_GRAVE_04 = "�����������";
MOBNAME_GRAVE_05 = "���� ��������� 325-431 - '� ��� ��������� ���� ������ �� ��'";
MOBNAME_GRAVE_06 = "���� ����������� 205-532";
MOBNAME_GRAVE_07 = "������ 510-546";
MOBNAME_GRAVE_08 = "����� 634-579 - '������� �����'";
MOBNAME_GRAVE_09 = "����������� ������";
MOBNAME_GRAVE_10 = "������� ������������ ���� 2894-3787 - '��� ��� ����! ������ ���...'";
MOBNAME_GRAVE_11 = "������ 220-310 - '��� ��������'";
MOBNAME_GRAVE_12 = "������� ����� ???-390 - '����������� ���� ��� � ��� ������������'";
MOBNAME_GRAVE_13 = "������ ����� 234-298 - '����� �����'";
MOBNAME_GRAVE_14 = "������� ���� 456-512 - '������ ������ ���� ���������� ���'";
MOBNAME_GRAVE_17 = "����� ������� 730-756";
MOBNAME_GRAVE_18 = "����� 721-762";
MOBNAME_GRAVE_19 = "����� 757-759";
MOBNAME_GRAVE_20 = "����� ���� 703-736";
MOBNAME_GRAVE_21 = "����� ����� 732-771";
MOBNAME_GRAVE_22 = "������ ����� 722-764";
MOBNAME_GRAVE_23 = "�������� ����� 741-755";
MOBNAME_GRAVE_24 = "��� 725-773";
MOBNAME_GRAVE_25 = "�����������";
MOBNAME_GRAVE_26 = "���� ������ 721-779";
MOBNAME_GRAVE_27 = "����� 713-752";
MOBNAME_GRAVE_28 = "����� ������ ��� ��� 120-212";
MOBNAME_GRAVE_29 = "���� ���� �� ��������� 117-212";
MOBNAME_GRAVE_30 = "���� ������ ��� ������� 156-212";
MOBNAME_GRAVE_31 = "������ ���� ����� 145-212";
MOBNAME_GRAVE_32 = "������ ������ ����� 112-212";
MOBNAME_GRAVE_33 = "�������� ����� ���� ������� 178-212";
MOBNAME_ADDON_IDOL = "������ �������";
/*
TXT_GUILDS[66] =
{
	"��� �������",
	"�������",
	"���������",
	"���������",
	"��� ����",
	"���������",
	"������� �� ��������",
	"�������",
	"����������",
	"������",
	"���������",
	"������",
	"�������",
	"�����",
	"��� ����",
	"GIL_PUBLIC",
	"GIL_SEPERATOR_HUM",
	"������ ���",
	"����",
	"������",
	"������ �������",
	"��������� ������ �������",
	"���������",
	"���������� �����",
	"������� ������",
	"�������� ����",
	"����",
	"����",
	"��������� ����",
	"�������",
	"������",
	"������",
	"��������� ������",
	"������-���",
	"�����",
	"�������",
	"��������",
	"������ ���������",
	"������",
	"�������� �����",
	"�������� �����",
	"������� �����",
	"��������� �����",
	"�����",
	"��������� �����",
	"������",
	"�������� �����",
	"������",
	"���������",
	"���������",
	"�������� �����",
	"�������� �����",
	"�������",
	"���������� ������",
	"��������� �����",
	"��������� �����",
	"GIL_EMPTY_B",
	"GIL_EMPTY_C",
	"GIL_SEPERATOR_ORC",
	"���",
	"������������� ���",
	"���-������",
	"�������-����",
	"GIL_EMPTY_X",
	"GIL_EMPTY_Y",
	"GIL_EMPTY_Z"
};

TXT_SPELLS[100] =
{
	"������ ����",
	"����� ���������",
	"������ ������",
	"������� ���������",
	"�������� ���",
	"������� ���������",
	"����������� ���",
	"��������� ��������",
	"� ����",
	"� ���������",
	"� ���������",
	"� ��������",
	"� ������� ��������",
	"� ������� ������ ��������",
	"� �����",
	"� ������ ������������ �����",
	"� �������",
	"T3",
	"����",
	"�������� ������",
	"������� ������",
	"������� ������ �������",
	"����� ������� �������",
	"�������� ���",
	"����� ������",
	"����� �����",
	"����� �����",
	"���",
	"������� ������� �������",
	"������",
	"������� �������� ���",
	"����� �������",
	"�����",
	"������� ����",
	"������� ������",
	"����� ������",
	"����������� ������",
	"������� �������� ����",
	"����� �������� ����",
	"������� �����",
	"����� ������",
	"������� ������� �������",
	"�������� �����",
	"������� ������",
	"����� ������",
	"����� ����",
	"���������� �������",
	"����������� � ����",
	"����������� � ����������",
	"����������� � ���������� �����",
	"����������� � �������� �������",
	"����������� � �����",
	"����������� � �����",
	"����������� � ��������",
	"����������� � �����",
	"����������� � ��������� �����",
	"����������� � �������",
	"����������� � ���������",
	"����������� � ���������� ��������",
	"��������",
	"������ ����",
	"������ ������",
	"��� ������",
	"������ ����������",
	"�������� ������",
	"TXT_SPL_RESERVED_65",
	"TXT_SPL_RESERVED_66",
	"TXT_SPL_RESERVED_67",
	"TXT_SPL_RESERVED_68",
	"TXT_SPL_RESERVED_69",
	"����",
	"�����",
	"����� ����",
	"������� �����",
	"��������� �����",
	"������",
	"�������",
	"TXT_SPL_RESERVED_77",
	"TXT_SPL_RESERVED_78",
	"TXT_SPL_RESERVED_79",
	"��������� ���������",
	"��� ���������",
	"������-�������",
	"�������������",
	"����� ������",
	"���� �������",
	"����� �������",
	"���� ������",
	"����� �����",
	"����� ����",
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
NAME_SPL_PALLIGHT = "������ ����";
NAME_SPL_PALLIGHTHEAL = "����� ���������";
NAME_SPL_PALHOLYBOLT = "������ ������";
NAME_SPL_PALMEDIUMHEAL = "������� ���������";
NAME_SPL_PALREPELEVIL = "�������� ���";
NAME_SPL_PALFULLHEAL = "������� ���������";
NAME_SPL_PALDESTROYEVIL = "����������� ���";
NAME_SPL_PALTELEPORTSECRET = "��������� ��������";
NAME_SPL_TELEPORTSEAPORT = "�������� � ����";
NAME_SPL_TELEPORTMONASTERY = "�������� � ���������";
NAME_SPL_TELEPORTFARM = "�������� � ���������";
NAME_SPL_TELEPORTXARDAS = "�������� � ��������";
NAME_SPL_TELEPORTPASSNW = "�������� � ������� ��������";
NAME_SPL_TELEPORTPASSOW = "�������� � ������� ������ ��������";
NAME_SPL_TELEPORTOC = "�������� � �����";
NAME_SPL_TELEPORTOWDEMONTOWER = "�������� � ������� ������������ �����";
NAME_SPL_TELEPORTTAVERNE = "�������� � �������";
NAME_SPL_TELEPORT_3 = "T3";
NAME_SPL_LIGHT = "����";
NAME_SPL_FIREBOLT = "�������� ������";
NAME_SPL_ICEBOLT = "������� ������";
NAME_SPL_LIGHTHEAL = "������� ������ �������";
NAME_SPL_SUMMONGOBLINSKELETON = "����� ������� �������";
NAME_SPL_INSTANTFIREBALL = "�������� ���";
NAME_SPL_ZAP = "����� ������";
NAME_SPL_SUMMONWOLF = "����� �����";
NAME_SPL_WINDFIST = "����� �����";
NAME_SPL_SLEEP = "���";
NAME_SPL_MEDIUMHEAL = "������� ������� �������";
NAME_SPL_FIRESTORM = "����� �������� ����";
NAME_SPL_SUMMONSKELETON = "����� �������";
NAME_SPL_FEAR = "�����";
NAME_SPL_ICECUBE = "������� ����";
NAME_SPL_CHARGEZAP = "������� ������";
NAME_SPL_LIGHTNINGFLASH = "������";
NAME_SPL_SUMMONGOLEM = "����� ������";
NAME_SPL_DESTROYUNDEAD = "����������� ������";
NAME_SPL_CHARGEFIREBALL = "������� �������� ���";
NAME_SPL_PYROKINESIS = "������� �������� ����";
NAME_SPL_ICEWAVE = "������� �����";
NAME_SPL_SUMMONDEMON = "����� ������";
NAME_SPL_FULLHEAL = "������� ������� �������";
NAME_SPL_FIRERAIN = "�������� �����";
NAME_SPL_BREATHOFDEATH = "������� ������";
NAME_SPL_MASSDEATH = "����� ������";
NAME_SPL_ARMYOFDARKNESS = "����� ����";
NAME_SPL_SHRINK = "���������� �������";
NAME_SPL_TRFSHEEP = "����������� � ����";
NAME_SPL_TRFSCAVENGER = "����������� � ����������";
NAME_SPL_TRFGIANTRAT = "����������� � ���������� �����";
NAME_SPL_TRFGIANTBUG = "����������� � �������� �������";
NAME_SPL_TRFWOLF = "����������� � �����";
NAME_SPL_TRFWARAN = "����������� � �����";
NAME_SPL_TRFSNAPPER = "����������� � ��������";
NAME_SPL_TRFWARG = "����������� � �����";
NAME_SPL_TRFFIREWARAN = "����������� � ��������� �����";
NAME_SPL_TRFLURKER = "����������� � �������";
NAME_SPL_TRFSHADOWBEAST = "����������� � ���������";
NAME_SPL_TRFDRAGONSNAPPER = "����������� � ���������� ��������";
NAME_SPL_CHARM = "��������";
NAME_SPL_MASTEROFDISASTER = "������ ����";
/*
TXT_TALENTS[22] =
{
	"",
	"����������",
	"���������",
	"���",
	"�������",
	"�������",
	"",
	"�����",
	"�������������",
	"",
	"",
	"����������",
	"���������",
	"����� ������",
	"�������� ���",
	"�������",
	"������ ����",
	"",
	"",
	"",
	"",
	""
};



TXT_INV_CAT[9] =
{
	"",
	"������",
	"�������",
	"�����",
	"���������",
	"���",
	"�����",
	"���������",
	"������"
};
*/
/*
	TXT_TALENTS_SKILLS[1] ="";
	TXT_TALENTS_SKILLS[2] ="�������|����|������";
	TXT_TALENTS_SKILLS[3] ="�������|����|������";
	TXT_TALENTS_SKILLS[4] ="�������|�������|������";
	TXT_TALENTS_SKILLS[5] ="�������|�������|������";
	TXT_TALENTS_SKILLS[6] ="�� �������|�������";
	TXT_TALENTS_SKILLS[7] ="";
	TXT_TALENTS_SKILLS[8] ="�� �������|���� 1|���� 2|���� 3|���� 4|���� 5|���� 6";
	TXT_TALENTS_SKILLS[9] ="�� �������|�������";
	TXT_TALENTS_SKILLS[10] ="";
	TXT_TALENTS_SKILLS[11] ="";
	TXT_TALENTS_SKILLS[12] ="�� �������|�������";
	TXT_TALENTS_SKILLS[13] ="�� �������|�������";
	TXT_TALENTS_SKILLS[14] ="�� �������|�������";
	TXT_TALENTS_SKILLS[15] ="�� �������|�������";
	TXT_TALENTS_SKILLS[16] ="�� �������|�������";
	TXT_TALENTS_SKILLS[17] ="�� �������|�������";
	TXT_TALENTS_SKILLS[18] ="";
	TXT_TALENTS_SKILLS[19] ="";
	TXT_TALENTS_SKILLS[20] ="";
	TXT_TALENTS_SKILLS[21] ="";
	TXT_TALENTS_SKILLS[22] ="";
*/
/*
const	string TXT_TALENTS_SKILLS[22] =
{
	"",
	"�������|����|������",
	"�������|����|������",
	"�������|�������|������",
	"�������|�������|������",
	"�� �������|�������",
	"",
	"�� �������|���� 1|���� 2|���� 3|���� 4|���� 5|���� 6",
	"�� �������|�������",
	"",
	"",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"",
	"",
	"",
	"",
	""
};
*/
/*
const	string TXT_TALENTS_SKILLS[22] =
{
	"",
	"�������|����|������",
	"�������|����|������",
	"�������|�������|������",
	"�������|�������|������",
	"�� �������|�������",
	"",
	"�� �������|���� 1|���� 2|���� 3|���� 4|���� 5|���� 6",
	"�� �������|�������",
	"",
	"",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"�� �������|�������",
	"",
	"",
	"",
	"",
	""
};
*/

NAME_PALADIN = "�������";
NAME_MILIZ = "���������";
NAME_TORWACHE = "�������� � �����";
NAME_TUERWACHE = "�������� � �����";
NAME_STADTWACHE = "��������� ��������";
NAME_ARBEITER = "�������";
NAME_RITTER = "������";
NAME_WACHE = "��������";
NAME_BUERGER = "���������";
NAME_BUERGERIN = "���������";
NAME_MAGD = "��������";
NAME_MAGIER = "��� ����";
NAME_NOVIZE = "���������";
NAME_DRACHENJAEGER = "������� �� ��������";
NAME_TOTERDRACHENJAEGER = "������� ������� �� ��������";
NAME_SOELDNER = "�������";
NAME_BAUER = "����������";
NAME_BAEUERIN = "����������";
NAME_BANDIT = "������";
NAME_STRAEFLING = "���������";
NAME_WAFFENKNECHT = "����������";
NAME_DEMENTOR = "������";
NAME_TOTERNOVIZE = "������� ���������";
NAME_ANTIPALDIN = "������������ �����";
NAME_SCHIFFSWACHE = "����������� ��������";
NAME_FLUECHTLING = "������";
DIALOG_ENDE = "�����";
DIALOG_BACK = "�����";
DIALOG_TRADE = "(������)";
DIALOG_PICKPOCKET = "(�������)";
NAME_RING = "������";
NAME_AMULETT = "������";
NAME_TRANK = "�����";
NAME_RUNE = "����";
NAME_SPRUCHROLLE = "������";
NAME_BEUTEL = "������� �������";
NAME_BAG = "�����";
NAME_CURRENCY = "������: ";
PRINT_TRADE_NOT_ENOUGH_GOLD = "� ��� ������������ ������ ��� ������� ����� ��������.";
NAME_VALUE = "����:";
NAME_MAG_CIRCLE = "����:";
NAME_MANAKOSTEN = "������ ����:";
NAME_MANAKOSTENMAX = "������ ���� (����.):";
NAME_MANAPERSEC = "���� � �������:";
NAME_DURATION = "������������ (�����):";
NAME_SEC_DURATION = "������������ (������):";
NAME_MANA_NEEDED = "���������� ����:";
NAME_STR_NEEDED = "���������� ����:";
NAME_DEX_NEEDED = "���������� ��������:";
NAME_DAM_EDGE = "���� �������:";
NAME_DAM_POINT = "���� ��������:";
NAME_DAM_FIRE = "���� �����:";
NAME_DAM_MAGIC = "���� ������:";
NAME_DAM_FLY = "���� ������:";
NAME_DAMAGE = "����:";
NAME_DAMAGE_MAX = "������������ ����:";
NAME_PERMANA = " (�� ��. ����)";
NAME_DAMAGEPERSEC = "���� � �������:";
NAME_PROT_EDGE = "������ �� ������:";
NAME_PROT_POINT = "������ �� �����:";
NAME_PROT_FIRE = "������ �� ����:";
NAME_PROT_MAGIC = "������ �� �����:";
NAME_BONUS_HP = "�������� � ��������:";
NAME_BONUS_MANA = "�������� � ����:";
NAME_BONUS_HPMAX = "�������� � ����. ��������:";
NAME_BONUS_MANAMAX = "�������� � ����. ����:";
NAME_BONUS_DEX = "�������� � ��������:";
NAME_BONUS_STR = "�������� � ����:";
NAME_ONEHANDED = "���������� ������";
NAME_TWOHANDED = "��������� ������";
NAME_HEALINGPERMANA = "������� �� ��. ����:";
NAME_HEALINGPERCAST = "�������:";
NAME_ITMW_1H_COMMON_01 = "������� ������� ���";
NAME_ITMW_1H_SPECIAL_01 = "������� ������ ���";
NAME_ITMW_2H_SPECIAL_01 = "��������� ������ ���";
NAME_ITMW_1H_SPECIAL_02 = "���������� ������ ���";
NAME_ITMW_2H_SPECIAL_02 = "������� ��������� ������ ���";
NAME_ITMW_1H_SPECIAL_03 = "������ ������ ������";
NAME_ITMW_2H_SPECIAL_03 = "������� ������ ������ ������";
NAME_ITMW_1H_SPECIAL_04 = "������ ������ '������ ��������'";
NAME_ITMW_2H_SPECIAL_04 = "������� ������ ������ '������ ��������'";
PRINT_GOLDGEGEBEN = " ������� ������";
PRINT_ITEMGEGEBEN = " ������";
PRINT_ITEMSGEGEBEN = " ��������� ������";
PRINT_GOLDERHALTEN = " ������� ��������";
PRINT_ITEMERHALTEN = " ��������";
PRINT_ITEMSERHALTEN = " ��������� ��������";
PRINT_KOSTEN = " (";
PRINT_LP = " ����� ��������)";
PRINT_2LP = " ���� ��������)";
PRINT_1LP = " ���� ��������)";
PRINT_NOTENOUGHLEARNPOINTS = "������������ ����� ��������!";
PRINT_NOLEARNOVERPERSONALMAX = "�������� ����� ������� - ";
PRINT_LEARNSTR = "���� + ";
PRINT_LEARNDEX = "�������� + ";
PRINT_LEARNMANA_MAX = "����. ���� + ";
PRINT_LEARNHITPOINTS_MAX = "����. �������� + ";
PRINT_LEARNLP = "���� �������� + ";
PRINT_LEARNCIRCLE_1 = "�������: 1-� ���� �����";
PRINT_LEARNCIRCLE_2 = "�������: 2-� ���� �����";
PRINT_LEARNCIRCLE_3 = "�������: 3-� ���� �����";
PRINT_LEARNCIRCLE_4 = "�������: 4-� ���� �����";
PRINT_LEARNCIRCLE_5 = "�������: 5-� ���� �����";
PRINT_LEARNCIRCLE_6 = "�������: 6-� ���� �����";
PRINT_LEARN1H = "��������: �������� ���������� �������";
PRINT_LEARN1H_AND_2H = "��������: �������� ���������� � ��������� �������";
PRINT_LEARN2H = "��������: �������� ��������� �������";
PRINT_LEARN2H_AND_1H = "��������: �������� ��������� � ���������� �������";
PRINT_LEARNBOW = "��������: �������� �������� �� ����";
PRINT_LEARNBOW_AND_CROSSBOW = "��������: �������� �������� �� ���� � ��������";
PRINT_LEARNCROSSBOW = "��������: �������� �������� �� ��������";
PRINT_LEARNCROSSBOW_AND_BOW = "��������: �������� �������� �� �������� � ����";
PRINT_LEARNPICKLOCK = "�������: �������� ���������";
PRINT_LEARNSNEAK = "�������: ��������� ��������";
PRINT_LEARNACROBAT = "�������: ����������";
PRINT_LEARNPICKPOCKET = "�������: ��������� ���������� ���������";
PRINT_LEARNSMITH = "�������: ��������� ������������ ������";
PRINT_LEARNRUNES = "�������: ��������� �������� ���";
PRINT_LEARNALCHEMY = "�������: ��������� ������������� �����";
PRINT_LEARNALCHEMYINNOSEYE = "�������: ��� �������� ���� ������";
PRINT_LEARNTAKEANIMALTROPHY = "�������: ������ ��������";
PRINT_LEARNPALTELEPORTSECRET = "�������: �������� ����-���������";
PRINT_LEARNSTR1 = "���� + 1";
PRINT_LEARNSTR5 = "���� + 5";
PRINT_LEARNSTR10 = "���� + 10";
PRINT_LEARNSTR20 = "���� + 20";
PRINT_LEARNDEX1 = "�������� + 1";
PRINT_LEARNDEX5 = "�������� + 5";
PRINT_LEARNDEX10 = "�������� + 10";
PRINT_LEARNDEX20 = "�������� + 20";
PRINT_LEARNMANA1 = "���� + 1";
PRINT_LEARNMANA5 = "���� + 5";
PRINT_LEARNMANA10 = "���� + 10";
PRINT_LEARNMANA20 = "���� + 20";
PRINT_LEARN1H1 = "���������� ������ + 1";
PRINT_LEARN1H5 = "���������� ������ + 5";
PRINT_LEARN1H10 = "���������� ������ + 10";
PRINT_LEARN1H20 = "���������� ������ + 20";
PRINT_LEARN2H1 = "��������� ������ + 1";
PRINT_LEARN2H5 = "��������� ������ + 5";
PRINT_LEARN2H10 = "��������� ������ + 10";
PRINT_LEARN2H20 = "��������� ������ + 20";
PRINT_LEARNBOW1 = "��� + 1";
PRINT_LEARNBOW5 = "��� + 5";
PRINT_LEARNBOW10 = "��� + 10";
PRINT_LEARNBOW20 = "��� + 20";
PRINT_LEARNCROSSBOW1 = "������� + 1";
PRINT_LEARNCROSSBOW5 = "������� + 5";
PRINT_LEARNCROSSBOW10 = "������� + 10";
PRINT_LEARNCROSSBOW20 = "������� + 20";
PRINT_SLEEPOVER = "�� ������ ��������� � ���������!";
PRINT_SLEEPOVEROBSESSED = "������� �������� ��� ���������!";
PRINT_SMITHSUCCESS = "������ ������!";
PRINT_RUNESUCCESS = "���� �������!";
PRINT_ALCHEMYSUCCESS = "����� ������!";
PRINT_ALCHEMYSUCCESSINNOSEYE = "���� ������ ���������� ��������!";
PRINT_PRODITEMSMISSING = "������������ ������������!";
PRINT_TABAKSUCCESS = "������ ����� �����!";
PRINT_JOINTSUCCESS = "����� �� �������� ����� �����!";
PRINT_NOINNOSTEARS = "��� �� ������� '���� ������'.";
PRINT_KEYMISSING = "��� ������� �� ������� ��� ��� ����������� �����!";
PRINT_PICKLOCKMISSING = "����� �� ����������� �������!";
PRINT_PICKLOCK_OR_KEYMISSING = "��... � ���� ��� ������� ��� �����.";
PRINT_NEVEROPEN = "� ������� �� ����� ������� ���� �����!";
PRINT_TOOFAR_AWAY = "������� ������.";
PRINT_WRONGSIDE = "�� � ��� �������.";
PRINT_MISSINGITEM = "� ��� � ��� ������?";
PRINT_ANOTHERUSER = "��� ������������.";
PRINT_NOPICKLOCKTALENT = "� �� ���� ��������� ����� ��������.";
PRINT_NOTHINGTOGET = "�� ����� �� ������ ������ ��������...";
PRINT_NOTHINGTOGET02 = "��� ������ ���...";
PRINT_NOTHINGTOGET03 = "������ �����...";
PRINT_BLESSSTR = "����� ������ ���� � ������: ���� + ";
PRINT_BLESSDEX = "����� ������ ���� � ������: �������� + ";
PRINT_BLESSMANA_MAX = "����� ������ ���� � ������: ����. ���� + ";
PRINT_BLESSHITPOINTS_MAX = "����� ������ ���� � ������: ����. �������� + ";
PRINT_BLESSMANA = "����� ������ ���� � ������� ���� ���.";
PRINT_BLESSHITPOINTS = "����� ������ ���� � ������ ���� ���������.";
PRINT_BLESSMANA_HIT = "����� ������ ����, � �� ���������� ���� ���, ��� ����� ������� ������.";
PRINT_BLESSNONE = "����� ���������� ���� �� ���� �������.";
PRINT_NOTENOUGHGOLD = "������������ ������.";
BLESS_SWORD = "�������� ��� (5000 �������)";
BLESS_SWORD2 = "�������� ��� (����� ������)";
PRAY_PALADIN1 = "... �����, ������������ ���� ����� ��� ������� ������ ...";
PRAY_PALADIN2 = "... ���������� �� ����� ����� � ����� �� ���� ...";
PRAY_PALADIN3 = "... ����� ��� ����������� ��������� � ����� ������ �� ����� ...";
PRAY_PALADIN4 = "... �� ������ ��� ������, �������� ���� �����.";
PRINT_FULLYHEALED = "��������� �������!";
PRINT_EAT1 = "�� ���������� ���� ����������.";
PRINT_EAT2 = "������ � ������ ����.";
PRINT_EAT3 = "�� ����������, ��� ���� ��������� ���!";
PRINT_READASTRONOMY = "������� ������������� ����������� ��������� ���.";
PRINT_GORNSTREASURE = "�������� 100 �������.";
PRINT_KEROLOTHSGELDBEUTEL = "�������� 300 �������.";
PRINT_MALETHBANDITSGOLD = "�������� 300 �������.";
PRINT_DIEGOSTREASURE = "�������� 2000 �������.";
PRINT_IRDORATHBOOKDOESNTOPEN = "��� ����� ���������� �������.";
PRINT_IRDORATHBOOKHIDDENKEY = "� ��������� ���� ����� ������� ����!";
PRINT_FISHLETTER = "� ���� ���� �������� �������.";
PRINT_INNOSEYEGIVEN = "���� ������ �����";
PRINT_INNOSEYEGET = "������� ���� ������";
PRINT_GOTFOURITEMS = "�������� 4 ��������";
PRINT_STR1 = "���� + 1";
PRINT_MANA10 = "���� + 10";
PRINT_DEX2 = "�������� + 2";
PRINT_ORCELITERINGEQUIP = "�� ���������� ��������.";
PRINT_SCISOBSESSED = "�� ���������� ������!";
PRINT_CLEARSCOBSESSION = "�� ���������� ���� �������������!";
PRINT_NUMBERLEFT = " ��������";
PRINT_NOVIZENLEFT = " ����������� ��������";
PRINT_DRAGKILLCOUNT = "���� ��������. �� ���� ��� � �� ���� ����� ��� �������. ������ ����� ������������ �� �������.";
PRINT_SMITH_1H_SPECIAL_01 = " (1 ����� ����)";
PRINT_SMITH_2H_SPECIAL_01 = " (2 ����� ����)";
PRINT_SMITH_1H_SPECIAL_02 = " (2 ����� ����)";
PRINT_SMITH_2H_SPECIAL_02 = " (3 ����� ����)";
PRINT_SMITH_1H_SPECIAL_03 = " (3 ����� ����)";
PRINT_SMITH_2H_SPECIAL_03 = " (4 ����� ����)";
PRINT_SMITH_1H_SPECIAL_04 = " (4 ����� ����, 5 ��. ��������� �����)";
PRINT_SMITH_2H_SPECIAL_04 = " (5 ������ ����, 5 ��. ��������� �����)";
NAME_MAGESCROLL = "������";
PRINT_FOUNDRING = "������� ������";
PRINT_FOUNDAMULETT = "������ ������";
PRINT_FOUNDSCROLL = "������ ������ � �����������";
PRINT_FOUNDPOTION = "������� �����";
PRINT_FOUNDGOLD10 = "������� 10 �������";
PRINT_FOUNDGOLD25 = "������� 25 �������";
PRINT_FOUNDGOLD50 = "������� 50 �������";
PRINT_FOUNDGOLD100 = "������� 100 �������";
PRINT_FOUNDGOLD1000 = "������� 1000 �������";
PRINT_FOUNDRUNEBLANK = "������� ����";
PRINT_FOUNDORENUGGET = "������ ����� ����";
PRINT_FOUNDLOCKPICK = "������� �������";
PRINT_HANNASBEUTEL = "��������� ������ � ��������� �������...";
PRINT_GOTPLANTS = "������� �����";
PRINT_NOSWEEPING = "����� �������� ��� ��� ������� ����������� ��������!";
PRINT_MANDIBLES = "���� ������ �� ���� �������� �������.";
PRINT_BLOODFLY = "�� ���� ������� � ��������.";
PRINT_XPGAINED = "���� + ";
PRINT_LEVELUP = "��������� ������!";
PRINT_NEWLOGENTRY = "����� ������ � ��������";
PRINT_TELEPORTTOOFARAWAY = "������� ������";
PRINT_BIFFSANTEIL = "���� �����: ";
PRINT_BIFFGOLD = " �������";
TEXT_INNOSEYE_SETTING_BROKEN = "������ ����� ������� ����������.";
TEXT_INNOSEYE_SETTING_REPAIRED = "������ ����� ������� � ������� � �����������.";
TEXT_INNOSEYE_GEM = "����������� ������ ����� � ���������.";
PICKPOCKET_20 = "(��� ������ �����, ��� ������� ��� �������)";
PICKPOCKET_40 = "(������� ��� ������� ����� �������� ������)";
PICKPOCKET_60 = "(�������� ������� ��� ������� �������� ����������)";
PICKPOCKET_80 = "(������� ��� ������� ����� �������� ������)";
PICKPOCKET_100 = "(������� ��� ������� ����� ��������� ������)";
PICKPOCKET_120 = "(������� ��� ������� ����������� ����������)";
PICKPOCKET_20_FEMALE = "(��� ������ �����, ��� ������� �� �������)";
PICKPOCKET_40_FEMALE = "(������� �� ������� ����� �������� ������)";
PICKPOCKET_60_FEMALE = "(�������� ������� �� ������� �������� ����������)";
PICKPOCKET_80_FEMALE = "(������� �� ������� ����� �������� ������)";
PICKPOCKET_100_FEMALE = "(������� �� ������� ����� ��������� ������)";
PICKPOCKET_120_FEMALE = "(������� �� ������� ����������� ����������)";

PRINT_POCKET_25 = "������ ����������� ��������� �����.";
PRINT_POCKET_300 = "���� ������� ����� ��������.";
PRINT_POCKET_MIS = "�� ������� ���������� �����";



PRINT_PICKLOCK_SUCCESS = "������, � �� ������ ����.";
PRINT_PICKLOCK_UNLOCK = "����� ������.";
PRINT_PICKLOCK_FAILURE = "����... ��������� ��� ���.";
PRINT_PICKLOCK_BROKEN = "������� ���������.";
PRINT_HITPOINTS_MISSING = "������������ ��������: ";
PRINT_HITPOINTS_MAX_MISSING = "������������ ����. ��������: ";
PRINT_MANA_MISSING = "������������ ����: ";
PRINT_MANA_MAX_MISSING = "������������ ����. ����: ";
PRINT_STRENGTH_MISSING = "������������ ����: ";
PRINT_DEXTERITY_MISSING = "������������ ��������: ";
PRINT_MAGCIRCLES_MISSING = "������� ������ ���������� ���� ��� ������������� ���� ����.";
PRINT_MAGCIRCLES_LOW = "�� ������ ����������� ���� �����.";
_STR_MESSAGE_INTERACT_NO_KEY = "��� ������� ��� ����������� �����.";
_STR_MESSAGE_TRADE_FAILURE = "���� ������ ������������ ������.";
STR_INFO_TRADE_ACCEPT = "�������";
STR_INFO_TRADE_RESET = "���������";
STR_INFO_TRADE_EXIT = "�����";
MENU_TEXT_NEEDS_APPLY = "������� ENTER ��� ���������!";
MENU_TEXT_NEEDS_RESTART = "��������� ��������� ������� � ���� ����� ����������� ����.";
KAPWECHSEL_1 = "����� 1";
KAPWECHSEL_1_TEXT = "������";
KAPWECHSEL_2 = "����� 2";
KAPWECHSEL_2_TEXT = "����������� � �������";
KAPWECHSEL_3 = "����� 3";
KAPWECHSEL_3_TEXT = "���� ������";
KAPWECHSEL_4 = "����� 4";
KAPWECHSEL_4_TEXT = "����� �� ��������";
KAPWECHSEL_5 = "����� 5";
KAPWECHSEL_5_TEXT = "��������";
KAPWECHSEL_6 = "����� 6";
KAPWECHSEL_6_TEXT = "������� ��������";
KAPITELANFANG = "������ �����";

PRINT_BOOKSTANDRUNES1 = "����� ������� ����, ������ ��������� ������ �� ����������������� ������������.";
PRINT_BOOKSTANDRUNES2 = "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.";
PRINT_BOOKSTANDRUNES3 = "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.";

};