//
//  LoseViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 06.05.2023.
//

import UIKit

final class LoseViewController: UIViewController {

    var language: String
    var soundPlaing: Bool
    var value: String
    var mainBG: String

    
    private var buttonPressCounter: Int = 0
    
    private let backGround: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var customNavigationBar = UINavigationBar()
    
    private let optionsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Options_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(optionsPressed), for: .touchUpInside)
        return button
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Repeat_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(repeatPressed), for: .touchUpInside)
        return button
    }()
    
    private let frameBalance: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame for balance")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var balance: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Let's win_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        return button
    }()
    
    private let livesOverLabel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Lives are over")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let wordsSupportLabel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Words of support_lose")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let letsWinLabel: UILabel = {
        let label = UILabel()
        label.text = "MENU"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        if soundPlaing {
            sound.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
        } else {
            sound.setBackgroundImage(UIImage(named: "Soundless_btn"), for: .normal)
        }
        
        setCustomNavigation()
        setSubviews()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backGround.image = UIImage(named: mainBG)
        balance.text = value
        setFont(balance, Constants.setSizeY(65.0), -2.0)
        setFont(letsWinLabel, Constants.setSizeY(65.0), 0.0)
    }

    private func setCustomNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 110))
        view.addSubview(customNavigationBar)
    }
    
    private func setSubviews() {
        view.addSubview(backGround)
        view.addSubview(optionsButton)
        backGround.addSubview(additionalOptions)
        view.addSubview(sound)
        view.addSubview(repeatButton)
        backGround.addSubview(frameBalance)
        frameBalance.addSubview(balance)
        view.addSubview(menuButton)
        menuButton.addSubview(letsWinLabel)
        backGround.addSubview(livesOverLabel)
        backGround.addSubview(wordsSupportLabel)
        
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backGround.topAnchor.constraint(equalTo: view.topAnchor),
            backGround.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGround.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            optionsButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            optionsButton.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            optionsButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            optionsButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            repeatButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            repeatButton.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            repeatButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            repeatButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            frameBalance.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: 10),
            frameBalance.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            frameBalance.widthAnchor.constraint(equalToConstant: Constants.setSizeY(210)),
            frameBalance.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            balance.centerXAnchor.constraint(equalTo: frameBalance.centerXAnchor),
            balance.centerYAnchor.constraint(equalTo: frameBalance.centerYAnchor),
            
            menuButton.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            menuButton.topAnchor.constraint(equalTo: wordsSupportLabel.bottomAnchor, constant: 30),
            menuButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(325)),
            menuButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            letsWinLabel.centerXAnchor.constraint(equalTo: menuButton.centerXAnchor),
            letsWinLabel.centerYAnchor.constraint(equalTo: menuButton.centerYAnchor),
            
            additionalOptions.topAnchor.constraint(equalTo: backGround.topAnchor),
            additionalOptions.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            additionalOptions.widthAnchor.constraint(equalToConstant: Constants.setSizeY(83)),
            additionalOptions.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),

            sound.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: Constants.setSizeY(7)),
            sound.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            
            livesOverLabel.topAnchor.constraint(equalTo: frameBalance.bottomAnchor, constant: 20),
            livesOverLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            livesOverLabel.widthAnchor.constraint(equalToConstant: Constants.setSizeX(350)),
            livesOverLabel.heightAnchor.constraint(equalToConstant: Constants.setSizeX(150)),
            
            wordsSupportLabel.topAnchor.constraint(equalTo: livesOverLabel.bottomAnchor, constant: 20),
            wordsSupportLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            wordsSupportLabel.widthAnchor.constraint(equalToConstant: Constants.setSizeX(265)),
            wordsSupportLabel.heightAnchor.constraint(equalToConstant: Constants.setSizeX(160)),
        ])
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "PassionOne-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : UIColor.black,
            .strokeWidth : border,
            .foregroundColor : UIColor.white
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    
    @objc func optionsPressed() {
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
    
    @objc func repeatPressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        if Int(value)! < 0 {
            self.view.window?.rootViewController = UINavigationController(rootViewController: GameViewController(
                language: language,
                soundPlaing: soundPlaing,
                value: "0",
                mainBG: mainBG,
                lifeCount: 3,
                state: 0))
            settingsDidChange()
        } else {
            self.view.window?.rootViewController = UINavigationController(rootViewController: GameViewController(
                language: language,
                soundPlaing: soundPlaing,
                value: value,
                mainBG: mainBG,
                lifeCount: 3,
                state: 0))
            settingsDidChange()
        }
        
    }
    
    @objc func menuPressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        if Int(value)! < 0 {
            self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
                language: language,
                soundPlaing: soundPlaing,
                value: "0",
                mainBG: mainBG))
            settingsDidChange()
        } else {
            self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
                language: language,
                soundPlaing: soundPlaing,
                value: value,
                mainBG: mainBG))
            settingsDidChange()
        }
        
        
        
    }
    
    @objc func soundPressed() {
        if soundPlaing {
            soundPlaing = false
            sound.setBackgroundImage(UIImage(named: "Soundless_btn"), for: .normal)
            AudioPlayerManager.shared.pause()
            AudioPlayerManager.shared.stopSoundEffect()
        } else {
            soundPlaing = true
            sound.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
            AudioPlayerManager.shared.play()
            if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
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
    
    private func settingsDidChange() {
        let defaults = UserDefaults.standard
        defaults.set(language, forKey: "language")
        defaults.set(soundPlaing, forKey: "soundPlaing")
        defaults.set(value, forKey: "value")
        defaults.set(mainBG, forKey: "mainBG")
        defaults.synchronize()
    }
}
