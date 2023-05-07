import CareKit
import CareKitStore
import CareKitUI
import ResearchKit
import UIKit
import os.log
import MapKit
import SwiftUI
import Foundation
import Contacts
import HealthKit
import PDFKit

class CSEPViewController : UIViewController, PDFViewDelegate {
    
    let CSEPView = PDFView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(CSEPView)

        guard let url = Bundle.main.url(forResource: "Information&ConsentForm", withExtension: "pdf") else {
            return
        }

        guard let PDF = PDFDocument(url: url) else {
            return
        }
        CSEPView.document = PDF
        CSEPView.displayBox = .mediaBox
        CSEPView.delegate = self
        CSEPView.displaysPageBreaks = false
        CSEPView.displayMode = .singlePageContinuous
        CSEPView.autoScales = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        CSEPView.frame = view.bounds
        CSEPView.minScaleFactor = CSEPView.scaleFactor
        CSEPView.displayBox = .mediaBox
    }
    func presentShareSheet() {
       guard let url = Bundle.main.url(forResource: "Information&ConsentForm", withExtension: "pdf") else {
           return
       }
        let pdf = UIActivityViewController(activityItems: [url], applicationActivities: nil)
       present(pdf,animated: true)
    }
}
class FAQViewController : UIViewController, PDFViewDelegate {
    
    let CSEPView = PDFView()
    let CSEPShareView = PDFView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(CSEPView)

        guard let url = Bundle.main.url(forResource: "FAQ", withExtension: "pdf") else {
            return
        }
        guard let PDF = PDFDocument(url: url) else {
            return
        }
        CSEPView.document = PDF
        CSEPView.displayBox = .mediaBox
        CSEPView.delegate = self
        CSEPView.displaysPageBreaks = false
        CSEPView.displayMode = .singlePageContinuous
        CSEPView.autoScales = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        CSEPView.frame = view.bounds
        CSEPView.minScaleFactor = CSEPView.scaleFactor
        CSEPView.displayBox = .mediaBox
    }
    func presentFAQSheet() {
       guard let url = Bundle.main.url(forResource: "FAQ", withExtension: "pdf") else {
           return
       }
        let pdf = UIActivityViewController(activityItems: [url], applicationActivities: nil)
       present(pdf,animated: true)
    }
}


extension PDFDocument: Transferable {
    public static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(contentType: .pdf) { pdf in
                if let data = pdf.dataRepresentation() {
                    return data
                } else {
                    return Data()
                }
            } importing: { data in
                if let pdf = PDFDocument(data: data) {
                    return pdf
                } else {
                    return PDFDocument()
                }
            }
        DataRepresentation(exportedContentType: .pdf) { pdf in
            if let data = pdf.dataRepresentation() {
                return data
            } else {
                return Data()
            }
        }
     }
}


