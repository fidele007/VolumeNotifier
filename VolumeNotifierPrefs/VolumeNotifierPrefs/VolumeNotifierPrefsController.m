//
//  VolumeNotifierPrefsController.m
//  VolumeNotifierPrefs
//
//  Created by Zheng on 11/8/14.
//  Copyright (c) 2014 XunYing Inc. All rights reserved.
//

#import <VolumeNotifierPrefsController.h>
#import <Preferences/Preferences.h>
#import "SettingsKit/SKListControllerProtocol.h"
#import "SettingsKit/SKTintedListController.h"
#import "SettingsKit/SKSharedHelper.h"
#import <Preferences/PSSpecifier.h>

#define kUrl_VisitWebSite @"http://82flex.com"
#define kUrl_MakeDonation @"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=g1ghell@163.com&item_name=zsm1703"
#define kUrl_MailTo @"i.82@me.com"
#define kUrl_MailSubject @"VolumeNotifier"
#define kUrl_Twitter @"82flexofficial"

@implementation VolumeNotifierPrefsController

- (UIColor*) tintColor {
    int r = 0;
    int g = 0;
    int b = 0;
    return [UIColor colorWithRed: r / 255.0f green: g / 255.0f blue: b / 255.0f alpha: 1.0f];
}

- (BOOL) showHeartImage { return NO; }

- (NSString*) headerText { return @"VolumeNotifier"; }

- (NSString*) headerSubText { return @"By i_82"; }

- (NSString*) customTitle { return @"VolumeNotifier"; }

- (NSArray *) customSpecifiers {
    return @[
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Switch",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enabled",
                    @"default" : @YES,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"mainSwitch"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enabled When Playing",
                    @"default" : @YES,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableWhenPlaying"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enabled in CC",
                    @"default" : @YES,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableCC"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"If there is no music app in background, the sound effect in \"Volume\" will be consistent with the \"Ringer\"."
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Addition",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enable Vibrate",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableVib"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Enable Flashlight",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"enableFlash"
                    },
                @{
                    @"cell" : @"PSSwitchCell",
                    @"label" : @"Block Volume HUD",
                    @"default" : @NO,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"blockHUD"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"You can turn off the flashlight from CC."
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Sound Effect",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSLinkListCell",
                    @"label" : @"Built-in",
                    @"default" : @1,
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"built-in",
                    @"detail" : @"PSListItemsController",
                    @"validTitles" : @[
                            @"Yosemite",
                            @"Beep",
                            @"Tink",
                            @"Morse",
                            @"Ping",
                            @"Pop",
                            @"Mavericks"
                        ],
                    @"validValues" :@[
                            @1,
                            @2,
                            @3,
                            @4,
                            @5,
                            @6,
                            @7
                        ]
                    },
                @{
                    @"cell" : @"PSEditTextCell",
                    @"label" : @"Custom",
                    @"default" : @"",
                    @"defaults" : @"com.darwindev.VolumeNotifier",
                    @"PostNotification" : @"com.darwindev.VolumeNotifier-preferencesChanged",
                    @"key" : @"soundName",
                    @"placeholder" : @"sound.caf"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"Leave the Custom Sound Name empty to use Built-in sound.\nCustom Sounds should be placed at /System/Library/Audio/UISounds/VolumeNotifier."
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"label" : @"Support",
                    @"isStaticText" : @YES
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Follow @82FlexOfficial",
                    @"icon" : @"twitter.png",
                    @"action" : @"followOnTwitter:"
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Visit 82Flex.com",
                    @"icon" : @"enabled.png",
                    @"action" : @"visitWebSite:"
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Give suggestions",
                    @"icon" : @"support.png",
                    @"action" : @"giveAdvice:"
                    },
                @{
                    @"cell" : @"PSButtonCell",
                    @"label" : @"Donate to 82Flex",
                    @"icon" : @"paypal.png",
                    @"action" : @"makeDonation:"
                    },
                @{
                    @"cell" : @"PSGroupCell",
                    @"footerText" : @"VolumeNotifier © 2014 82Flex.com"
                    }
            ];
}

- (void) followOnTwitter:(PSSpecifier*)specifier {
    [SKSharedHelper openTwitter:kUrl_Twitter];
}

- (void) visitWebSite:(PSSpecifier*)specifier {
    [SKSharedHelper openWebSite:kUrl_VisitWebSite];
}

- (void) giveAdvice:(PSSpecifier*)specifier {
    [SKSharedHelper openEmail:kUrl_MailTo subject:kUrl_MailSubject];
}

- (void) makeDonation:(PSSpecifier *)specifier {
    [SKSharedHelper openWebSite:kUrl_MakeDonation];
}

@end