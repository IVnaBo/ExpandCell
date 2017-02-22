//
//  HeadView.h
//  ExpandCell
//
//  Created by BO on 17/2/22.
//  Copyright © 2017年 BO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProblemTitleModel;

@protocol HeadViewDelegate <NSObject>

@optional
- (void)clickHeadView:(NSInteger )section;

@end

@interface HeadView : UITableViewHeaderFooterView

@property (nonatomic, strong) ProblemTitleModel *titleGroup;

@property (nonatomic, weak) id<HeadViewDelegate> delegate;

@property (assign,nonatomic)NSInteger sec;

+ (instancetype)headViewWithTableView:(UITableView *)tableView;

@end
