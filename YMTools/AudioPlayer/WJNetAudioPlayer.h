//
//  WJNetAudioPlayer.h
//  MusicStreamer
//
//  Created by 幻想无极（谭启宏） on 16/8/31.
//  Copyright © 2016年 幻想无极（谭启宏）. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**网络音频播放器*/
@interface WJNetAudioPlayer : NSObject

- (instancetype)initWithUrl:(NSURL *)url;

@property (strong, nonatomic) void (^progressBlock)(CGFloat f,NSString *loadTime,NSString *totalTime);
@property (strong, nonatomic) void (^errorBlock)(NSString *errorStr);

- (void)play;

- (void)pause;

- (void)stop;

@end
