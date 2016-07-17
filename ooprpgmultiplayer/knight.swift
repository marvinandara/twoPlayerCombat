//
//  knight.swift
//  ooprpgmultiplayer
//
//  Created by Marvin Andara on 7/16/16.
//  Copyright © 2016 MarvinAndara. All rights reserved.
//

import Foundation
class Knight: Player {

    private var _name = "Knightnight"
    private var _attackPwr = 0
    private var _hp = 250
    
    private var attacks: [String] = ["Holy Slash","Cleansing Strike","Divine Retribution",
                                     "Sweeping Strike","Charge"]
    private var attacksPower: [Int] = [10,15,20,50,100]
    
    var name: String {
        get{
            return _name
        }
    }
    
    var attackPwr: Int {
        get{
            return _attackPwr
        }
        set{
            _attackPwr = newValue
        }
    }
    
    var hp: Int {
        get{
            return _hp
        }
        set{
            _hp = newValue
        }
    }
    
    func getAttack() -> String {

        let rand = Int(arc4random_uniform(UInt32(attacks.count)))
        _attackPwr = attacksPower[rand]
        return "\(attacks[rand]) for \(attacksPower[rand]) damage!"
        
    }
    
    override func isAlive() -> Bool {
        if _hp > 0 {
            
            return true
            
        }
        
        return false
    }

}
