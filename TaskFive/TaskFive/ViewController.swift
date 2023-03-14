//
//  ViewController.swift
//  TaskFive
//
//  Created by Alexander Nifontov on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Subviews
	
	private lazy var presentButton = UIButton()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		setupConstraints()
	}
	
	// MARK: - Methods
	
	private func setupUI() {
		view.backgroundColor = .systemBackground
		
		presentButton.setTitle("Present", for: .normal)
		presentButton.setTitleColor(.systemBlue, for: .normal)
		presentButton.setTitleColor(.systemBlue.withAlphaComponent(0.7), for: .highlighted)
		presentButton.addTarget(self, action: #selector(presentButton_touchUpInside), for: .touchUpInside)
		presentButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func setupConstraints() {
		view.addSubview(presentButton)
		
		let constraints = [
			presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		]
		
		constraints.forEach { $0.isActive = true }
	}
	
	// MARK: - Actions
	
	@objc
	private func presentButton_touchUpInside(_ sender: UIButton) {
		let viewController = PopoverViewController()
		viewController.modalPresentationStyle = .popover
		
		let popover = viewController.popoverPresentationController
		popover?.delegate = self
		popover?.sourceView = sender
		
		present(viewController, animated: true)
	}
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		.none
	}
}

