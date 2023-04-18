# sampleWatchOSBackgroundApp
A sample app to demonstrate background execution of tasks in watchOS

It was a pain point for me to find the right examples for running tasks (such as a timer) when the app is inactive/background in the watchOS since it was my first app using Swift and Apple's documentation did not help with any snippets. 

This app simply "ticks" every second and sends a haptic feedback to the user, even when it is inactive. This is facilitated using the WKExtendedRuntimeSession as a part of the WatchKit package which uses a "Mindful" session in the Background Mode capability. The background execution can be implemented further in the App's state change for background state by preserving the session.

Hope this helps anyone looking for a basic example for running inactive/background tasks without the need for workout data tracking.

## Helpul articles 

https://developer.apple.com/documentation/watchkit/using_extended_runtime_sessions
https://developer.apple.com/documentation/watchkit/life_cycles/working_with_the_watchos_app_life_cycle
https://blog.theivan.io/watchkit/2020/02/02/apple-watch-haptics-in-background.html
https://developer.apple.com/forums/thread/664075
