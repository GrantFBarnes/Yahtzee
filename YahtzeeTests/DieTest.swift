//
//  DieTest.swift
//  Yahtzee
//
//  Created by Grant Barnes on 2/23/16.
//  Copyright © 2016 Grant Barnes. All rights reserved.
//

import XCTest
@testable import Yahtzee

class DieTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let yb = YahtzeeBrain()
        var (score,_,_) = yb.score("Full House", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 1, die2: 1, die3: 1, die4: 2, die5: 2)
        XCTAssertEqual(score,25)
        
        (score,_,_) = yb.score("Full House", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 1, die2: 2, die3: 1, die4: 2, die5: 1)
        
        XCTAssertEqual(score,25)
        
        (score,_,_) = yb.score("Sm. Straight", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 1, die2: 1, die3: 2, die4: 4, die5: 3)
        
        XCTAssertEqual(score,30)
        
        (score,_,_) = yb.score("Sm. Straight", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 4, die2: 1, die3: 2, die4: 4, die5: 3)
        
        XCTAssertEqual(score,30)
        
        (score,_,_) = yb.score("Lg. Straight", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 5, die2: 1, die3: 2, die4: 4, die5: 3)
        
        XCTAssertEqual(score,40)
        
        (score,_,_) = yb.score("Lg. Straight", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 1, die2: 5, die3: 2, die4: 4, die5: 3)
        
        XCTAssertEqual(score,40)
        
        (score,_,_) = yb.score("Yahtzee", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 2, die3: 2, die4: 2, die5: 3)
        
        XCTAssertEqual(score,0)
        
        (score,_,_) = yb.score("Yahtzee", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 2, die3: 2, die4: 2, die5: 2)
        
        XCTAssertEqual(score,50)
        
        (score,_,_) = yb.score("4 of a Kind", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 2, die3: 2, die4: 2, die5: 2)
        
        XCTAssertEqual(score,8)

        (score,_,_) = yb.score("3 of a Kind", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 2, die3: 2, die4: 2, die5: 2)
        
        XCTAssertEqual(score,6)
        
        (score,_,_) = yb.score("3 of a Kind", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 4, die3: 5, die4: 2, die5: 2)
        
        XCTAssertEqual(score,6)

        (score,_,_) = yb.score("3 of a Kind", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 5, die2: 6, die3: 5, die4: 2, die5: 2)
        
        XCTAssertEqual(score,0)
        
        (score,_,_) = yb.score("3 of a Kind: 18", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 4, die3: 5, die4: 2, die5: 2)
        
        XCTAssertEqual(score,0)
        
        (score,_,_) = yb.score("Fours: 16", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 4, die3: 5, die4: 2, die5: 2)
        
        XCTAssertEqual(score,0)
        
        (score,_,_) = yb.score("Fours: 16", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 4, die3: 4, die4: 4, die5: 4)
        
        XCTAssertEqual(score,0)
        
        (score,_,_) = yb.score("Fours", chance: "Chance", ones: "Ones", twos: "Twos", threes: "Threes", fours: "Fours", fives: "Fives", sixes: "Sixes", threekind: "3 of a Kind", fourkind: "4 of a Kind", fullhouse: "Full House", smstr: "Sm. Straight", lgstr: "Lg. Straight", yahtzee: "Yahtzee", die1: 2, die2: 4, die3: 4, die4: 4, die5: 4)
        
        XCTAssertEqual(score,16)
    
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
