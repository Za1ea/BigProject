extends Node


var grid: Array[Array] = []

var level1_ans = [
	["purple", "purple", "purple", "purple", "purple", "purple", "red"   ],
	["white" , "whale" , "whale" , "whale" , "whale" , "purple", "red"   ],
	["white" , "white" , "white" , "white" , "white" , "purple", "red"   ],
	["purple", "purple", "purple", "purple", "purple", "purple", "red"   ],
	["purple", "red"   , "red"   , "red"   , "red"   , "red"   , "red"   ],
	["purple", "red"   , "purple", "purple", "purple", "purple", "purple"],
	["purple", "purple", "purple", "teal"  , "teal"  , "teal"  , "purple"]
]

var trivia = {
	"recycle": {
		"How many pounds of plastic enters the ocean every year?": ["t~33 billion", "f~15 billion", "f~1 billion"],
		"question 2": ["t~yes", "f~no", "f~no"],
		"question 3": ["t~yes", "f~no", "f~no"],
		"question 4": ["t~yes", "f~no", "f~no"],
		"question 5": ["t~yes", "f~no", "f~no"],
	},
	"reuse": {
		"question 1": ["t~yes", "f~no", "f~no"],
		"question 2": ["t~yes", "f~no", "f~no"],
		"question 3": ["t~yes", "f~no", "f~no"],
		"question 4": ["t~yes", "f~no", "f~no"],
		"question 5": ["t~yes", "f~no", "f~no"],
	},
	"clean_up": {
		"question 1": ["t~yes", "f~no", "f~no"],
		"question 2": ["t~yes", "f~no", "f~no"],
		"question 3": ["t~yes", "f~no", "f~no"],
		"question 4": ["t~yes", "f~no", "f~no"],
		"question 5": ["t~yes", "f~no", "f~no"],
	}
}
