//
//  TextView.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 17/04/24.
//

import UIKit

class TextView: UILabel {

    private var title: String
    private var textSize: CGFloat
    private var color: String
    private var fontType: String
    
    init(title: String, size: CGFloat, color: String, fontType: String) {
        self.title = title
        self.textSize = size
        self.color = color
        self.fontType = fontType
        super.init(frame: .zero)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        text = title
        textColor = UIColor(named: self.color)
        self.font = UIFont(name: fontType, size: textSize)
    }
   

}
