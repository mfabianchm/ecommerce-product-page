//
//  CarouselImageView.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 17/04/24.
//

import UIKit

class CarouselImageView: UIImageView {
    
    private var imageName: String?
    private var imageWidth: CGFloat

    init(imageName: String, imageWidth: CGFloat) {
        self.imageName = imageName
        self.imageWidth = imageWidth
        super.init(frame: .zero)
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage() {
        guard let imageName = imageName else { return }
        image = UIImage(named: imageName)
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 270),
            widthAnchor.constraint(equalToConstant: imageWidth)
        ])
    }
    
}
