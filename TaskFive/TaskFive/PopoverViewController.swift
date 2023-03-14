//
//  PopoverViewController.swift
//  TaskFive
//
//  Created by Alexander Nifontov on 14.03.2023.
//

import UIKit

class PopoverViewController: UIViewController {
	
	// MARK: - Subviews
	
	private lazy var selectHeightView = UISegmentedControl()
	private lazy var closeButton = UIButton()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupUI()
		setupConstraints()
		updatePreferredSize()
	}
	
	// MARK: - Methods
	
	private func setupUI() {
		view.backgroundColor = .systemBackground
		
		selectHeightView.insertSegment(withTitle: "280pt", at: 0, animated: false)
		selectHeightView.insertSegment(withTitle: "150pt", at: 1, animated: false)
		selectHeightView.addTarget(self, action: #selector(selectHeightView_valueChanged), for: .valueChanged)
		selectHeightView.selectedSegmentIndex = 0
		selectHeightView.translatesAutoresizingMaskIntoConstraints = false
		
		closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
		closeButton.addTarget(self, action: #selector(closeButton_touchUpInside), for: .touchUpInside)
		closeButton.tintColor = .systemGray
		closeButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func setupConstraints() {
		view.addSubview(selectHeightView)
		view.addSubview(closeButton)
		
		let constraints = [
			selectHeightView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			selectHeightView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
		]
		
		constraints.forEach { $0.isActive = true }
	}
	
	private func updatePreferredSize() {
		let index = selectHeightView.selectedSegmentIndex
		let preferredHeight: CGFloat = index == 0 ? 280 : 150
		preferredContentSize = CGSize(width: 300, height: preferredHeight)
	}
	
	// MARK: - Actions
	
	@objc
	private func selectHeightView_valueChanged(_ sender: UISegmentedControl) {
		updatePreferredSize()
	}
	
	@objc
	private func closeButton_touchUpInside(_ sender: UIButton) {
		dismiss(animated: true)
	}
}
