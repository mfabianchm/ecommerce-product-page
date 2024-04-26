//
//  ViewController.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 17/04/24.
//

import UIKit

let optionsModalMenu = ["Collections", "Men", "Women", "About", "Contact"]

struct ViewData {
  let color: UIColor
  let minimum: Double
  let maximum: Double
  let stepValue: Double
}

class ViewController: UIViewController {
    
    private var stepperValue: Double = 0
    var product = Products(numberOfProducts: 0)
    
    let modalView = UIView()
    let scrollView = ScrollView()
    
//    NavBarView
    let navBarView = UIView()
    let menuButton = UIButton(type: .custom)
    let cartButton = UIButton(type: .custom)
    let profileButton = UIButton(type: .custom)
    let logoView = UIImageView()
    
    let modal = UIView()
    let modalTableView = UITableView()
    let closeButton = UIButton(type: .custom)
    
    let testView: UILabel = TextView(title: "Hola", size: 30, color: "Orange", fontType: "KumbhSans-Bold")
    let imagesStackView = UIStackView()
  
    let descriptionView = DescriptionView(frame: .zero)
    
    let customStepper = RoundStepper(viewData: .init(color: UIColor(named:"orange") ?? UIColor(ciColor: .black), minimum: 0, maximum: 10, stepValue: 1))
    
    let addCartButton = UIButton()
    
    let cartModalView = CartModalView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureNavBar()
        configureScrollView()
        configureModal()
        configureDescriptionProductView()
        configureStepper()
        configureAddCartButton()
        configureCartModalView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func configureNavBar() {
        view.addSubview(navBarView)
        
        let views = [menuButton, logoView, cartButton, profileButton]
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            navBarView.addSubview(view)
        }
        
        menuButton.setImage(UIImage(named: "icon-menu"), for: .normal)
        menuButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
                
        logoView.image = UIImage(named: "logo")
        cartButton.setImage(UIImage(named: "icon-cart"), for: .normal)
        cartButton.setTitleColor(UIColor(named: "Orange"), for: .normal)
        cartButton.titleLabel?.font = UIFont(name: "KumbhSans-Bold", size: 18)
        cartButton.addTarget(self, action: #selector(showCart), for: .touchUpInside)
        profileButton.setImage(UIImage(named: "image-avatar"), for: .normal)
    
        NSLayoutConstraint.activate([
            navBarView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            navBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarView.heightAnchor.constraint(equalToConstant: 80),
            
            menuButton.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: 20),
            menuButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
            
            logoView.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor, constant: 25),
            logoView.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
            
            profileButton.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor, constant: -20),
            profileButton.widthAnchor.constraint(equalToConstant: 30),
            profileButton.heightAnchor.constraint(equalToConstant: 30),
            profileButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
           
            cartButton.trailingAnchor.constraint(equalTo: profileButton.leadingAnchor, constant: -20),
            cartButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor),
        ])
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imagesStackView)
        scrollView.indicatorStyle = .white
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 270),
            scrollView.topAnchor.constraint(equalTo: navBarView.bottomAnchor)
        ])
    }
    
    
    func configureModal() {
        view.addSubview(modal)
        modal.translatesAutoresizingMaskIntoConstraints = false
        modal.layer.zPosition = 30
        
        modal.addSubview(modalTableView)
        modal.addSubview(closeButton)
        modal.isHidden = true
        modal.backgroundColor = .systemBackground
        
        modalTableView.translatesAutoresizingMaskIntoConstraints = false
        modalTableView.dataSource = self
        modalTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        modalTableView.isHidden = true
        modalTableView.backgroundColor = .systemBackground
        
        closeButton.setImage(UIImage(named: "icon-close"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(hideModal), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            modal.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            modal.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modal.widthAnchor.constraint(equalToConstant: 300),
            modal.heightAnchor.constraint(equalToConstant: 700),
            
            modalTableView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            modalTableView.leadingAnchor.constraint(equalTo: modal.leadingAnchor),
            modalTableView.trailingAnchor.constraint(equalTo: modal.trailingAnchor),
            modalTableView.bottomAnchor.constraint(equalTo: modal.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: modal.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: modal.leadingAnchor, constant: 20),
        ])
    
    }
    
    func configureDescriptionProductView() {
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func configureStepper() {
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        customStepper.addTarget(self, action: #selector(didStepperValueChanged), for: .valueChanged)
        
        view.addSubview(customStepper)
            NSLayoutConstraint.activate([
              customStepper.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
              customStepper.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
              customStepper.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
              customStepper.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func configureAddCartButton() {
        view.addSubview(addCartButton)
        addCartButton.translatesAutoresizingMaskIntoConstraints = false
        addCartButton.setTitle("Add to cart", for: .normal)
        addCartButton.setTitleColor(.white, for: .normal)
        addCartButton.layer.cornerRadius = 8
        addCartButton.titleLabel?.font =  UIFont(name: "KumbhSans-Bold", size: 20)
        addCartButton.addTarget(self, action: #selector(addCartButtonTapped), for: .touchUpInside)
        addCartButton.tintColor = .white
        
        
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "icon-cart")
        configuration.baseBackgroundColor = UIColor(named: "Orange")
        configuration.imagePadding = 10
        
        addCartButton.configuration = configuration
        
        NSLayoutConstraint.activate([
            addCartButton.topAnchor.constraint(equalTo: customStepper.bottomAnchor, constant: 10),
            addCartButton.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            addCartButton.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            addCartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCartModalView() {
        
        view.addSubview(cartModalView)
        cartModalView.numberOfProducts = product.numberOfProducts
        cartModalView.isHidden = true
        
        cartModalView.checkoutModal.eraseButton.addTarget(self, action: #selector(emptyCar), for: .touchUpInside)
      
        if(self.stepperValue == 0.0) {
            cartModalView.checkoutModal.isHidden = true
            cartModalView.emptyLabel.isHidden = false
        } else {
            cartModalView.checkoutModal.isHidden = false
            cartModalView.emptyLabel.isHidden = true
        }
        
        NSLayoutConstraint.activate([
            cartModalView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            cartModalView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 10),
            cartModalView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            cartModalView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
        ])
        
    }
    
    
//    Methods for buttons when tapped
    
    
    @objc func showModal() {
        DispatchQueue.main.async {
            self.modal.isHidden = false
            self.modalTableView.isHidden = false
            self.view.backgroundColor = UIColor(white: 1, alpha: 0.5)
            self.profileButton.layer.opacity = 0.3
            self.scrollView.layer.opacity = 0.3
            self.customStepper.layer.opacity = 0.3
            self.addCartButton.layer.opacity = 0.3
        }
    }
    
    @objc func hideModal() {
        DispatchQueue.main.async {
            self.modal.isHidden = true
            self.modalTableView.isHidden = true
            self.view.backgroundColor = .systemBackground
            self.profileButton.layer.opacity = 1
            self.scrollView.layer.opacity = 1
            self.customStepper.layer.opacity = 1
            self.addCartButton.layer.opacity = 1
        }
    }
    
    @objc private func didStepperValueChanged() {
        DispatchQueue.main.async {
            self.stepperValue = self.customStepper.value
        }
      }
    
    @objc private func addCartButtonTapped() {
        DispatchQueue.main.async {
            let numberOfProducts = Int(self.stepperValue)
//            self.product.numberOfProducts = numberOfProducts
            self.cartButton.setTitle(numberOfProducts.description, for: .normal)
            self.cartModalView.checkoutModal.priceLabel.text = "$125.00 x \(numberOfProducts.description)"
            self.cartModalView.checkoutModal.calculateTotal(price: 125.00, quantity: Float(self.stepperValue))
            self.configureCartModalView()
        }
      }
    
    @objc func emptyCar() {
        DispatchQueue.main.async {
            print("buttonTapped")
            self.stepperValue = 0
            self.cartButton.setTitle("", for: .normal)
            self.customStepper.setStepperValueToZero()
            self.configureStepper()
           self.configureCartModalView()
        }
    }
    
    @objc func showCart() {
        cartModalView.isHidden.toggle()
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsModalMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let model = optionsModalMenu[indexPath.row]
                
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = model
                
        cell.contentConfiguration = listContentConfiguration
        
        return cell
    }
}



