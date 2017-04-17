//
//  Todo.swift
//  TodoApp
//
//  Created by Vanni Galli on 02.04.17.
//  Copyright © 2017 Vanni Galli. All rights reserved.
//

import Foundation
import UIKit

class Todo {
    private let dateFormatter = DateFormatter()
    
    var creationDate: NSDate
    var title: String
    var description: String
    var photo: UIImage
    var completed: Bool
    
    static var defaultDescription = "descrizione di default"
    
    init?(title: String) {
        guard !title.isEmpty else {
            return nil
        }
        
        dateFormatter.dateFormat = "HH:mm:ss"
        
        self.creationDate = NSDate()
        self.title = title
        self.description = Todo.defaultDescription
        self.photo = UIImage(named: "defaultPhoto")!
        self.completed = false
    }
    
    func getPrettyDate() -> String {
        return dateFormatter.string(from: creationDate as Date)
    }
    
}
