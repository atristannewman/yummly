//
//  README.md
//  YumList
//
//  Created by Tristan Newman on 11/9/24.
//

## Table of Content
- Design Considerations
- Project Structure Overview

## Design Considerations
- Modular Architecture: This structure allows for efficient scaling as the application grows.
- Networking Consdireation: I briefly considered choosing a networking library for the Yummly app, I opted for **Alamofire** over **Moya**. Alamofire is better maintained, having an update 11 days ago, versus Moya in August. Alamofire, Moya, and URLRequests require boilter plate to make scalabl. It made sense to go with Alamofire, because you get the benefits of just enough data task abstraction.

## Project Structure Overview

This folder structure is designed to support scalability and maintainability in a SwiftUI application.

- Features: Contains distinct modules for each feature, promoting separation of concerns and modular development. This allows for easier testing and future enhancements.
  
- Services: Centralizes network calls and data management, ensuring that business logic is decoupled from UI components. This enhances reusability and simplifies updates.
-- Here I left RecipesService at this layer for simplicity. As the app would scale, more of the http requests would be brokendown into a Network Manager

- Database: Manages local data persistence. Could use Core Data, Realm, or SQLite for local storage.

- Networking: Specifically for network-related operations, using Alamofire for HTTP requests. In a larger project this holds request builders, API endpoints, and response handlers.

- Coordinators: (for larger applications, overkill for this little app) Manages navigation and flow between views, providing a clear structure for user interactions and improving code readability.

- Utilities: Houses common functions and extensions that can be reused across the application, reducing code duplication.

- Tests: Primarly focused on testing the View Model. The ViewModel contains the core business logic of the application, including decoding and state management.

