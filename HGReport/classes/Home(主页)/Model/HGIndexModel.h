//
//  HGIndexModel.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/22.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGIndexModel : NSObject

@property(nonatomic,assign) NSInteger *articleId;

@property(nonatomic,copy) NSString *articleTitle;

@property(nonatomic,copy) NSString *articleLink;

@property(nonatomic,assign) NSInteger *articlePlatform;

@property(nonatomic,assign) NSInteger *articleCategory;

@property(nonatomic,copy) NSString *articleDescript;

@property(nonatomic,copy) NSString *articleBody;

@property(nonatomic,copy) NSString *articleImage;

@property(nonatomic,copy) NSString *createTime;

@property(nonatomic,copy) NSString *updateTime;


@end

NS_ASSUME_NONNULL_END
