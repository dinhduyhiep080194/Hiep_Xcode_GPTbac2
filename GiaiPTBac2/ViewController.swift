//
//  ViewController.swift
//  GiaiPTBac2
//
//  Created by cntt17 on 4/8/17.
//  Copyright © 2017 cntt17. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txta: UITextField!
    @IBOutlet var txtb: UITextField!
    @IBOutlet var txtc: UITextField!
    

    @IBOutlet var lblResult2: UILabel!
    @IBOutlet var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblResult.isHidden = true
        lblResult2.isHidden = true
        self.txta.delegate = self
        self.txtb.delegate = self
        self.txtc.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789.-").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    @IBAction func btnGiai(_ sender: Any) {
        lblResult2.text = ""
        lblResult.isHidden = false
        if(txta.text! == "" || txtb.text! == "" || txtc.text! == ""){
            lblResult.text = "Ban chua nhap du cac so!"
        }
        else{
            let a:Double = Double(txta.text!)!
            let b:Double = Double(txtb.text!)!
            let c:Double = Double(txtc.text!)!
        
            if(a==0){
                if(b==0){
                    if(c==0){
                        lblResult.text = "PT co nghiem bat ki"
                    }
                    else{
                        lblResult.text = "PT vo nghiem"
                    }
                }
                else if(c==0){
                    lblResult.text = "PT co nghiem x = 0"
                }
                    else{
                    lblResult.text = "PT co nghiem x = \(-c/b))"
                    }
            }
            else{
                let delta = ((b*b)-(4*a*c))
                if(delta<0){
                    lblResult.text = "PT vo nghiem"
                }
                else if(delta==0){
                    let x = (-b)/(2*a)
                    lblResult.text = "PT co nghiem x = \(x)"
                }
                    else{
                        lblResult2.isHidden = false
                        let x1 = (-b + sqrt(delta))/(2*a)
                        let x2 = (-b - sqrt(delta))/(2*a)
                        lblResult.text = "PT co nghiem x1 = \(x1)"
                        lblResult2.text = "PT co nghiem x2 = \(x2)"
                    }
                }
    
        }
    }
}

