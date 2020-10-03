//
//  Category+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Olivia Morgan Chambliss on 10/2/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Category)
public class Category: NSManagedObject {
    var expenses: [Expense]? {
        return self.rawExpenses?.array as? [Expense]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Category.entity(), insertInto: context )
        
        self.title = title
    }
}
