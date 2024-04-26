//
//  CheckoutModal.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 25/04/24.
//

import UIKit

class CheckoutModal: UIView {
    
    var numberOfProducts: Int?
    
    let imageView = UIImageView()
    let productName = UILabel()
    var priceLabel = UILabel()
    let totalLabel = UILabel()
    let eraseButton = UIButton()
    let checkoutButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let views = [imageView, productName, priceLabel, totalLabel, eraseButton, checkoutButton]
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        
        imageView.image = UIImage(named: "image-product-1-thumbnail")
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        productName.text = "Fall Limited Edition Sneakers"
        productName.textColor = UIColor(named: "Dark-grayish-Blue")
        productName.font = UIFont(name: "KumbhSans-Regular", size: 16)
        
        priceLabel.text = "$125.00 x \(numberOfProducts ?? 0)"
        priceLabel.textColor = UIColor(named: "Dark-grayish-Blue")
        priceLabel.font = UIFont(name: "KumbhSans-Regular", size: 16)
        
        totalLabel.text = "$375.00"
        totalLabel.textColor = UIColor(named: "Very-Dark-Blue")
        totalLabel.font = UIFont(name: "KumbhSans-Bold", size: 16)
        
        eraseButton.setImage(UIImage(named: "icon-delete"), for: .normal)
        
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.titleLabel?.font =  UIFont(name: "KumbhSans-Bold", size: 16)
        checkoutButton.backgroundColor = UIColor(named: "Orange")
        checkoutButton.layer.cornerRadius = 8
        
        self.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            productName.topAnchor.constraint(equalTo: imageView.topAnchor),
            productName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            
            priceLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            
            totalLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10),
            totalLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
            
            eraseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            eraseButton.widthAnchor.constraint(equalToConstant: 40),
            eraseButton.heightAnchor.constraint(equalToConstant: 40),
            eraseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            checkoutButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            checkoutButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            checkoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            checkoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func calculateTotal(price: Float, quantity: Float) {
        let total = price * quantity
        totalLabel.text = "$\(total.description)"
    }

}
