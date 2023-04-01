//
//  EmiViewController.swift
//  Tasker
//
//  Created by Dinesh Sharma on 30/03/23.
//

import UIKit

class EmiViewController: UIViewController {
    
    @IBOutlet var btnCalculate: UIButton!
    @IBOutlet var txtPrincipalAmount: UITextField!
    @IBOutlet var txtInterestRate: UITextField!
    @IBOutlet var txtLoanTenure: UITextField!
    @IBOutlet weak var lblTotalIntrest: UILabel!

    @IBOutlet weak var btnShare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        btnShare.isEnabled = false
    }
    
    
    @IBAction func btnCalculateTapped(_ sender: Any) {
        
        let loanAmount = Double(self.txtPrincipalAmount.text!) ?? .zero
        let numberOfPayments = Double(self.txtLoanTenure.text!) ?? .zero
        let interestRate = Double(self.txtInterestRate.text!) ?? .zero
        let rate = interestRate / 100 / 12
        let monthlyPayment = loanAmount * rate / (1 - pow(1 + rate, -numberOfPayments))
        let totalPayments = monthlyPayment * numberOfPayments
        let totalIntrest = totalPayments - loanAmount
        
        lblTotalIntrest.text = "₹\(totalIntrest)"
        view.endEditing(true)
        
        btnShare.isEnabled = true
    }
    
    
    func captureScreen() -> UIImage {
        var window: UIWindow? = UIApplication.shared.keyWindow
        window = UIApplication.shared.windows[0] as? UIWindow
        UIGraphicsBeginImageContextWithOptions(window!.frame.size, window!.isOpaque, 0.0)
        window!.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!;
    }
    
    
    
    @IBAction func btnShareTapped(_ sender: Any) {
        
        let image = self.captureScreen()
        let shareController: UIActivityViewController = {
            let activities: [Any] = [image]
            let controller = UIActivityViewController(activityItems: activities, applicationActivities: nil)
            return controller}()
        self.present(shareController, animated: true, completion: nil)
    }
    
    


}

