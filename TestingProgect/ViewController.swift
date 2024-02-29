import UIKit
import SnapKit
import OSLog

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button =  UIButton()
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    @objc func buttonTapped() {
        self.showTopToast(message: "Message", font: .boldSystemFont(ofSize: 12))
        Logger.fileLocation.info("Message was shown")
    }
}



