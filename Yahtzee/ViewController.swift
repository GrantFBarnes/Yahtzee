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
    var cup = Cup()

    @IBOutlet weak var die1: UIButton!
    @IBOutlet weak var die2: UIButton!
    @IBOutlet weak var die3: UIButton!
    @IBOutlet weak var die4: UIButton!
    @IBOutlet weak var die5: UIButton!
    
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
    
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var totalscore: UILabel!
    
    var rollsremaining = 3
    var rolled = false
    
    var finished = 0
    var highscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let highscoreDefault = NSUserDefaults.standardUserDefaults()
        if let highscore = (highscoreDefault.valueForKey("highscore")) {
            highscoreLabel.text = "Highscore: \(highscore)"
        }
    }
    
    @IBAction func newgame() {
        resetDice()
        
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
        
        cup.unlockDice()
        
        resetRolls()
        finished = 0
        
        brain = YahtzeeBrain()
        
    }
    
    @IBAction func score(sender: UIButton) {
        let category = sender.currentTitle!
        
        let titles = ["Ones":ones, "Twos":twos, "Threes":threes,"Fours":fours,"Fives":fives,"Sixes":sixes,"Chance":chance,"3 of a Kind":kind3,"4 of a Kind":kind4,"Sm. Straight":smstr,"Lg. Straight":lgstr,"Full House":fullhouse,"Yahtzee":yahtzee]
        
        let key = ["⚀":1,"⚁":2,"⚂":3,"⚃":4,"⚄":5,"⚅":6]

        if rolled {
            let (score,scored,f) = brain.score(category, chance: chance.text!, ones: ones.text!, twos: twos.text!, threes: threes.text!, fours: fours.text!, fives: fives.text!, sixes: sixes.text!, threekind: kind3.text!, fourkind: kind4.text!, fullhouse: fullhouse.text!, smstr: smstr.text!, lgstr: lgstr.text!, yahtzee: yahtzee.text!, die1: key[die1.currentTitle!]!, die2: key[die2.currentTitle!]!, die3: key[die3.currentTitle!]!, die4: key[die4.currentTitle!]!, die5: key[die5.currentTitle!]!)
            
            finished = f
            
            if titles[category]!.text! == "-" {
                titles[category]!.text = "\(score)"
                totalscore.text = "\(Int(totalscore.text!)! + score)"
            }
        
            if scored {
                resetRolls()
                cup.unlockDice()
                rolled = false
                resetDice()
            }
        
            if finished == 13 {
                resetDice()
                die1.setTitle("D",forState: .Normal)
                die2.setTitle("O",forState: .Normal)
                die3.setTitle("N",forState: .Normal)
                die4.setTitle("E",forState: .Normal)
                die5.setTitle("!",forState: .Normal)

                rolled = false
                
                let finalscore = Int(totalscore.text!)!
                remaining.text = "Final Score = \(finalscore)"
                
                
                
                let highscoreDefault = NSUserDefaults.standardUserDefaults()
                
                if let ohs = highscoreDefault.valueForKey("highscore"){
                    let oldhighscore = (ohs as! Int)
                    if finalscore > oldhighscore {
                        highscoreDefault.setValue(finalscore, forKey: "highscore")
                        highscoreDefault.synchronize()
                        highscoreLabel.text = "High Score: \(finalscore)"
                        remaining.text = "NEW HIGH SCORE!!"
                    }
                } else {
                    highscoreDefault.setValue(finalscore, forKey: "highscore")
                    highscoreDefault.synchronize()
                    highscoreLabel.text = "High Score: \(finalscore)"
                    remaining.text = "NEW HIGH SCORE!!"
                }
            }
        }
    }

    @IBAction func lockDie(sender: UIButton) {
        let t = sender.tag
        
        var die = die1
        
        switch t {
        case 1:
            die = die1
        case 2:
            die = die2
        case 3:
            die = die3
        case 4:
            die = die4
        case 5:
            die = die5
        default: break
        }
        
        if finished < 13 {
            if cup.isLocked(t) {
                die.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0)
                
            } else {
                die.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.8)
            }
            cup.toggleLock(t)
        }
    }
    

    @IBAction func roll() {
        let key = [1:"⚀",2:"⚁",3:"⚂",4:"⚃",5:"⚄",6:"⚅"]
        if finished < 13 {
            if rollsremaining >= 1 {
                remaining.text = "Rolls Remaining: \(rollsremaining-1)"
                let dievals = cup.rollDice()
                die1.setTitle(key[dievals[0]],forState: .Normal)
                die2.setTitle(key[dievals[1]],forState: .Normal)
                die3.setTitle(key[dievals[2]],forState: .Normal)
                die4.setTitle(key[dievals[3]],forState: .Normal)
                die5.setTitle(key[dievals[4]],forState: .Normal)

            }
            rolled = true
            rollsremaining = rollsremaining - 1
        }
    }
    
    func resetRolls() {
        rollsremaining = 3
        remaining.text = "Rolls Remaining: 3"
    }
    
    func resetDice() {
        die1.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0)
        die2.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0)
        die3.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0)
        die4.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0)
        die5.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0)
        die1.setTitle("-",forState: .Normal)
        die2.setTitle("-",forState: .Normal)
        die3.setTitle("-",forState: .Normal)
        die4.setTitle("-",forState: .Normal)
        die5.setTitle("-",forState: .Normal)
    }

}

