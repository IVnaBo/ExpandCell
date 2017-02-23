# ExpandCell
单元格的伸展与收缩
![示例](http://g.recordit.co/k3ynkfd4Wu.gif)   
```
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ProblemTitleModel * tM = self.exp_Arr[section];
    if (tM.isOpened) {
        return 1;
    }else{
        return 0;
    }
    
}
```
   _______ 
   ```
- (void)clickHeadView:(NSInteger)section
{
    //刷新整组数据...
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
   
    [self.exp_tab reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}
```
