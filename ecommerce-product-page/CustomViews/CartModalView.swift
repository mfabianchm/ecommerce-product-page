//
//  CartModalView.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 25/04/24.
//

import UIKit

class CartModalView: UIView {
    
    var numberOfProducts: Int?
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Cart"
        label.font = UIFont(name: "KumbhSans-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.text = "Your cart is empty."
        emptyLabel.font = UIFont(name: "KumbhSans-Bold", size: 20)
        emptyLabel.textColor = UIColor(named: "Dark-grayish-Blue")
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        return emptyLabel
    }()
    
    let checkoutModal = CheckoutModal()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.addSubview(headerLabel)
        self.addSubview(emptyLabel)
        self.addSubview(checkoutModal)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
        self.backgroundColor = .systemBackground
        
        DispatchQueue.main.async {
            self.headerLabel.layer.addBorder(edge: .bottom, color: UIColor(named: "Light-Grayish-Blue")!, thickness: 2)
        }
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 60),
            
            emptyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emptyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            checkoutModal.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            checkoutModal.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            checkoutModal.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            checkoutModal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    

}
