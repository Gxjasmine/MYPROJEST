//
//  SettingViewController.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func onCloseClicked(sender: AnyObject) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let animation = CATransition()
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromRight
        self.navigationController?.view.layer.add(animation, forKey: "someAnimation")
        _ = self.navigationController?.popViewController(animated: false)
        CATransaction.commit()
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
