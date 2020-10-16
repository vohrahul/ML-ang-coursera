## Copyright (C) 2008 Bill Denney <bill@denney.ws>
## Copyright (C) 2012 Carnë Draug <carandraug+dev@gmail.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{h} =} holidays
## @deftypefnx {Function File} {@var{h} =} holidays (@var{startdate}, @var{enddate})
## List holidays and non-trading days.
## 
## Returns vector @var{h} of all holidays and non-trading days between
## @var{startdate} and @var{enddate}, inclusive.  Output dates are in the serial
## day  number format.  Any date format accepted by @code{datevec} can be used.
## If called with no input arguments, returns all holidays between the 1st of
## January of 1885 and 31st of December of 2050.
##
## For example, to get all holidays for 2007 (02-Jan-2007 was mourning day of
## Gerald Ford.  See below for comments on such special occasions):
## @group
## @example
## holidays ("jan 01 2007", "dec 31 2007")
##     @result{} 733043
##        733044
##        733057
##        733092
##        733138
##        733190
##        733227
##        733288
##        733368
##        733401
## @end example
## @end group
##
## For ease of read, the output of @code{holidays} can be passed to
## @code{datestr}.  Also, the function @code{now} can be used to list all dates
## until current date.
## @group
## @example
## datestr (holidays ("may 01 2012", now))
##     @result{} 28-May-2012
##        04-Jul-2012
##        03-Sep-2012
## @end example
## @end group
##
## These holidays are trading holidays observed by the NYSE according to its
## rule 51.10.  It also tries to take into account the exceptions due to "unusual
## business conditions" or for additional days that have been called as holidays
## for one-time purposes.  However, as these are unpredictable by nature only the
## ones until 2011/02/01 have been listed.
##
## The complete list can be found at
## http://www.chronos-st.org/NYSE_Observed_Holidays-1885-Present.html
##
## @seealso{busdate, lbusdate, isbusday, fbusdate}
## @end deftypefn

## XXX when editiong this function, keep the list of unusual holidays up to date.
## For example, the following dates should be listed but cannot be guessed:
##    * Tue, 02 Jan 2007: DayOfMourning-GeraldFord
##    * Tue, 11 Sep 2001: WorldTradeCenterEvent
##    * Wed, 12 Sep 2001: WorldTradeCenterEvent
##    * Thu, 13 Sep 2001: WorldTradeCenterEvent
##    * Fri, 14 Sep 2001: WorldTradeCenterEvent
##
## The following makes it easier to check dates:
##    datestr (holidays ("jan 01 2011", now))
##
## Just google for the closing dates of NYSE and see if it's up to date. This
## link may, or may not, be up to date http://www.nyse.com/pdfs/closings.pdf
## Please update help text when rechecking this.

function hol = holidays (sd, ed)

  if (nargin != 0 && nargin != 2)
    print_usage;
  endif
  ## list of all holidays between jan 1 1885 and dec 31 2050
  ## 688484 = datenum (1885, 1, 1); 749113 = datenum (2050, 12, 31);
  sd_hol = 688484; ed_hol = 749113;
  hol = [688484; 688537; 688576; 688790; 688813; 688842; 688849; 688901; 688961; 688999; 689034; 689154; 689177; 689266; 689311; 689363; 689398; 689461; 689525; 689541; 689573; 689580; 689631; 689650; 689651; 689668; 689729; 689764; 689825; 689889; 689912; 689913; 689938; 689945; 689997; 690053; 690063; 690064; 690065; 690094; 690129; 690189; 690253; 690276; 690303; 690310; 690403; 690459; 690494; 690553; 690617; 690640; 690668; 690675; 690728; 690760; 690924; 690981; 691004; 691033; 691040; 691092; 691145; 691190; 691225; 691288; 691325; 691334; 691352; 691368; 691400; 691407; 691458; 691502; 691522; 691555; 691590; 691652; 691716; 691739; 691764; 691771; 691823; 691852; 691920; 691955; 692016; 692080; 692103; 692129; 692136; 692188; 692237; 692285; 692320; 692380; 692444; 692467; 692494; 692501; 692543; 692594; 692751; 692808; 692831; 692860; 692867; 692909; 692919; 692972; 692983; 693017; 693052; 693115; 693172; 693195; 693284; 693355; 693381; 693416; 693479; 693543; 693559; 693591; 693598; 693640; 693649; 693686; 693745; 693746; 693780; 693781; 693843; 693868; 693907; 693930; 693955; 693962; 694004; 694014; 694064; 694111; 694146; 694207; 694271; 694294; 694319; 694320; 694327; 694369; 694379; 694421; 694476; 694511; 694512; 694571; 694588; 694635; 694658; 694685; 694692; 694734; 694778; 694841; 694876; 694935; 694999; 695022; 695050; 695057; 695099; 695110; 695156; 695168; 695306; 695363; 695386; 695415; 695422; 695464; 695474; 695513; 695572; 695607; 695670; 695734; 695750; 695782; 695789; 695831; 695840; 695898; 695937; 695972; 696034; 696098; 696121; 696146; 696153; 696195; 696205; 696302; 696337; 696398; 696462; 696485; 696511; 696518; 696560; 696570; 696667; 696702; 696762; 696826; 696849; 696876; 696883; 696925; 696990; 697133; 697190; 697213; 697242; 697249; 697291; 697301; 697347; 697399; 697434; 697497; 697533; 697554; 697577; 697666; 697697; 697763; 697798; 697861; 697898; 697925; 697941; 697973; 697980; 698022; 698031; 698082; 698128; 698163; 698225; 698263; 698289; 698312; 698337; 698344; 698386; 698396; 698439; 698494; 698529; 698589; 698653; 698676; 698703; 698710; 698752; 698789; 698859; 698894; 698953; 698995; 699017; 699040; 699068; 699075; 699117; 699128; 699174; 699286; 699289; 699290; 699291; 699292; 699293; 699296; 699297; 699298; 699299; 699300; 699303; 699304; 699305; 699306; 699307; 699310; 699311; 699312; 699313; 699314; 699317; 699318; 699319; 699320; 699321; 699324; 699325; 699326; 699327; 699328; 699331; 699332; 699333; 699334; 699335; 699338; 699339; 699340; 699341; 699342; 699345; 699346; 699347; 699348; 699349; 699352; 699353; 699354; 699355; 699356; 699359; 699360; 699361; 699362; 699363; 699366; 699367; 699368; 699369; 699370; 699373; 699374; 699375; 699376; 699377; 699380; 699381; 699382; 699383; 699384; 699387; 699388; 699389; 699390; 699391; 699394; 699395; 699396; 699397; 699398; 699401; 699402; 699403; 699404; 699405; 699408; 699409; 699410; 699411; 699412; 699415; 699416; 699417; 699418; 699419; 699433; 699440; 699482; 699492; 699531; 699590; 699625; 699688; 699724; 699745; 699768; 699857; 699916; 699955; 699990; 700052; 700090; 700116; 700139; 700164; 700171; 700213; 700223; 700266; 700320; 700326; 700355; 700416; 700455; 700480; 700503; 700529; 700536; 700563; 700570; 700577; 700578; 700588; 700623; 700685; 700720; 700780; 700790; 700844; 700850; 700867; 700894; 700901; 700943; 700984; 701008; 701026; 701050; 701085; 701144; 701153; 701186; 701208; 701231; 701259; 701266; 701308; 701319; 701358; 701417; 701452; 701515; 701551; 701572; 701595; 701684; 701715; 701781; 701816; 701879; 701916; 701943; 701946; 701959; 701991; 701998; 702040; 702049; 702100; 702146; 702181; 702243; 702281; 702307; 702330; 702355; 702362; 702404; 702414; 702450; 702511; 702546; 702576; 702583; 702607; 702646; 702671; 702694; 702720; 702727; 702769; 702779; 702835; 702877; 702912; 702971; 703013; 703035; 703058; 703086; 703093; 703135; 703146; 703192; 703342; 703377; 703399; 703422; 703451; 703458; 703500; 703510; 703549; 703608; 703643; 703706; 703742; 703763; 703786; 703875; 703927; 703972; 703986; 704007; 704070; 704107; 704134; 704150; 704182; 704189; 704231; 704240; 704284; 704338; 704373; 704434; 704473; 704498; 704521; 704547; 704554; 704596; 704606; 704641; 704703; 704738; 704798; 704858; 704862; 704885; 704886; 704912; 704919; 704961; 705026; 705068; 705103; 705162; 705204; 705226; 705249; 705277; 705284; 705326; 705337; 705376; 705533; 705568; 705590; 705613; 705642; 705649; 705691; 705701; 705733; 705799; 705834; 705897; 705934; 705961; 705977; 706009; 706016; 706058; 706067; 706079; 706080; 706081; 706082; 706083; 706086; 706087; 706118; 706164; 706199; 706261; 706299; 706325; 706348; 706373; 706380; 706422; 706432; 706468; 706529; 706564; 706625; 706664; 706689; 706695; 706712; 706738; 706745; 706787; 706797; 706853; 706894; 706929; 706989; 707053; 707059; 707076; 707103; 707110; 707152; 707210; 707360; 707395; 707417; 707425; 707440; 707469; 707476; 707518; 707528; 707560; 707626; 707661; 707724; 707760; 707781; 707790; 707804; 707893; 707945; 707990; 708025; 708088; 708125; 708152; 708155; 708168; 708200; 708207; 708249; 708258; 708302; 708355; 708390; 708452; 708490; 708516; 708532; 708564; 708571; 708613; 708623; 708652; 708721; 708756; 708816; 708880; 708886; 708896; 708930; 708937; 708979; 709037; 709086; 709121; 709180; 709222; 709244; 709251; 709260; 709295; 709302; 709344; 709355; 709394; 709551; 709586; 709608; 709616; 709631; 709660; 709667; 709709; 709719; 709779; 709817; 709852; 709915; 709951; 709972; 709981; 709995; 710084; 710129; 710182; 710217; 710279; 710317; 710343; 710359; 710391; 710398; 710440; 710450; 710486; 710547; 710582; 710624; 710625; 710643; 710682; 710707; 710713; 710723; 710755; 710756; 710763; 710805; 710815; 710871; 710912; 710947; 711007; 711071; 711077; 711094; 711121; 711128; 711170; 711221; 711277; 711312; 711371; 711413; 711435; 711442; 711458; 711486; 711493; 711535; 711546; 711578; 711644; 711679; 711742; 711778; 711799; 711808; 711822; 711911; 711963; 712008; 712043; 712106; 712143; 712170; 712173; 712186; 712218; 712225; 712267; 712276; 712320; 712373; 712408; 712470; 712508; 712534; 712550; 712582; 712589; 712631; 712641; 712670; 712738; 712773; 712834; 712873; 712898; 712904; 712914; 712947; 712954; 712996; 713006; 713055; 713104; 713139; 713198; 713240; 713262; 713269; 713285; 713313; 713320; 713362; 713373; 713412; 713569; 713604; 713626; 713634; 713649; 713678; 713685; 713737; 713790; 713835; 713870; 713933; 713990; 714013; 714042; 714102; 714147; 714199; 714234; 714297; 714361; 714377; 714409; 714416; 714467; 714504; 714565; 714600; 714661; 714725; 714741; 714773; 714774; 714781; 714833; 714889; 714930; 714965; 715025; 715089; 715112; 715139; 715146; 715239; 715295; 715330; 715389; 715453; 715476; 715504; 715505; 715511; 715564; 715596; 715694; 715760; 715817; 715840; 715869; 715876; 715928; 715981; 716026; 716061; 716124; 716188; 716204; 716236; 716243; 716294; 716331; 716390; 716391; 716426; 716488; 716552; 716568; 716600; 716607; 716659; 716716; 716756; 716791; 716852; 716916; 716932; 716965; 716972; 717024; 717073; 717121; 717156; 717216; 717280; 717300; 717303; 717330; 717337; 717388; 717423; 717486; 717521; 717587; 717644; 717667; 717696; 717703; 717755; 717808; 717853; 717888; 717951; 718008; 718031; 718060; 718120; 718165; 718217; 718252; 718315; 718379; 718395; 718427; 718434; 718485; 718515; 718582; 718617; 718679; 718743; 718759; 718791; 718798; 718840; 718850; 718897; 718900; 718948; 718961; 718968; 718975; 718983; 718984; 718989; 718996; 719003; 719010; 719017; 719024; 719031; 719038; 719043; 719052; 719059; 719066; 719073; 719080; 719087; 719094; 719101; 719107; 719113; 719122; 719130; 719136; 719143; 719150; 719157; 719164; 719204; 719215; 719253; 719257; 719313; 719348; 719365; 719407; 719494; 719522; 719529; 719582; 719614; 719712; 719778; 719858; 719887; 719894; 719939; 719992; 720044; 720079; 720142; 720222; 720251; 720310; 720349; 720408; 720444; 720506; 720570; 720586; 720618; 720621; 720625; 720649; 720674; 720734; 720772; 720809; 720870; 720950; 720983; 720990; 721038; 721091; 721136; 721174; 721234; 721321; 721348; 721355; 721402; 721441; 721500; 721539; 721598; 721685; 721713; 721720; 721766; 721826; 721871; 721906; 721969; 722026; 722049; 722078; 722137; 722183; 722235; 722270; 722280; 722333; 722413; 722445; 722452; 722501; 722533; 722599; 722635; 722697; 722777; 722809; 722816; 722865; 722918; 722963; 723000; 723061; 723141; 723174; 723181; 723229; 723275; 723327; 723366; 723425; 723489; 723512; 723540; 723547; 723593; 723653; 723691; 723730; 723796; 723876; 723905; 723912; 723957; 724010; 724062; 724097; 724160; 724240; 724269; 724328; 724367; 724426; 724461; 724524; 724604; 724636; 724643; 724692; 724752; 724790; 724827; 724888; 724968; 725001; 725008; 725056; 725102; 725154; 725192; 725252; 725277; 725339; 725366; 725373; 725420; 725459; 725518; 725557; 725616; 725703; 725731; 725738; 725784; 725844; 725882; 725921; 725987; 726067; 726096; 726103; 726148; 726194; 726253; 726288; 726351; 726431; 726463; 726470; 726519; 726551; 726617; 726653; 726715; 726795; 726827; 726834; 726883; 726936; 726981; 727018; 727079; 727159; 727192; 727199; 727247; 727286; 727345; 727383; 727443; 727530; 727557; 727564; 727611; 727671; 727709; 727748; 727814; 727894; 727923; 727930; 727975; 728028; 728080; 728115; 728178; 728258; 728287; 728346; 728385; 728411; 728444; 728479; 728542; 728622; 728654; 728661; 728710; 728763; 728808; 728844; 728906; 728986; 729018; 729025; 729074; 729120; 729172; 729210; 729270; 729357; 729384; 729391; 729438; 729477; 729536; 729575; 729634; 729721; 729749; 729756; 729774; 729802; 729855; 729900; 729939; 730005; 730085; 730114; 730121; 730138; 730166; 730212; 730271; 730306; 730369; 730449; 730478; 730502; 730537; 730597; 730635; 730671; 730733; 730813; 730845; 730852; 730866; 730901; 730954; 730999; 731036; 731097; 731105; 731106; 731107; 731108; 731177; 731210; 731217; 731237; 731265; 731304; 731363; 731401; 731461; 731548; 731575; 731582; 731601; 731629; 731689; 731727; 731766; 731825; 731912; 731940; 731947; 731965; 731993; 732046; 732098; 732109; 732133; 732196; 732276; 732305; 732329; 732364; 732396; 732462; 732497; 732560; 732640; 732672; 732679; 732693; 732728; 732781; 732826; 732862; 732924; 733004; 733036; 733043; 733044; 733057; 733092; 733138; 733190; 733227; 733288; 733368; 733401; 733408; 733428; 733456; 733488; 733554; 733593; 733652; 733739; 733767; 733774; 733792; 733820; 733873; 733918; 733957; 734023; 734103; 734132; 734139; 734156; 734184; 734230; 734289; 734324; 734387; 734467; 734496; 734520; 734555; 734615; 734653; 734688; 734751; 734831; 734863; 734870; 734884; 734919; 734965; 735017; 735054; 735115; 735195; 735228; 735235; 735255; 735283; 735322; 735381; 735419; 735479; 735566; 735593; 735600; 735619; 735647; 735707; 735745; 735784; 735843; 735930; 735958; 735965; 735983; 736011; 736057; 736109; 736148; 736214; 736294; 736323; 736330; 736347; 736375; 736414; 736480; 736515; 736578; 736658; 736690; 736697; 736711; 736746; 736799; 736844; 736880; 736942; 737022; 737054; 737061; 737075; 737110; 737149; 737208; 737245; 737306; 737386; 737419; 737426; 737446; 737474; 737534; 737572; 737610; 737670; 737757; 737784; 737791; 737810; 737838; 737891; 737936; 737975; 738041; 738121; 738150; 738157; 738174; 738202; 738248; 738307; 738342; 738405; 738485; 738514; 738538; 738573; 738626; 738671; 738706; 738769; 738849; 738881; 738888; 738902; 738937; 738983; 739035; 739071; 739133; 739213; 739245; 739252; 739266; 739301; 739340; 739399; 739437; 739497; 739584; 739611; 739618; 739637; 739665; 739725; 739763; 739802; 739861; 739948; 739976; 739983; 740001; 740029; 740075; 740127; 740166; 740232; 740312; 740341; 740348; 740365; 740393; 740432; 740498; 740533; 740596; 740676; 740705; 740729; 740764; 740817; 740862; 740898; 740960; 741040; 741072; 741079; 741093; 741128; 741167; 741226; 741263; 741324; 741404; 741437; 741444; 741464; 741492; 741552; 741590; 741628; 741688; 741775; 741802; 741809; 741828; 741856; 741909; 741954; 741993; 742052; 742139; 742167; 742174; 742192; 742220; 742259; 742325; 742360; 742423; 742503; 742532; 742556; 742591; 742644; 742689; 742724; 742787; 742867; 742899; 742906; 742920; 742955; 743001; 743053; 743089; 743151; 743231; 743263; 743270; 743284; 743319; 743351; 743417; 743454; 743515; 743595; 743628; 743635; 743655; 743683; 743736; 743781; 743820; 743879; 743966; 743994; 744001; 744019; 744047; 744093; 744145; 744184; 744250; 744330; 744359; 744366; 744383; 744411; 744478; 744516; 744551; 744614; 744694; 744723; 744747; 744782; 744828; 744880; 744915; 744978; 745058; 745090; 745097; 745111; 745146; 745185; 745244; 745281; 745342; 745422; 745455; 745462; 745482; 745510; 745570; 745608; 745646; 745706; 745793; 745820; 745827; 745846; 745874; 745920; 745972; 746011; 746070; 746157; 746185; 746192; 746210; 746238; 746277; 746336; 746375; 746441; 746521; 746550; 746557; 746574; 746602; 746662; 746707; 746742; 746805; 746885; 746917; 746924; 746938; 746973; 747019; 747071; 747107; 747169; 747249; 747281; 747288; 747302; 747337; 747369; 747435; 747472; 747533; 747613; 747646; 747653; 747673; 747701; 747754; 747799; 747837; 747897; 747984; 748011; 748018; 748037; 748065; 748111; 748163; 748202; 748268; 748348; 748377; 748384; 748401; 748429; 748489; 748534; 748569; 748632; 748712; 748741; 748765; 748800; 748846; 748898; 748933; 748996; 749076; 749108 ];
  if (nargin == 0)
    return
  endif

  sd = datenum (datevec (sd));
  ed = datenum (datevec (ed));

  if (sd > ed)
    hol = zeros (0,1);  # matlab compatibility 0x1
  else
    hol = hol(hol >= sd & hol <= ed);
    if (sd < sd_hol); hol = [calculate_holidays(sd, sd_hol -1); hol]; endif
    if (ed > ed_hol); hol = [hol; calculate_holidays(ed_hol +1, ed)]; endif
  endif

endfunction

function hol = calculate_holidays (sd, ed)
  ## for dates outside the list, we can try to calculate them

  ## calculate all holidays on the request years. We will trim them at the end
  yrs = year (sd) : year (ed);

  hol = [];
  ## New Year's Day
  ## when it falls on a Saturday it will not move to Friday so the adjustment
  ## later on will not work for those cases. As such, we prune them now
  hol = [hol; (weekday (datenum(yrs, 1, 1)) != 7)(:)];
  ## Martin Luther King Day, the third Monday in January
  hol = [hol; nweekdate(3, 2, yrs, 1)(:)];
  ## Washington's Birthday, the third Monday in February
  hol = [hol; nweekdate(3, 2, yrs, 2)(:)];
  ## Good Friday (Friday of Easter)
  hol = [hol; (easter (yrs) - 2)(:)];
  ## Memorial Day, the last Monday in May
  hol = [hol; lweekdate(2, yrs, 5)(:)];
  ## Independence Day, July 4
  hol = [hol; datenum(yrs, 7, 4)(:)];
  ## Labor Day, the first Monday in September
  hol = [hol; nweekdate(1, 2, yrs, 9)(:)];
  ## Thanksgiving Day, the fourth Thursday in November
  hol = [hol; nweekdate(4, 5, yrs, 11)(:)];
  ## Christmas Day
  hol = [hol; datenum(yrs, 12, 25)(:)];

  ## Adjust for Saturdays and Sundays
  ## From NYSE rules at http://nyserules.nyse.com/nysetools/PlatformViewer.asp?SelectedNode=chp_1_3&manual=/nyse/rules/nyse-rules/
  ##
  ## The Exchange Board has also determined that, when any holiday observed by
  ## the Exchange falls on a Saturday, the Exchange will not be open for business
  ## on the preceding Friday and when any holiday observed by the Exchange falls
  ## on a Sunday, the Exchange will not be open for business on the succeeding
  ## Monday, unless unusual business conditions exist, such as the ending of a
  ## monthly or the yearly accounting period.
  ##
  ## Basically, Saturday holidays should be shifted to the previous Friday, and
  ## Sunday holidays to the next Monday, except when it crosses a calendar year.
  wd = weekday (hol);
  hol(wd == 1) = hol(wd == 1) + 1;  # Sunday holidays move to Monday
  hol(wd == 7) = hol(wd == 7) - 1;  # Saturday holidays move to Friday

  ## Trim out the days that are not in the date range
  hol(hol > ed | hol < sd) = [];
  hol = sort (hol);

endfunction

%!assert(holidays("jan 1 1999", "jan 1 1998"), zeros(0,1));   # return empty when startdate is after enddate
%!assert(holidays("mar 5 2008", "mar 8 2008"), zeros(0,1));
%!assert(holidays(datenum(2008,3,5), datenum(2008,3,5)), zeros(0,1));
%!assert(holidays(datenum(2008,1,1), datenum(2008,1,1)), datenum(2008,1,1));

## accept input dates in multiple formats
%!assert (holidays ("jan 1 2010",         "mar 1 2010"),         [734139; 734156; 734184]);
%!assert (holidays (datenum (2010, 1, 1), datenum (2010, 3, 1)), [734139; 734156; 734184]);

## do NOT move new year's day to Friday when it falls on a Saturday (Jan 2005)
%!assert (holidays ("dec 29 2004", "jan 2 2005"), zeros (0, 1));
## but do move new year's day to Monday when it falls on a Sunday (Jan 2006)
%!assert (holidays ("dec 29 2005", "jan 2 2006"), datenum (2006 ,1 ,2));

## check for special dates such as 11-jun-2004 (PresidentialFuneral-RonaldReagan) which can't be guessed, are just on the list
%!assert(holidays(datenum(2004,1,1), datenum(2004,12,31)), datenum(2004*ones(10,1), [1;1;2;4;5;6;7;9;11;12], [1;19;16;9;31;11;5;6;25;24]));
