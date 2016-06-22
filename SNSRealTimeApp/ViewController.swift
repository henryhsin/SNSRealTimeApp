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
        
        firebase.childByAppendingPath("User").childByAppendingPath("name").setValue(firebaseTextField.text)
        
        firebase.childByAppendingPath("User").childByAppendingPath("isOnline").setValue("true")
        

    }
    let firebase = Firebase(url: "https://snsrealtimeapp-16145.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase.observeEventType(FEventType.Value, withBlock: {(snapshot: FDataSnapshot!) -> Void in
            if let snap = snapshot.value["User"]{
                if let name = snap?.objectForKey("name") as? String{
                    self.textLabel.text = name
                }
            }
        })
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

