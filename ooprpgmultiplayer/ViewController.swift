//
//  ViewController.swift
//  ooprpgmultiplayer
//
//  Created by Marvin Andara on 7/16/16.
//  Copyright © 2016 MarvinAndara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var groundLbl: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var actionLblPortrait: UIImageView!
    @IBOutlet weak var actionLbl: UILabel!
    @IBOutlet weak var pOneButton: UIButton!
    @IBOutlet weak var pTwoButton: UIButton!
    @IBOutlet weak var gameTitle: UIImageView!
    @IBOutlet weak var pOneAttackLbl: UILabel!
    @IBOutlet weak var pTwoAttackLbl: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var winnerLbl: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var pOneHp: UILabel!
    @IBOutlet weak var pTwoHp: UILabel!
    
    
    
    var orcPlayer = Orc()
    var knightPlayer = Knight()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuScreen()
    }
    
    
    @IBAction func pOneOnAttack(sender: AnyObject) {
        
        actionLbl.text = "\(orcPlayer.name) used " + orcPlayer.getAttack()
        knightPlayer.hp -= orcPlayer.attackPwr
        pTwoHp.text = "\(knightPlayer.hp) HP"
        if !knightPlayer.isAlive() {
            winnerScreen(orcPlayer.name)
        }
        pOneButton.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(ViewController.enablePTwo), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func pTwoOnAttack(sender: AnyObject) {
        
        actionLbl.text = "\(knightPlayer.name) used " + knightPlayer.getAttack()
        orcPlayer.hp -= knightPlayer.attackPwr
        pOneHp.text = "\(orcPlayer.hp) HP"
        if !orcPlayer.isAlive() {
            winnerScreen(knightPlayer.name)
        }
        pTwoButton.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(ViewController.enablePOne), userInfo: nil, repeats: false)

    }
    
    @IBAction func onPlay(sender: AnyObject) {
        
        pOneHp.text = "\(orcPlayer.hp) HP"
        pTwoHp.text = "\(knightPlayer.hp) HP"
        battleScreen()
        pOneButton.enabled = true
        pTwoButton.enabled = false
        
    }
    
    @IBAction func onMenu(sender: AnyObject) {
        
        menuScreen()
    }
    
    func winnerScreen(name: String){
        
        winnerLbl.hidden = false
        menuButton.hidden = false
        
        groundLbl.hidden = true
        playerImg.hidden = true
        enemyImg.hidden = true
        actionLbl.hidden = true
        actionLblPortrait.hidden = true
        pOneButton.hidden = true
        pTwoButton.hidden = true
        pOneAttackLbl.hidden = true
        pTwoAttackLbl.hidden = true
        pOneHp.hidden = true
        pTwoHp.hidden = true
        
        winnerLbl.text = "The winner is " + name
        knightPlayer.hp = 250
        orcPlayer.hp = 250
        
    }
    
    func menuScreen(){
        
        gameTitle.hidden = false
        playButton.hidden = false
        
        winnerLbl.hidden = true
        menuButton.hidden = true

    }
    
    func battleScreen(){
        
        gameTitle.hidden = true
        playButton.hidden = true
        
        groundLbl.hidden = false
        playerImg.hidden = false
        enemyImg.hidden = false
        actionLbl.hidden = false
        actionLblPortrait.hidden = false
        pOneButton.hidden = false
        pTwoButton.hidden = false
        pOneAttackLbl.hidden = false
        pTwoAttackLbl.hidden = false
        pOneHp.hidden = false
        pTwoHp.hidden = false
    }
    func enablePOne(){
        
        pOneButton.enabled = true
        
    }
    
    func enablePTwo(){
        
        pTwoButton.enabled = true
    }

}

