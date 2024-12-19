# iOS Exercise

## Context

- You have to create a simple app. When opened, it shows your favourite characters at the top (if any, and horizontal) and a list of characters from the Disney API ( https://disneyapi.dev ) in a vertical layout. Keep in mind the API does return all characters in a single batch if you wish, but it also offers pagination and page size.
- Tapping on a character it navigates to the details page and gives you the option to either add it or remove it from your favourite characters, assuming they are there already or not.
- Bear in mind, the horizontal favourite characters view at the top is only shown in the main screen, together with in the List of all characters. Instead, in the details screen, you only see their details as in title, image, and some buttons to add / remove the character.
- Make the horizontal favourite characters view at the top not greater than 100px in height.
- You&#39;re expected to use some sort of in-app data persistence mechanism so the favourite view persists between app restarts.
- Make sure your code is covered with unit tests.
- Create a md file with notes explaining your choices and reasons why.
- Don&#39;t use any 3rd party libraries, only in-house solutions.
- Try to use SwiftUI and the latest OS as min deployment targets, and the latest swift concurrency framework to operate on the network requests.

## Bonus

- Sort characters per popularity as based on how many films or short films they appear
- UI is entirely up to you and if not finalised or not looking &quot;good&quot; it&#39;s absolutely ok. What we&#39;re looking for is your attention to details, your architecture choices, your code readability and your attention to testing. We believe you can complete the test in 2 days to a week, but if you need more than 1 week please let us know and communicate with us. If you don&#39;t complete your test, it&#39;s also fine, but make sure to explain your choices and document the steps that you would have taken.

# Jorge's Palomino Feedback

* Run the app and you will see the Disney characters displayed as requested.
* You can add and remove characters to your favourites and they'll be displayed at the top.
* Shutting down & opening it again and your favourite characters will be persistent.
* Pagination added with infinite scroll.
* Added some Unit and UI Tests.


![ScreenRecording-1](media/ScreenRecording-1.gif)

⌨️ with ♡ by [J. Palomino](https://github.com/Jorge-Palomino) 😈
