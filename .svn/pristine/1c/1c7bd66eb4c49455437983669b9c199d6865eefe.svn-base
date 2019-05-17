//
//  HGHUD.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/10.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompleteBlock)(void);

typedef void(^ResultBlock)(void);

typedef void(^ExecuteBlock)(void);


NS_ASSUME_NONNULL_BEGIN

@interface HGHUD : UIView

@property(nonatomic,weak) NSError *HGResultError;

@property(nonatomic,weak) NSMutableArray *HGResultArray;

@property(nonatomic,weak) NSMutableDictionary *HGResultDict;

- (instancetype)initWithView:(UIView *)ShowView;

#pragma mark - 网络等待视图

- (void) ShowWaiting;

#pragma mark - 网络等待视图消失

- (void) DissmissWaiting;

- (void)ShowWaitWithState:(NSString *)State;

#pragma mark - HUD弹框带文字视图

- (void) ShowWaitWithState:(NSString *)State Complete:(CompleteBlock) complete;

//#pragma mark - HUD弹框带文字视图带完成block

- (void)ShowWaitWithState:(NSString *)State Excute:(ExecuteBlock)Excute Complete:(CompleteBlock)complete;

- (void)ShowToastWithState:(NSString *)State Complete:(CompleteBlock)complete;

@end

NS_ASSUME_NONNULL_END
