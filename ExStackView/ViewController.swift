//
//  ViewController.swift
//  ExStackView
//
//  Created by 김종권 on 2022/12/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        return stackView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemMint.withAlphaComponent(0.3)
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        stackView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        addLabels()
    }
    
    private func addLabels() {
        (0..<20).map { idx in
            let label: UILabel = {
                let label = UILabel()
                label.text = "text" + String(idx)
                label.font = .systemFont(ofSize: 40, weight: .bold)
                label.numberOfLines = 1
                label.textColor = .black
                return label
            }()
            return label
        }
        .forEach(stackView.addArrangedSubview)
    }
}
