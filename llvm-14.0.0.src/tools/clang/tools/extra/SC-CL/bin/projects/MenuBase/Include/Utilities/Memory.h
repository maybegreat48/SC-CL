
int* GetVehicleMetaAddress(VehicleHash Hash);
int* GetExecutableAddress();

enum HandlingIndexes
{
	HANDLING_INDEX_AIRTUG = 0,
	HANDLING_INDEX_ADDER = 1,
	HANDLING_INDEX_AIRBUS = 2,
	HANDLING_INDEX_AMBULAN = 3,
	HANDLING_INDEX_ASEA = 4,
	HANDLING_INDEX_ASTEROPE = 5,
	HANDLING_INDEX_BARRACKS = 6,
	HANDLING_INDEX_BARRACKS2 = 7,
	HANDLING_INDEX_BIFF = 8,
	HANDLING_INDEX_BALLER = 9,
	HANDLING_INDEX_BALLER2 = 10,
	HANDLING_INDEX_BANSHEE = 11,
	HANDLING_INDEX_BENSON = 12,
	HANDLING_INDEX_BISON = 13,
	HANDLING_INDEX_BFINJECT = 14,
	HANDLING_INDEX_BJXL = 15,
	HANDLING_INDEX_BLAZER = 16,
	HANDLING_INDEX_BLAZER2 = 17,
	HANDLING_INDEX_BLISTA = 18,
	HANDLING_INDEX_BOBCATXL = 19,
	HANDLING_INDEX_BODHI2 = 20,
	HANDLING_INDEX_BOXVILLE = 21,
	HANDLING_INDEX_BUCCANEE = 22,
	HANDLING_INDEX_BUFFALO = 23,
	HANDLING_INDEX_BUFFALO2 = 24,
	HANDLING_INDEX_BULLET = 25,
	HANDLING_INDEX_BURRITO = 26,
	HANDLING_INDEX_BUS = 27,
	HANDLING_INDEX_CADDY = 28,
	HANDLING_INDEX_CADDY2 = 29,
	HANDLING_INDEX_CAMPER = 30,
	HANDLING_INDEX_CARBONIZ = 31,
	HANDLING_INDEX_CAVCADE = 32,
	HANDLING_INDEX_CHEETAH = 33,
	HANDLING_INDEX_COACH = 34,
	HANDLING_INDEX_COGCABRIO = 35,
	HANDLING_INDEX_COMET = 36,
	HANDLING_INDEX_COQUETTE = 37,
	HANDLING_INDEX_CRUSADER = 38,
	HANDLING_INDEX_DILETTANTE = 39,
	HANDLING_INDEX_DOCKTUG = 40,
	HANDLING_INDEX_DOMINATOR = 41,
	HANDLING_INDEX_DLOADER = 42,
	HANDLING_INDEX_DUBSTA = 43,
	HANDLING_INDEX_DUNE = 44,
	HANDLING_INDEX_DUNE2 = 45,
	HANDLING_INDEX_ELEGY2 = 46,
	HANDLING_INDEX_ENTITYXF = 47,
	HANDLING_INDEX_EMPEROR = 48,
	HANDLING_INDEX_EXEMPLAR = 49,
	HANDLING_INDEX_F620 = 50,
	HANDLING_INDEX_FBI = 51,
	HANDLING_INDEX_FBI2 = 52,
	HANDLING_INDEX_FBIOLD = 53,
	HANDLING_INDEX_FELON = 54,
	HANDLING_INDEX_FELON2 = 55,
	HANDLING_INDEX_FELTZER = 56,
	HANDLING_INDEX_FLATBED = 57,
	HANDLING_INDEX_FIRETRUK = 58,
	HANDLING_INDEX_FORKLIFT = 59,
	HANDLING_INDEX_FQ2 = 60,
	HANDLING_INDEX_FUGITIVE = 61,
	HANDLING_INDEX_FUTO = 62,
	HANDLING_INDEX_FUSILADE = 63,
	HANDLING_INDEX_GAUNTLET = 64,
	HANDLING_INDEX_GBURRITO = 65,
	HANDLING_INDEX_GRANGER = 66,
	HANDLING_INDEX_GRESLEY = 67,
	HANDLING_INDEX_HABANERO = 68,
	HANDLING_INDEX_HANDLER = 69,
	HANDLING_INDEX_HAULER = 70,
	HANDLING_INDEX_HOTKNIFE = 71,
	HANDLING_INDEX_INFERNUS = 72,
	HANDLING_INDEX_INGOT = 73,
	HANDLING_INDEX_INTRUDER = 74,
	HANDLING_INDEX_ISSI = 75,
	HANDLING_INDEX_JACKAL = 76,
	HANDLING_INDEX_JB700 = 77,
	HANDLING_INDEX_JOURNEY = 78,
	HANDLING_INDEX_KHAMEL = 79,
	HANDLING_INDEX_LANDSTALKER = 80,
	HANDLING_INDEX_LGUARD = 81,
	HANDLING_INDEX_MANANA = 82,
	HANDLING_INDEX_MARBELLA = 83,
	HANDLING_INDEX_MINIVAN = 84,
	HANDLING_INDEX_MIXER = 85,
	HANDLING_INDEX_MIXER2 = 86,
	HANDLING_INDEX_MESA = 87,
	HANDLING_INDEX_MULE = 88,
	HANDLING_INDEX_MONROE = 89,
	HANDLING_INDEX_MOWER = 90,
	HANDLING_INDEX_NINEF = 91,
	HANDLING_INDEX_ORACLE = 92,
	HANDLING_INDEX_ORACLE2 = 93,
	HANDLING_INDEX_PACKER = 94,
	HANDLING_INDEX_PBUS = 95,
	HANDLING_INDEX_PHANTOM = 96,
	HANDLING_INDEX_PATRIOT = 97,
	HANDLING_INDEX_PENUMBRA = 98,
	HANDLING_INDEX_PEYOTE = 99,
	HANDLING_INDEX_PHOENIX = 100,
	HANDLING_INDEX_PICADOR = 101,
	HANDLING_INDEX_POLICE = 102,
	HANDLING_INDEX_POLICE2 = 103,
	HANDLING_INDEX_POLICE3 = 104,
	HANDLING_INDEX_POLICET = 105,
	HANDLING_INDEX_POLICEOLD = 106,
	HANDLING_INDEX_POLICEOL2 = 107,
	HANDLING_INDEX_PONY = 108,
	HANDLING_INDEX_POUNDER = 109,
	HANDLING_INDEX_PRAIRIE = 110,
	HANDLING_INDEX_PRANGER = 111,
	HANDLING_INDEX_PREMIER = 112,
	HANDLING_INDEX_PRIMO = 113,
	HANDLING_INDEX_RADI = 114,
	HANDLING_INDEX_RANCHERXL = 115,
	HANDLING_INDEX_RLOADER = 116,
	HANDLING_INDEX_RAPIDGT = 117,
	HANDLING_INDEX_REBEL = 118,
	HANDLING_INDEX_REGINA = 119,
	HANDLING_INDEX_RHAPSODY = 120,
	HANDLING_INDEX_RIOT = 121,
	HANDLING_INDEX_RIPLEY = 122,
	HANDLING_INDEX_ROCOTO = 123,
	HANDLING_INDEX_ROMERO = 124,
	HANDLING_INDEX_RUBBLE = 125,
	HANDLING_INDEX_RUINER = 126,
	HANDLING_INDEX_RUMPO = 127,
	HANDLING_INDEX_SADLER = 128,
	HANDLING_INDEX_SABREGT = 129,
	HANDLING_INDEX_SANDKING = 130,
	HANDLING_INDEX_SCHAFTER2 = 131,
	HANDLING_INDEX_SCHWARZE = 132,
	HANDLING_INDEX_SCRAP = 133,
	HANDLING_INDEX_SENTINEL = 134,
	HANDLING_INDEX_SEMINOLE = 135,
	HANDLING_INDEX_SERRANO = 136,
	HANDLING_INDEX_SERRANO2 = 137,
	HANDLING_INDEX_SHERIFF = 138,
	HANDLING_INDEX_SPEEDO = 139,
	HANDLING_INDEX_STANIER = 140,
	HANDLING_INDEX_STINGER = 141,
	HANDLING_INDEX_STINGERGT = 142,
	HANDLING_INDEX_STOCKADE = 143,
	HANDLING_INDEX_STRATUM = 144,
	HANDLING_INDEX_STRETCH = 145,
	HANDLING_INDEX_SULTAN = 146,
	HANDLING_INDEX_SURANO = 147,
	HANDLING_INDEX_SURFER = 148,
	HANDLING_INDEX_SURGE = 149,
	HANDLING_INDEX_SUPERD = 150,
	HANDLING_INDEX_TACO = 151,
	HANDLING_INDEX_TAILGATE = 152,
	HANDLING_INDEX_TAXI2 = 153,
	HANDLING_INDEX_TIPTRUCK = 154,
	HANDLING_INDEX_TIPTRUCK2 = 155,
	HANDLING_INDEX_TORNADO = 156,
	HANDLING_INDEX_TOURBUS = 157,
	HANDLING_INDEX_TOWTRUCK = 158,
	HANDLING_INDEX_TOWTRUCK2 = 159,
	HANDLING_INDEX_TRASH = 160,
	HANDLING_INDEX_TRACTOR = 161,
	HANDLING_INDEX_TRACTOR2 = 162,
	HANDLING_INDEX_URANUS = 163,
	HANDLING_INDEX_UTILTRUC = 164,
	HANDLING_INDEX_UTILTRUC2 = 165,
	HANDLING_INDEX_UTILTRUC3 = 166,
	HANDLING_INDEX_VACCA = 167,
	HANDLING_INDEX_VIGERO = 168,
	HANDLING_INDEX_VOODOO2 = 169,
	HANDLING_INDEX_VOLTIC = 170,
	HANDLING_INDEX_WASHINGTON = 171,
	HANDLING_INDEX_YOUGA = 172,
	HANDLING_INDEX_ZTYPE = 173,
	HANDLING_INDEX_ZION = 174,
	HANDLING_INDEX_AKUMA = 175,
	HANDLING_INDEX_BAGGER = 176,
	HANDLING_INDEX_BATI = 177,
	HANDLING_INDEX_CARBON = 178,
	HANDLING_INDEX_DAEMON = 179,
	HANDLING_INDEX_DOUBLE = 180,
	HANDLING_INDEX_FAGGIO = 181,
	HANDLING_INDEX_HEXER = 182,
	HANDLING_INDEX_NEMESIS = 183,
	HANDLING_INDEX_PCJ = 184,
	HANDLING_INDEX_RUFFIAN = 185,
	HANDLING_INDEX_SANCHEZ = 186,
	HANDLING_INDEX_POLICEB = 187,
	HANDLING_INDEX_VADER = 188,
	HANDLING_INDEX_BMX = 189,
	HANDLING_INDEX_CRUISER = 190,
	HANDLING_INDEX_FIXTER = 191,
	HANDLING_INDEX_SCORCHER = 192,
	HANDLING_INDEX_TRIBIKE = 193,
	HANDLING_INDEX_CARGOPLANE = 194,
	HANDLING_INDEX_CUBAN800 = 195,
	HANDLING_INDEX_DUSTER = 196,
	HANDLING_INDEX_LUXOR = 197,
	HANDLING_INDEX_JET = 198,
	HANDLING_INDEX_LAZER = 199,
	HANDLING_INDEX_STUNT = 200,
	HANDLING_INDEX_TITAN = 201,
	HANDLING_INDEX_SHAMAL = 202,
	HANDLING_INDEX_SPMED = 203,
	HANDLING_INDEX_SPSMALL = 204,
	HANDLING_INDEX_MAMMATUS = 205,
	HANDLING_INDEX_VELUM = 206,
	HANDLING_INDEX_FREIGHT = 207,
	HANDLING_INDEX_FREIGHTCAR = 208,
	HANDLING_INDEX_METROTRAIN = 209,
	HANDLING_INDEX_ARMYTRAILER = 210,
	HANDLING_INDEX_BALETRAILER = 211,
	HANDLING_INDEX_BOATTRAILER = 212,
	HANDLING_INDEX_DOCKTRAILER = 213,
	HANDLING_INDEX_GRAINTRAIL = 214,
	HANDLING_INDEX_PROPTRAILER = 215,
	HANDLING_INDEX_RAKETRAILER = 216,
	HANDLING_INDEX_TANKER = 217,
	HANDLING_INDEX_TRAILERL = 218,
	HANDLING_INDEX_TRAILER = 219,
	HANDLING_INDEX_TRAILER2 = 220,
	HANDLING_INDEX_TR2 = 221,
	HANDLING_INDEX_TR3 = 222,
	HANDLING_INDEX_TRFLAT = 223,
	HANDLING_INDEX_TRAILERSMALL = 224,
	HANDLING_INDEX_BULLDOZE = 225,
	HANDLING_INDEX_CUTTER = 226,
	HANDLING_INDEX_DUMP = 227,
	HANDLING_INDEX_RHINO = 228,
	HANDLING_INDEX_SUBMERSIBLE = 229,
	HANDLING_INDEX_DINGHY = 230,
	HANDLING_INDEX_DINGHY2 = 231,
	HANDLING_INDEX_MARQUIS = 232,
	HANDLING_INDEX_PREDATOR = 233,
	HANDLING_INDEX_JETMAX = 234,
	HANDLING_INDEX_SQUALO = 235,
	HANDLING_INDEX_SUNTRAP = 236,
	HANDLING_INDEX_SEASHARK = 237,
	HANDLING_INDEX_TROPIC = 238,
	HANDLING_INDEX_ANNIHL = 239,
	HANDLING_INDEX_BUZZARD = 240,
	HANDLING_INDEX_BUZZARD2 = 241,
	HANDLING_INDEX_CARGOBOB = 242,
	HANDLING_INDEX_FROGGER = 243,
	HANDLING_INDEX_MAVERICK = 244,
	HANDLING_INDEX_POLMAV = 245,
	HANDLING_INDEX_SKYLIFT = 246,
	HANDLING_INDEX_BLIMP = 247,

};

#if PLATFORM == PLATFORM_PC
enum VehicleMetaIndexes
{
	VMI_TotalSize = 1376,

	VMI_DisplayName = 624,
	VMI_VehicleType = 792,
	VMI_HandlingId = 1160,
	VMI_PovCameraName = 1192,
};
enum VehicleType
{
	VEHICLE_TYPE_CAR = 0,
	VEHICLE_TYPE_PLANE = 1,
	VEHICLE_TYPE_TRAILER = 2,
	VEHICLE_TYPE_QUADBIKE = 3,
	VEHICLE_TYPE_AMPHIBIOUS_AUTOMOBILE = 6,
	VEHICLE_TYPE_AMPHIBIOUS_QUADBIKE = 7,
	VEHICLE_TYPE_HELI = 8,
	VEHICLE_TYPE_BLIMP = 9,
	VEHICLE_TYPE_BIKE = 11,
	VEHICLE_TYPE_BICYCLE = 12,
	VEHICLE_TYPE_BOAT = 13,
	VEHICLE_TYPE_TRAIN = 14,
	VEHICLE_TYPE_SUBMARINE = 15,
};
#else
enum VehicleMetaIndexes
{
	VMI_TotalSize = 624,

	VMI_DisplayName = 352,
	VMI_VehicleType = 440,
	VMI_HandlingId = 508,
	VMI_PovCameraName = 540,
};
enum VehicleType
{
	VEHICLE_TYPE_CAR = 0,
	VEHICLE_TYPE_PLANE = 1,
	VEHICLE_TYPE_TRAILER = 2,
	VEHICLE_TYPE_QUADBIKE = 3,
	VEHICLE_TYPE_HELI = 6,
	VEHICLE_TYPE_BLIMP = 7,
	VEHICLE_TYPE_BIKE = 9,
	VEHICLE_TYPE_BICYCLE = 10,
	VEHICLE_TYPE_BOAT = 11,
	VEHICLE_TYPE_TRAIN = 12,
	VEHICLE_TYPE_SUBMARINE = 13,
};
#endif