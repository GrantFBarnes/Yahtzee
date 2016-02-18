//
//  Cup.swift
//  Yahtzee
//
//  Created by Grant Barnes on 2/18/16.
//  Copyright © 2016 Grant Barnes. All rights reserved.
//

import Foundation


class Cup {
    
    class Die {
        var locked: Bool
        var value: Int
        
        init() {
            locked = false
            value = 1
        }
        
        func roll() {
            if !locked {
                let newVal = Int(arc4random_uniform(6) + 1)
                value = newVal
            }
        }
        
        func lock() {
            locked = true
        }
        
        func unlock() {
            locked = false
        }
        
        func isLocked() -> Bool {
            return locked
        }
    }
    
    
    var die1 = Die()
    var die2 = Die()
    var die3 = Die()
    var die4 = Die()
    var die5 = Die()
    
    var dice: [Die]
    
    init() {
        dice = [die1,die2,die3,die4,die5]
    }
    
    func rollDice() -> [Int] {
        var vals = [Int]()
        for d in dice {
            d.roll()
            vals.append(d.value)
        }
        return vals
    }
    
    func unlockDice() {
        for d in dice {
            d.unlock()
        }
    }
    
    func toggleLock(die: Int) {
        if dice[die-1].isLocked() {
            dice[die-1].unlock()
        } else {
            dice[die-1].lock()
        }
    }
    
    func isLocked(die: Int) -> Bool {
        return dice[die-1].isLocked()
    }
}