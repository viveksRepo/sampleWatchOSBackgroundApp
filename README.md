# sampleWatchOSBackgroundApp
A sample app to demonstrate background execution of tasks in watchOS

It was a pain point for me to find the right examples for running tasks (such as a timer) when the app is inactive/background in the watchOS since it was my first app using Swift and Apple's documentation did not help with any snippets. 

This app simply "ticks" every second and sends a haptic feedback to the user, even when it is inactive. The background execution can be implemented further in the App's state change for background state by preserving the session.

Hope this helps anyone looking for a basic example for running inactive/background tasks without the need for workout data tracking.
