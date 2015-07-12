//
//  BaseTableViewController.swift
//  Budget
//
//  Created by Yaakov Gamliel on 7/10/15.
//  Copyright (c) 2015 G2Think. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    func configureControllerItems(controller: UITableViewController!, controllerTitle: String?, cellIdentifier: String!) {
        controller.title = controllerTitle
        controller.tableView.registerClass(UITableViewHeaderFooterView.classForCoder(), forHeaderFooterViewReuseIdentifier: cellIdentifier)
    }
    
    func configureControllerEditButton(controller: UITableViewController!) {
        
        controller.navigationItem.leftBarButtonItem = controller.editButtonItem()
        
    }
 
}