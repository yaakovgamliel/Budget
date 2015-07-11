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
        
        Item.createItem(itemName, price: itemPrice)
        
    }

}
