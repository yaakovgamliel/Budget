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

    class func deleteItem(item: Item) -> Bool {
        
        let myStack: DataStackController = DataStackController.init()
        let context: NSManagedObjectContext! = myStack.mainQueueManagedContext
        
        context.deleteObject(item)
       
        var error: NSError?
        
        return context.save(&error)
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
