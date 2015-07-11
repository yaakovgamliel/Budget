//
//  ItemsTableViewController.swift
//  
//
//  Created by Yaakov Gamliel on 6/2/15.
//
//

import UIKit
import CoreData

class ItemsTableViewController: UITableViewController {

    var itemsContainer :  [Item] = []
    let controllerCellIdentifier = "itemCell"
    let itemProvider: ItemsController = ItemsController()
    lazy var totalPriceLabel: UILabel = {
        
        return UILabel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureControllerItems(self, controllerTitle: "Budget", cellIdentifier: controllerCellIdentifier)
        
        self.configureControllerEditButton(self)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setupItems()
    }
    
    func setupItems() {
        itemProvider.itemLoaderWithCompletion { (results) -> () in
            
            self.itemsContainer = results!
            
            var totalPrice = ItemUtils.totolPriceForItemList(self.itemsContainer)
            
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsContainer.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(controllerCellIdentifier) as! UITableViewCell
        
        var item = self.itemsContainer[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.price.stringValue
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        return UIView(frame: CGRectZero)
    }
    q
    
    //MARK: - Edit functions
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {

            
            self.itemsContainer.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {

        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
}