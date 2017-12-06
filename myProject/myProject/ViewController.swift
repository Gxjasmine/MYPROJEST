//
//  ViewController.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuButton:UIButton? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "MY VIEW"
        initializeStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initializeStyle() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.tintColor = .white
        
        //left back
        if menuButton == nil {
            menuButton = Utils.createButtonWithIcon(icon: UIImage(named: "menu2")!)
            menuButton!.addTarget(self, action: #selector(onMenuClicked), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton!)
            
        }
        
    }

    @objc func onMenuClicked(sender: AnyObject?) {
        
    }
}

