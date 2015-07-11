//
//  ItemsController.swift
//  Budget
//
//  Created by Yaakov Gamliel on 7/3/15.
//  Copyright (c) 2015 G2Think. All rights reserved.
//

import UIKit
import CoreData


class ItemsController  {
    
    let controllerContext: NSManagedObjectContext
    var proxyItems: [ItemProxy] = []
    var someItems: [Item]?
    
    lazy var someOtherItems: [AnyObject]? = {
        var error: NSError?
        let fetch  = NSFetchRequest(entityName: Item.entityName())
        
        fetch.returnsObjectsAsFaults = false

        var stack = DataStackController()
        
        return stack.mainQueueManagedContext!.executeFetchRequest(fetch, error: &error)
    }()
    
    deinit {
       println("bye!!!!!!!!!!!!!!!!!!!")
    }
    
    init() {
        var stack = DataStackController()
        controllerContext = stack.mainQueueManagedContext!
        controllerContext.name = "Items Controller Context"
    }
    
    func itemLoader() -> [Item]? {
        
        var pep: [Item]?
        
        let fetch  = NSFetchRequest(entityName: Item.entityName())
        
        fetch.returnsObjectsAsFaults = false
        
        var error: NSError?
        if let fetchedResults = controllerContext.executeFetchRequest(fetch, error: &error) as? [Item] {
            
            return fetchedResults
            
        } else {
            
            return nil
        }
    }
    
    func itemLoaderWithCompletion(completionClosure: (results: [Item]?) -> ()) {
        
        var pep: [Item]?
        
        let fetch  = NSFetchRequest(entityName: Item.entityName())
        
        fetch.returnsObjectsAsFaults = false
        
        var error: NSError?
        if let fetchedResults = controllerContext.executeFetchRequest(fetch, error: &error) as? [Item] {
            
            completionClosure(results: fetchedResults)
            
        }
    }

    func proxyItemsContainerBuilder(resultRequest: [Item]) -> [ItemProxy] {
        for item in resultRequest {
            var bob = ItemProxy(itemName: item.itemName(), itemPrice: item.itemPrice())
            proxyItems.append(bob)
        }
        
        return proxyItems
    }

}
