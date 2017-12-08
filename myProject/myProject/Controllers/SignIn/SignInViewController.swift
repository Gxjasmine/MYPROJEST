//
//  SignInViewController.swift
//  myProject
//
//  Created by fuzhong on 2017/12/8.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {

    @IBOutlet weak var bgViewBottom: NSLayoutConstraint!
    @IBOutlet weak var myField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var hight: NSLayoutConstraint!
    
    var oriBotton:CGFloat = 0
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oriBotton = bgViewBottom.constant
    }
 
    override func initializeStyle() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyBoardWillShow(_ notification: Notification){
        let kbInfo = notification.userInfo
        
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect()
        
        //键盘的y偏移量
//        let changeY2 = kbRect.origin.y - UIScreen.main.bounds.height
        let changeY = kbRect.size.height - bgViewBottom.constant

        //键盘弹出的时间
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
        if changeY > 0 {
            UIView.animate(withDuration: duration) {
                
                self.bgViewBottom.constant += changeY
            }
        }
        
        print("keyBoardWillShow --\(changeY)--\(duration)")

    }
    
    @objc func keyBoardWillHide(_ notification: Notification){
        self.bgViewBottom.constant = oriBotton

        print("keyBoardWillHide")
     }

    @IBAction func siginInClick(_ sender: Any) {
        
        let mainVC:ViewController = (Enum.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: "ViewControllerID") as? ViewController)!
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.navigationController = UINavigationController(rootViewController: mainVC)
        UIApplication.shared.keyWindow?.rootViewController = myAppdelegate.navigationController
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pwdField.resignFirstResponder()
        myField.resignFirstResponder()
    }

}
