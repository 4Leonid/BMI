//
//  ResultViewController.swift
//  BMI
//
//  Created by Леонид Турко on 16.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class ResultViewController: UIViewController {
  //  MARK: - Private Properties
  private lazy var background: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "result_background")
    return element
  }()
  private lazy var stackView: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 8
    return element
  }()
  
  private lazy var resultLabel: UILabel = {
    let element = UILabel()
    element.text = "YOUR RESULT"
    element.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    element.textColor = .white
    element.textAlignment = .center
    return element
  }()
  
  private lazy var infoLabel: UILabel = {
    let element = UILabel()
    element.text = "Hello"
    element.textColor = .white
    element.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    element.textAlignment = .center
    return element
  }()
  
  private lazy var snackLabel: UILabel = {
    let element = UILabel()
    element.text = "EAT SOME MORE SNACKS!"
    element.font = UIFont.systemFont(ofSize: 20, weight: .light)
    element.textColor = .white
    element.textAlignment = .center
    return element
  }()
  
  private lazy var reculculateButton: UIButton = {
    let element = UIButton(type: .system)
    element.backgroundColor = .white
    let color = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1)
    element.setTitleColor(color, for: .normal)
    element.setTitle("RECALCULATE", for: .normal)
    element.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    element.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
    return element
  }()
  
  var bmiValue: String?
  var advice: String?
  var color: UIColor?
  
  //  MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
    setConstraints()
    showInfo()
  }
  
  @objc func pushButton() {
    dismiss(animated: true)
  }
}

//  MARK: -  Private Methods
extension ResultViewController {
  private func showInfo() {
    infoLabel.text = bmiValue
    snackLabel.text = advice
    view.backgroundColor = color
  }
  
  private func setView() {
    view.backgroundColor = #colorLiteral(red: 0.2, green: 0.4823529412, blue: 0.7725490196, alpha: 1)
    view.addSubview(background)
    view.addSubview(stackView)
    view.addSubview(reculculateButton)
    
    stackView.addArrangedSubview(resultLabel)
    stackView.addArrangedSubview(infoLabel)
    stackView.addArrangedSubview(snackLabel)
  }
  
  private func setConstraints() {
    background.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    stackView.snp.makeConstraints { make in
      make.center.equalTo(view.snp.center)
    }
    
    reculculateButton.snp.makeConstraints { make in
      make.bottom.leading.trailing.equalToSuperview().inset(40)
      make.height.equalTo(61)
    }
  }
}

//  MARK: - Show Canvas
struct OtherContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = ResultViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return ResultViewController()
  }
  
  func updateUIViewController(_ uiViewController: ResultViewController, context: Context) {}
}

struct OtherContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
