//
//  ViewController.swift
//  SNSRealTimeApp
//
//  Created by 辛忠翰 on 2016/6/21.
//  Copyright © 2016年 Keynote. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var firebaseTextField: UITextField!
    
    @IBAction func sendMessage(sender: UIButton) {
        firebase.setValue(firebaseTextField.text)
    }
    let firebase = Firebase(url: "https://snsrealtimeapp-16145.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        //當你的Firebase有任何更動時，就可以用這個func去做事情，在這裡我們只是單純的把它print出來
        //一開始這個function並沒有work，後來把資料庫的read/write都設為true之後便解決了
        /*Firebase console -> database -> rule
 {
 "rules": {
 ".read": true,
 ".write": true
 }
 }
 */
        
        
//        firebase.observeEventType(FEventType.Value){(snapshot: FDataSnapshot!)-> Void in
//            
//            NSLog("Firebase Observer Calle")
//            print(snapshot.value)
//            
//            self.firebase.setValue("GG")
//        }
        
        //observeEventType: it can do anything u want to do to the firebase
        firebase.observeEventType(FEventType.Value, withBlock: {(snapshot: FDataSnapshot!) -> Void in
            NSLog("Firebase Observer Calle")
            print(snapshot.value)
            //it can change the firebase's value with the code
            
            self.textLabel.text = snapshot.value as! String
            
        })
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

