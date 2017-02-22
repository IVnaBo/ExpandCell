//
//  ProblemTitleModel.h
//  ExpandCell
//
//  Created by BO on 17/2/22.
//  Copyright © 2017年 BO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemTitleModel : NSObject

@property (nonatomic, assign, getter = isOpened) BOOL opened;

@property (copy,nonatomic)NSString *title;

@property (copy,nonatomic)NSString *answers;


-(instancetype)initWithDic:(NSDictionary *)dic;
@end
