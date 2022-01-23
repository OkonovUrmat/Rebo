//
//  ViewController.swift
//  Rebo
//
//  Created by Urmat on 9/12/21.
//

import UIKit
import Foundation

class MyView: UIView {
    private let anotherView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        
        clipsToBounds = true
        anotherView.backgroundColor = .systemYellow
        anotherView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(anotherView)
        
        let topGuide = UILayoutGuide()
        let bottomGuide = UILayoutGuide()

        addLayoutGuide(topGuide)
        addLayoutGuide(bottomGuide)
        
        NSLayoutConstraint.activate([
            topGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            topGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            topGuide.topAnchor.constraint(equalTo: topAnchor),
            topGuide.heightAnchor.constraint(equalToConstant: 200),
            anotherView.leadingAnchor.constraint(equalTo: leadingAnchor),
            anotherView.trailingAnchor.constraint(equalTo: trailingAnchor),
            anotherView.topAnchor.constraint(equalTo: topGuide.bottomAnchor),
            anotherView.bottomAnchor.constraint(equalTo: bottomGuide.topAnchor),
            bottomGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomGuide.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

class ViewController: UIViewController {

//    let myView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6444200873, blue: 0.3537504971, alpha: 1)
        
        setUpMainView()
    }

    func setUpMainView() {
        // Title
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.center = view.center
        NSLayoutConstraint.activate([
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        title.text = "Ozon"
        title.textAlignment = .center
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 48)
        title.textColor = .black
        
        // Center View
        let centerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let centerViewConstraintAlignment = CGFloat(30)
        centerView.layer.cornerRadius = 10
        centerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerView)

        NSLayoutConstraint.activate([
            centerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: centerViewConstraintAlignment),
            centerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -centerViewConstraintAlignment),
            centerView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: centerViewConstraintAlignment),
            centerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        centerView.backgroundColor = .white
        
        // Center View buttons
        let centerViewBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        centerViewBtn.layer.cornerRadius = 10
        centerViewBtn.center = view.center

        view.addSubview(centerViewBtn)

        centerViewBtn.backgroundColor = .black

        centerViewBtn.title(for: .highlighted)
        centerViewBtn.setTitleColor(.white, for: .normal)
        centerViewBtn.setTitle("Зал 1", for: .normal)

        centerViewBtn.addTarget(self, action: #selector(openWebSocketViewController), for: .touchUpInside)
        
        // Computer hall buttons
        let firstHallButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let secondHallButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        firstHallButton.layer.cornerRadius = 10
        secondHallButton.layer.cornerRadius = 10
        firstHallButton.translatesAutoresizingMaskIntoConstraints = false
        secondHallButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstHallButton)
        view.addSubview(secondHallButton)
    }
    
    @objc private func openWebSocketViewController() {
        let vc = WebSocketViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
