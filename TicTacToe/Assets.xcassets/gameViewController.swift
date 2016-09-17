//
//  gameViewController.swift
//  TicTacToe
//
//  Created by Jacob Bashista on 9/14/16.
//  Copyright © 2016 Jacob Bashista. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    
    
    //Add Connections for All Images
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    //Add Connections for All Buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    //Connect the Message Label
    @IBOutlet weak var userMessage: UILabel!
    
    //Connect the Restart Label
    @IBOutlet weak var restart: UIButton!
    
    
    //Keep Track of the Plays and Who Played
    var plays = [Int:Int]()
    //Keep Track if someone has won
    var done = false
    //Keep track what turn it is
    var playerTurn = 0
    
    
    //This function runs right after the app has started
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //We need to hide the userMessage and the restart button
        userMessage.isHidden = true
        restart.isHidden = true
        
        
    }
    
    //Create a function that plays a users turn
    //We need to additional Ints for where the player played and who they are
    func userTurn(spot:Int, player:Int){
        
        //Create an or statement that uses the X or O png depending on whos turn it is
        let playerMark = player == 0 ? "X.png" : "O.png"
        
        //Set the current spot to the players X or O
        plays[spot] = player
        
        //Add a switch to set each of the different image positions
        switch spot{
        case 1:
            //For each case we need to set the UIImage to the correct player
            image1.image = UIImage(named: playerMark)
        case 2:
            image2.image = UIImage(named: playerMark)
        case 3:
            image3.image = UIImage(named: playerMark)
        case 4:
            image4.image = UIImage(named: playerMark)
        case 5:
            image5.image = UIImage(named: playerMark)
        case 6:
            image6.image = UIImage(named: playerMark)
        case 7:
            image7.image = UIImage(named: playerMark)
        case 8:
            image8.image = UIImage(named: playerMark)
        case 9:
            image9.image = UIImage(named: playerMark)
        //We need a default so that the switch can close. Even though it will never be run it wont work without it
        default:
            image5.image = UIImage(named: playerMark)
        }
    }
    
    //Add a function to check if the player has won
    func checkForWin(){
        
        //Create a let that stores the two possibilites
        let whoWon = ["Player 1":0, "Player 2":1]
        
        //To check all the possibilites we need to have it check the players ID and the play position for all possible wins
        for(key,value) in whoWon{
            if((plays[7] == value && plays[8] == value && plays[9] == value) ||
                (plays[4] == value && plays[5] == value && plays[6] == value) ||
                (plays[1] == value && plays[2] == value && plays[3] == value) ||
                (plays[1] == value && plays[4] == value && plays[7] == value) ||
                (plays[2] == value && plays[5] == value && plays[8] == value) ||
                (plays[1] == value && plays[5] == value && plays[9] == value) ||
                (plays[3] == value && plays[6] == value && plays[9] == value)){
                
                //If someone did win we need to set some stuff up
                
                //We need to set the userMessage to show who won
                //\(key) can be used to get the key of whoWon into the string
                //You can customize the win message however you want
                userMessage.text = "\(key) Won!"
                //We then need to show the userMessage
                userMessage.isHidden = false
                //We also want to show the restart button
                restart.isHidden = false
                //And we need to tell the game that someone has won
                done = true
                
                
                
            }
        }
        
    }
    
    
    //Create an Action to Happen when a Button is Clicked
    @IBAction func UIButtonClicked(sender:UIButton){
        
        //Create an if Statement that checks if the player can play
        if(!(plays[sender.tag] != nil) && !done){
            //Then play a turn
            userTurn(spot: sender.tag, player:playerTurn)
        }
        //After the turn we need to check if a player has won
        checkForWin();
        //Then switch to the other player
        playerTurn = 1 - playerTurn
        
    }


    func reset(){
        
        //We need to set everything back to the beginning
        //Set done to false
        done = false
        //Hide the Restart and Message
        restart.isHidden = true
        userMessage.isHidden = true
        //Empty the Plays table
        plays.removeAll()
        //Remove all the Image
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        image5.image = nil
        image6.image = nil
        image7.image = nil
        image8.image = nil
        image9.image = nil
    }
    
    
    //Connect the Restart Button to the Script
    @IBAction func resetButtonClicked(_ sender: AnyObject) {
        
        //Run the reset function
        reset()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
