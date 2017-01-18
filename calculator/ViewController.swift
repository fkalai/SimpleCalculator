//
//  ViewController.swift
//  calculator
//
//  Created by fenomeno69 on 03/01/2017.
//  Copyright © 2017 Fotis Kalaitzidis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var PlusView: UIView!
    @IBOutlet weak var MinusView: UIView!
    @IBOutlet weak var multiplicationView: UIView!
    @IBOutlet weak var divisionView: UIView!
    @IBOutlet weak var AlphaButton: UIButton!
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var ZeroLabel: UILabel!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ACLabel.titleLabel?.text = "AC"
        
        
    }

    @IBAction func numbers(_ sender: UIButton)
    {
        AlphaButton.alpha = 0
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }else
        {
            ZeroLabel.text = ""
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
        PlusView.alpha = 0
        MinusView.alpha = 0
        multiplicationView.alpha = 0
        divisionView.alpha = 0
        
        //if (label.text?.characters.count)! >= 3 {
        //    label.text = "\(label.text!)."
        //}
        //else if (label.text?.characters.count)! >= 7 {
           // label.text = "\(label.text!)."
        if (label.text?.characters.count)! >= 7 {
            label.font = UIFont(name: "Helvetica-Light", size: 60)
        }
        if (label.text?.characters.count)! >= 9 {
            label.font = UIFont(name: "Helvetica-Light", size: 55)
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 // Divide
            {
                divisionView.alpha = 0.5
            }
            else if sender.tag == 13 // Multiply
            {
                multiplicationView.alpha = 0.5
            }
            else if sender.tag == 14 // Minus
            {
                MinusView.alpha = 0.5
            }
            else if sender.tag == 15 // Plus
            {
                PlusView.alpha = 0.5
            }
            else if sender.tag == 18
            {
                label.text = String(numberOnScreen / 100)
            }
            
            operation = sender.tag
            performingMath = true
        }
        
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            
            // To delete the last operation of the screen when you click the next number
            performingMath = true
            
        }
        else if sender.tag == 11
        {
            AlphaButton.alpha = 1
            ZeroLabel.text = ""
            label.text = "0"
            label.font = UIFont(name: "Helvetica-Light", size: 75)
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    


}

