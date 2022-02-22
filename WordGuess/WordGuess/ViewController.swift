//
//  ViewController.swift
//  WordGuess
//
//  Created by Ajay Bandi on 9/28/21.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DisplayLabel: UILabel!
    
    
    @IBOutlet weak var HintLabel: UILabel!
    
    
    @IBOutlet weak var GuessingLetter: UITextField!
    
    
    @IBOutlet weak var Check: UIButton!
    
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var PlayAgain: UIButton!
    
   var words = [["SWIFT", "Programming Language"],
             ["DOG", "Animal"],
             ["CYCLE", "Two wheeler"],
             ["MACBOOK", "Apple device"]]
    
    var count = 0;
    var word = ""
    var lettersGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Check button should be disabled.
        Check.isEnabled = false;
        //Get the first word from the array
        word = words[count][0]
        
        DisplayLabel.text = ""
        
        //Populate the display label with the underscores. The # of underscores is equal to the # of characters in the word.
        updateUnderscores();
        
        //Get the first hint from the array
        HintLabel.text = "Hint: "+words[count][1]
        
        //Clear the status label intially.
        statusLabel.text = ""
    }

    @IBAction func CheckOnClick(_ sender: Any) {
        //Get the text from the text field.
        var letter = GuessingLetter.text!
        
        //Replace the guessed letter if the letter is part of the word.
        lettersGuessed = lettersGuessed + letter
         var revealedWord = ""
        for l in word{
            if lettersGuessed.contains(l){
                revealedWord += "\(l)"
            }
            else{
                revealedWord += "_ "
            }
        }
        //Assigning the word to displaylabel after a guess
        DisplayLabel.text = revealedWord
        GuessingLetter.text = ""
        
        //If the word is guessed correctly, we are enabling play again button and disabling the check button.
        if DisplayLabel.text!.contains("_") == false{
            PlayAgain.isHidden = false;
            Check.isEnabled = false;
        }
        Check.isEnabled = false
        
    }
    
    
    @IBAction func PlayAgainOnClick(_ sender: UIButton) {
        //Reset the button to disable initially.
        PlayAgain.isHidden = true
        //clear the label
        lettersGuessed = ""
        count += 1
        //if count reaches the end of the array (all the words are guessed sucessfully), then print Congratualtions in the status label.
        if count == words.count{
            
            statusLabel.text = "Congruations! You are done with the game!"
            //clearing the labels.
            DisplayLabel.text = ""
            HintLabel.text = ""
        }
        else{
            //fetch the next word from the array
            word = words[count][0]
            //fetch the hint related to the word
            HintLabel.text = "Hint: "
            HintLabel.text! += words[count][1]
            //Enabling the check button.
            Check.isEnabled = true
            
            DisplayLabel.text = ""
            updateUnderscores()
        }
    }
    
    @IBAction func enterLabelChanged(_ sender: UITextField) {
        //Read the data from the text field
        var textEnterd = GuessingLetter.text!;
        //Consider only the last character by calling textEntered.last and trimming the white spaces.
        textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
        GuessingLetter.text = textEnterd
        
        //Check whether the entered text is empty or not to enable check button.
        if textEnterd.isEmpty{
            Check.isEnabled = false
        }
        else{
            Check.isEnabled = true
        }
        
    }
    
    func updateUnderscores(){
        for letter in word{
            DisplayLabel.text! += "- "
        }
    }
    
    
}
