# IndoorpinSdk_ios


see indoorpin.com for more information


IndoorpinSDK is used for the mobile integration of Indoorpin CMS.
It is strongly recommended to start with quick start part described in CMS (cms.indoorpin.com)
Quick Start provides a demo app in the app store so you do not need to deal with SDK at first. After quick start you can start using SDK. 


Steps to get started with SampleApp :

STEP 1:

    sign up to CMS from cms.indoorpin.com
    Create an application in CMS in application page with "com.infonomi.SampleApp" bundle id and copy the api key.

STEP 2:

    Create a branch in CMS (cms.indoorpin.com) in branches page


STEP 3:

    Add a floor plan to the added branch in step 2 in CMS in branches page. You have to provide a floor plan image in this step. A sample floor plan image can be found here:
            https://goo.gl/Tky5ot

STEP 4:

    Add your iBeacon device in Beacon page in CMS. Locate the beacon device on the floor plan you created in step 3.


STEP 5:

    Add a campaign in Campaign page in CMS. Select the beacon device you created in step 4. 


STEP 6:

    Open SampleApp.xcodeproj



STEP 7:

    In AppDelegate.swift file replace PUT_YOUR_API_KEY_HERE with the API key that you've copied in step 1.


STEP 8:
    
    Build and run SampleApp on the device.

STEP 9:

    Open CMS live map page and see whether you can see Taylor Swift on the floor plan for the application Sample App.
    While the sample app is running you will receive push notifications and popups according to your campaign setup
    In CMS analytics page, you will be able to see heatmap and analytics data in different formats on the floor plan.


Integrating IndoorpinSdk To Your Own Mobile App:

STEP 1:

Drag and drop IndoorpinSDK.framework into your project. 

If your project is a Swift project then add the following import in the swift file where you want to initialize indoorpinSdk:
    #import IndoorpinSdk

If your project is an "Objective C" project then add the following import to the .m file where you want to initialize IndoorpinSdk:
    #import "IndoorpinSdk-Swift.h"


STEP 2:

Create an indoorpin user class as following:

    var user : IPUser = IPUser()

    //user.userId = 235   Fill this if you want to track the customer with your own database customer id. If this is the case, you should set userDB tof your application to YES in CMS

    user.name = "Taylor"
    user.surname = "Swift"
    user.email = "taylorswift@gmail.com"
    user.profileImageUrl = "http://topnews.in/light/files/taylor-swift_6.jpg?1424841363"
    user.gender =  user.IPGENDER_FEMALE

    user.dateOfBirth = "1980-01-30"  // "yyyy-mm-dd"

All of the user data are optional values. If you do not provide name/surname the user will be displayed as anonymous user.
If you want to track your users with the userId that you already have in your own database, then fill in the userId and select userDB=yes for your application in CMS else leave it empty.


STEP 3:

Initialize sdk with the following code:

//PUT_YOUR_API_KEY_HERE  You can see your Api Key in CMS Applications page
IndoorpinSdk.sharedInstance.initialize( "PUT_YOUR_API_KEY_HERE" , userParam: user)



STEP 4:

If you want to add floor plan navigation module create a viewcontroller in your storyboard and in the class/module part of the view controller insert the following:

Class: IPFloorPlanViewController
Module: IndoorpinSdk

This will display the current floor plan with blue circle on it.


STEP 5:

In your project's ini file add the following:

<key>NSLocationAlwaysUsageDescription</key>
<string>Location information will be used to display the campaigns nearby.</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location information will be used to display the campaigns nearby.</string>


At this point, if you test your app, you will be able to see your pop-ups and blue circle on floor plan 


STEP 6:
In AppDelegate file enter the following to didFinishLaunchingWithOptions function:

// This is needed for push notifications
application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound | UIUserNotificationType.Alert |
UIUserNotificationType.Badge, categories: nil
))


STEP 7:
In AppDelegate file enter the following to applicationDidBecomeActive function:

//This is needed to display pop-ups in order which are stacked in the queue when the app was in background
IndoorpinSdk.sharedInstance.applicationDidBecomeActive()


STEP 8:

Enter the following if you need background ibeacon ranging. If you do not add this you will still be able to detect ibeacon signals during enter and exit regions.

In AppDelegate applicationDidEnterBackground:

// Indoorpin,  
//    If you put the following line this app will listen iBeacon signals in the background
//    If you do not put the following line you will be able to listen iBeacons only in Enter and Exit Refions
//    Warning: If you put this piece of code you will receive a lot of questions from Apple Review team
//
    UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({
    })



