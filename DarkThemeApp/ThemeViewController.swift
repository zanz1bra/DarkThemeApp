//
//  ThemeViewController.swift
//  DarkThemeApp
//
//  Created by erika.talberga on 19/10/2023.
//

import UIKit

class ThemeViewController: UIViewController {

    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var folderButton: UIBarButtonItem!
    @IBOutlet weak var trashButton: UIBarButtonItem!
// #warning("need to have IBOutlet another Item button and put on leading side")
    
    var darkTheme = false
    var mainText = "Dark Theme Off"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ThemeViewController func viewDidLoad")
        darkButton.layer.cornerRadius = 10
        darkThemeIsOn(isOn: darkTheme)
    }

    @IBAction func darkButtonTapped(_ sender: Any) {
        print("darkButtonTapped")
        darkThemeIsOn(isOn: darkTheme)
//        view.backgroundColor = UIColor.black
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        
//        darkButton.setTitle("Dark Theme off", for: .normal)
//        darkButton.setTitleColor(UIColor.black, for: .normal)
//        darkButton.tintColor = UIColor.white
        
//        #warning("Dark Theme off : Dark Theme on")
    }
    
    func darkThemeIsOn(isOn: Bool) {
        mainText = isOn ? "Dark Theme Off" : "Dark Theme On"
        darkButton.setTitle(mainText, for: .normal)
        darkButton.setTitleColor(isOn ? UIColor.black : UIColor.white, for: .normal)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: !isOn ? UIColor.black : UIColor.white]
        darkButton.backgroundColor = !isOn ? .black : .white
        view.backgroundColor = isOn ? UIColor.black : UIColor.white
        trashButton.tintColor = !isOn ? .black : .white
        folderButton.tintColor = !isOn ? .black : .white
        darkTheme.toggle()
    }
    
    @IBAction func folderTapped(_ sender: Any) {
        basicAlert(title: "My Folder", message: "This is my item button!")
    }
//    #warning("Need to have IBAction for Item button and logic to present actionSheet")
    @IBAction func trashButtonTapped(_ sender: Any) {
        sheetAlert(title: "Trash", message: "Are you shure?")
    }
    
}

extension UIViewController {
    
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func sheetAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let sheetAlert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            sheetAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            
            self.present(sheetAlert, animated: true)
        }
    }
}
