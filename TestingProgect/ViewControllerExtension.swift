import UIKit

extension UIViewController {
    
    func showBottomToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.4, delay: 0.7, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showTopToast(message : String, font: UIFont) {
        
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: 100, width: 150, height: 35))
        let toastLabel = ToastLabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 2
        self.view.addSubview(toastLabel)
        toastLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview().offset(60)
            make.trailing.lessThanOrEqualToSuperview().offset(-60)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        UIView.animate(withDuration: 0.4, delay: 0.7, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
}

final class ToastLabel: UILabel {
  
  var topInset: CGFloat = 8.0
  var bottomInset: CGFloat = 8.0
  var leftInset: CGFloat = 8.0
  var rightInset: CGFloat = 8.0
  
  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }
  
  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset,
                  height: size.height + topInset + bottomInset)
  }
  
  override var bounds: CGRect {
    didSet {
      // ensures this works within stack views if multi-line
      preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
    }
  }
}
