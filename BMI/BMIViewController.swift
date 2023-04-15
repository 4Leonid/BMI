//
//  ViewController.swift
//  BMI
//
//  Created by Леонид Турко on 15.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class BMIViewController: UIViewController {
  //  MARK: - Private Properties
  private lazy var backgroundImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "calculate_background")
    return element
  }()
  
  private lazy var calculateButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("CALCULATE", for: .normal)
    element.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    element.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1)
    element.setTitleColor(.white, for: .normal)
    element.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return element
  }()
  
  //  MARK:  StackView
  private lazy var vStackView: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 10
    return element
  }()
  
  private lazy var hStackViewOne: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fillEqually
    return element
  }()
  
  private lazy var hStackViewTwo: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fillEqually
    return element
  }()
  
  //  MARK:  Labels
  private lazy var textLabel: UILabel = {
    let element = UILabel()
    element.text = "CALCULATE YOUR BMI"
    element.numberOfLines = 0
    element.textColor = .darkGray
    element.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    return element
  }()
  
  private lazy var heightLabel: UILabel = {
    let element = UILabel()
    element.textColor = .darkGray
    element.text = "Height"
    element.font = UIFont.systemFont(ofSize: 17, weight: .light)
    return element
  }()
  
  private lazy var weightLabel: UILabel = {
    let element = UILabel()
    element.textColor = .darkGray
    element.text = "Weight"
    element.font = UIFont.systemFont(ofSize: 17, weight: .light)
    return element
  }()
  
  private lazy var heightNumberLabel: UILabel = {
    let element = UILabel()
    element.textColor = .darkGray
    element.text = "1.5m"
    element.textAlignment = .right
    element.font = UIFont.systemFont(ofSize: 17, weight: .light)
    return element
  }()
  
  private lazy var weightNumberLabel: UILabel = {
    let element = UILabel()
    element.textColor = .darkGray
    element.text = "100Kg"
    element.textAlignment = .right
    element.font = UIFont.systemFont(ofSize: 17, weight: .light)
    return element
  }()
  
  //  MARK:  Sliders
  private lazy var firstSlider: UISlider = {
    let element = UISlider()
    element.maximumValue = 3
    element.minimumValue = 0
    element.value = 1.5
    element.minimumTrackTintColor = #colorLiteral(red: 0.5301753283, green: 0.5373558402, blue: 0.8578448892, alpha: 1)
    element.thumbTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1)
    element.alpha = 0.7
    element.addTarget(self, action: #selector(moveSlider), for: .valueChanged)
    return element
  }()
  
  private lazy var secondSlider: UISlider = {
    let element = UISlider()
    element.maximumValue = 200
    element.minimumValue = 0
    element.value = 100
    element.minimumTrackTintColor = #colorLiteral(red: 0.5301753283, green: 0.5373558402, blue: 0.8578448892, alpha: 1)
    element.thumbTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1)
    element.alpha = 0.7
    element.addTarget(self, action: #selector(moveSlider), for: .valueChanged)
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
  }

  @objc private func moveSlider(_ sender: UISlider) {
    switch sender {
    case firstSlider:
      heightNumberLabel.text = String(format: "%.2fm", sender.value)
    default:
      weightNumberLabel.text = String(format: "%.fKg", sender.value)
    }
  }
  
  @objc private func buttonPressed() {
    let height = firstSlider.value
    let weight = secondSlider.value
    print(pow(height, 2))
    print(weight / pow(height, 2))
    
    let bmi = weight / pow(height, 2)
  }
}

//  MARK: -  Private Methods
extension BMIViewController {
  private func setViews() {
    view.addSubview(backgroundImage)
    view.addSubview(vStackView)
    vStackView.addArrangedSubview(textLabel)
    vStackView.addArrangedSubview(hStackViewOne)
    vStackView.addArrangedSubview(firstSlider)
    vStackView.addArrangedSubview(hStackViewTwo)
    vStackView.addArrangedSubview(secondSlider)
    vStackView.addArrangedSubview(calculateButton)
    
    hStackViewOne.addArrangedSubview(heightLabel)
    hStackViewOne.addArrangedSubview(heightNumberLabel)
    
    hStackViewTwo.addArrangedSubview(weightLabel)
    hStackViewTwo.addArrangedSubview(weightNumberLabel)
  }
  
  private func setConstraints() {
    backgroundImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    vStackView.snp.makeConstraints { make in
      make.edges.equalTo(view.snp.margins)
    }
    
    hStackViewOne.snp.makeConstraints { make in
      make.height.equalTo(21)
    }
    
    hStackViewTwo.snp.makeConstraints { make in
      make.height.equalTo(hStackViewOne.snp.height)
    }
    
    firstSlider.snp.makeConstraints { make in
      make.height.equalTo(61)
    }
    
    secondSlider.snp.makeConstraints { make in
      make.height.equalTo(firstSlider.snp.height)
    }
    
    calculateButton.snp.makeConstraints { make in
      make.height.equalTo(61)
    }
  }
}

//  MARK: - Show Canvas
struct ContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = BMIViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return BMIViewController()
  }
  
  func updateUIViewController(_ uiViewController: BMIViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
