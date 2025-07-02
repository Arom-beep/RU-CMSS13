//Areas for Prison_Station_RU - Arom-beep
// [RU-CMSS13 ADD]

/area/prisonru
	name = "Fiorina Orbital Penitentiary - Main Cellblock"
	icon = 'icons/turf/area_prison_v3_fiorina.dmi'
	can_build_special = TRUE
	temperature = T20C
	ceiling = CEILING_GLASS
	ambience_exterior = AMBIENCE_PRISON
	soundscape_playlist = SCAPE_PL_FIORINA_COMMON
	ceiling_muffle = FALSE
	minimap_color = MINIMAP_AREA_COLONY

//LZ CODE

/area/prisonru/lz
	icon_state = "lz"
	name = "Prison - LZ"
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ
	ceiling = CEILING_GLASS

/area/prisonru/lz/near_lzI
	name = "Prison - Main Hanger"
	linked_lz = DROPSHIP_LZ1

/area/prisonru/lz/console_lzI
	name = "Prison - LZ1 'Admin"
	icon_state = "lz1"
	linked_lz = DROPSHIP_LZ1
	requires_power = FALSE

/area/prisonru/lz/dispatch_lzI
	name = "Prison - Main Hangar Traffic Control"
	ambience_exterior = AMBIENCE_PRISON_LZDISPATCH
	linked_lz = DROPSHIP_LZ1

/area/prisonru/lz/near_lzII
	name = "Prison - Research Hanger"
	linked_lz = DROPSHIP_LZ2
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/lz/console_lzII
	name = "Prison - LZ2 'Research'"
	icon_state = "lz2"
	linked_lz = DROPSHIP_LZ2
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI
	requires_power = FALSE

/area/prisonru/lz/storage
	name = "Prison - Research Hangar Storage"
	linked_lz = DROPSHIP_LZ2
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

//Station Areas
/area/prisonru/station
	name = "Prison - Station Interior"
	icon_state = "station0"
	ceiling = CEILING_GLASS

//SECURITY
/area/prisonru/station/security
	name = "Prison - Security Department"
	minimap_color = MINIMAP_AREA_SEC

/area/prisonru/station/security/barracks
	name = "Prison - Security Barracks"

/area/prisonru/station/security/intake
	name = "Prison - Intake Processing"

/area/prisonru/station/security/briefing
	name = "Prison - Briefing"

/area/prisonru/station/security/head
	name = "Prison - Head of Security's office"

/area/prisonru/station/security/armory
	icon_state = "wardens"

/area/prisonru/station/security/armory/riot
	name = "Prison - Riot Armory"

/area/prisonru/station/security/armory/lethal
	name = "Prison - Lethal Armory"

/area/prisonru/station/security/armory/highsec_monitoring
	name = "Prison - High-Security Monitoring Armory"
	icon_state = "security_sub"

/area/prisonru/station/security/monitoring
	icon_state = "security_hub"

/area/prisonru/station/security/monitoring/lowsec/ne
	name = "Prison - Northeast Low-Security Monitoring"

/area/prisonru/station/security/monitoring/lowsec/sw
	name = "Prison - Southwest Low-Security Monitoring"

/area/prisonru/station/security/monitoring/medsec/south
	name = "Prison - Medium-Security Monitoring"
	soundscape_playlist = SCAPE_PL_FIORINA_COMPUTERS_ROOM

/area/prisonru/station/security/monitoring/medsec/central
	name = "Prison - Central Medium-Security Monitoring"

/area/prisonru/station/security/monitoring/highsec
	name = "Prison - High-Security Monitoring"

/area/prisonru/station/security/monitoring/maxsec
	name = "Prison - Maximum-Security Monitoring"

/area/prisonru/station/security/monitoring/maxsec/panopticon
	name = "Prison - Panopticon Monitoring"

/area/prisonru/station/security/monitoring/protective
	name = "Prison - Protective Custody Monitoring"

/area/prisonru/station/security/checkpoint
	icon_state = "security_hub"

/area/prisonru/station/security/checkpoint/medsec
	name = "Prison - Medium-Security Checkpoint"

/area/prisonru/station/security/checkpoint/highsec/n
	name = "Prison - North High-Security Checkpoint"

/area/prisonru/station/security/checkpoint/highsec/s
	name = "Prison - South High-Security Checkpoint"

/area/prisonru/station/security/checkpoint/vip
	name = "Prison - VIP Checkpoint"

/area/prisonru/station/security/checkpoint/maxsec
	name = "Prison - Maximum-Security Checkpoint"

/area/prisonru/station/security/checkpoint/highsec_medsec
	name = "Prison - High-to-Medium-Security Checkpoint"

/area/prisonru/station/security/checkpoint/maxsec_highsec
	name = "Prison - Maximum-to-High-Security Checkpoint"

/area/prisonru/station/storage
	icon_state = "station0"

/area/prisonru/station/storage/medsec
	name = "Prison - Medium-Security Storage"

/area/prisonru/station/storage/highsec/n
	name = "Prison - North High-Security Storage"

/area/prisonru/station/storage/highsec/s
	name = "Prison - South High-Security Storage"

/area/prisonru/station/storage/vip
	name = "Prison - VIP Storage"

/area/prisonru/station/recreation
	icon_state = "station1"

/area/prisonru/station/recreation/staff
	name = "Prison - Staff Recreation"

/area/prisonru/station/recreation/medsec
	name = "Prison - Medium-Security Recreation"

/area/prisonru/station/recreation/highsec/n
	name = "Prison - North High-Security Recreation"

/area/prisonru/station/recreation/highsec/s
	name = "Prison - South High-Security Recreation"

/area/prisonru/station/execution
	name = "Prison - Execution"

/area/prisonru/station/store
	name = "Prison - prisonru Store"

/area/prisonru/station/chapel
	name = "Prison - Chapel"

/area/prisonru/station/cleaning
	name = "Prison - Custodial Supplies"

/area/prisonru/station/command/office
	name = "Prison - Warden's Office"

/area/prisonru/station/command/secretary_office
	name = "Prison - Warden's Secretary's Office"

/area/prisonru/station/command/quarters
	name = "Prison - Warden's Quarters"

/area/prisonru/station/toilet
	icon_state = "restrooms"

/area/prisonru/station/toilet/canteen
	name = "Prison - Canteen Restooms"

/area/prisonru/station/toilet/security
	name = "Prison - Security Restooms"

/area/prisonru/station/toilet/research
	name = "Prison - Research Restooms"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/station/toilet/staff
	name = "Prison - Staff Restooms"

//Maintanance code
/area/prisonru/station/maintenance
	icon_state = "maints"
	ambience_exterior = AMBIENCE_PRISON_MAINTENANCE

/area/prisonru/station/maintenance/residential

/area/prisonru/station/maintenance/residential/nw
	name = "Prison - Northwest Civilian Residences Maintenance"

/area/prisonru/station/maintenance/residential/ne
	name = "Prison - Northeast Civilian Residences Maintenance"

/area/prisonru/station/maintenance/residential/sw
	name = "Prison - Southwest Civilian Residences Maintenance"

/area/prisonru/station/maintenance/residential/se
	name = "Prison - Southeast Civilian Residences Maintenance"

/area/prisonru/station/maintenance/residential/access/north
	name = "Prison - North Civilian Residences Access"

/area/prisonru/station/maintenance/residential/access/south
	name = "Prison - South Civilian Residences Access"

/area/prisonru/station/maintenance/staff_research
	name = "Prison - Staff-Research Maintenance"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/station/maintenance/research_medbay
	name = "Prison - Research-Infirmary Maintenance"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/station/maintenance/hangar_barracks
	name = "Prison - Hangar-Barracks Maintenance"
	soundscape_playlist = SCAPE_PL_FIORINA_COMPUTERS_ROOM
	linked_lz = DROPSHIP_LZ1


/area/prisonru/station/canteen
	name = "Prison - Canteen"

/area/prisonru/station/kitchen
	name = "Prison - Kitchen"

/area/prisonru/station/laundry
	name = "Prison - Laundry"

/area/prisonru/station/library
	name = "Prison - Library"

//Engi code
/area/prisonru/station/engineering
	name = "Prison - Engineering"
	icon_state = "power0"
	minimap_color = MINIMAP_AREA_ENGI

/area/prisonru/station/engineering/atmos
	name = "Prison - Atmospherics"

/area/prisonru/station/parole/protective_custody
	name = "Prison - Protective Custody Parole"

/area/prisonru/station/visitation
	name = "Prison - Visitation"

/area/prisonru/station/yard
	name = "Prison - Yard"

//HALLWAYS

/area/prisonru/station/hallway
	icon_state = "station4"

/area/prisonru/station/hallway/entrance
	name = "Prison - Entrance Hallway"

/area/prisonru/station/hallway/central
	name = "Prison - Central Ring"

/area/prisonru/station/hallway/central/east
	name = "Prison - East Central Ring"

/area/prisonru/station/hallway/central/north
	name = "Prison - North Central Ring"

/area/prisonru/station/hallway/central/south
	name = "Prison - South Central Ring"

/area/prisonru/station/hallway/central/west
	name = "Prison - West Central Ring"

/area/prisonru/station/hallway/east
	name = "Prison - East Hallway"

/area/prisonru/station/hallway/staff
	name = "Prison - Staff Hallway"

/area/prisonru/station/hallway/engineering
	name = "Prison - Engineering Hallway"
	minimap_color = MINIMAP_AREA_ENGI

//QUARTERS

/area/prisonru/station/quarters/staff //In SCI
	name = "Prison - Staff Quarters"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/station/quarters/research //In SCI
	name = "Prison - Research Dorms"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI
	minimap_color = MINIMAP_AREA_RESEARCH

/area/prisonru/station/disposal
	name = "Prison - Disposals"

//Civilian BLOCK CODE
/area/prisonru/station/residential

/area/prisonru/station/residential/central
	name = "Prison - Civilian Residences Central"

/area/prisonru/station/residential/north
	name = "Prison - Civilian Residences North"

/area/prisonru/station/residential/south
	name = "Prison - Civilian Residences South"

//MEDBAY CODE

/area/prisonru/medbay
	name = "Prison - Infirmary"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/medbay/foyer
	name = "Prison - Infirmary Foyer"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/medbay/surgery
	name = "Prison - Operating Theatre"

/area/prisonru/medbay/morgue
	name = "Prison - Morgue"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

//CELLBLOCKS CODE

//Near Engi/Canteen
/area/prisonru/cellblock/holdingN
	name = "Prison - Holding Cell 1"
	minimap_color = MINIMAP_AREA_SEC

/area/prisonru/cellblock/holdingS
	name = "Prison - Holding Cell 2"
	minimap_color = MINIMAP_AREA_SEC

//Central Cell ring
/area/prisonru/cellblock/lowsec
	minimap_color = MINIMAP_AREA_CELL_LOW

/area/prisonru/cellblock/lowsec/nw
	name = "Prison - Northwest Low-Security Cellblock"

/area/prisonru/cellblock/lowsec/ne
	name = "Prison - Northeast Low-Security Cellblock"

/area/prisonru/cellblock/lowsec/sw
	name = "Prison - Southwest Low-Security Cellblock"

/area/prisonru/cellblock/lowsec/se
	name = "Prison - Southeast Low-Security Cellblock"

//South Cell Blocks
/area/prisonru/cellblock/mediumsec
	name = "Prison - Medium-Security Cellblock"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/prisonru/cellblock/mediumsec/north
	name = "Prison - Medium-Security Cellblock North"

/area/prisonru/cellblock/mediumsec/south
	name = "Prison - Medium-Security Cellblock South"

/area/prisonru/cellblock/mediumsec/east
	name = "Prison - Medium-Security Cellblock East"

/area/prisonru/cellblock/mediumsec/west
	name = "Prison - Medium-Security Cellblock West"

//North-West Cell Blocks
/area/prisonru/cellblock/highsec
	minimap_color = MINIMAP_AREA_CELL_HIGH

/area/prisonru/cellblock/highsec/north/north
	name = "Prison - North High-Security Cellblock North"

/area/prisonru/cellblock/highsec/north/south
	name = "Prison - North High-Security Cellblock South"

//South-West Cell Blocks
/area/prisonru/cellblock/highsec/south/north
	name = "Prison - South High-Security Cellblock North"

/area/prisonru/cellblock/highsec/south/south
	name = "Prison - South High-Security Cellblock South"

//North Cell's Blocks
/area/prisonru/cellblock/maxsec
	minimap_color = MINIMAP_AREA_CELL_MAX

/area/prisonru/cellblock/maxsec/north
	name = "Prison - Maximum-Security Panopticon Cellblock"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/cellblock/maxsec/south
	name = "Prison - Maximum-Security Suspended Cellblock"

//VIP Cell blocks
/area/prisonru/cellblock/vip
	name = "Prison - VIP Cells"
	minimap_color = MINIMAP_AREA_CELL_VIP

/area/prisonru/cellblock/protective
	name = "Prison - Protective Custody"
	minimap_color = MINIMAP_AREA_CELL_VIP

// RESEARCH CODE
/area/prisonru/research
	name = "Prison - Biological Research Department"
	soundscape_playlist = SCAPE_PL_FIORINA_NEAR_SCI

/area/prisonru/research/rd
	name = "Prison - Research Director's office"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret
	name = "Prison - Classified Research"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret/WYLab
	name = "Prison - WY Research Laboratory"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret/dissection
	name = "Prison - Dissection"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret/chemistry
	name = "Prison - Chemistry"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret/bioengineering
	name = "Prison - Bioengineering"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret/containment
	name = "Prison - Test Subject Containment"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

/area/prisonru/research/secret/testing
	name = "Prison - Biological Testing"
	ambience_exterior = AMBIENCE_PRISON_ALARM
	soundscape_playlist = SCAPE_PL_LV759_INDOORS

//Civilian BLOCK CODE
/area/prisonru/residential

/area/prisonru/residential/central
	name = "Prison - Civilian Residences Central"

/area/prisonru/residential/north
	name = "Prison - Civilian Residences North"

/area/prisonru/residential/south
	name = "Prison - Civilian Residences South"

//Monorail CODE
/area/prisonru/monorail

/area/prisonru/monorail/west
	name = "Prison - West Monorail Station"

/area/prisonru/monorail/east
	name = "Prison - East Monorail Station"
	linked_lz = DROPSHIP_LZ1

//Telecomms CODE
/area/prisonru/telecomms
	icon_state = "base_icon"
	name = "Prison - Telecommunications"
	soundscape_playlist = SCAPE_PL_FIORINA_MACHINES_ROOM

/area/prisonru/telecomms/hangar_storage/main //Also telecomms tower there
	name = "Prison - Main Hangar Storage"

/area/prisonru/telecomms/relay
	name = "Prison - Communications Relay"

//CLF ship CODE
/area/prisonru/pirate
	name = "Tramp Freighter \"Rocinante\""
