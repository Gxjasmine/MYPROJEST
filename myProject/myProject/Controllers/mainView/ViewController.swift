//
//  ViewController.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    var menuButton:UIButton? = nil
    var mytableDelagate:MyTableViewDelegate?
    var mytableDatasource:MyViewDatasource?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "MY VIEW"
        setupViewModel()
        ACBaseService().downLoadFw()
    }
    
    private func setupViewModel() {
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        mytableDelagate = MyTableViewDelegate()
        tableView.delegate = mytableDelagate
        self.tableView.tableFooterView = UIView()
        mytableDatasource = MyViewDatasource()
        tableView.dataSource = mytableDatasource
        
        mytableDelagate?.clickedItemAtIndexPath = {[weak self](indexPath) in
            print("click index:\(indexPath)")
            
            if indexPath.row % 2 == 0 {
                
                let videoVC:ViedoViewController = Enum.STORYBOARDS.MAIN_STORYBOARD.instantiateViewController(withIdentifier: "ViedoViewControllerID") as! ViedoViewController
                
                self?.navigationController?.pushViewController(videoVC, animated: true)
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func initializeStyle() {
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
        
        let setVC:SettingViewController = Enum.STORYBOARDS.SETTING_STORYBOARD.instantiateViewController(withIdentifier: "SettingViewControllerId") as! SettingViewController
        
        //动画
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let anima = CATransition()
        anima.type = kCATransitionMoveIn
        anima.subtype = kCATransitionFromLeft
        navigationController?.view.layer.add(anima, forKey: "settingAnima")
        navigationController?.pushViewController(setVC, animated: true)
        CATransaction.commit()
        
    }
}

