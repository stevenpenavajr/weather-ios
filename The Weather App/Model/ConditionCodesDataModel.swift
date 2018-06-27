//
//  PhrasesDataModel.swift
//  The Weather App
//
//  Created by Steven Penava on 6/18/18.
//  Copyright © 2018 Steven Penava. All rights reserved.
//

// NEED TO ADJUST TEMPERATURE RANGES, FOR SURE

import Foundation

public struct ConditionCodesDataModel {
    
    // Condition dictionaries are declared and defined under ../Model/Codes
    
    static func genPhrasedBasedOnTemp(temp: Int, conditions: [Int], gender: String) -> String {
        
        var randIndex = Int(arc4random_uniform(1))
        print(conditions)
        print(temp)
        
        switch (temp) {
            case 0...31:
                print(conditionPhraseDictionary[conditions[0]]!["0,31"]![randIndex])
                return conditionPhraseDictionary[conditions[0]]!["0,31"]![randIndex]
            case 32...45:
                print()
                print(conditionPhraseDictionary[conditions[0]]!["32,45"]![randIndex])
                return conditionPhraseDictionary[conditions[0]]!["32,45"]![randIndex]
            case 46...57:
                print()
                print(conditionPhraseDictionary[conditions[0]]!["46,57"]![randIndex])
                return conditionPhraseDictionary[conditions[0]]!["46,57"]![randIndex]
            case 58...69:
                print()
                print(conditionPhraseDictionary[conditions[0]]!["58,69"]![randIndex])
                return conditionPhraseDictionary[conditions[0]]!["58,69"]![randIndex]
            case 70...85:
                print()
                print(conditionPhraseDictionary[conditions[0]]!["70,85"]![randIndex])
                return conditionPhraseDictionary[conditions[0]]!["70,85"]![randIndex]
            case 86...95:
                print()
                return conditionPhraseDictionary[conditions[0]]!["86,95"]![randIndex]
            case 96...120:
                return conditionPhraseDictionary[conditions[0]]!["96,120"]![randIndex]
                print()
            default:
                break
            
        }
        return ""
    }

//        // MARK: Clear Sky (800)
//        public struct Code800 {
//            static let temp32_49: [String] = [
//                "Pretty chilly out. Wear something warm.",
//                "Cold, but at least it isn't raining.",
//                "It's kinda cold out. Good day for Netflix."
//            ]
//            static let temp50_59: [String] = [
//                "Not a cloud in the sky. Long sleeve and shorts.",
//                "Clear skies. Long sleeve and pants."
//            ]
//            static let temp60_79: [String] = [
//                "It's beautiful out. Go play some golf.",
//                "Really pretty day, not a cloud in the sky.",
//                "Good day to eat outside."
//            ]
//            static let temp80_100: [String] = [
//                "Why aren't you at the pool?",
//                "GIRL: Why aren't you tanning?",        // GIRL
//                "Great day for a bike ride.",
//                "Make a margarita and chill outside.",
//                "GUY: Crack open a cold one and relax."
//            ]
//        }
//
//        // MARK: Rain Category (5xx)
//        /* ------------------------------------------------------------------ */
//
//        // MARK: Light Rain (500)
//        public struct Code500 {
//
//            static let temp32_49 : [String] = [
//                "A little rainy. Dress warm, boots ideal.",
//                "You won't get too wet. It's cold though.",
//                "Pretty cold. Layer up.",
//                "Not the worst, but it's kinda rainy.",
//                "Raincoat or a Patagonia should do.",
//                "Chilly and a bit wet. Throw on something warm."
//            ]
//
//            static let temp50_59 : [String] = [
//                "A bit nippy and a little wet.",
//                "I'd pack a very light rain jacket.",
//                "I'd recommend not walking wherever you're going.",
//                "It'll probably smell good after the rain.",
//                "Currently a little wet. Not too cold, though.",
//                "Sweatshirt or light raincoat. Not bad."
//            ]
//
//            static let temp60_79 : [String] = [
//                "Throw on a t-shirt and a light rain jacket.",
//                "Dress light and water-resistant.",
//                "You might see a rainbow today.",
//                "Barely anything out there right now. Dress light.",
//                "Probably won't even need an umbrella.",
//                "Light rain jacket, that's about it."
//            ]
//
//            static let temp80_100 : [String] = [
//                "Hot and rainy. Gross. No rain jacket needed.",
//                "Humid. Wear a short sleeve.",
//                "Don't dress heavily at all. It's sticky."
//            ]
//        }
//
//        // MARK: Moderate Rain (501)
//        public struct Code501 {
//
//            static let temp32_49 : [String] = [
//                "It's very cold and rainy. Heavy raincoat.",
//                "Colder than a penguin's ass. Dress heavy.",
//                "It's cold as hell and wet. Wear a coat.",
//                "Wear something water-resistant and warm.",
//                "I'd wear the opposite of a tank top.",
//                "Wear a coat, pack an umbrella. You'll need it."
//            ]
//
//            static let temp50_59 : [String] = [
//                "It's pretty rainy out there. Netflix?",
//                "What a great day to do absolutely nothing.",
//                "Chill and watch The Office. That's what I'd do.",
//                "There's probably a Simpson's maratahon on...",
//                "It's wet. Might as well eat ice cream and relax.",
//                "How good does a bowl of soup sound right now?"
//            ]
//
//            static let temp60_79 : [String] = [
//                "Throw on a t-shirt and a light rain jacket.",
//                "Dress light and water-resistant.",
//                "You might see a rainbow today.",
//                "It's getting kinda rainy. Dress light and dry.",
//                "Probably won't even need an umbrella.",
//                "Light rain jacket, that's about it."
//            ]
//
//            static let temp80_100 : [String] = [
//                "Rain jacket. A very light one. Humid out there.",
//                "Honestly, I'd go play in the rain. No shirt.",
//                "Don't dress heavily at all. It's sticky."
//            ]
//        }
//
//        // MARK: Heavy Intensity Rain (502)
//        public struct Code502 {
//
//            static let temp32_49 : [String] = [
//                "Super rainy. Just stay inside.",
//                "Cold and rainy. Great day for a movie.",
//                "Don't go out unless you love being drenched.",
//                "Not even rain boots would help at this point.",
//                "Are you a polar bear? Then stay inside.",
//                "Netflix is calling your name. Stay dry."
//            ]
//
//            static let temp50_59 : [String] = [
//                "You're going to want a poncho.",
//                "It's literally pouring. Avoid going out.",
//                "Did you close your car's windows?",
//                "Looks like you gotta cancel your golf plans.",
//                "Your best bet is to avoid going outside.",
//                "Don't drive if your wipers are crappy."
//            ]
//
//            static let temp60_79 : [String] = [
//                "You're going to want a poncho.",
//                "It's literally pouring. Avoid going out.",
//                "Did you close your car's windows?",
//                "Looks like you gotta cancel your golf plans.",
//                "Your best bet is to avoid going outside.",
//                "Don't drive if your wipers are crappy.",
//                ]
//
//            static let temp80_100 : [String] = [
//                "Rain jacket. Or staying inside.",
//                "Honestly, I'd go play in the rain. No shirt.",
//                "Looks like you gotta cancel your tennis plans."
//            ]
//        }
//
//        // MARK: Very Heavy/Extreme Rain (503/504)
//        public struct Code503or504 {
//
//            static let temp32_49 : [String] = [
//                "Umbrella would probably break. Big indoors day.",
//                "Stay inside if you're sane.",
//                "Get your dog inside and don't leave for a bit.",
//                "Currently raining very heavily. Raincoat.",
//                "Unless you like bad weather, chill indoors.",
//                "Torrential downpour. No need to leave the house."
//            ]
//
//            static let temp50_59 : [String] = [
//                "Don't drive anywhere right now.",
//                "Potential flooding. Be careful outside.",
//                "Umbrella, rain jacket, and a boat.",
//                "It's raining a ton right now. Ponchos necessary.",
//                "If you're hitting the bars, I'd recommend Uber.",
//                "Stay inside and watch a movie on Netflix."
//            ]
//
//            static let temp60_79 : [String] = [
//                "Umbrella would probably break. Big indoors day.",
//                "Stay inside if you're sane.",
//                "Get your dog inside and don't leave for a bit.",
//                "Currently raining very heavily. Raincoat.",
//                "Unless you like bad weather, chill indoors.",
//                "Torrential downpour. No need to leave the house."
//            ]
//
//            static let temp80_100 : [String] = [
//                "Umbrella would probably break. Big indoors day.",
//                "Get your dog inside and don't leave for a bit.",
//                "Currently raining very heavily. Raincoat.",
//                "Unless you like bad weather, chill indoors.",
//                "Torrential downpour. No need to leave the house."
//            ]
//        }
//
//        // MARK: Freezing Rain (511) *** NEEDS IMPLEMENTATION ***
//        public struct Code511 {
//
//        }
//
//        // MARK: Light Shower/Shower (520/521)
//        public struct Code520or521 {
//
//            static let temp32_49 : [String] = [
//                "Light shower but it's cold. Wear a jacket.",
//                "More cold than rainy. Still, layer up a bit.",
//                "Light showers, real cold.",
//                "Take a jacket over an umbrella.",
//                "It's gonna be pretty cold out there."
//            ]
//
//            static let temp50_59 : [String] = [
//                "Throw on a long-sleeve, no jacket.",
//                "You honestly may not even need a raincoat.",
//                "Something light but water resistant is best.",
//                "Pack an umbrella in case it rains more.",
//                "It's not too bad out there. You won't melt.",
//                "Probably don't need to cancel any plans."
//            ]
//
//            static let temp60_79 : [String] = [
//                "Not too cold, hot, or wet. Light clothing.",
//                "You don't need a raincoat at the moment.",
//                "Wear something light.",
//                "Pack an umbrella in case it rains more.",
//                "It's not too bad out there. You won't melt.",
//                "Probably don't need to cancel any plans."
//            ]
//
//            static let temp80_100 : [String] = [
//                "It's warm, wear light clothing.",
//                "You don't need a raincoat at the moment.",
//                "Wear something light. It's hot."
//            ]
//        }
//
//        // MARK: Heavy/Ragged Shower (522/531)
//        public struct Code522or531 {
//
//            static let temp32_49 : [String] = [
//                "Stay inside for a bit, cold and wet.",
//                "What falls but never gets hurt? Rain.",
//                "Bunch of rain and it's cold. Stay in!",
//                "I'd wait a few minutes to walk the dog.",
//                "Stay inside and throw on a Snuggie."
//            ]
//
//            static let temp50_59 : [String] = [
//                "Stay inside for a bit, it's a bit wet.",
//                "What falls but never gets hurt? Rain.",
//                "I'd pack an umbrella and a poncho.",
//                "I'd wait a few minutes to walk the dog."
//            ]
//
//            static let temp60_79 : [String] = [
//                "At least you don't have to water the plants.",
//                "Stay inside for a bit, it's a bit wet.",
//                "What falls but never gets hurt? Rain.",
//                "Be sure to pack an umbrella."
//            ]
//
//            static let temp80_100 : [String] = [
//                "At least you don't have to water the plants.",
//                "Stay inside for a bit, it's a bit wet.",
//                "What falls but never gets hurt? Rain.",
//                "Be sure to pack an umbrella."
//            ]
}
