//
//  CustomStepper.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 22/04/24.
//

import UIKit

class RoundStepper: UIControl {
  
  private lazy var plusButton = stepperButton(color: viewData.color, text: "+", value: 1)
  private lazy var minusButton = stepperButton(color: viewData.color, text: "-", value: -1)
  
  private lazy var counterLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont(name: "KumbhSans-Bold", size: 23)
    label.text = "0"
    return label
  }()
  
  private lazy var container: UIStackView = {
      let stack = UIStackView()
      stack.distribution = .fillEqually
      stack.backgroundColor = UIColor(named: "Light-Grayish-Blue")
      stack.layer.cornerRadius = 10
      stack.translatesAutoresizingMaskIntoConstraints = false
      return stack
  }()
  
  struct ViewData {
    let color: UIColor
    let minimum: Double
    let maximum: Double
    let stepValue: Double
  }

  private (set) var value: Double = 0
  private let viewData: ViewData
  
  init(viewData: ViewData) {
    self.viewData = viewData
    super.init(frame: .zero)
    setup()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setValue(_ newValue: Double) {
    updateValue(min(viewData.maximum, max(viewData.minimum, newValue)))
  }

  private func setup() {
    backgroundColor = .white
    addSubview(container)
    
    NSLayoutConstraint.activate([
      container.topAnchor.constraint(equalTo: topAnchor),
      container.leadingAnchor.constraint(equalTo: leadingAnchor),
      container.trailingAnchor.constraint(equalTo: trailingAnchor),
      container.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    [minusButton, counterLabel, plusButton].forEach(container.addArrangedSubview)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    plusButton.layer.cornerRadius = 0.5 * bounds.size.height
    minusButton.layer.cornerRadius = 0.5 * bounds.size.height
  }
  
  private func didPressedStepper(value: Double) {
    updateValue(value * viewData.stepValue)
  }
  
  private func updateValue(_ newValue: Double) {
    guard (viewData.minimum...viewData.maximum) ~= (value + newValue) else {
      return
    }
    value += newValue
    counterLabel.text = String(value.formatted())
    sendActions(for: .valueChanged)
  }
  
  private func stepperButton(color: UIColor, text: String, value: Int) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    button.setTitle(text, for: .normal)
    button.tag = value
    button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
    button.setTitleColor(UIColor(named: "Orange"), for: .normal)
    button.setTitleColor(.black, for: .highlighted)
    return button
  }
    
    func setStepperValueToZero () {
        counterLabel.text = "0"
        value = 0
    }
  
  @objc private func buttonTapped(_ sender: UIButton) {
    didPressedStepper(value: Double(sender.tag))
  }
}
