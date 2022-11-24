//
//  ButtonsView.swift
//  ClousuresTest
//
//  Created by Harbros on 26.01.22.
//

import UIKit

class ButtonsView: UIStackView {
    
    // MARK: - Enum
    enum Actions {
        case add, result, changeColor
    }
    
    // MARK: - UIProperties
    private let increaseCountButton = UIButton()
    private let changeColorButton = UIButton()
    private let decreaseCountButton = UIButton()
    var block: ((Actions) -> Void)?

    // MARK: - Lifecycle
    override func layoutSubviews() {
        setupUI()
    }
    // MARK: - Private
    private func setupUI() {
        axis = .vertical
        distribution = .fillEqually
        setupButtons()
    }
     func setupButtons() {
        increaseCountButton.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        increaseCountButton.layer.cornerRadius = Constants.cornerRadius
        increaseCountButton.setTitle(Constants.increaseTitle, for: .normal)
        increaseCountButton.backgroundColor = .blue
        addArrangedSubview(increaseCountButton)
         
        changeColorButton.addTarget(self,  action: #selector(changeColorButtonTapped), for: .touchUpInside)
        changeColorButton.layer.cornerRadius = Constants.cornerRadius
        changeColorButton.setTitle(Constants.changeColorTitle, for: .normal)
        changeColorButton.backgroundColor = .green
        addArrangedSubview(changeColorButton)
        
        decreaseCountButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
        decreaseCountButton.layer.cornerRadius = Constants.cornerRadius
        decreaseCountButton.setTitle(Constants.decreaseTitle, for: .normal)
        decreaseCountButton.backgroundColor = .red
        addArrangedSubview(decreaseCountButton)
    }
    
    func changeLabel(counterLabel: UILabel, actions: Actions ) {
        guard let number = Int(counterLabel.text ?? "")
        else {
            return
        }
        switch actions {
        case .add:
            counterLabel.text = String(number + 1)
        case .result:
            counterLabel.text = String(number - 1)
        case .changeColor:
            counterLabel.textColor = .randomColor
        }
    }
    
    // MARK: - Selectors
    @objc private func increaseButtonTapped() {
        block?(.add)
    }
    @objc private func changeColorButtonTapped() {
        block?(.changeColor)
    }
    @objc private func decreaseButtonTapped() {
        block?(.result)
    }
}
