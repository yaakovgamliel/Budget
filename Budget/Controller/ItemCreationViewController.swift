//
//  ItemCreationViewController.swift
//  Budget
//
//  Created by Yaakov Gamliel on 6/15/15.
//  Copyright (c) 2015 G2Think. All rights reserved.
//

import UIKit

class ItemCreationViewController: UIViewController {

   //MARK: - Outlets
    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemPrice: UITextField!
    @IBOutlet weak var itemDescriptionByUser: UITextField!
    
    //MARK: - ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    
    @IBAction func doneButtonTouched(sender: AnyObject) {
        
        if (!itemName.text.isEmpty && !itemPrice.text.isEmpty) {
            addNewItem(itemName.text, itemPrice: Float(itemPrice.text.toInt()!))
        }
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    
    func addNewItem(itemName: String, itemPrice: Float) {
        
//        Item.createItem(itemName, price: itemPrice)
        
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            
            
            Item.createItemBlock(itemName, price: itemPrice, description: nil)

            
            // do some task
//            dispatch_async(dispatch_get_main_queue()) {
//                // update some UI
//            }
        }
    }

}
