//
//  DailyQuoteViewController.swift
//  ModernStoic
//
//  Created by Maaz M on 4/22/24.
//

import UIKit

class DailyQuoteViewController: UIViewController {
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = ""
        authorLabel.text = ""

        fetchQuotes()

        // Do any additional setup after loading the view.
    }
    
    
    private func fetchQuotes() {
        let url = URL(string: "https://stoic-quotes.com/api/quote")!
        
        let session = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("🚨 Request failed: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("🚨 Server Error: response: \(String(describing: response))")
                return
            }
            
            guard let data = data else {
                print("🚨 No data returned from request")
                return
            }
            
            do {
                let quoteResponse = try JSONDecoder().decode(QuoteResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.quoteLabel.text = quoteResponse.text
                    self.authorLabel.text = quoteResponse.author
                }
            } catch {
                print("🚨 Error decoding JSON data into Quote Response: \(error.localizedDescription)")
            }
        }
        session.resume()
    }
    
    private func updateUI(with quote: DailyQuote) {
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
    }
    
    
    
    @IBAction func didTapRefreshQuote(_ sender: UIButton) {
        fetchQuotes()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
