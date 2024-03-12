import UIKit
import SnapKit

class CharacterDetailViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(nameTapped))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func nameTapped() {
        print(nameLabel.text ?? "")
    }
    
    func configure(_ model: HarryPotterCharacter) {
        nameLabel.text = model.name
    }

}
