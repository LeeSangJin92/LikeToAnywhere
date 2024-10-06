# 🔐 권한 데이터
insert into authority(authority_name)
values ("ROLE_RA_Member"),("ROLE_CREW_Master"),("ROLE_CREW_Named"),("ROLE_CREW_Member"),("ROLE_RA_ADMIN");

# 🏍️ 오토바이 브랜드
insert into bike_brand(bikebrand_name,bikebrand_logo)
values ("BMW","bmw_logo.png"),("CF모토","cfmoto_logo.png"),("FB 몬디알","fbmondial_logo.png"),
       ("KR/S&T/효성","krmotors_logo.png"),("KTM","ktm_logo.png"),
       ("MV-아구스타","mvagusta_logo.png"),("SSR 모터스포츠","ssrmoto_logo.png"),
       ("가와사키","kawasaki_logo.png"),("두카티","ducati_logo.png"),
       ("로얄엔필드","royalenfield_logo.png"),("모토구찌","motoguzzi_logo.png"),
       ("베넬리","benelli_logo.png"),("베스파","vespa_logo.png"),
       ("브릭스톤","brixton_logo.png"),("스즈끼","suzuki_logo.png"),
       ("야마하","yamaha_logo.png"),("이탈젯","italjet_logo.png"),("인디안모터사이클","indian_logo.png"),
       ("트라이엄프","triumph_logo.png"),("할리데이비슨","harleydavidson_logo.png"),
       ("허스크바나","husqvarna_logo.png"),("혼다","honda_logo.png");


# 🏍️ 오토바이 모델 데이터
insert into bike_model(brand_id,model_name,model_cc)
values (1,"R 1250 RS",1250),(1,"S 1000 RR",1000),(1,"S 1000 XR",1000),
       (1,"F 900 XR",900),(1,"M 1000 R",1000),(1,"M 1000 R",1000),
       (1,"K 1600 GT",1600),(1,"K 1600 GTL",1600),(1,"K 1600 B",1600),
       (1,"K 1600 GA",1600),(1,"R 1250 R",1250),(1,"S 1000 RR",1000),
       (1,"F 900 R",900),(1,"G 310 R",310),(1,"R 18",900),(1,"R 18 B",900),
       (1,"R nineT",900),(1,"R 1300 GS",1300),(1,"R 1250 GS",1250),
       (1,"F 850 GS",850),(1,"F 750 GS",750),(1,"G 310 GS",310),
       (1,"CE 04",400),(1,"C 400 X",400),(1,"C 400 GT",400),
       (2,"800 MT",800),(2,"450 SR",450),(3,"PIEGA 452",452),
       (3,"PIEGA 125",125),(3,"FLEX 300",300),(3,"HPS 2024",400),
       (3,"SPARTAN 250",250),(3,"SPARTAN 125",125),(3,"SMX MOTARD",125),
       (3,"SMX ENDURO",300),(3,"FLAT TRACK",200),(3,"IMOLA 125",125),
       (3,"IMOLA 50",50),(4,"아퀼라 300",300),(4,"아퀼라 125",125),(4,"미라쥬 650",650),
       (4,"케이윈 350",350),(4,"케이윈 125",125),(4,"욜로 125",125),(4,"그란투스 125",125),
       (4,"비버 125",125),(4,"델리로드 프로",125),(5,"1290 SUPER DUKE R",1290),
       (5,"890 DUKE GP",890),(5,"890 DUKE R",890),(5,"390 DUKE",390),
       (5,"125 DUKE",125),(5,"1290 SUPER ADVENTURE R",1290),(5,"1290 SUPER ADVENTURE S",1290),
       (5,"890 ADVENTURE R",890),(5,"890 ADVENTURE",890),(5,"390 ADVENTURE",390),
       (5,"390 ADVENTURE SW",390),(5,"690 ENDURO R",690),(5,"RC 390",390),
       (5,"890 SMT",890),(5,"1290 SUPER DUKE GT",1290),(5,"450 SMR",450),(5,"690 SMC R",690),
       (6,"RUSH 1000",1000),(6,"SUPERVELOCE S",1000),(6,"SUPERVELOCE 800",800),
       (6,"BRUTALE 1000 RR",1000),(6,"BRUTALE 1000 RS",1000),(6,"BRUTALE 800 RR",800),
       (6,"DRAGSTER RR SCS",1000),(6,"DRAGSTER RC SCS",1000),(6,"TURISMO VELOCE ROSSO",800),
       (6,"TURISMO VELOCE LUSSO SCS",800),(6,"TURISMO VELOCE RC SCS",800),(6,"F3 800 ROSSO",800),
       (6,"F3 800 RC",800),(6,"F3 RR",800),(7,"BUCCANEER 125",125),(7,"BUCCANEER 250",250),
       (8,"NINJA ZX-10R",1000),(8,"NINJA-ZX-6R",600),(8,"NINJA-ZX-4RR",400),(8,"NINJA 650",650),
       (8,"NINJA 400",400),(8,"Z H2 SE",400),(8,"Z900 SE",900),(8,"Z900",900),
       (8,"NINJA H2 SX SE",900),(8,"NINJA 1000SX",1000),(8,"Z900RS SE",900),
       (8,"Z900RS",900),(8,"Z650RS",650),(8,"VERSYS 1000 SE",1000),
       (8,"VERSYS 650",650),(8,"W800",800),(8,"VULCAN S",800),(9,"Desert X",1000),
       (9,"DesertX Rally",1000),(9,"New Monster",1000),(9,"Monster SP",800),
       (9,"Monster 30",300),(9,"Panigale V2",900),(9,"Panigale V4 S",900),
       (9,"Panigale V4 SP2",900),(9,"Multistrada V4 RALLY",900),(9,"Multistrada V4 S",400),
       (9,"Multistrada V2 S",900),(9,"Multistrada V4 PIKES PEAK",200),
       (9,"Multistrada V4 S GRUND TOUR",430),(9,"Multistrada V4 RS",430),
       (9,"Hypermotard 950 SP",950),(9,"Hypermotard 698 Mono RVE",698),(9,"DIAVEL V4",400),
       (9,"Supersport 950 S",950),(9,"STREETFIGHTER V4 S",950),(9,"STREETFIGHTER V2",950),
       (9,"STREETFIGHTER V4 SP",590),(9,"ICON 2G",950),(9,"FULL THROTTLE 2G",950),
       (9,"NIGHTSHIFT 2G",950),(10,"SUEPER METEOR 650",650),(10,"METEOR 350",350),
       (10,"HNTR 350",350),(10,"SCRAM 411",411),(10,"CLASSIC 350",350),(10,"CLASSIC 500",500),
       (10,"HIMALAYAN 450",450),(10,"HIMALAYAN 411",411),(10,"INTERCEPTOR",650),
       (10,"CONTINNENTAL GT",650),(10,"BULLET 500",500),(11,"V7",900),(11,"V85 TT",800),
       (11,"V100",1000),(12,"TNT 125",125),(12,"RKF 125",125),(12,"TRK502X",502),
       (12,"레온치노 125",125),(12,"레온치노 250",250),(12,"레온치노 500",500),(12,"레온치노 800",800),
       (12,"임페리알레 400",400),(12,"SR 125",125),(12,"502C",502),(12,"파나레알 125",125),
       (12,"비에스테 125",125),(13,"LX",125),(13,"SPRINT",125),(13,"PRIMAVERA",125),(13,"GTS",125),
       (13,"GTV",125),(13,"SEIGIORNI",125),(13,"GTS SUPER",125),(14,"CROMWELL 125",125),
       (14,"CROMWELL 250",250),(14,"CROMWELL 1200",1200),(14,"FELLSBERG 125 ABS",125),
       (14,"FELLSBERG 125 XC",125),(14,"FELLSBERG 250",250),(14,"SUNRAY 125",125),
       (14,"RAYBURN 125",125),(14,"CROSSFIRE 125",125),(14,"CROSSFIRE 125 XS",125),
       (14,"CROSSFIRE 500",500),(14,"CROSSFIRE 500 X",500),(14,"CROSSFIRE 500 XC",500),
       (15,"HAYABUSA",1200),(15,"KATANA",1000),(15,"GSX-R1000",1000),(15,"GSX-R125 ABS",125),
       (15,"GSX-S1000GT",1000),(15,"GSX-S1000",1000),(15,"GSX-8S",800),(15,"SV650X",650),
       (15,"SV650",650),(15,"GSX-S125 ABS",125),(15,"V-STROM 1050 DE",1050),
       (15,"V-STROM 800 DE",800),(15,"V-STROM 650 XT",650),(15,"BURGMAN 400 COUPE",400),
       (15,"AVENIS 125",125),(15,"BURGMAN STREET 125 EX",125),(15,"RMX 450Z",450),
       (15,"RM-Z450",450),(15,"RM-Z250",250),(15,"DR-Z125L",125),(15,"DR-Z70",270),
       (16,"VZF-R1M",1000),(16,"VZF-R1",1000),(16,"VZF-R7",700),(16,"VZF-R3",300),
       (16,"TRACER9",900),(16,"TRACER9 GT+",900),(16,"XSR900",900),(16,"XSR750",750),
       (16,"MT-10SP",1000),(16,"MT-10",1000),(16,"MT-09 SP",900),(16,"MT-07",700),
       (16,"MT-03",300),(16,"YZ250F",250),(16,"YZ125X",125),(16,"YZ85",850),(16,"YZ65",650),
       (16,"PW50",500),(17,"그리폰 125",125),(17,"그리폰 400",400),(17,"필그림 125",125),
       (17,"드랙스터 200",200),(17,"포뮬라 125",125),(18,"FTR",1000),(18,"인디언 스카우트",1000),
       (18,"인디언 치프",1000),(18,"인디언 스포츠 치프",1000),(18,"인디언 슈퍼 치프",1000),
       (18,"인디언 스프링필드",1000),(18,"인디언 챌린저",1000),(18,"인디언 스프링필드",1000),
       (18,"인디언 치프테인",1000),(18,"인디언 로드마스터",1000),(18,"인디언 퍼슈트",1000),
       (19,"TIGER 1200",1200),(19,"TIGER 900",900),(19,"TIGER SPORT 660",660),
       (19,"SCRAMBLER 1200",1200),(19,"SPEED 400",400),(19,"SCRAMBLER 400 X",400),
       (19,"SPEED TWIN 900",900),(19,"BONNEVILLE T100",1000),(19,"SCRAMBLER 900",900),
       (19,"BONNEVILLE T120",1200),(19,"SPEED TWIN 1200",1200),(19,"BONNEVILLE BOBBER",1200),
       (19,"BONNEVILLE SPEEDMASTER",1200),(19,"THRUXTON RS",1200),(19,"TRIDENT 660",660),
       (19,"STREET TRIPLE 765",765),(19,"SPEED TRIPLE 1200 RS",1200),
       (19,"SPEED TRIPLE 1200 RR",1200),(19,"ROCKET 3",1200),(20,"SPORTSTER S",1200),
       (20,"Softail Standard",1200),(20,"Street Bob 114",1200),(20,"Sport Glide",1200),
       (20,"Fat Bob 114",1200),(20,"Heritage Classic",1200),(20,"Fat Boy 114",1200),
       (20,"Low Rider ST",1200),(20,"Low Rider S",1200),(20,"Breakout",1200),
       (20,"Uultra",1200),(20,"Road King",1200),(20,"Road Glide",1200),(20,"TriGlide",1200),
       (21,"노든 901",901),(21,"스바르트필렌 125",125),(22,"C125",125),
       (22,"CT125",125),(22,"SUPER CUB",114),(22,"CBR 1000RR",1000),(22,"CBR 500R",500),
       (22,"CBR 650R",650),(22,"GOLD WING MT",1200),(22,"NT 1100",1100),
       (22,"REBLE 1100 MT",1100),(22,"REBLE 500",500),(22,"CB500X",500),(22,"CRF 1100",1100),
       (22,"CRF300L",300),(22,"NC750X",750),(22,"XL750",750),(22,"ADV350",350),
       (22,"FORZA350",350),(22,"FORZA750",750),(22,"PCX",125),(22,"CB1000R",1000),
       (22,"CB500F",500),(22,"CB650R",650),(22,"CB750 HORNET",750),(22,"CL500",500),
       (22,"CB 125R",125),(22,"CB 300R",300),(22,"Monkey125",125),(22,"MSX Grom",125);

# 🗺️ 지역 데이터
insert into address(address_id, city, town)
values (1,"서울","종로구"),(2,"서울","중구"),(3,"서울","용산구"),(4,"서울","성동구"),(5,"서울","광진구"),
       (6,"서울","동대문구"),(7,"서울","중랑구"),(8,"서울","성북구"),(9,"서울","강북구"),(10,"서울","도봉구"),
       (11,"서울","노원구"),(12,"서울","은평구"),(13,"서울","서대문구"),(14,"서울","마포구"),(15,"서울","양천구"),
       (16,"서울","강서구"),(17,"서울","구로구"),(18,"서울","금천구"),(19,"서울","영등포구"),(20,"서울","동작구"),
       (21,"서울","관악구"),(22,"서울","서초구"),(23,"서울","강남구"),(24,"서울","송파구"),(25,"서울","강동구"),
       (26,"경기","가평"),(27,"경기","과천"),(28,"경기","광주"),(29,"경기","군포"),(30,"경기","남양주"),
       (31,"경기","부천"),(32,"경기","수원"),(33,"경기","안산"),(34,"경기","안양"),(35,"경기","양평"),
       (36,"경기","연천"),(37,"경기","용인"),(38,"경기","의정부"),(39,"경기","파주"),(40,"경기","포천"),
       (41,"경기","화성"),(42,"경기","고양"),(43,"경기","광명"),(44,"경기","구리"),(45,"경기","김포"),
       (46,"경기","동두천"),(47,"경기","성남"),(48,"경기","시흥"),(49,"경기","안성"),(50,"경기","양주"),
       (51,"경기","여주"),(52,"경기","오산"),(53,"경기","의왕"),(54,"경기","이천"),(55,"경기","평택"),
       (56,"경기","하남"),(57,"충북","제천"),(58,"충북","충주"),(59,"충북","단양"),(60,"충북","괴산"),
       (61,"충북","음성"),(62,"충북","진천"),(63,"충북","청주"),(64,"충북","보은"),(65,"충북","옥천"),
       (66,"충북","영동"),(67,"충북","증평"),(68,"충남","태안"),(69,"충남","서산"),(70,"충남","당진"),
       (71,"충남","예산"),(72,"충남","홍성"),(73,"충남","청양"),(74,"충남","보령"),(75,"충남","서천"),
       (76,"충남","부여"),(77,"충남","논산"),(78,"충남","금산"),(79,"충남","계룡"),(80,"충남","공주"),
       (81,"충남","아산"),(82,"충남","천안"),(83,"강원","철원"),(84,"강원","화천"),(85,"강원","양구"),
       (86,"강원","고성"),(87,"강원","인제"),(88,"강원","속초"),(89,"강원","양양"),(90,"강원","홍천"),
       (91,"강원","횡성"),(92,"강원","원주"),(93,"강원","평창"),(94,"강원","강릉"),(95,"강원","정선"),
       (96,"강원","영월"),(97,"강원","동해"),(98,"강원","삼척"),(99,"강원","태백"),(100,"경북","울릉"),
       (101,"경북","울진"),(102,"경북","봉화"),(103,"경북","영주"),(104,"경북","예천"),(105,"경북","문경"),
       (106,"경북","상주"),(107,"경북","구미"),(108,"경북","김천"),(109,"경북","성주"),(110,"경북","고령"),
       (111,"경북","칠곡"),(112,"경북","의성"),(113,"경북","안동"),(114,"경북","영양"),(115,"경북","영덕"),
       (116,"경북","청송"),(117,"경북","포항"),(118,"경북","영천"),(119,"경북","경주"),(120,"경북","경산"),
       (121,"경북","청도"),(122,"경남","함양"),(123,"경남","거창"),(124,"경남","산청"),(125,"경남","하동"),
       (126,"경남","합천"),(127,"경남","의령"),(128,"경남","창녕"),(129,"경남","밀양"),(130,"경남","양산"),
       (131,"경남","김해"),(132,"경남","함안"),(133,"경남","창원"),(134,"경남","고성"),(135,"경남","진주"),
       (136,"경남","사천"),(137,"경남","남해"),(138,"경남","통영"),(139,"경남","거제"),(140,"전북","군산"),
       (141,"전북","익산"),(142,"전북","김제"),(143,"전북","부안"),(144,"전북","고창"),(145,"전북","정읍"),
       (146,"전북","전주"),(147,"전북","완주"),(148,"전북","진안"),(149,"전북","임실"),(150,"전북","순창"),
       (151,"전북","남원"),(152,"전북","장수"),(153,"전북","무주"),(154,"전남","목포"),(155,"전남","여수"),
       (156,"전남","순천"),(157,"전남","나주"),(158,"전남","광양"),(159,"전남","담양"),(160,"전남","곡성"),
       (161,"전남","구례"),(162,"전남","고흥"),(163,"전남","보성"),(164,"전남","화순"),(165,"전남","장흥"),
       (166,"전남","강진"),(167,"전남","해남"),(168,"전남","영암"),(169,"전남","무안"),(170,"전남","함평"),
       (171,"전남","영광"),(172,"전남","장성"),(173,"전남","완도"),(174,"전남","진도"),(175,"전남","신안");