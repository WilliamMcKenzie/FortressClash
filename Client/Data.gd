extends Node

var units = {
	"Militia" : {
		"health" : 2,
		"attack" : 1,
		"speed" : 1
	},
	"Miner" : {
		"capacity" : 1,
		"speed" : 1,
		"distance" : 0.5
	},
}

var cards = {
	"Militia Camp" : {
		"health" : 20,
		"cost" : 0,
		"effect" : {
			"type" : "spawn",
			"unit" : "Militia",
			"cooldown" : 15
		},
	},
	"Miner Camp" : {
		"health" : 10,
		"cost" : 0,
		"effect" : {
			"type" : "spawn",
			"unit" : "Miner",
			"cooldown" : 10
		},
	},
	"Crystal Amplifier" : {
		"health" : 60,
		"cost" : 50,
		"effect" : {
			"type" : "buff",
			"range" : 5,
			"operation" : "add",
			"amount" : 5
		}
	}
}
