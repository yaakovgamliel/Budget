//
//  ItemProxy.swift
//  Budget
//
//  Created by Yaakov Gamliel on 7/3/15.
//  Copyright (c) 2015 G2Think. All rights reserved.
//

import UIKit

struct ItemProxy {
    
    var name: String
    var price: Float
    
    init(itemName:  String, itemPrice: Float) {
        name = itemName
        price = itemPrice
    }
    
}