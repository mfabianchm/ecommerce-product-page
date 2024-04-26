//
//  ScrollView.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 23/04/24.
//

import UIKit

class ScrollView: UIScrollView {
    
    let imagesStackView = UIStackView()
    let imagesNames = ["image-product-1", "image-product-2", "image-product-3", "image-product-4",]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureScrollView() {
            translatesAutoresizingMaskIntoConstraints = false
            addSubview(imagesStackView)
            indicatorStyle = .white
        
        DispatchQueue.main.async {
            self.imagesStackView.translatesAutoresizingMaskIntoConstraints = false
            self.imagesStackView.axis = .horizontal
            self.imagesStackView.spacing = 0
            
            for image in self.imagesNames {
                let imageView = CarouselImageView(imageName: image, imageWidth: self.frame.width)
                self.imagesStackView.addArrangedSubview(imageView)
            }
            
            NSLayoutConstraint.activate([
                self.imagesStackView.topAnchor.constraint(equalTo: self.topAnchor),
                self.imagesStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.imagesStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.imagesStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
        }
    }

}
