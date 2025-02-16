//
//  sofomo_taskUITestsLaunchTests.m
//  sofomo_taskUITests
//
//  Created by Patryk Gałązka on 14/02/2025.
//

#import <XCTest/XCTest.h>

@interface sofomo_taskUITestsLaunchTests : XCTestCase

@end

@implementation sofomo_taskUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
