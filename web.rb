require 'sinatra'
require 'json'
require 'set'

set :port, ENV["PORT"] || 8778
set :server, "webrick"

data = JSON.parse('[{
        "pid": "53070",
        "title": "Advancing Research to Combat Drug-Resistant Tuberculosis Through TB Alliance",
        "picture_url": "",
        "org": "Novartis AG",
        "category": "Medicine",
        "type": "Humanitarian Research",
        "location": "Basel, Switzerland",
        "contact": ""
    },
    {
        "pid": "52429",
        "title": "Device to Prevent Hypothermia in Preterm Babies in low resource settings",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50264-entry52429-section33506-incupouchlogo-1409070524102.jpg",
        "org": "Prasanga Lokuge\nChristian Felt",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Minneapolis, MN, USA",
        "contact": ""
    },
    {
        "pid": "52864",
        "title": "L PRV Saves Lives",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51083-entry52864-section33506-picture3-1412530473416.jpg",
        "org": "Manuel T. Rosado\nLee C. Rosado",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Jacksonville, FL",
        "contact": "Manuel T. Rosado\n12943 Bearpaw Pl.\nJacksonville, FL 32246"
    },
    {
        "pid": "53075",
        "title": "Patent for a household product - sales of which to help Darfurian refugees",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51311-entry53075-section33892-20141029_202551-1414639912283.jpg",
        "org": "Margaret Ruth Sharpe, individual",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Costa Mesa, CA USA",
        "contact": "Margaret Sharpe\n949-375-3949\nmsharpe3949@gmail.com"
    },
    {
        "pid": "52999",
        "title": "Kit for early detecting the efficacy of targeted drugs in cancer patients",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51173-entry52999-section33506-logo-1413049161759.jpg",
        "org": "Ming-Chung Jiang/Taipei Medical University-Shuang Ho Hospital",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Taipei, Taiwan",
        "contact": "Email: \njiangmwd@gmail.com\njiangmcedu@yahoo.com.tw"
    },
    {
        "pid": "52438",
        "title": "The Nutritional Autonomy for All",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50289-entry52438-section33823-p1060784-1409241208661.jpg",
        "org": "Nutriset",
        "category": "Nutrition",
        "type": "Humanitarian Use",
        "location": "Malaunay, France",
        "contact": ""
    },
    {
        "pid": "52511",
        "title": "Windsprings - Create Power with Gusty Winds, Tethered Objects, Vertical Cols",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50466-entry52511-section33869-picture-1414712978317.png",
        "org": "Saavedra LTD",
        "category": "Household Energy",
        "type": "Humanitarian Research",
        "location": "Irmo, South Carolina",
        "contact": "lookforthepower.com\njohn@lookforthepower.com"
    },
    {
        "pid": "53044",
        "title": "American Standards SaTo Technology: Safer Human Waste Disposal Worldwide",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51218-entry53044-section33846-as_ffg_logo_combo-1414615686623.jpg",
        "org": "AS IP Holdco L.L.C. and \nAmerican Standard Brands, \neach of which is an affiliated sister company of the LIXIL GROUP Corporation.",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Piscataway, NJ USA",
        "contact": ""
    },
    {
        "pid": "53090",
        "title": "Water Conservation",
        "picture_url": "",
        "org": "Rein Tech, Inc.",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Cheyenne, Wyoming",
        "contact": "Michael Klicpera\ndebonair7@att.net"
    },
    {
        "pid": "52492",
        "title": "Think Outside the Car - Generating Electricity with Gusty Winds \u0026 Rigid Flaps",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50416-entry52492-section33869-intermittentwindspic-1410263861975.png",
        "org": "Saavedra LTD",
        "category": "Household Energy",
        "type": "Humanitarian Research",
        "location": "Irmo, SC USA",
        "contact": "john@lookforthepower.com\nsaaavedra@mindspring.com"
    },
    {
        "pid": "53071",
        "title": "Technology for improving nutrition, the use of food resources, and food safety.",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51267-entry53071-section33823-covergraphic-1414626723324.jpg",
        "org": "Eugenio Minvielle, an individual.",
        "category": "Nutrition",
        "type": "Humanitarian Use",
        "location": "Rye, New York, U.S.A",
        "contact": ""
    },
    {
        "pid": "52832",
        "title": "Rapid, Cost-Effective Diagnostics for Resource-Limited Settings",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51074-entry52832-section33506-aldatu_icon_lowgradient-withborder-1412284848738.png",
        "org": "Aldatu Biosciences",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Boston, MA USA",
        "contact": "www.aldatubio.com // change@aldatubio.com"
    },
    {
        "pid": "52372",
        "title": "Portable Neonatal Intensive Care Unit (NICU)",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50167-entry52372-section33506-portablenicu_dftw_rendering-1408108955417.jpg",
        "org": "Designs for the World LLC",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "St Petersburg, FL US",
        "contact": "Designs for the World LLC\n901 34th Avenue N, No. 76265\nSt. Petersburg, FL 33734 U.S.A.\ninfo@designsfortheworld.com\nwww.designsfortheworld.com"
    },
    {
        "pid": "53085",
        "title": "Semi-Synthetic Artemisinin Production Process for Anti-Malarial Drugs",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51057-entry53085-section33506-picturejpeg-1414777028495.jpg",
        "org": "SANOFI",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Paris, France",
        "contact": "SANOFI US\n55 Corporate Drive\nBridgewater, NJ  08807\n800-981-2491"
    },
    {
        "pid": "53118",
        "title": "Diagnostics and Therapeutics for Restoring the Immune System",
        "picture_url": "",
        "org": "Alpha-1 Biologics LLC",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Stony Brook, NY, USA",
        "contact": "Name: ___Cynthia L. Bristow, PhD___________________________\nAddress: ___25 Health Sciences Dr., Suite 110___________________\nEmail: _cynthia.bristow@alpha1biologics.com___________________\nPhone Number: __631-444-6238_____________________\nPreferred contact method: _email_____________"
    },
    {
        "pid": "53043",
        "title": "Reducing world hunger and poverty while improving health of overweight people",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51241-entry53043-section33823-overweightvshungry-1414090653873.jpg",
        "org": "Jose Luis Garcia",
        "category": "Nutrition",
        "type": "Humanitarian Use",
        "location": "Valencia, Venezuela",
        "contact": "email: jlg21059@yahoo.com"
    },
    {
        "pid": "53083",
        "title": "Systems and methods for an advanced medical device",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51327-entry53083-section33506-1363647180-1414763828693.png",
        "org": "Metrad Biosystems",
        "category": "Medicine",
        "type": "Humanitarian Research",
        "location": "Los Gatos, CA, USA",
        "contact": "Milan Radojicic MD\nMilan.radojicic@metradbiosystems.com"
    },
    {
        "pid": "53116",
        "title": "Diagnostics for early detection of dengue infection",
        "picture_url": "",
        "org": "InBios International, Inc.",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Seattle, WA, USA",
        "contact": ""
    },
    {
        "pid": "53117",
        "title": "Biological cleansing of purification of waste waters for agronomic production",
        "picture_url": "",
        "org": "Lyseconcept France  \nLyseconcept Senegal \nLyseconcept RDC \nLyseconcept Benin \nLyseconcept Mali\nLyseconcept MAuritanie\nLyseconcept Namibia",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Toulon, France",
        "contact": "Name: D&#39;Alexandris France   \nAddress: 103 Rue Ernest Renan Toulon 83000 \nEmail: lyseconcept@gmail.com\nPhone Number: +330603658726\nPreferred contact method: Email lyseconcept@gmail.com"
    },
    {
        "pid": "52418",
        "title": "Disaster Emergency Assessment Notification (DEAN)",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50221-entry52418-section33506-bc_1-1408684729465.jpg",
        "org": "Blaster Communications Inc.",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Rancho Cucamonga CA.",
        "contact": "909-373-5665"
    },
    {
        "pid": "53064",
        "title": "wellness connected. Health Prevention Program to all who need it most",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51288-entry53064-section33892-wellnessconnected-1414535379534.png",
        "org": "LeanRadar LLC\nJuan Manuel Garcia",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Miami, Fl USA",
        "contact": "J. Manny Garcia"
    },
    {
        "pid": "52821",
        "title": "Rapid Self-Sterilizing Device",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51063-entry52821-section33846-uv%E6%AE%BA%E8%8F%8C%E6%B5%B7%E5%A0%B1-1414490279985.png",
        "org": "Industrial Technology Research Institute of Taiwan, Shr Ren-Chin Designer",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Taiwan, R.O.C",
        "contact": "Name: Shr Ren-Chin\nAddress: R117-B4, ITRI, 30011, Taiwan (R.O.C)\nEmail: renchin@msn.com"
    },
    {
        "pid": "53042",
        "title": "FLAMESTOWER - TURNING COOKING FIRES INTO IN HOME ELECTRICITY",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51247-entry53042-section33869-logo_square2-1414086460472.jpg",
        "org": "FLAMESTOWER, INC",
        "category": "Household Energy",
        "type": "Humanitarian Use",
        "location": "San Francisco, CA",
        "contact": "info@flamestower.com"
    },
    {
        "pid": "52935",
        "title": "Method of Distributing Music Online",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51111-entry52935-section33892-design8combinedlogo-1412678245875.jpg",
        "org": "Charles S. Parker, Jr. (Sole inventor)",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "",
        "contact": "Charles S. Parker, Jr.\nP O BOX 324, Steubenville, OH  43952\n[Email:] cp@BiggerThanIdol.com \n[Website:]  www.BiggerThanIdol.com\n[Phone Number:] 740-457-8101\n[Preferred contact method:] Email\n[Press contact:] Charles S. Parker, Jr."
    },
    {
        "pid": "52491",
        "title": "Heat From Highways - Generating Electricity from Thermal Gradients",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50400-entry52491-section33869-applicationlogo-1409866501638.png",
        "org": "Saavedra LTD",
        "category": "Household Energy",
        "type": "Humanitarian Research",
        "location": "Irmo, SC  USA",
        "contact": "saavedra@mindspring.com\njohn@lookforthepower.com\nlookforthepower.com"
    },
    {
        "pid": "53072",
        "title": "Freedom Chair: the Adaptive and Portable All-Terrain Mobility Machine",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50240-entry53072-section33506-gritfreedomchair-1414625293300.jpg",
        "org": "Global Research Innovation and Technology (GRIT)\nIndividual Inventor: Benjamin Michael Judge (representing all 3 entities listed)\nMassachusetts Institute of Technology\nSingapore University of Technology and Design",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Cambridge, MA, USA",
        "contact": "Name: _Global Research Innovation and Technology__\nAddress: __288 Norfolk St. 4th Flr, Cambridge, MA 02139, USA__\nEmail: _info@gogrit.org________________________\nPhone Number: __617-383-4748_________________\nPreferred contact method: _email: info@gogrit.org__________\nPress contact: ___ email: info@gogrit.org _______________"
    },
    {
        "pid": "52553",
        "title": "UroCycler Automatic Bladder Management System",
        "picture_url": "",
        "org": "UroSolutions Technologies, Inc.\nFoundation Fighting Fatal Infection \u0026 Disease",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Orlando,Florida, USA",
        "contact": ""
    },
    {
        "pid": "53062",
        "title": "Humidity Collection Apparatus",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50291-entry53062-section33892-hydroart-1414530748534.jpg",
        "org": "Operation HydroDrop",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Austin, TX, USA",
        "contact": "info@hydrodrop.org"
    },
    {
        "pid": "53077",
        "title": "Remediation of Tuluwat Village, Wiyot Indian Tribe",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51276-entry53077-section33846-cool-oxregisteredlogo-1414707104831.jpg",
        "org": "DeepEarth Technologies, Inc.",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Alsip, IL USA",
        "contact": "Name: Cheryl Rietjens\nAddress: 12635 South Kroll Drive, Alsip, IL  60803\nEmail: cheryl@cool-ox.com\nPhone Number: (708) 396-0100\nPreferred contact method: e-mail\nPress contact: William Lundy, Sr. or Cheryl Rietjens"
    },
    {
        "pid": "52444",
        "title": "Cardiopulmonary Lightning Protection Garment",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50300-entry52444-section33506-photo2-1409357641996.jpg",
        "org": "Zoltar Technology\nDan Schlager",
        "category": "Medicine",
        "type": "Humanitarian Research",
        "location": "Tiburon, California,",
        "contact": "Dan Schlager MD\n116 Barn Road\nTiburon, Ca 94920\nzolt@comcast.net"
    },
    {
        "pid": "52417",
        "title": "LOLA Foundation",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50220-entry52417-section33892-logo7-5-4-1408666202377.jpg",
        "org": "LOLA Foundation",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Atherton, CA  USA",
        "contact": "Dennis Fernandez\ndennis@iploft.com"
    },
    {
        "pid": "52863",
        "title": "Method and Apparatus to Rewire the Brain Using Fingertip movement",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51082-entry52863-section33506-brainpathslogotrademark-1412529289027.jpg",
        "org": "BRAINPATHS LLC",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Las Vegas, Nevada US",
        "contact": "Brainpaths LLC\nMedical Devices\nPatricia Derrick\nPresident/Inventor \nLas Vegas, Nevada\n702-804-1112"
    },
    {
        "pid": "53079",
        "title": "A methods of Purifying Fucoidan from Brown Algae",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51318-entry53079-section33823-fucoforce-1414737040987.png",
        "org": "National Taiwan University Science and Technology;\nNational Penghu University of Science and Technology",
        "category": "Nutrition",
        "type": "Humanitarian Use",
        "location": "Taipei, Taiwan, ROC",
        "contact": "TEL:+886-2-27303737\nNo.43, Sec. 4, Keelung Rd., Da&#39;an Dist., Taipei 106, Taiwan (R.O.C.)"
    },
    {
        "pid": "52554",
        "title": "jelma motor",
        "picture_url": "",
        "org": "jameleddine abdellaoui",
        "category": "Household Energy",
        "type": "Humanitarian Use",
        "location": "roswell , ga , u s a",
        "contact": "jameleddine abdellaoui\n175 derby forest ct roswell ga  30076\ninfo@jelmatechnology.com\n407 591 9657"
    },
    {
        "pid": "53093",
        "title": "FasciaDerm Heel Pain Relief System for Plantar Fasciitis",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51337-entry53093-section33506-fasciadermheelpainreliefsystem-1414805546081.png",
        "org": "Applied BioKinetics LLC",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Houston Texas, USA",
        "contact": ""
    },
    {
        "pid": "53078",
        "title": "You Too Can Recycle",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51245-entry53078-section33846-finaltoocanlogo-1414732934366.jpg",
        "org": "Laura Canary",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Clearwater, FL, US",
        "contact": "Laura Canary \n\nMailing address:\nYou Too Can Recycle, LLC\n1985 Hyvue Dr.\nClearwater, FL 33763\n\nPhone: 727-272-0212\nEmail: lauracanary@yahoo.com\nWebsite: youtoocanrecycle.com"
    },
    {
        "pid": "53088",
        "title": "Eliminated Listening Chaos and Achieving Clarity of Sound for Auditory Challenge",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51299-entry53088-section33892-hearingforthefirsttime-1414785338789.jpg",
        "org": "Able Kids Foundation\n\nBrain Basket, LLC",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Fort Collins, CO USA",
        "contact": "Name: Ken Curtis, Brain Basket, LLC   Address: 724 Whalers Way, Bldg. I, Suite 101 Fort Collins, CO 80525\nEmail: kencurtis3@gmail.com  Phone Number: 303-884-7443   Preferred contact method: Email or Phone\nPress contact: Ken Curtis, Brain Basket, LLC or \nJo Waldron, Able Kids Foundation,   jwaldron@ablekidsfoundation.org or 1-970-226-2253"
    },
    {
        "pid": "53084",
        "title": "Advancing Living Standards with Crowdsourced Workplace Transparency",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51315-entry53084-section33892-laborvoiceslogo-1414774489337.png",
        "org": "LaboVoices, Inc.",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Sunnyvale, CA, USA",
        "contact": "Name: Kohl Gill\nAddress: \n201 West California Avenue, #1022\nSunnyvale CA 94086\nUSA\nEmail: kohlgill@LaborVoices.com\nPhone Number: 925.456.4574"
    },
    {
        "pid": "52431",
        "title": "D.I.Y. Shoes Educational program_KLEM PROJECT",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50268-entry52431-section33846-3logo-1409082969917.jpg",
        "org": "i-CLUE DESIGN, LEE Jinyoung Designer",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Seoul, KOREA",
        "contact": "https://www.facebook.com/klemproject\nwww.i-cluedesign.com\nicluedesign@gmail.com"
    },
    {
        "pid": "52477",
        "title": "Technology for Accessible Education for Children with Disabilities Worldwide",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50374-entry52477-section33892-patentimage-1409919954136.png",
        "org": "Zyrobotics, LLC",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Atlanta, GA, USA",
        "contact": "Zyrobotics, LLC\n3522 Ashford Dunwoody #105, Atlanta, GA 30319\nEmail: ztech@zyrobotics.com\nWeb: www.zyrobotics.com"
    },
    {
        "pid": "53113",
        "title": "MicroRNAs for Diagnostic Screening of Colon Cancer in Stool, Blood \u0026 Tissue",
        "picture_url": "",
        "org": "GEM Tox Labs, Institute for Research in Biotechnology",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Greenville, NC",
        "contact": "Name: Dr. Farid E. Ahmed\nAddress: 2607 Calvin Way, Greenville, NC 27834-5627, USA\nEmail: gemtoxconsultants@yahoo.com\nPhone Number: (252) 321-7261 Cell: (252) 258-1008\nPreferred contact method: E-mail or telephone"
    },
    {
        "pid": "53089",
        "title": "Systems and Methods of Elevated Drainage for Flood Control and Water Conservatio",
        "picture_url": "",
        "org": "Mr. Jackie Hontiveros",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "San Mateo, Californi",
        "contact": "Jack Hontiveros\njackhontiveros@att.net\n650-430-4464"
    },
    {
        "pid": "53091",
        "title": "Gilead Sciences: Tenofovir Alafenamide (TAF) Licensing to Medicines Patent Pool",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51335-entry53091-section33506-gileadlogotag-1415116675089.jpg",
        "org": "Gilead Sciences",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Foster City, CA",
        "contact": ""
    },
    {
        "pid": "52508",
        "title": "HARVESTING ELECTRICITY AND IRRIGATION USING HELICAL TURBINES IN A VORTEX",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50461-entry52508-section33869-hugtruck-1410183784414.jpg",
        "org": "Living Water Is Corporation",
        "category": "Household Energy",
        "type": "Humanitarian Use",
        "location": "Gatineau, Qc, Canada",
        "contact": "www.livingwateris.com\n\nroaudet@gmail.com"
    },
    {
        "pid": "52644",
        "title": "Solar Service Station (3S)",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50795-entry52644-section33869-large20black20and20orange20logo-1411162021456.jpg",
        "org": "SunPower Corporation",
        "category": "Household Energy",
        "type": "Humanitarian Use",
        "location": "San Jose, CA, USA",
        "contact": ""
    },
    {
        "pid": "53092",
        "title": "Golden Rice",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51336-entry53092-section33823-gr12-1414793890048.jpg",
        "org": "The Golden Rice Project",
        "category": "Nutrition",
        "type": "Humanitarian Use",
        "location": "Dornach, Switzerland",
        "contact": "contact@goldenrice.org"
    },
    {
        "pid": "52545",
        "title": "An E-Reader for the Blind: A Multi-Line Refreshable Braille Display Device",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50576-entry52545-section33892-ncsu_logo_2x2_red-1410456359609.jpg",
        "org": "North Carolina State University (patent application owner)\n\nPolymer Braille, Inc. (exclusive licensee)",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Raleigh, NC, USA",
        "contact": "Dinesh Divakaran Ph.D., Brian Eller J.D., Paul Franzon Ph.D., Peichun Yang Ph.D.\n\nEmail: brian_eller@ncsu.edu\nPhone: (919) 515-7199"
    },
    {
        "pid": "52765",
        "title": "Means and Methods of Medical Treatment and Other Actions Using Decision Tree...",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team50994-entry52765-section33506-crystal-1412042014575.jpg",
        "org": "Beauford --Beau-- Chapman",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "San Anselmo, CA",
        "contact": ""
    },
    {
        "pid": "53094",
        "title": "Combating River Blindness with a Novel Black Fly Trap",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51084-entry53094-section33846-blackflytraps-1414831189545.png",
        "org": "John Wardzala",
        "category": "Sanitation",
        "type": "Humanitarian Use",
        "location": "Connecticut, USA",
        "contact": "bahootas@gmail.com"
    },
    {
        "pid": "53114",
        "title": "Liquid Vaccine Preparations",
        "picture_url": "",
        "org": "International Medica Foundation",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Rochester, MN, USA",
        "contact": "Name: Leonard P. Ruiz\nAddress: 5264 Oxford Street, Shoreview, MN  55126\nEmail: lpruiz@intl-medica.org\nPhone Number: 651-490-0212\nPreferred contact method: email\nPress contact: Scott Rosenow, sresonow@intl-medica.org"
    },
    {
        "pid": "53097",
        "title": "Green Tech Academ",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51339-entry53097-section33892-ecopic-1414841807424.jpg",
        "org": "Pat Brown, Founder",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Cleveland, OH US",
        "contact": "Pat Brown\nallaroundearth@gmail.org\n330.596.5134"
    },
    {
        "pid": "53115",
        "title": "Rapid Assessment of Malaria Detection Device",
        "picture_url": "",
        "org": "Case Western Reserve University",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Cleveland, OH, USA",
        "contact": "Name: Brian T. Grimberg, Ph.D.\nAddress: Case Western Reserve University\n2109 Adelbert Road\nBiomedical Research Building, Room 427\nCleveland, OH 44106-4983\nEmail: endmalaria@case.edu\nPhone Number: 216. 368.6328\nPreferred contact method: email\nPress contact: Jessica Studeny, jes91@case.edu, 216.368.4692"
    },
    {
        "pid": "53063",
        "title": "Obstacle Detection Device",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51275-entry53063-section33892-fauxseelogotrans-13-1414533491100.png",
        "org": "George Brandon Foshee\nTimothy Allen Zigler",
        "category": "Living Standards",
        "type": "Humanitarian Use",
        "location": "Magnolia, AR, USA",
        "contact": "Brandon Foshee\noffice-4030 Col. Rd. 5 Magnolia, AR 71753\nemail-brandonfoshee40@yahoo.com\nPh#-870-696-3871\npreferred contact method-email\npress contact-brandonfoshee40@yahoo.com"
    }, 
    {
        "pid": "53045",
        "title": "SHAPE CAPTURING JAMMABLE ASSEMBLY FOR PROSTHETIC AND ORTHOTICS CARE",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51250-entry53045-section33506-bethlogo-1414102108365.jpg",
        "org": "BeTHCare, Inc.",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Cambridge, MA, USA",
        "contact": "Jason Hill\nJason@bethcare.us\n(617) 871- 9324"
    },
    {
        "pid": "53017",
        "title": "Portable Water Purification Station",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51190-entry53017-section33869-photo01-1413401399597.jpg",
        "org": "Jamel HANBLI (Independent Invotor )",
        "category": "Household Energy",
        "type": "Humanitarian Research",
        "location": "Tunis, Tunisia",
        "contact": "jamelhanbli@yahoo.fr\nhttps://www.linkedin.com/pub/jamel-hanbli/8b/581/800"
    },
    {
        "pid": "53082",
        "title": "Wound-Pump: A Simplified Negative Pressure Wound Therapy Device",
        "picture_url": "https://skild-prod.s3.amazonaws.com/p4h/images/small/team51325-entry53082-section33506-wicarelogo2013-1414746994557.jpg",
        "org": "Worldwide Innovative Healthcare (WiCare)",
        "category": "Medicine",
        "type": "Humanitarian Use",
        "location": "Cambridge, MA, USA",
        "contact": "Danielle R. Zurovcik\n250 Main Street #425584\nCambridge, MA 02142\n\ndrz@wicaresolutions.com"
    }]')
    
winners = {"Medicine"=>{"Sanofi"=>"Artemisinin is an important antimalarial drug derived from the sweet wormwood plant in Asia and Africa.  Growing cycles, crop yields, and weather cause supply volatility of artemisinin, making it difficult to obtain at times.  To address this problem, a public-private partnership to create synthetic artemisinin was formed in 2004 by PATH, the University of California Berkeley (2013 Patents for Humanity award winner), and Amyris, Inc., with support from the Bill & Melinda Gates Foundation.  In 2007, Sanofi joined the project as the manufacturing partner for their chemical expertise and industrial capacity, taking this project from laboratory experiments to factory production. Sanofi is now supplying large quantities of artemisinin anti-malarial compounds on a no-profit-no-loss basis for use in developing countries.",
            "Novartis"=>"Tuberculosis kills more adults worldwide than any infectious disease besides HIV/AIDS.  One of the biggest challenges facing tuberculosis researchers is how to combat multidrug-resistant tuberculosis, which is caused by an organism that is resistant to the most potent tuberculosis drugs.  Novartis has discovered a class of compounds called indolcarboxamides that are active against drug-sensitive and multidrug-resistant strains of tuberculosis.  In an arrangement requiring no upfront or milestone payments, Novartis has provided their entire tuberculosis R&D program, including these compounds, to the TB Alliance, a non-profit product development partnership that seeks to find new and improved tuberculosis treatment regimens.  The agreement allows the TB Alliance to develop these compounds further into potential tuberculosis treatments and potentially conduct clinical trials.  Early toxicology, safety, and therapeutic studies have been promising."},
           "Sanitation"=>{"American Standard"=>"American Standard's 'SaTo' (Safe Toilet) Technology was created for people worldwide who do not have access to safe, basic sanitation. The SaTo Technology includes specially designed latrine pans and collectors with a counterweighted trapdoor-like flapper that can be flushed by pouring a small amount of water onto it.  Upon closure, the flapper door creates an air-tight seal that reduces odors and prevents insects from entering and exiting the pit, eliminating a primary route of disease transmission.  American Standard has partnered with BRAC, UNICEF, Save the Children, and other NGOs to distribute SaTo pans and collectors throughout the developing world.  Over 700,000 SaTo pans have been distributed in Bangladesh, Uganda, Haiti, Malawi, and the Philippines."},
          "Nutrition"=>{"Nutriset"=>"According to UNICEF, as many as 67 million children suffer from acute malnutrition every year.  Children suffering from prolonged malnutrition often develop digestive problems that interfere with eating more food, causing further health problems and death.  Nutriset developed nutritional products made from peanuts and other ingredients that helps malnourished children quickly and safely regain weight and digestive function.  In addition to delivering their Plumpy'Nut branded products throughout the world with partners like UNICEF and USAID, Nutriset also offers open licensing to producers in the developing world so communities can work toward self-sufficiency.  Their PlumpyField (Registered Trademark) network assembles entrepreneurs in participating countries to manufacture the Plumpy' range of products for local needs.",
            "Golden Rice"=>"Despite current interventions, vitamin A deficiency is the leading killer of children globally (2-3 million annually) and also the leading cause of childhood blindness (500,000 cases annually). Most cases arise in Asia where the staple food eaten by 3.5 billion people daily, white rice, lacks vitamin A sources typically found in meat and leafy vegetables. These deaths and blindness are preventable. \nGolden Rice was genetically enhanced to provide a source of vitamin A for people subsisting mainly on rice. Professors Potrykus and Beyer invented the technology after a decade of research, and have worked with Dr. Dubock since 2000 to donate it to the resource poor in developing countries. Patenting the technology allowed the inventors to partner with Syngenta on commercial projects in return for support of their humanitarian objectives to make Golden Rice available free of charge to those in need.  Local Golden Rice varieties are currently being developed by public sector institutions in Bangladesh, China, India, Indonesia, Philippines, and Vietnam, with a target cost no more than white rice."},
          "Household Energy"=>{"SunPower Corp"=>"Nearly 18 percent of the world's population is energy impoverished.  Traditional forms of lighting are combustion-based (firewood, charcoal, kerosene and dung), contributing to an estimated 3.5 million deaths a year from health impacts and house fires.  For these communities, SunPower has outfitted a standard shipping container with solar panels on top and equipment inside to power hundreds of safe, rechargeable lanterns.  Locals rent these lanterns for a small fee which is then reinvested to expand and improve the program.  SunPower donates the container and supplies to partner organizations, along with ongoing technical support."},
          "Living Standards"=>{"GRIT: Global Research Innovation & Technology"=>"An estimated 65 million people in the developing world require wheelchairs.  However, conventional wheelchairs don't function well on the rough and uneven terrain commonly found in developing regions. GRIT was created by engineering graduates of the Massachusetts Institute of Technology (MIT) to increase mobility for the disabled around the world.  Their three-wheel Leveraged Freedom Chair uses a push-lever drivetrain to help people move over broken pavement, dirt roads, fields, hills, rocky terrain and more.  It's built from standard bicycle parts to enable local repairs with available materials.  After graduating, the MIT students founded GRIT to bring the product to market, and MIT assisted by transferring the patent rights to GRIT for further development. The chair has been distributed in partnership with the World Bank, Red Cross, and others in India, Brazil, Guatemala, Guinea, Kenya, Haiti, Easter Island, Nepal, and Tanzania. A new version of the Leveraged Freedom Chair, known simply as the Freedom Chair, is now available in the United States for recreational use, helping Americans move beyond the pavement."}}
titles = Array.new(6)
logos = Array.new(6)
randoms = Set.new
num = 0
# The p4h categories are Medicine, Nutrition, Sanitation, Household Energy, Living Standards
# common words:
sanitation = ["black", "water", "people", "flies", "waste"]
medicine = ["targeted", "developing", "disease", "cost", "device"]
livingstandards = ["information", "children", "educational", "workplace", "system"]
nutrition = ["nutritional", "population", "health", "access", "vitamin"]
householdenergy = ["electricity", "power", "source", "renewable", "community"]
medicinescore = 0
nutritionscore = 0
sanitationscore = 0
householdenergyscore = 0
livingstandardsscore = 0
pickedwinnerinfo = {}

get '/' do
  # Get the data to pass to the view template for quiz
  # Randomly pick 12 different entries
  while randoms.size <= 12
    num = rand(55)
    while data[num]["picture_url"] == ""
      num = rand(55)
    end
    randoms << num
  end
  logoind = randoms.to_a
  randoms.clear
  wordind = rand(5)
  # Select 6 titles
  titles = [data[logoind[6]]["title"], data[logoind[7]]["title"], data[logoind[8]]["title"], data[logoind[9]]["title"], data[logoind[10]]["title"], data[logoind[11]]["title"]]
  titlecats = [data[logoind[6]]["category"], data[logoind[7]]["category"], data[logoind[8]]["category"], data[logoind[9]]["category"], data[logoind[10]]["category"], data[logoind[11]]["category"]]
  # pick 6 logos
  logos = [data[logoind[0]]["picture_url"],data[logoind[1]]["picture_url"],data[logoind[2]]["picture_url"],data[logoind[3]]["picture_url"],data[logoind[4]]["picture_url"],data[logoind[5]]["picture_url"]] 
  logocats = [data[logoind[0]]["category"],data[logoind[1]]["category"],data[logoind[2]]["category"],data[logoind[3]]["category"],data[logoind[4]]["category"],data[logoind[5]]["category"]]
  erb :quiz, locals: {title: titles, logos: logos, sanword: sanitation[wordind], medword: medicine[wordind], livword: livingstandards[wordind], nutword: nutrition[wordind], heword: householdenergy[wordind], logocats: logocats, titlecats: titlecats}
  #erb :quiz, locals: {topwords: words, imgurls: images, titles: submissiontitles}
end

post '/result' do
  medicinescore = 0
nutritionscore = 0
sanitationscore = 0
householdenergyscore = 0
livingstandardsscore = 0
  @post = params[:post]
  # @post has the form results. Now tabulate the score for each category and determine the winner
  # The p4h categories are Medicine, Nutrition, Sanitation, Household Energy, Living Standards
  case @post["icons"]
    when "medicine"
      medicinescore = medicinescore + 1
    when "nutrition"
      nutritionscore = nutritionscore + 1
    when "sanitation"
      sanitationscore = sanitationscore + 1
    when "householdenergy"
      householdenergyscore = householdenergyscore + 1
    when "livingstandard"
      livingstandardsscore = livingstandardsscore + 1
  end
  case @post["words"]
    when "medicine"
      medicinescore = medicinescore + 1
    when "nutrition"
      nutritionscore = nutritionscore + 1
    when "sanitation"
      sanitationscore = sanitationscore + 1
    when "householdenergy"
      householdenergyscore = householdenergyscore + 1
    when "livingstandard"
      livingstandardsscore = livingstandardsscore + 1
  end
  case @post["logos"]
    when "Medicine"
      medicinescore = medicinescore + 1
    when "Nutrition"
      nutritionscore = nutritionscore + 1
    when "Sanitation"
      sanitationscore = sanitationscore + 1
    when "Household Energy"
      householdenergyscore = householdenergyscore + 1
    when "Living Standards"
      livingstandardsscore = livingstandardsscore + 1
  end
  case @post["titles"]
    when "Medicine"
      medicinescore = medicinescore + 1
    when "Nutrition"
      nutritionscore = nutritionscore + 1
    when "Sanitation"
      sanitationscore = sanitationscore + 1
    when "Household Energy"
      householdenergyscore = householdenergyscore + 1
    when "Living Standards"
      livingstandardsscore = livingstandardsscore + 1
  end
  case @post["teamtype"]
    when "independentresearcher"
      nutritionscore = nutritionscore + 1
      sanitationscore = sanitationscore + 1
      livingstandardsscore = livingstandardsscore + 1
    when "university"
      medicinescore = medicinescore + 1
    when "corporation"
      sanitationscore = sanitationscore + 1
      medicinescore = medicinescore + 1
      householdenergyscore = householdenergyscore + 1
    when "nonprofit"
      livingstandardsscore = livingstandardsscore + 1
      sanitationscore = sanitationscore + 1
  end
  resultkeypair = {"Sanitation" => sanitationscore, "Living Standards" => livingstandardsscore, "Household Energy"=>householdenergyscore,"Medicine"=>medicinescore,"Nutrition"=>nutritionscore}.max_by{|k,v| v}
  filenamehash = {"Sanitation" => "sanitation", "Living Standards" => "livingstandards", "Household Energy"=>"householdenergy","Medicine"=>"medicine","Nutrition"=>"nutrition"}
=begin
  winnerinfo = winners[resultkeypair[0]]
  puts "Winning category is: " + resultkeypair[0].to_s
  puts "Size is: " + winnerinfo.size.to_s
  randomindex = rand(winnerinfo.size-1)
  puts "Random number is: " + randomindex.to_s
  puts "Hash is: " + winnerinfo.to_a.to_s
  # winnerinfo should be a hash of the winners in the category of the quiz taker
  if winnerinfo.size > 1
    doubarr = winnerinfo.to_a
    pickedwinnerinfo = doubarr[0][randomindex]
  else
    pickedwinnerinfo = winnerinfo.to_a[0] 
  end
    puts "PICKEDWINNERINFO: " + pickedwinnerinfo[0].to_s
=end
  erb :results, locals: {icon: resultkeypair[0], filename: filenamehash[resultkeypair[0]]}
end
