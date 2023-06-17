//
//  LetsWinViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 29.04.2023.
//

import UIKit

final class LetsWinViewController: UIViewController {

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
    
    private let storeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Store screen_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(storePressed), for: .touchUpInside)
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
    
    private let wheelElement: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Menu wheel element")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let miniCircle: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Tier 1 wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let middleCircle: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Tier 2 wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bigCircle: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Tier 3 wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let viewCircle: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 365/2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let letsWinButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Let's win_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(letsWinPressed), for: .touchUpInside)
        return button
    }()
    
    private let letsWinLabel: UILabel = {
        let label = UILabel()
        label.text = ""
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
    
    private let howToPlay: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "How to play_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(howToPlayPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let changeLanguage: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Change language_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeLanguagePressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let sound: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let overView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.isHidden = true
        return view
    }()
    
    private let languageСhanger: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Language changer_pop-up")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    private let activeLanguageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Language changer_pop-up"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(activeLanguagePressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let englishCheckmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let englishLabel: UILabel = {
        let label = UILabel()
        label.text = "ENGLISH"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let disactiveLanguageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Language_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(disactiveLanguagePressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let portugueseCheckmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let portugueseLabel: UILabel = {
        let label = UILabel()
        label.text = "PORTUGUESE"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if soundPlaing {
            sound.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
            AudioPlayerManager.shared.play()
        } else {
            sound.setBackgroundImage(UIImage(named: "Soundless_btn"), for: .normal)
            AudioPlayerManager.shared.pause()
        }
        
        setCustomNavigation()
        setSubviews()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setFont(englishLabel, 50.0, 0)
        setFont(portugueseLabel, 50.0, 0)
        setLanguage()
        if letsWinLabel.text == "VAMOS GANHAR" { setFont(letsWinLabel, Constants.setSizeY(50.0), 0.0) } else { setFont(letsWinLabel, Constants.setSizeX(65.0), 0.0) }
        backGround.image = UIImage(named: mainBG)
        customizeInterface()
        balance.text = value
        setFont(balance, Constants.setSizeY(65.0), -2.0)
        
        // устанавливаем свойства тени для создания эффекта свечения
        bigCircle.layer.shadowColor = UIColor.white.cgColor
        bigCircle.layer.shadowRadius = 10
        bigCircle.layer.shadowOpacity = 1
        bigCircle.layer.shadowOffset = CGSize.zero
        bigCircle.layer.shadowPath = UIBezierPath(roundedRect: bigCircle.bounds.insetBy(dx: -15, dy: -15), cornerRadius: bigCircle.layer.cornerRadius).cgPath
        bigCircle.layer.cornerRadius =  Constants.setSizeX(365/2)
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
        view.addSubview(howToPlay)
        view.addSubview(changeLanguage)
        view.addSubview(sound)
        
        view.addSubview(storeButton)
        backGround.addSubview(frameBalance)
        frameBalance.addSubview(balance)
        backGround.addSubview(viewCircle)
        backGround.addSubview(bigCircle)
        backGround.addSubview(middleCircle)
        backGround.addSubview(miniCircle)
        backGround.addSubview(wheelElement)
        view.addSubview(letsWinButton)
        letsWinButton.addSubview(letsWinLabel)
        view.addSubview(overView)
        view.addSubview(languageСhanger)
        view.addSubview(activeLanguageButton)
        activeLanguageButton.addSubview(englishLabel)
        view.addSubview(disactiveLanguageButton)
        disactiveLanguageButton.addSubview(portugueseLabel)
        languageСhanger.addSubview(englishCheckmark)
        languageСhanger.addSubview(portugueseCheckmark)
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
            
            storeButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            storeButton.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            storeButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            storeButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            wheelElement.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            wheelElement.centerYAnchor.constraint(equalTo: backGround.centerYAnchor),
            wheelElement.widthAnchor.constraint(equalToConstant: Constants.setSizeY(365)),
            wheelElement.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            miniCircle.centerXAnchor.constraint(equalTo: wheelElement.centerXAnchor),
            miniCircle.centerYAnchor.constraint(equalTo: wheelElement.centerYAnchor),
            miniCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            miniCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            
            middleCircle.centerXAnchor.constraint(equalTo: wheelElement.centerXAnchor),
            middleCircle.centerYAnchor.constraint(equalTo: wheelElement.centerYAnchor),
            middleCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            middleCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            
            bigCircle.centerXAnchor.constraint(equalTo: wheelElement.centerXAnchor),
            bigCircle.centerYAnchor.constraint(equalTo: wheelElement.centerYAnchor),
            bigCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(345)),
            bigCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(345)),
            
            frameBalance.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: 10),
            frameBalance.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            frameBalance.widthAnchor.constraint(equalToConstant: Constants.setSizeX(210)),
            frameBalance.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            balance.centerXAnchor.constraint(equalTo: frameBalance.centerXAnchor),
            balance.centerYAnchor.constraint(equalTo: frameBalance.centerYAnchor),
            
            letsWinButton.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            letsWinButton.topAnchor.constraint(equalTo: bigCircle.bottomAnchor, constant: Constants.setSizeY(60)),
            letsWinButton.widthAnchor.constraint(equalToConstant: Constants.setSizeX(325)),
            letsWinButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(105)),
            letsWinLabel.centerXAnchor.constraint(equalTo: letsWinButton.centerXAnchor),
            letsWinLabel.centerYAnchor.constraint(equalTo: letsWinButton.centerYAnchor),
            
            additionalOptions.topAnchor.constraint(equalTo: backGround.topAnchor),
            additionalOptions.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            additionalOptions.widthAnchor.constraint(equalToConstant: Constants.setSizeY(83)),
            additionalOptions.heightAnchor.constraint(equalToConstant: Constants.setSizeY(290)),

            howToPlay.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: Constants.setSizeY(7)),
            howToPlay.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            howToPlay.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            howToPlay.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),

            changeLanguage.topAnchor.constraint(equalTo: howToPlay.bottomAnchor, constant: Constants.setSizeY(7)),
            changeLanguage.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            changeLanguage.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            changeLanguage.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),

            sound.topAnchor.constraint(equalTo: changeLanguage.bottomAnchor, constant: Constants.setSizeY(7)),
            sound.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            
            overView.topAnchor.constraint(equalTo: view.topAnchor),
            overView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            languageСhanger.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            languageСhanger.centerYAnchor.constraint(equalTo: backGround.centerYAnchor),
            languageСhanger.widthAnchor.constraint(equalToConstant: Constants.setSizeY(350)),
            languageСhanger.heightAnchor.constraint(equalToConstant: Constants.setSizeY(225)),
            
            activeLanguageButton.bottomAnchor.constraint(equalTo: languageСhanger.centerYAnchor, constant: -15),
            activeLanguageButton.leadingAnchor.constraint(equalTo: languageСhanger.leadingAnchor, constant: 20),
            activeLanguageButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(270)),
            activeLanguageButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            activeLanguageButton.centerXAnchor.constraint(equalTo: englishLabel.centerXAnchor),
            activeLanguageButton.centerYAnchor.constraint(equalTo: englishLabel.centerYAnchor),
            
            disactiveLanguageButton.topAnchor.constraint(equalTo: languageСhanger.centerYAnchor, constant: 15),
            disactiveLanguageButton.leadingAnchor.constraint(equalTo: languageСhanger.leadingAnchor, constant: 20),
            disactiveLanguageButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(270)),
            disactiveLanguageButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            disactiveLanguageButton.centerXAnchor.constraint(equalTo: portugueseLabel.centerXAnchor),
            disactiveLanguageButton.centerYAnchor.constraint(equalTo: portugueseLabel.centerYAnchor),
            
            englishCheckmark.centerYAnchor.constraint(equalTo: activeLanguageButton.centerYAnchor),
            englishCheckmark.leadingAnchor.constraint(equalTo: activeLanguageButton.trailingAnchor, constant: 10),
            englishCheckmark.widthAnchor.constraint(equalToConstant: Constants.setSizeY(40)),
            englishCheckmark.heightAnchor.constraint(equalToConstant: Constants.setSizeY(40)),
            
            portugueseCheckmark.centerYAnchor.constraint(equalTo: disactiveLanguageButton.centerYAnchor),
            portugueseCheckmark.leadingAnchor.constraint(equalTo: disactiveLanguageButton.trailingAnchor, constant: 10),
            portugueseCheckmark.widthAnchor.constraint(equalToConstant: Constants.setSizeY(40)),
            portugueseCheckmark.heightAnchor.constraint(equalToConstant: Constants.setSizeY(40)),
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
            howToPlay.isHidden = false
            changeLanguage.isHidden = false
            sound.isHidden = false
        } else {
            additionalOptions.isHidden = true
            howToPlay.isHidden = true
            changeLanguage.isHidden = true
            sound.isHidden = true
        }
        buttonPressCounter += 1
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        
        
    }
    
    @objc func storePressed() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.view.window?.rootViewController = UINavigationController(rootViewController: StoreViewController(
            collectionViewLayout: layout,
            language: language,
            soundPlaing: soundPlaing,
            value: value,
            mainBG: mainBG))
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        settingsDidChange()
    }
    
    @objc func letsWinPressed() {
        self.view.window?.rootViewController = UINavigationController(rootViewController: GameViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: value,
            mainBG: mainBG,
            lifeCount: 3,
            state: 0))
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        settingsDidChange()
    }
    
    
    @objc func howToPlayPressed() {
        self.view.window?.rootViewController = UINavigationController(rootViewController: HowToPlayViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: "0",
            mainBG: mainBG))
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        settingsDidChange()
    }
    
    @objc func changeLanguagePressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        overView.isHidden = false
        languageСhanger.isHidden = false
        activeLanguageButton.isHidden = false
        disactiveLanguageButton.isHidden = false
        englishLabel.isHidden = false
        portugueseLabel.isHidden = false
        
        if language == "en" {
            englishCheckmark.isHidden = false
            portugueseCheckmark.isHidden = true
        } else {
            englishCheckmark.isHidden = true
            portugueseCheckmark.isHidden = false
        }
        settingsDidChange()
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
        settingsDidChange()
    }
    
    @objc private func activeLanguagePressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        englishCheckmark.isHidden = false
        portugueseCheckmark.isHidden = true
        language = "en"
        
        self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: value,
            mainBG: mainBG))
        settingsDidChange()
    }
    
    @objc private func disactiveLanguagePressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        englishCheckmark.isHidden = true
        portugueseCheckmark.isHidden = false
        language = "po"
        
        self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: value,
            mainBG: mainBG))
        settingsDidChange()
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
    
    private func customizeInterface() {
        switch backGround.image {
        case UIImage(named: "BG_Blue theme"):
            self.miniCircle.image = UIImage(named: "Blue tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Blue tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Blue tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Blue tier 3 wheel element")
        case UIImage(named: "BG_Red theme"):
            self.miniCircle.image = UIImage(named: "Red tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Red tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Red tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Red tier 3 wheel element")
        case UIImage(named: "BG_Yellow theme"):
            self.miniCircle.image = UIImage(named: "Yellow tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Yellow tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Yellow tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Yellow tier 3 wheel element")
        case UIImage(named: "BG_Blue-green theme"):
            self.miniCircle.image = UIImage(named: "Blue-green tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Blue-green tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Blue-green tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Blue-green tier 3 wheel element")
        case UIImage(named: "BG_Yellow-red theme"):
            self.miniCircle.image = UIImage(named: "Yellow-red tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Yellow-red tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Yellow-red tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Yellow-red tier 3 wheel element")
        default:
            self.miniCircle.image = UIImage(named: "Tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Tier 3 wheel element")
        }
    }
    
    private func setLanguage() {
        if language == "en" {
            letsWinLabel.text = "LET'S WIN"
            
        } else {
            letsWinLabel.text = "VAMOS GANHAR"
        }
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
