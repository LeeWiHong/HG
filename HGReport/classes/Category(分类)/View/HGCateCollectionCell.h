//
//  HGCateCollectionCell.h
//  HGReport
//
//  Created by LeeWiHong on 2019/5/21.
//  Copyright © 2019 com.360arrow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HGCateModel;

NS_ASSUME_NONNULL_BEGIN

@interface HGCateCollectionCell : UICollectionViewCell

@property(nonatomic,weak) HGCateModel *CateModel;

@end

NS_ASSUME_NONNULL_END
