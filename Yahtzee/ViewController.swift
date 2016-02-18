//
//  ViewController.swift
//  Yahtzee
//
//  Created by Grant Barnes on 2/11/16.
//  Copyright © 2016 Grant Barnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundColor = UIColor.greenColor()
    
    var brain = YahtzeeBrain()
    
    @IBOutlet weak var die1: UILabel!
    @IBOutlet weak var die3: UILabel!
    @IBOutlet weak var die2: UILabel!
    @IBOutlet weak var die4: UILabel!
    @IBOutlet weak var die5: UILabel!
    @IBOutlet weak var remaining: UILabel!
    
    @IBOutlet weak var chance: UILabel!
    @IBOutlet weak var ones: UILabel!
    @IBOutlet weak var twos: UILabel!
    @IBOutlet weak var threes: UILabel!
    @IBOutlet weak var fours: UILabel!
    @IBOutlet weak var fives: UILabel!
    @IBOutlet weak var sixes: UILabel!
    @IBOutlet weak var kind3: UILabel!
    @IBOutlet weak var kind4: UILabel!
    @IBOutlet weak var fullhouse: UILabel!
    @IBOutlet weak var smstr: UILabel!
    @IBOutlet weak var lgstr: UILabel!
    @IBOutlet weak var yahtzee: UILabel!
    
    @IBOutlet weak var totalscore: UILabel!
    
    var die1locked = false
    var die2locked = false
    var die3locked = false
    var die4locked = false
    var die5locked = false
    
    var rollsremaining = 3
    
    var rolled = false
    
    var finished = 0
    
    @IBAction func newgame() {
        die1.text = "0"
        die2.text = "0"
        die3.text = "0"
        die4.text = "0"
        die5.text = "0"
        totalscore.text = "0"
        chance.text = "-"
        ones.text = "-"
        twos.text = "-"
        threes.text = "-"
        fours.text = "-"
        fives.text = "-"
        sixes.text = "-"
        kind3.text = "-"
        kind4.text = "-"
        fullhouse.text = "-"
        smstr.text = "-"
        lgstr.text = "-"
        yahtzee.text = "-"
        
        die1locked = false
        die2locked = false
        die3locked = false
        die4locked = false
        die5locked = false
        
        die1.backgroundColor = UIColor.lightGrayColor()
        die2.backgroundColor = UIColor.lightGrayColor()
        die3.backgroundColor = UIColor.lightGrayColor()
        die4.backgroundColor = UIColor.lightGrayColor()
        die5.backgroundColor = UIColor.lightGrayColor()
        
        resetRolls()
        finished = 0
        
    }
    
    @IBAction func score(sender: UIButton) {
        let category = sender.currentTitle!
        
        let titles = ["Ones":ones, "Twos":twos, "Threes":threes,"Fours":fours,"Fives":fives,"Sixes":sixes,"Chance":chance,"3 of a Kind":kind3,"4 of a Kind":kind4,"Sm. Straight":smstr,"Lg. Straight":lgstr,"Full House":fullhouse,"Yahtzee":yahtzee]

        if rolled {
            let (score,scored,f) = brain.score(category, chance: chance.text!, ones: ones.text!, twos: twos.text!, threes: threes.text!, fours: fours.text!, fives: fives.text!, sixes: sixes.text!, threekind: kind3.text!, fourkind: kind4.text!, fullhouse: fullhouse.text!, smstr: smstr.text!, lgstr: lgstr.text!, yahtzee: yahtzee.text!, die1: Int(die1.text!)!, die2: Int(die2.text!)!, die3: Int(die3.text!)!, die4: Int(die4.text!)!, die5: Int(die5.text!)!)
            
            finished = f
            
            if titles[category]!.text! == "-" {
                titles[category]!.text = "\(score)"
                totalscore.text = "\(Int(totalscore.text!)! + score)"
            }
        
            if scored {
                resetRolls()
                die1locked = false
                die2locked = false
                die3locked = false
                die4locked = false
                die5locked = false
                rolled = false
                die1.backgroundColor = UIColor.lightGrayColor()
                die2.backgroundColor = UIColor.lightGrayColor()
                die3.backgroundColor = UIColor.lightGrayColor()
                die4.backgroundColor = UIColor.lightGrayColor()
                die5.backgroundColor = UIColor.lightGrayColor()
                die1.text = "0"
                die2.text = "0"
                die3.text = "0"
                die4.text = "0"
                die5.text = "0"
            }
        
            if finished == 13 {
                die1.backgroundColor = UIColor.greenColor()
                die2.backgroundColor = UIColor.greenColor()
                die3.backgroundColor = UIColor.greenColor()
                die4.backgroundColor = UIColor.greenColor()
                die5.backgroundColor = UIColor.greenColor()
                die1.text = "D"
                die2.text = "O"
                die3.text = "N"
                die4.text = "E"
                die5.text = "!"
                rolled = false
                remaining.text = "Final Score = \(Int(totalscore.text!)!)"
            }
        }
    }

    @IBAction func lock1() {
        if finished < 13 {
            if die1locked {
                die1.backgroundColor = UIColor.lightGrayColor()
                die1locked = false
            } else {
                die1.backgroundColor = UIColor.redColor()
                die1locked = true
            }
        }
    }
    
    @IBAction func lock2() {
        if finished < 13 {
            if die2locked {
                die2.backgroundColor = UIColor.lightGrayColor()
                die2locked = false
            } else {
                die2.backgroundColor = UIColor.redColor()
                die2locked = true
            }
        }
    }
    
    @IBAction func lock3() {
        if finished < 13 {
            if die3locked {
                die3.backgroundColor = UIColor.lightGrayColor()
                die3locked = false
            } else {
                die3.backgroundColor = UIColor.redColor()
                die3locked = true
            }
        }
    }
    
    @IBAction func lock4() {
        if finished < 13 {
            if die4locked {
                die4.backgroundColor = UIColor.lightGrayColor()
                die4locked = false
            } else {
                die4.backgroundColor = UIColor.redColor()
                die4locked = true
            }
        }
    }
    
    @IBAction func lock5() {
        if finished < 13 {
            if die5locked {
                die5.backgroundColor = UIColor.lightGrayColor()
                die5locked = false
            } else {
                die5.backgroundColor = UIColor.redColor()
                die5locked = true
            }
        }
    }
    
    @IBAction func roll() {
        if finished < 13 {
            if rollsremaining >= 1 {
                remaining.text = "Rolls Remaining: \(rollsremaining-1)"
                if !die1locked {
                    die1.text = "\(arc4random_uniform(6) + 1)"
                }
                if !die2locked {
                    die2.text = "\(arc4random_uniform(6) + 1)"
                }
                if !die3locked {
                    die3.text = "\(arc4random_uniform(6) + 1)"
                }
                if !die4locked {
                    die4.text = "\(arc4random_uniform(6) + 1)"
                }
                if !die5locked {
                    die5.text = "\(arc4random_uniform(6) + 1)"
                }
            }
            rolled = true
            rollsremaining = rollsremaining - 1
        }
    }
    
    func resetRolls() {
        rollsremaining = 3
        remaining.text = "Rolls Remaining: 3"
    }

}

