#if os(iOS)
import UIKit

@MainActor
public class XLink {
    
    // MARK: - Link - canOpenURL
    public static func canOpen(url: URL) -> Bool {
        UIApplication.shared.canOpenURL(url)
    }
    
    
    
    // MARK: - Link - openURL
    @available(iOS 10.0, *)
    public static func openURL(url: URL,
                               options: [UIApplication.OpenExternalURLOptionsKey: Any],
                               completion: @escaping (_ completed: Bool) -> Void) {
            
        UIApplication.shared.open(url,
                                  options: options) { (completed: Bool) in
            completion(completed)
        }
    }
    
    
    
    @available(iOS 13.0, *)
    public static func openURL(url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any]) async -> Bool {
        await UIApplication.shared.open(url, options: options)
    }
}
#endif
