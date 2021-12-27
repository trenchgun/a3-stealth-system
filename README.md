#Stealth System Test Mission

This is a small mission for 13 people (with 10 spectator slots) meant to test the basic stealth and alert system I wrote.
The stealth system can be found in functions/stealth, and is called from initServer.sqf.

This system is intended to have alert levels raise when AI detect player activity nearby. Quick-Response-Forces will be spawned and sent to the
location players are detected.

This mission uses Superxpdude's XPT mission framework. My work is within the function and init files as well as the mission.sqm, any code taken from
another source is credited.