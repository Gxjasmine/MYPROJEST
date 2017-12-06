//
//  MyViewDatasource.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class MyViewDatasource: NSObject {

}

extension MyViewDatasource:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "cellId1") as! nextTableViewCell
            cell.titleLabel.text = "test title"

            return cell
        }
        else
        {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "cellId2") as! swichTableViewCell
            cell.titleLabel.text = "switch title"

            return cell
        }
    }
    
    
}
