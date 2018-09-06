//
//  ViewController.swift
//  SwiftTouchID
//
//  Created by 渋江一晃 on 2018/09/07.
//  Copyright © 2018年 suzumi49n. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tap(_ sender: Any) {
        startFaceID()
    }
    
    func startFaceID() {
        let context = LAContext()
        var error :NSError?
        let localizedReason = "顔をiPhoneに向けて下さい"
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            //TocuhIDに対応している場合
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason, reply: {
                success, error in
                if success {
                    print("成功！！")
                    
                    // アラートを出す
                    self.showOKAlert()
                    
                } else {
                    print("失敗")
                }
            })
        }else{
            //TocuhIDに対応していない場合
            NSLog("生体IDに対応してない")
        }
    }
    
    func showOKAlert() {
        let alertController = UIAlertController(title: "成功",
                                                message: "顔認証に成功しました",
                                                preferredStyle: .alert)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action:UIAlertAction!) -> Void in
            
            //画面遷移
            let storyborad: UIStoryboard = self.storyboard!
            let nextView = storyborad.instantiateViewController(withIdentifier: "next")
            self.present(nextView, animated: true, completion: nil)
                                                            
        })
        
        alertController.addAction(okBtn)
        present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

