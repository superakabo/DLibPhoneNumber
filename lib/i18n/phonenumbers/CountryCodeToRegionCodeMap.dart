import 'dart:collection';

class CountryCodeToRegionCodeMap {
  static Map<int, List<String>> getCountryCodeToRegionCodeMap() {
    Map<int, List<String>> countryCodeToRegionCodeMap = HashMap<int, List<String>>();

    List<String> listWithRegionCode = [
      "US",
      "AG",
      "AI",
      "AS",
      "BB",
      "BM",
      "BS",
      "CA",
      "DM",
      "DO",
      "GD",
      "GU",
      "JM",
      "KN",
      "KY",
      "LC",
      "MP",
      "MS",
      "PR",
      "SX",
      "TC",
      "TT",
      "VC",
      "VG",
      "VI"
    ];
    countryCodeToRegionCodeMap[1] = listWithRegionCode;

    listWithRegionCode = ["RU", "KZ"];
    countryCodeToRegionCodeMap[7] = listWithRegionCode;

    listWithRegionCode = ["EG"];
    countryCodeToRegionCodeMap[20] = listWithRegionCode;

    listWithRegionCode = ["ZA"];
    countryCodeToRegionCodeMap[27] = listWithRegionCode;

    listWithRegionCode = ["GR"];
    countryCodeToRegionCodeMap[30] = listWithRegionCode;

    listWithRegionCode = ["NL"];
    countryCodeToRegionCodeMap[31] = listWithRegionCode;

    listWithRegionCode = ["BE"];
    countryCodeToRegionCodeMap[32] = listWithRegionCode;

    listWithRegionCode = ["FR"];
    countryCodeToRegionCodeMap[33] = listWithRegionCode;

    listWithRegionCode = ["ES"];
    countryCodeToRegionCodeMap[34] = listWithRegionCode;

    listWithRegionCode = ["HU"];
    countryCodeToRegionCodeMap[36] = listWithRegionCode;

    listWithRegionCode = ["IT", "VA"];
    countryCodeToRegionCodeMap[39] = listWithRegionCode;

    listWithRegionCode = ["RO"];
    countryCodeToRegionCodeMap[40] = listWithRegionCode;

    listWithRegionCode = ["CH"];
    countryCodeToRegionCodeMap[41] = listWithRegionCode;

    listWithRegionCode = ["AT"];
    countryCodeToRegionCodeMap[43] = listWithRegionCode;

    listWithRegionCode = ["GB", "GG", "IM", "JE"];
    countryCodeToRegionCodeMap[44] = listWithRegionCode;

    listWithRegionCode = ["DK"];
    countryCodeToRegionCodeMap[45] = listWithRegionCode;

    listWithRegionCode = ["SE"];
    countryCodeToRegionCodeMap[46] = listWithRegionCode;

    listWithRegionCode = ["NO", "SJ"];
    countryCodeToRegionCodeMap[47] = listWithRegionCode;

    listWithRegionCode = ["PL"];
    countryCodeToRegionCodeMap[48] = listWithRegionCode;

    listWithRegionCode = ["DE"];
    countryCodeToRegionCodeMap[49] = listWithRegionCode;

    listWithRegionCode = ["PE"];
    countryCodeToRegionCodeMap[51] = listWithRegionCode;

    listWithRegionCode = ["MX"];
    countryCodeToRegionCodeMap[52] = listWithRegionCode;

    listWithRegionCode = ["CU"];
    countryCodeToRegionCodeMap[53] = listWithRegionCode;

    listWithRegionCode = ["AR"];
    countryCodeToRegionCodeMap[54] = listWithRegionCode;

    listWithRegionCode = ["BR"];
    countryCodeToRegionCodeMap[55] = listWithRegionCode;

    listWithRegionCode = ["CL"];
    countryCodeToRegionCodeMap[56] = listWithRegionCode;

    listWithRegionCode = ["CO"];
    countryCodeToRegionCodeMap[57] = listWithRegionCode;

    listWithRegionCode = ["VE"];
    countryCodeToRegionCodeMap[58] = listWithRegionCode;

    listWithRegionCode = ["MY"];
    countryCodeToRegionCodeMap[60] = listWithRegionCode;

    listWithRegionCode = ["AU", "CC", "CX"];
    countryCodeToRegionCodeMap[61] = listWithRegionCode;

    listWithRegionCode = ["ID"];
    countryCodeToRegionCodeMap[62] = listWithRegionCode;

    listWithRegionCode = ["PH"];
    countryCodeToRegionCodeMap[63] = listWithRegionCode;

    listWithRegionCode = ["NZ"];
    countryCodeToRegionCodeMap[64] = listWithRegionCode;

    listWithRegionCode = ["SG"];
    countryCodeToRegionCodeMap[65] = listWithRegionCode;

    listWithRegionCode = ["TH"];
    countryCodeToRegionCodeMap[66] = listWithRegionCode;

    listWithRegionCode = ["JP"];
    countryCodeToRegionCodeMap[81] = listWithRegionCode;

    listWithRegionCode = ["KR"];
    countryCodeToRegionCodeMap[82] = listWithRegionCode;

    listWithRegionCode = ["VN"];
    countryCodeToRegionCodeMap[84] = listWithRegionCode;

    listWithRegionCode = ["CN"];
    countryCodeToRegionCodeMap[86] = listWithRegionCode;

    listWithRegionCode = ["TR"];
    countryCodeToRegionCodeMap[90] = listWithRegionCode;

    listWithRegionCode = ["IN"];
    countryCodeToRegionCodeMap[91] = listWithRegionCode;

    listWithRegionCode = ["PK"];
    countryCodeToRegionCodeMap[92] = listWithRegionCode;

    listWithRegionCode = ["AF"];
    countryCodeToRegionCodeMap[93] = listWithRegionCode;

    listWithRegionCode = ["LK"];
    countryCodeToRegionCodeMap[94] = listWithRegionCode;

    listWithRegionCode = ["MM"];
    countryCodeToRegionCodeMap[95] = listWithRegionCode;

    listWithRegionCode = ["IR"];
    countryCodeToRegionCodeMap[98] = listWithRegionCode;

    listWithRegionCode = ["SS"];
    countryCodeToRegionCodeMap[211] = listWithRegionCode;

    listWithRegionCode = ["MA", "EH"];
    countryCodeToRegionCodeMap[212] = listWithRegionCode;

    listWithRegionCode = ["DZ"];
    countryCodeToRegionCodeMap[213] = listWithRegionCode;

    listWithRegionCode = ["TN"];
    countryCodeToRegionCodeMap[216] = listWithRegionCode;

    listWithRegionCode = ["LY"];
    countryCodeToRegionCodeMap[218] = listWithRegionCode;

    listWithRegionCode = ["GM"];
    countryCodeToRegionCodeMap[220] = listWithRegionCode;

    listWithRegionCode = ["SN"];
    countryCodeToRegionCodeMap[221] = listWithRegionCode;

    listWithRegionCode = ["MR"];
    countryCodeToRegionCodeMap[222] = listWithRegionCode;

    listWithRegionCode = ["ML"];
    countryCodeToRegionCodeMap[223] = listWithRegionCode;

    listWithRegionCode = ["GN"];
    countryCodeToRegionCodeMap[224] = listWithRegionCode;

    listWithRegionCode = ["CI"];
    countryCodeToRegionCodeMap[225] = listWithRegionCode;

    listWithRegionCode = ["BF"];
    countryCodeToRegionCodeMap[226] = listWithRegionCode;

    listWithRegionCode = ["NE"];
    countryCodeToRegionCodeMap[227] = listWithRegionCode;

    listWithRegionCode = ["TG"];
    countryCodeToRegionCodeMap[228] = listWithRegionCode;

    listWithRegionCode = ["BJ"];
    countryCodeToRegionCodeMap[229] = listWithRegionCode;

    listWithRegionCode = ["MU"];
    countryCodeToRegionCodeMap[230] = listWithRegionCode;

    listWithRegionCode = ["LR"];
    countryCodeToRegionCodeMap[231] = listWithRegionCode;

    listWithRegionCode = ["SL"];
    countryCodeToRegionCodeMap[232] = listWithRegionCode;

    listWithRegionCode = ["GH"];
    countryCodeToRegionCodeMap[233] = listWithRegionCode;

    listWithRegionCode = ["NG"];
    countryCodeToRegionCodeMap[234] = listWithRegionCode;

    listWithRegionCode = ["TD"];
    countryCodeToRegionCodeMap[235] = listWithRegionCode;

    listWithRegionCode = ["CF"];
    countryCodeToRegionCodeMap[236] = listWithRegionCode;

    listWithRegionCode = ["CM"];
    countryCodeToRegionCodeMap[237] = listWithRegionCode;

    listWithRegionCode = ["CV"];
    countryCodeToRegionCodeMap[238] = listWithRegionCode;

    listWithRegionCode = ["ST"];
    countryCodeToRegionCodeMap[239] = listWithRegionCode;

    listWithRegionCode = ["GQ"];
    countryCodeToRegionCodeMap[240] = listWithRegionCode;

    listWithRegionCode = ["GA"];
    countryCodeToRegionCodeMap[241] = listWithRegionCode;

    listWithRegionCode = ["CG"];
    countryCodeToRegionCodeMap[242] = listWithRegionCode;

    listWithRegionCode = ["CD"];
    countryCodeToRegionCodeMap[243] = listWithRegionCode;

    listWithRegionCode = ["AO"];
    countryCodeToRegionCodeMap[244] = listWithRegionCode;

    listWithRegionCode = ["GW"];
    countryCodeToRegionCodeMap[245] = listWithRegionCode;

    listWithRegionCode = ["IO"];
    countryCodeToRegionCodeMap[246] = listWithRegionCode;

    listWithRegionCode = ["AC"];
    countryCodeToRegionCodeMap[247] = listWithRegionCode;

    listWithRegionCode = ["SC"];
    countryCodeToRegionCodeMap[248] = listWithRegionCode;

    listWithRegionCode = ["SD"];
    countryCodeToRegionCodeMap[249] = listWithRegionCode;

    listWithRegionCode = ["RW"];
    countryCodeToRegionCodeMap[250] = listWithRegionCode;

    listWithRegionCode = ["ET"];
    countryCodeToRegionCodeMap[251] = listWithRegionCode;

    listWithRegionCode = ["SO"];
    countryCodeToRegionCodeMap[252] = listWithRegionCode;

    listWithRegionCode = ["DJ"];
    countryCodeToRegionCodeMap[253] = listWithRegionCode;

    listWithRegionCode = ["KE"];
    countryCodeToRegionCodeMap[254] = listWithRegionCode;

    listWithRegionCode = ["TZ"];
    countryCodeToRegionCodeMap[255] = listWithRegionCode;

    listWithRegionCode = ["UG"];
    countryCodeToRegionCodeMap[256] = listWithRegionCode;

    listWithRegionCode = ["BI"];
    countryCodeToRegionCodeMap[257] = listWithRegionCode;

    listWithRegionCode = ["MZ"];
    countryCodeToRegionCodeMap[258] = listWithRegionCode;

    listWithRegionCode = ["ZM"];
    countryCodeToRegionCodeMap[260] = listWithRegionCode;

    listWithRegionCode = ["MG"];
    countryCodeToRegionCodeMap[261] = listWithRegionCode;

    listWithRegionCode = ["RE", "YT"];
    countryCodeToRegionCodeMap[262] = listWithRegionCode;

    listWithRegionCode = ["ZW"];
    countryCodeToRegionCodeMap[263] = listWithRegionCode;

    listWithRegionCode = ["NA"];
    countryCodeToRegionCodeMap[264] = listWithRegionCode;

    listWithRegionCode = ["MW"];
    countryCodeToRegionCodeMap[265] = listWithRegionCode;

    listWithRegionCode = ["LS"];
    countryCodeToRegionCodeMap[266] = listWithRegionCode;

    listWithRegionCode = ["BW"];
    countryCodeToRegionCodeMap[267] = listWithRegionCode;

    listWithRegionCode = ["SZ"];
    countryCodeToRegionCodeMap[268] = listWithRegionCode;

    listWithRegionCode = ["KM"];
    countryCodeToRegionCodeMap[269] = listWithRegionCode;

    listWithRegionCode = ["SH", "TA"];
    countryCodeToRegionCodeMap[290] = listWithRegionCode;

    listWithRegionCode = ["ER"];
    countryCodeToRegionCodeMap[291] = listWithRegionCode;

    listWithRegionCode = ["AW"];
    countryCodeToRegionCodeMap[297] = listWithRegionCode;

    listWithRegionCode = ["FO"];
    countryCodeToRegionCodeMap[298] = listWithRegionCode;

    listWithRegionCode = ["GL"];
    countryCodeToRegionCodeMap[299] = listWithRegionCode;

    listWithRegionCode = ["GI"];
    countryCodeToRegionCodeMap[350] = listWithRegionCode;

    listWithRegionCode = ["PT"];
    countryCodeToRegionCodeMap[351] = listWithRegionCode;

    listWithRegionCode = ["LU"];
    countryCodeToRegionCodeMap[352] = listWithRegionCode;

    listWithRegionCode = ["IE"];
    countryCodeToRegionCodeMap[353] = listWithRegionCode;

    listWithRegionCode = ["IS"];
    countryCodeToRegionCodeMap[354] = listWithRegionCode;

    listWithRegionCode = ["AL"];
    countryCodeToRegionCodeMap[355] = listWithRegionCode;

    listWithRegionCode = ["MT"];
    countryCodeToRegionCodeMap[356] = listWithRegionCode;

    listWithRegionCode = ["CY"];
    countryCodeToRegionCodeMap[357] = listWithRegionCode;

    listWithRegionCode = ["FI", "AX"];
    countryCodeToRegionCodeMap[358] = listWithRegionCode;

    listWithRegionCode = ["BG"];
    countryCodeToRegionCodeMap[359] = listWithRegionCode;

    listWithRegionCode = ["LT"];
    countryCodeToRegionCodeMap[370] = listWithRegionCode;

    listWithRegionCode = ["LV"];
    countryCodeToRegionCodeMap[371] = listWithRegionCode;

    listWithRegionCode = ["EE"];
    countryCodeToRegionCodeMap[372] = listWithRegionCode;

    listWithRegionCode = ["MD"];
    countryCodeToRegionCodeMap[373] = listWithRegionCode;

    listWithRegionCode = ["AM"];
    countryCodeToRegionCodeMap[374] = listWithRegionCode;

    listWithRegionCode = ["BY"];
    countryCodeToRegionCodeMap[375] = listWithRegionCode;

    listWithRegionCode = ["AD"];
    countryCodeToRegionCodeMap[376] = listWithRegionCode;

    listWithRegionCode = ["MC"];
    countryCodeToRegionCodeMap[377] = listWithRegionCode;

    listWithRegionCode = ["SM"];
    countryCodeToRegionCodeMap[378] = listWithRegionCode;

    listWithRegionCode = ["UA"];
    countryCodeToRegionCodeMap[380] = listWithRegionCode;

    listWithRegionCode = ["RS"];
    countryCodeToRegionCodeMap[381] = listWithRegionCode;

    listWithRegionCode = ["ME"];
    countryCodeToRegionCodeMap[382] = listWithRegionCode;

    listWithRegionCode = ["XK"];
    countryCodeToRegionCodeMap[383] = listWithRegionCode;

    listWithRegionCode = ["HR"];
    countryCodeToRegionCodeMap[385] = listWithRegionCode;

    listWithRegionCode = ["SI"];
    countryCodeToRegionCodeMap[386] = listWithRegionCode;

    listWithRegionCode = ["BA"];
    countryCodeToRegionCodeMap[387] = listWithRegionCode;

    listWithRegionCode = ["MK"];
    countryCodeToRegionCodeMap[389] = listWithRegionCode;

    listWithRegionCode = ["CZ"];
    countryCodeToRegionCodeMap[420] = listWithRegionCode;

    listWithRegionCode = ["SK"];
    countryCodeToRegionCodeMap[421] = listWithRegionCode;

    listWithRegionCode = ["LI"];
    countryCodeToRegionCodeMap[423] = listWithRegionCode;

    listWithRegionCode = ["FK"];
    countryCodeToRegionCodeMap[500] = listWithRegionCode;

    listWithRegionCode = ["BZ"];
    countryCodeToRegionCodeMap[501] = listWithRegionCode;

    listWithRegionCode = ["GT"];
    countryCodeToRegionCodeMap[502] = listWithRegionCode;

    listWithRegionCode = ["SV"];
    countryCodeToRegionCodeMap[503] = listWithRegionCode;

    listWithRegionCode = ["HN"];
    countryCodeToRegionCodeMap[504] = listWithRegionCode;

    listWithRegionCode = ["NI"];
    countryCodeToRegionCodeMap[505] = listWithRegionCode;

    listWithRegionCode = ["CR"];
    countryCodeToRegionCodeMap[506] = listWithRegionCode;

    listWithRegionCode = ["PA"];
    countryCodeToRegionCodeMap[507] = listWithRegionCode;

    listWithRegionCode = ["PM"];
    countryCodeToRegionCodeMap[508] = listWithRegionCode;

    listWithRegionCode = ["HT"];
    countryCodeToRegionCodeMap[509] = listWithRegionCode;

    listWithRegionCode = ["GP", "BL", "MF"];
    countryCodeToRegionCodeMap[590] = listWithRegionCode;

    listWithRegionCode = ["BO"];
    countryCodeToRegionCodeMap[591] = listWithRegionCode;

    listWithRegionCode = ["GY"];
    countryCodeToRegionCodeMap[592] = listWithRegionCode;

    listWithRegionCode = ["EC"];
    countryCodeToRegionCodeMap[593] = listWithRegionCode;

    listWithRegionCode = ["GF"];
    countryCodeToRegionCodeMap[594] = listWithRegionCode;

    listWithRegionCode = ["PY"];
    countryCodeToRegionCodeMap[595] = listWithRegionCode;

    listWithRegionCode = ["MQ"];
    countryCodeToRegionCodeMap[596] = listWithRegionCode;

    listWithRegionCode = ["SR"];
    countryCodeToRegionCodeMap[597] = listWithRegionCode;

    listWithRegionCode = ["UY"];
    countryCodeToRegionCodeMap[598] = listWithRegionCode;

    listWithRegionCode = ["CW", "BQ"];
    countryCodeToRegionCodeMap[599] = listWithRegionCode;

    listWithRegionCode = ["TL"];
    countryCodeToRegionCodeMap[670] = listWithRegionCode;

    listWithRegionCode = ["NF"];
    countryCodeToRegionCodeMap[672] = listWithRegionCode;

    listWithRegionCode = ["BN"];
    countryCodeToRegionCodeMap[673] = listWithRegionCode;

    listWithRegionCode = ["NR"];
    countryCodeToRegionCodeMap[674] = listWithRegionCode;

    listWithRegionCode = ["PG"];
    countryCodeToRegionCodeMap[675] = listWithRegionCode;

    listWithRegionCode = ["TO"];
    countryCodeToRegionCodeMap[676] = listWithRegionCode;

    listWithRegionCode = ["SB"];
    countryCodeToRegionCodeMap[677] = listWithRegionCode;

    listWithRegionCode = ["VU"];
    countryCodeToRegionCodeMap[678] = listWithRegionCode;

    listWithRegionCode = ["FJ"];
    countryCodeToRegionCodeMap[679] = listWithRegionCode;

    listWithRegionCode = ["PW"];
    countryCodeToRegionCodeMap[680] = listWithRegionCode;

    listWithRegionCode = ["WF"];
    countryCodeToRegionCodeMap[681] = listWithRegionCode;

    listWithRegionCode = ["CK"];
    countryCodeToRegionCodeMap[682] = listWithRegionCode;

    listWithRegionCode = ["NU"];
    countryCodeToRegionCodeMap[683] = listWithRegionCode;

    listWithRegionCode = ["WS"];
    countryCodeToRegionCodeMap[685] = listWithRegionCode;

    listWithRegionCode = ["KI"];
    countryCodeToRegionCodeMap[686] = listWithRegionCode;

    listWithRegionCode = ["NC"];
    countryCodeToRegionCodeMap[687] = listWithRegionCode;

    listWithRegionCode = ["TV"];
    countryCodeToRegionCodeMap[688] = listWithRegionCode;

    listWithRegionCode = ["PF"];
    countryCodeToRegionCodeMap[689] = listWithRegionCode;

    listWithRegionCode = ["TK"];
    countryCodeToRegionCodeMap[690] = listWithRegionCode;

    listWithRegionCode = ["FM"];
    countryCodeToRegionCodeMap[691] = listWithRegionCode;

    listWithRegionCode = ["MH"];
    countryCodeToRegionCodeMap[692] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[800] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[808] = listWithRegionCode;

    listWithRegionCode = ["KP"];
    countryCodeToRegionCodeMap[850] = listWithRegionCode;

    listWithRegionCode = ["HK"];
    countryCodeToRegionCodeMap[852] = listWithRegionCode;

    listWithRegionCode = ["MO"];
    countryCodeToRegionCodeMap[853] = listWithRegionCode;

    listWithRegionCode = ["KH"];
    countryCodeToRegionCodeMap[855] = listWithRegionCode;

    listWithRegionCode = ["LA"];
    countryCodeToRegionCodeMap[856] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[870] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[878] = listWithRegionCode;

    listWithRegionCode = ["BD"];
    countryCodeToRegionCodeMap[880] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[881] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[882] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[883] = listWithRegionCode;

    listWithRegionCode = ["TW"];
    countryCodeToRegionCodeMap[886] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[888] = listWithRegionCode;

    listWithRegionCode = ["MV"];
    countryCodeToRegionCodeMap[960] = listWithRegionCode;

    listWithRegionCode = ["LB"];
    countryCodeToRegionCodeMap[961] = listWithRegionCode;

    listWithRegionCode = ["JO"];
    countryCodeToRegionCodeMap[962] = listWithRegionCode;

    listWithRegionCode = ["SY"];
    countryCodeToRegionCodeMap[963] = listWithRegionCode;

    listWithRegionCode = ["IQ"];
    countryCodeToRegionCodeMap[964] = listWithRegionCode;

    listWithRegionCode = ["KW"];
    countryCodeToRegionCodeMap[965] = listWithRegionCode;

    listWithRegionCode = ["SA"];
    countryCodeToRegionCodeMap[966] = listWithRegionCode;

    listWithRegionCode = ["YE"];
    countryCodeToRegionCodeMap[967] = listWithRegionCode;

    listWithRegionCode = ["OM"];
    countryCodeToRegionCodeMap[968] = listWithRegionCode;

    listWithRegionCode = ["PS"];
    countryCodeToRegionCodeMap[970] = listWithRegionCode;

    listWithRegionCode = ["AE"];
    countryCodeToRegionCodeMap[971] = listWithRegionCode;

    listWithRegionCode = ["IL"];
    countryCodeToRegionCodeMap[972] = listWithRegionCode;

    listWithRegionCode = ["BH"];
    countryCodeToRegionCodeMap[973] = listWithRegionCode;

    listWithRegionCode = ["QA"];
    countryCodeToRegionCodeMap[974] = listWithRegionCode;

    listWithRegionCode = ["BT"];
    countryCodeToRegionCodeMap[975] = listWithRegionCode;

    listWithRegionCode = ["MN"];
    countryCodeToRegionCodeMap[976] = listWithRegionCode;

    listWithRegionCode = ["NP"];
    countryCodeToRegionCodeMap[977] = listWithRegionCode;

    listWithRegionCode = ["001"];
    countryCodeToRegionCodeMap[979] = listWithRegionCode;

    listWithRegionCode = ["TJ"];
    countryCodeToRegionCodeMap[992] = listWithRegionCode;

    listWithRegionCode = ["TM"];
    countryCodeToRegionCodeMap[993] = listWithRegionCode;

    listWithRegionCode = ["AZ"];
    countryCodeToRegionCodeMap[994] = listWithRegionCode;

    listWithRegionCode = ["GE"];
    countryCodeToRegionCodeMap[995] = listWithRegionCode;

    listWithRegionCode = ["KG"];
    countryCodeToRegionCodeMap[996] = listWithRegionCode;

    listWithRegionCode = ["UZ"];
    countryCodeToRegionCodeMap[998] = listWithRegionCode;

    return countryCodeToRegionCodeMap;
  }
}
