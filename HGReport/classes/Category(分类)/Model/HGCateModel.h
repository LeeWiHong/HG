//
//  HGCateModel.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/21.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGCateModel : NSObject

@property(nonatomic,assign) NSInteger *categoryId;

@property(nonatomic,copy) NSString *categoryName;

@property(nonatomic,copy) NSString *categoryImage;

@property(nonatomic,assign) NSInteger *categoryType;

@property(nonatomic,copy) NSString *Description;

@property(nonatomic,copy) NSString *createTime;

@property(nonatomic,copy) NSString *updateTime;

@end

NS_ASSUME_NONNULL_END
