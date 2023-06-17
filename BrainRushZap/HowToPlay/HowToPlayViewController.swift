//
//  HowToPlayViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 01.05.2023.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    var language: String
    var soundPlaing: Bool
    var value: String
    var mainBG: String
    
    private var customNavigationBar = UINavigationBar()
    private var buttonPressCounter: Int = 0
    
    private let backGround: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "5")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Options_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(optionsPressed), for: .touchUpInside)
        return button
    }()
    
    private let storeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Close_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(storePressed), for: .touchUpInside)
        return button
    }()
    
    private let additionalOptions: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Additional options")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    private let sound: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigation()
        setSubviews()
        setConstraints()
        setLanguage()
    }
    
    private func setCustomNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 110))
        view.addSubview(customNavigationBar)
    }
    
    private func setSubviews() {
        view.addSubview(backGround)
        view.addSubview(optionsButton)
        view.addSubview(storeButton)
        backGround.addSubview(additionalOptions)
        view.addSubview(sound)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backGround.topAnchor.constraint(equalTo: view.topAnchor),
            backGround.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGround.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            optionsButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            optionsButton.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            optionsButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(121)),
            optionsButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            storeButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            storeButton.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            storeButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(121)),
            storeButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            additionalOptions.topAnchor.constraint(equalTo: backGround.topAnchor),
            additionalOptions.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            additionalOptions.widthAnchor.constraint(equalToConstant: Constants.setSizeY(96)),
            additionalOptions.heightAnchor.constraint(equalToConstant: Constants.setSizeY(190)),

            sound.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 123),
            sound.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
        ])
    }
    
    private func setLanguage() {
        if language == "en" {
            backGround.image = UIImage(named: "5")
        } else {
            backGround.image = UIImage(named: "como jogar")
        }
    }
    
    @objc private func optionsPressed() {
        if buttonPressCounter % 2 == 0 {
            additionalOptions.isHidden = false
            sound.isHidden = false
        } else {
            additionalOptions.isHidden = true
            sound.isHidden = true
        }
        buttonPressCounter += 1
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
    }
    
    @objc private func storePressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: "0",
            mainBG: mainBG))
    }
    
    @objc func soundPressed() {
        if soundPlaing {
            soundPlaing = false
            sound.setBackgroundImage(UIImage(named: "Soundless_btn"), for: .normal)
            AudioPlayerManager.shared.pause()
        } else {
            soundPlaing = true
            sound.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
            AudioPlayerManager.shared.play()
        }
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
    }
    
    init(language: String, soundPlaing: Bool, value: String, mainBG: String) {
        self.language = language
        self.soundPlaing = soundPlaing
        self.value = value
        self.mainBG = mainBG
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
