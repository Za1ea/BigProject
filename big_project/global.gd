extends Node

var current_game: String

var grid: Array[Array] = []


	#["" , "" , "" , "" , "" , "" , ""],
	#["" , "" , "" , "" , "" , "" , ""],
	#["" , "" , "" , "" , "" , "" , ""],
	#["" , "" , "" , "" , "" , "" , ""],
	#["" , "" , "" , "" , "" , "" , ""],
	#["" , "" , "" , "" , "" , "" , ""],
	#["" , "" , "" , "" , "" , "" , ""]

var level1_ans = [
	["purple", "purple", "purple", "purple", "purple", "purple", "red"   ],
	["yellow", "whale" , "whale" , "whale" , "whale" , "purple", "red"   ],
	["yellow", "yellow", "yellow", "yellow", "yellow", "purple", "red"   ],
	["purple", "purple", "purple", "purple", "purple", "purple", "red"   ],
	["purple", "red"   , "red"   , "red"   , "red"   , "red"   , "red"   ],
	["purple", "red"   , "purple", "purple", "purple", "purple", "purple"],
	["purple", "purple", "purple", "teal"  , "teal"  , "teal"  , "purple"]
]
#colors: red, purple, yellow, teal

var level2_ans = [
	["purple", "purple", "purple", "whale" , "yellow", "whale" , "green"],
	["blue"  , "blue"  , "purple", "red"   , "yellow", "whale" , "green"],
	["teal"  , "blue"  , "purple", "red"   , "yellow", "yellow", "green"],
	["teal"  , "whale" , "purple", "red"   , "red"   , "yellow", "green"],
	["teal"  , "teal"  , "purple", "yellow", "yellow", "yellow", "green"],
	["whale" , "whale" , "purple", "yellow", "whale" , "whale" , "green"],
	["whale" , "whale" , "purple", "yellow", "yellow", "green" , "green"]
]
#colors: purple, blue, teal, yellow, red, green

var level3_ans = [
	["whale", "whale"  , "whale"  , "whale"  , "yellow" , "yellow" , "yellow"],
	["teal" , "teal"   , "teal"   , "yellow" , "yellow" , "red"    , "yellow"],
	["teal" , "yellow" , "yellow" , "yellow" , "purple" , "red"    , "yellow"],
	["teal" , "purple" , "purple" , "purple" , "purple" , "red"    , "yellow"],
	["teal" , "purple" , "whale"  , "whale"  , "whale"  , "red"    , "red"   ],
	["teal" , "purple" , "purple" , "purple" , "purple" , "purple" , "red"   ],
	["teal" , "teal"   , "teal"   , "teal"   , "teal"   , "purple" , "purple"]
]
#colors: teal, pruple, red, yellow

var level4_ans = [
	["yellow" , "yellow" , "yellow" , "yellow" , "whale"  , "whale"  , "whale" ],
	["yellow" , "whale"  , "whale"  , "yellow" , "whale"  , "green"  , "green" ],
	["yellow" , "yellow" , "whale"  , "yellow" , "yellow" , "green"  , "purple"],
	["red"    , "yellow" , "green"  , "green"  , "green"  , "green"  , "purple"],
	["red"    , "red"    , "green"  , "red"    , "red"    , "red"    , "purple"],
	["teal"   , "red"    , "red"    , "red"    , "teal"   , "teal"   , "purple"],
	["teal"   , "teal"   , "teal"   , "teal"   , "teal"   , "purple" , "purple"]
]
#colors: yellow, red, teal, green, purple

var level5_ans = [
	["whale" , "red"    , "red"    , "whale"  , "whale"  , "whale"  , "whale" ],
	["whale" , "whale"  , "red"    , "red"    , "yellow" , "yellow" , "yellow"],
	["teal"  , "teal"   , "teal"   , "red"    , "red"    , "red"    , "yellow"],
	["teal"  , "purple" , "purple" , "purple" , "purple" , "red"    , "yellow"],
	["teal"  , "purple" , "whale"  , "whale"  , "purple" , "purple" , "yellow"],
	["teal"  , "purple" , "purple" , "whale"  , "teal"   , "teal"   , "yellow"],
	["teal"  , "teal"   , "teal"   , "teal"   , "teal"   , "yellow" , "yellow"]
]
#colors: teal, purple, red, yellow


var trivia = {
	"recycle": {
		"How many pounds of plastic enters the ocean every year?": ["t~33 billion", "f~15 billion", "f~1 billion"],
		"How long does plastic take to decompose?": ["t~500-1000 years", "f~10,000 years", "f~100-500 years"],
		"What is the largest trash site in the ocean?": ["t~Great Pacific Garbage Patch", "f~Great Atlantic Garbage Patch", "f~Great Pacific Plastic Patch"],
		"What animal can be easily mistaken for plastic bags?": ["t~Jellyfish", "f~Manatee", "f~Sunfish"],
		"Where is trash supposed to go?": ["t~Landfills", "f~The ocean", "f~Recycling Centers"],
	},
	"reuse": {
		"Which of the following is not one of the most commonly found items in coastal cleanups?": ["t~Aluminum cans", "f~Food wrappers", "f~Plastic straws"],
		"How many plastic bottles on average do humans use annually?": ["t~500 billion", "f~200 billion", "f~700 billion"],
		"What is the most common item found in beach pickups?": ["t~Cigarettes", "f~Plastic bottles", "f~Plastic bags"],
		"In what country are plastic bags illegal?": ["t~Kenya", "f~Singapore", "f~Sweden"],
		"How big is the Great Pacific Garbage Patch": ["t~Twice the size of Texas", "t~Three times the size of France", "f~The size of Alaska"],
	},
	"clean_up": {
		"36% of the oil in the ocean comes from:": ["t~Runoff from cities and companies", "f~Oil spills", "f~Cargo ships"],
		"How many marine locations are recorded as dead zones globally (as of 2024)?": ["t~500", "f~250", "f~1000"],
		"What country is the third biggest ocean plastic polluter?": ["t~Indonesia", "f~Brazil", "f~US"],
		"In what estimated year will there be more plastic in the ocean than fish?": ["t~2050", "f~2040", "f~2060"],
		"What percent of seabirds have been found to have plastic pieces in their stomach?": ["t~90", "f~75", "f~80"],
	}
}

var obstacle_score = 0
var port = 1
var intro = 0
var lose = false
