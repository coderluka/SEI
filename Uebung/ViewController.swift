//
//  PinInputViewController.swift
//  Uebung
//
//  Created by Luka Dimitrijevic on 15.01.21.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- Internal Class Members
    private var enteredDigitsCount : Int    = 0
    private var debug              : Bool   = false
    private var pinCode            : String = ""
    
    // MARK:- UI Element Outlets
    @IBOutlet weak var pinLbl  : UILabel!
    @IBOutlet weak var zeroBtn : UIButton!
    @IBOutlet weak var oneBtn  : UIButton!
    @IBOutlet weak var twoBtn  : UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn : UIButton!
    @IBOutlet weak var fiveBtn : UIButton!
    @IBOutlet weak var sixBtn  : UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn : UIButton!
    
    // MARK:- UI Element Actions
    @IBAction func onePressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "1"}
        else       {pinLbl.text = text + "*"}
        pinCode += "1"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func twoPressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "2"}
        else       {pinLbl.text = text + "*"}
        pinCode += "2"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func threePressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "3"}
        else       {pinLbl.text = text + "*"}
        pinCode += "3"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func fourPressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "4"}
        else       {pinLbl.text = text + "*"}
        pinCode += "4"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func fivePressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "5"}
        else       {pinLbl.text = text + "*"}
        pinCode += "5"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func sixPressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "6"}
        else       {pinLbl.text = text + "*"}
        pinCode += "6"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func sevenPressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "7"}
        else       {pinLbl.text = text + "*"}
        pinCode += "7"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func eightPressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "8"}
        else       {pinLbl.text = text + "*"}
        pinCode += "8"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func ninePressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "9"}
        else       {pinLbl.text = text + "*"}
        pinCode += "9"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    @IBAction func zeroPressed(_ sender: UIButton) {
        let text = pinLbl.text ?? ""
        if (debug) {pinLbl.text = text + "0"}
        else       {pinLbl.text = text + "*"}
        pinCode += "0"
        pinLbl.backgroundColor = UIColor.white
        evaluateInput()
    }
    
    // MARK:- Internal Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // reset pin label text
        pinLbl.text = ""
        pinCode     = ""
        // register notification center observer
        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(appSwitched), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc func appSwitched(_ notification:Notification)
    {
        if (debug) {pinLbl.text = "App Switched"}
        else       {pinLbl.text = ""}
        pinLbl.backgroundColor = UIColor.white
        enteredDigitsCount = 0
        pinCode = ""
    }
    
    private func evaluateInput(){
        if (enteredDigitsCount >= 3)
        {
            // check if pin was correct
            if (pinCode == "4711")
            {
                pinLbl.backgroundColor = UIColor.green
                // present correct input alert
                let alert = UIAlertController(title: "PIN Input", message: "Entered Correct Input Successfully", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Proceed", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                pinLbl.backgroundColor = UIColor.red
                let dialogMessage = UIAlertController(title: "PIN Input", message: "Incorrect PIN Input", preferredStyle: .alert)
                self.present(dialogMessage, animated: true, completion: {
                    Timer.scheduledTimer(withTimeInterval: 2, repeats:false, block: {_ in self.dismiss(animated: true, completion: nil)
                })})
            }
            pinLbl.text        = ""
            pinCode            = ""
            enteredDigitsCount = 0
        }
        else
        {
            enteredDigitsCount += 1
        }
    }
}

// MARK:- Notification Center Extension
extension Notification.Name {
    static let appSwitched = Notification.Name("appSwitched")
}
