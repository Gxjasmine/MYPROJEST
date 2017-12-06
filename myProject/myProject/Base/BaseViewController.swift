//
//  BaseViewController.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStyle()
    }
    
    override func viewDidAppear (_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func onCloseClicked(sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }
    
    //MARK: - Helper methods
    
    /**
     Configures the basic appearance for the common appearance cae.
     
     * Adds menu button as left bar button item
     * Adds debug indicator when running in firmware debug mode
     * Sets title view to `ACNavigation` instance
     
     Subclasses overriding this method should be account for the default values
     */
    func initializeStyle() {
        self.navigationItem.hidesBackButton = true
        //left back
        let menuButton = Utils.createButtonWithIcon(icon: UIImage(named: "close")!)
        menuButton.addTarget(self, action: #selector(onCloseClicked), for: .touchUpInside)
        menuButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
    }
    
}
