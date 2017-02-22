//
//  ViewController.m
//  ExpandCell
//
//  Created by BO on 17/2/22.
//  Copyright © 2017年 BO. All rights reserved.
//

#import "ViewController.h"
#import "HeadView.h"
#import "ProblemTitleModel.h"
#include "ExpTabviewCell.h"
static NSString * identify = @"view";
#define Iphone_W [UIScreen mainScreen].bounds.size.width
#define Iphone_H [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,HeadViewDelegate>

@property(strong,nonatomic)UITableView * exp_tab;
@property(strong,nonatomic)NSMutableArray * exp_Arr;
@property(strong,nonatomic)UIButton * btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString*path = [[NSBundle mainBundle]pathForResource:@"problemCenter" ofType:@"plist"];
    NSArray * arr = [NSArray arrayWithContentsOfFile:path];
 
    for (NSDictionary * dic in arr) {
        ProblemTitleModel * model = [[ProblemTitleModel alloc]initWithDic:dic];
        [self.exp_Arr addObject:model];
    }
    
    self.exp_tab.sectionHeaderHeight = 50;
    [self.exp_tab registerNib:[UINib nibWithNibName:@"ExpTabviewCell" bundle:nil] forCellReuseIdentifier:identify];
    [self.view addSubview:self.exp_tab];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeadView *headView = [HeadView headViewWithTableView:tableView];
    ProblemTitleModel * tm     = self.exp_Arr[section];
    headView.titleGroup = tm;
    headView.sec = section;
    headView.delegate = self;
    
    return headView;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProblemTitleModel * tm     =self.exp_Arr[indexPath.section];
    NSString * content = tm.answers;
    UIFont * font = [UIFont systemFontOfSize:14];
    NSDictionary * totalMoneydic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGSize totalMoneySize =[content boundingRectWithSize:CGSizeMake(Iphone_W-16,1000) options:NSStringDrawingUsesLineFragmentOrigin  attributes:totalMoneydic context:nil].size;
    return totalMoneySize.height+20;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.exp_Arr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ProblemTitleModel * tM = self.exp_Arr[section];
    if (tM.isOpened) {
        return 1;
    }else{
        return 0;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExpTabviewCell * cell =  [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[ExpTabviewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identify];
    }
    ProblemTitleModel * tM = self.exp_Arr[indexPath.section];
    cell.TextLab.text = tM.answers;
    return cell;
}

- (void)clickHeadView:(NSInteger)section
{
    //刷新整组数据...
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
   
    [self.exp_tab reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}
/**
;
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableView *)exp_tab
{
    if (!_exp_tab) {
        _exp_tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, Iphone_W, Iphone_H-40) style:UITableViewStylePlain];
        _exp_tab.delegate = self;
        _exp_tab.dataSource = self;
    }
    return _exp_tab;
}

-(NSMutableArray *)exp_Arr
{
    if (!_exp_Arr) {
        _exp_Arr = [NSMutableArray array];
    }
    return _exp_Arr;
}

@end
