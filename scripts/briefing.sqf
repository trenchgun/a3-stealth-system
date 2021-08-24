// Script to handle initial mission briefings
// General guidelines would be to include briefings for the following
// Situation, Mission, and Assets
// Briefings are listed in the opposite order that they are written below. New diaryRecords are always placed at the top of the list.
// https://community.bistudio.com/wiki/createDiaryRecord

//player createDiaryRecord ["Diary", ["Assets", "Example Mission Assets"]];
//player createDiaryRecord ["Diary", ["Mission", "Example Mission Briefing"]];
//player createDiaryRecord ["Diary", ["Situation", "Example Situation Briefing"]];

// TO USE THIS FILE. UNCOMMENT THE MARKED LINE IN "initPlayerLocal.sqf"

player createDiaryRecord ["Diary", ["Assets", "Example Asset List:<br/>
	- 3x Direct Action teams<br/>
	- 1x Greyhawk UAV w/ 3x Scalpels
"]];

player createDiaryRecord ["Diary", ["Intel",
"The villa is suspected to have a guard staff of around 40.
<br/>
<br/>Only about half of that are on a shift at a time.
<br/>
<br/>More men are on standby in the surrounding area to reinforce the villa. If things really get out of hand, helicopter QRF could be summoned from the nearby airfield.
<br/>
<br/>Enter the villa and search it for the three laptops, then exfiltrate."
]];


player createDiaryRecord ["Diary", ["Mission",
"Infiltrate the villa.
<br/>
<br/>
<br/>Secure all copies of the intel.
<br/>
<br/>
<br/>Take no prisoners.
<br/>
<br/>Leave only chaos."
]];

player createDiaryRecord ["Diary", ["Situation",
"The source has been tracked down.
<br/>
<br/>
<br/>The intel is confirmed to be at the villa."
]];
