//
//  AnimationViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     **/
    
    // Mark: - Properties
    private let animationView = AnimationView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureView()
        configureButton()
        configureGestures()
    }
    
    private func configureVC() {
        title = "Animation"
        view.backgroundColor = .uiviewWhite
    }
    
    private func configureButton() {
        self.animationView.fadeInOutButton.addTarget(self, action: #selector(didPressFade), for: .touchUpInside)
    }
    
    private func configureGestures() {
        animationView.logoImageView.isUserInteractionEnabled = true
        animationView.logoImageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gesture:))))
    }
    
    // MARK: - Actions
    @objc private func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @objc private func didPressFade() {
        switch animationView.logoImageView.alpha {
        case 1:
            self.animationView.logoImageView.fadeOut()
            self.animationView.fadeInOutButton.setTitle("FADE IN", for: .normal)
        case 0:
            self.animationView.logoImageView.fadeIn()
            self.animationView.fadeInOutButton.setTitle("FADE OUT", for: .normal)
        default:
            break
        }
    }
    
    @objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: self.view)
            animationView.logoImageView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
            if let view = gesture.view {
                view.center = CGPoint(x:view.center.x + translation.x,
                                      y:view.center.y + translation.y)
            }
            gesture.setTranslation(CGPoint.zero, in: self.view)
        default:
            break
        }
    }
    
    private func configureView() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)            ])
    }
}
