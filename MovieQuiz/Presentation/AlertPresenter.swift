import Foundation
import UIKit

protocol AlertPresenter {
    func show(alertModel: AlertModel)
}

final class AlertPresenterImpl {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

extension AlertPresenterImpl: AlertPresenter {
    func show(alertModel: AlertModel) {
        let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.buttunAction()
        }
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true)
    }
}
