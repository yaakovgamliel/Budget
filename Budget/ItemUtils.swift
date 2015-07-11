//
//  ItemUtils.swift
//  Budget
//
//  Created by Yaakov Gamliel on 7/10/15.
//  Copyright (c) 2015 G2Think. All rights reserved.
//

import UIKit

class ItemUtils {

    class func totolPriceForItemList(items: [Item]) -> Float {
        
        var totalPrice: Float = 0
        
        for item in items {
            totalPrice += item.price.floatValue
        }
        
        return totalPrice
    }
    
}
