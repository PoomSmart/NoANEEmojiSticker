#define CHECK_TARGET
#import <PSHeader/PS.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <dlfcn.h>

@interface TUIEmojiUpscaler : NSObject
+ (instancetype)sharedInstance;
- (UIImage *)imageFromEmoji:(NSString *)emoji;
@end

%hook UIKeyboardEmojiDraggableView

- (void)generateEmoji:(NSString *)emoji withCompletion:(void (^)(UIImage *, NSError *))completion {
    TUIEmojiUpscaler *upscaler = [%c(TUIEmojiUpscaler) sharedInstance];
    UIImage *image = [upscaler imageFromEmoji:emoji];
    completion(image, nil);
}

%end

%ctor {
    if (isTarget(TargetTypeApps | TargetTypeGenericExtensions)) {
        dlopen("/System/Library/PrivateFrameworks/TextInputUI.framework/TextInputUI", RTLD_NOW);
        %init;
    }
}
