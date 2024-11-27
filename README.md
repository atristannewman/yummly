//
//  README.md
//  YumList
//
//  Created by Tristan Newman on 11/9/24.
//

## Table of Content
- Trade-offs and Decisions
- Focus Areas
- Steps to Run the App
- Project Structure Overview
- Time Spent
- External Code and Dependencies
- Additional Information
- To Dos (Given More Time)

## Trade-offs and Decisions
- Networking Consdireation: I briefly considered choosing a networking library for the Yummly app, I opted for **Alamofire** over **Moya**. Alamofire is better maintained, having an update 11 days ago, versus Moya in August. Alamofire, Moya, and URLRequests require boilter plate to make scalabl. It made sense to go with Alamofire, because you get the benefits of just enough data task abstraction.
- Used Kingfisher instead of building custom solution. Traded control for reliability and maintenance.
- Kept RecipesService simple for MVP. Would build out a Network Manager in the future, it would endup looking like Moya under the hood.
- Not passing an array of Recipe structs: To prepare for future application growth, the decision was made to pull out relevant features for the UI currently used. This will become important by allocating less memory to multiple arrays of traits relevant to the different Feature variables, such as an array of filtered or sorted recipes.

## Focus Areas
- Modular Architecture: This structure allows for efficient scaling as the application grows.
* Note: I wouldn't normally make a project this small with such a fine grained folder layout, this was to display how I would separate all the parts to scale.

## Steps to Run the App
1. Clone the repository
2. Install dependencies using Swift Package Manager
3. Open YumList.xcodeproj in Xcode 15+
4. Build and run on iOS 17.0+ simulator or device

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
    - Used Protocols to make this easier.


## External Code and Dependencies
1. Alamofire - Networking
2. Kingfisher - Image loading/caching
3. Network Monitor - https://www.youtube.com/watch?v=ieMv_TgIb04

## Additional Information
1. Just the Network Monitor wasn't very reliable

## To Dos
1. Reduce scale of folder layout for the size and scope of the project.
2a. More granualar error handling when it comes to malformed data.
2b. Figure out what is going on with the Network Monitor. I couldn't get it to consistently report when toggling wifi in simulator and side loading from path.status
3. Build out the ui and make use of the youtube video urls sent in the recipe objects. Something like when the user taps or holds to scroll the video of that recipe starts playing in the cell.
4. Filtering and sorting. I ran out of time on this one. Sorting by cuisine and name, then filtering by cuisine.
5. Dark mode
6. Scroll to top button that appears at 10% scroll
7. More white space around the AppIcon. It looks crowded.
8. Shadow to text and implementing Roboto
