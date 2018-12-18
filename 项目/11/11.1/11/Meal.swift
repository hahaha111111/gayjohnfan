//
//  Meal.swift
//  11
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 apple inc. All rights reserved.
//

import UIKit

class Meal: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
        
        //MARK: Properties
        
        var name: String = ""
        var photo: UIImage?
        var rating: Int = 0
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    
}
