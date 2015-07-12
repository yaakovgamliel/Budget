import CoreData

@objc(Item)

public class Item: _Item {

    class func createItem(name: String, price: Float) -> Item {
       
        var myStack: DataStackController = DataStackController()

        var myCurrentItem : Item? = self.init( entity: Item.entity(myStack.mainQueueManagedContext), insertIntoManagedObjectContext: myStack.mainQueueManagedContext)
        
        myCurrentItem?.name = name
        myCurrentItem?.price = price
       
        println("Saving new item name:\(myCurrentItem?.name) price:\(myCurrentItem?.price)")
        println(myStack.mainQueueManagedContext?.name)
        
        myStack.saveContext()
        
        
        return myCurrentItem!
    }
    
    class func createItemBlock(name: String, price: Float, description: String?) {
        
        var myStack: DataStackController = DataStackController()

        var privateContext = DataStackController().privateQueueManagedContext
        
        privateContext?.performBlockAndWait({ () -> Void in
        
        var myCurrentItem : Item? = self.init( entity: Item.entity(privateContext), insertIntoManagedObjectContext: privateContext)
            
            myCurrentItem!.name = name
            myCurrentItem!.price = price
            
            privateContext?.save(nil)
        })

    }

    class func deleteItem(item: Item) -> Bool {
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            let myStack: DataStackController = DataStackController.init()
            
            var privateContext = DataStackController().privateQueueManagedContext
            
            privateContext?.performBlockAndWait({ () -> Void in
                
                if let itemToDelete = privateContext?.existingObjectWithID(item.objectID, error: nil) as! Item? {
                    
                    privateContext?.deleteObject(itemToDelete)
                    
                    privateContext?.save(nil)
                    
                }
            })
        }

        return true
    }
    
    public func itemLooks(item: Item) {
        
        let itemName  = item.name
        let itemPrice = item.price
        
        println("Item info name: \(itemName), price \(itemPrice)")
    }
    
    public func itemName() -> String! {
        return name;
    }
    
    public func itemPrice() -> Float! {
        return price!.floatValue;
    }

}
