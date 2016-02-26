//
//  YahtzeeBrain.swift
//  Yahtzee
//
//  Created by Grant Barnes on 2/17/16.
//  Copyright © 2016 Grant Barnes. All rights reserved.
//

import Foundation

class YahtzeeBrain {
    
    var finished: Int
    
    init () {
        finished = 0
    }
    
    func score(category: String, chance: String, ones: String, twos: String, threes: String, fours: String, fives: String, sixes: String, threekind: String, fourkind: String, fullhouse: String,smstr: String,lgstr: String,yahtzee: String,die1: Int, die2: Int, die3: Int, die4: Int, die5: Int) -> (Int,Bool,Int) {
        
        var scored = false
        var value = 0
        let vals = [die1,die2,die3,die4,die5]
        
        switch category {
            case "Chance":
                if chance.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = die1 + die2 + die3 + die4 + die5
                }
            case "Ones":
                if ones.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = singles(1,die1: die1,die2: die2,die3: die3,die4: die4,die5: die5)
                }
            case "Twos":
                if twos.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = singles(2,die1: die1,die2: die2,die3: die3,die4: die4,die5: die5)
                }
            case "Threes":
                if threes.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = singles(3,die1: die1,die2: die2,die3: die3,die4: die4,die5: die5)
                }
            case "Fours":
                if fours.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = singles(4,die1: die1,die2: die2,die3: die3,die4: die4,die5: die5)
                }
            case "Fives":
                if fives.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = singles(5,die1: die1,die2: die2,die3: die3,die4: die4,die5: die5)
                }
            case "Sixes":
                if sixes.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    value = singles(6,die1: die1,die2: die2,die3: die3,die4: die4,die5: die5)
                }
            case "3 of a Kind":
                if threekind.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    var occured: [Int:Int] = [:]
                    
                    for x in 0..<vals.count {
                        let keyExists = occured[vals[x]] != nil
                        if keyExists {
                            occured[vals[x]] = occured[vals[x]]! + 1
                        } else {
                            occured[vals[x]] = 1
                        }
                    }
                    var found = false
                    for (val, amount) in occured {
                        if amount >= 3 {
                            value = 3 * val
                            found = true
                        }
                    }
                    if !found {
                        value = 0
                    }
                }
                
            case "4 of a Kind":
                if fourkind.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    var occured: [Int:Int] = [:]
                
                    for x in 0..<vals.count {
                        let keyExists = occured[vals[x]] != nil
                        if keyExists {
                            occured[vals[x]] = occured[vals[x]]! + 1
                        } else {
                            occured[vals[x]] = 1
                        }
                    }
                    var found = false
                    for (val, amount) in occured {
                        if amount >= 4 {
                            value = 4 * val
                            found = true
                        }
                    }
                    if !found {
                        value = 0
                    }
                }
                
            case "Full House":
                if fullhouse.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    var occured: [Int:Int] = [:]
                    
                    for x in 0..<vals.count {
                        let keyExists = occured[vals[x]] != nil
                        if keyExists {
                            occured[vals[x]] = occured[vals[x]]! + 1
                        } else {
                            occured[vals[x]] = 1
                        }
                    }
                    
                    var found3 = false
                    var found2 = false
                    for (_,amount) in occured {
                        if amount == 3 {
                            found3 = true
                        }
                        if amount == 2 {
                            found2 = true
                        }
                    }
                    if found2 && found3 {
                        value = 25
                    } else {
                        value = 0
                    }
                }
                
            case "Sm. Straight":
                if smstr.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1

                    var f = false
                    
                    for x in 0..<vals.count {
                        var temp = vals
                        temp.removeAtIndex(x)
                        if fourinrow(temp) {
                            f = true
                        }
                    }
                    if f {
                        value = 30
                    } else {
                        value = 0
                    }
                }
            
            case "Lg. Straight":
                if lgstr.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    let sorted = vals.sort()
                    
                    if sorted[4]-sorted[0] == 4{
                        value = 40
                    } else {
                        value = 0
                    }
                }
                
            case "Jahtzee":
                if yahtzee.rangeOfString(":") == nil {
                    scored = true
                    finished = finished + 1
                    var occured: [Int:Int] = [:]
                    
                    for x in 0..<vals.count {
                        let keyExists = occured[vals[x]] != nil
                        if keyExists {
                            occured[vals[x]] = occured[vals[x]]! + 1
                        } else {
                            occured[vals[x]] = 1
                        }
                    }
                    
                    var found = false
                    
                    for (_, amount) in occured {
                        if amount == 5 {
                            value = 50
                            found = true
                        }
                    }
                    if !found {
                        value = 0
                    }
                }
            default: break
        }
        return (value,scored,finished)
    }
    
    private func singles(val: Int, die1: Int, die2: Int, die3: Int, die4: Int, die5: Int) -> Int {
        var v = 0
        if die1 == val {
            v = v + val
        }
        if die2 == val {
            v = v + val
        }
        if die3 == val {
            v = v + val
        }
        if die4 == val {
            v = v + val
        }
        if die5 == val {
            v = v + val
        }
        return v
    }
    
    private func fourinrow(vals: [Int]) -> Bool {
        let sorted = vals.sort()
        let s: Set = Set(sorted)
        
        if s.count == sorted.count {
            if sorted[3]-sorted[0] == 3{
                return true
            } else {
                return false
            }
        }
        return false
    }
}


