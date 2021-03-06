%本報告使用了多重鍵盤輸入，參考了以下網址：
%https://yuchungchuang.wordpress.com/2017/08/07/matlab-%E5%A4%9A%E9%87%8D%E6%8C%89%E9%8D%B5%E4%BA%8B%E4%BB%B6%E7%9A%84%E8%99%95%E7%90%86keypressfcn/

%待做--------------------------------------------------------------待做
%待做--------------------------------------------------------------待做
%待做--------------------------------------------------------------待做
%待做--------------------------------------------------------------待做

%改掉雙方攻擊的 lag 修改 Ispress.space 指令，修復 lag
%加入 BOSS
%加入玩家強制終止鍵
%加入遊戲介紹文

%待做--------------------------------------------------------------待做
%待做--------------------------------------------------------------待做
%待做--------------------------------------------------------------待做
%待做--------------------------------------------------------------待做


function original_game()

    %% 遊戲基礎盤面設計:
    % 黑色區塊範圍為 (0:3,0:3)，即主遊戲區塊
    % 左上側灰色部分將用來計時與計算分數
    
    fig = figure('KeyPressFcn',@kpfcn,'KeyReleaseFcn',@krfcn,'Name','Original Game');
    
    colordef(fig,'black');
    axis([0 3 0 3]);
    set(gca,'xtick',[],'xticklabel',[]);
    set(gca,'ytick',[],'yticklabel',[]);
    box on;
    
    hold on;
    
   
    
    
    %% 加入槍枝(即第一視角之玩家)
    % 玩家即是一把會 '左右' 移動的槍枝
    % 控制左右移動就只是簡單的按左右方向鍵
    % 發射子彈是利用 '空白鍵'  (但要切成 "英文輸入" )
    % 玩家所擁有的資訊: 1. 血量  2. 子彈數目  3. 子彈攻擊力  4. 槍枝位置 (x,y)  5. 分數
    % 初始玩家血量為: 20 
    % 子彈數目: 15，但是打完一隻怪物將可額外獲得 怪物血量 顆子彈
    % 子彈攻擊力: 目前皆為 1 ，但是未來可考慮隨機生成 1 或 2 的攻擊力
    % 槍枝位置: 初始位置: (1.5,0) ，隨著左右鍵盤鍵而改變
    % 分數: 初始值為零，每打死一隻怪物，獲得 怪物血量 分數
    % player=[blood_Val, bullet_Num, attack_Val, gun_xPosition, gun_yPosition, score]
    
    player=[20,15,1,1.5,0,0];
    
    gun=scatter(player(4),player(5),800,'s','g','filled');
    
    %玩家資訊
    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
    player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
    game_status=2; % 初始遊戲狀態 v.s. game_status=1 指的是 過了某一個關卡
    
    
    %開始遊戲
    while game_status==1 || game_status==2
            %% 加入射擊之目標物
            % 目標物理應要有 1. 血量  2. 分數  3. 攻擊力  4. 位置(x,y)
            % 攻擊力目前有兩種怪物，藍色怪物具有隨機 1-3 之攻擊力，紅色怪物沒有攻擊力
            % 目標物位置目前是定點，待基本運算及操作完成，再加以考慮會動的目標物
            %假設目前一次出現三個目標物
            % monster_Name=[blood_Val, score, attack_Val, x_Position, y_Position]
            %red_Monster=[10,10,0,ii-0.5,2.5]
            %blue_Monster=[15,15,randi([1 3]),ii-0.5,2.5]
        
        %過了某一輪關卡，給予獎勵，子彈加五，分數加十
        if game_status==1
            player(6)=player(6)+10;
            player(2)=player(2)+5;
        end
         
        
        %更新顯示資訊
        delete(bullet_num);
        delete(player_score);
        delete(player_blood);
        bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
        player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
        player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
        
        %兩種不同的怪物(藍色 OR 紅色)隨機生成三隻
        monster=[];
        
        for ii=1:3 
            red_Monster=[10,10,0,ii-0.5,2.5];
            blue_Monster=[15,15,randi([1 3]),ii-0.5,2.5];
            if randi([1 2])==1 %決定哪一種怪物被生成
                monster=[monster;red_Monster];
            else
                monster=[monster;blue_Monster];
            end
        end
        
        
        %判斷要用甚麼顏色畫怪物 (藍 FOR 藍 ，紅 FOR 紅)
        if monster(1,1)==10 
            monster1=scatter(monster(1,4),monster(1,5),1000,'s','r','filled');
        else
            monster1=scatter(monster(1,4),monster(1,5),1000,'s','b','filled');
        end
        
        
        if monster(2,1)==10
            monster2=scatter(monster(2,4),monster(2,5),1000,'s','r','filled');
        else
            monster2=scatter(monster(2,4),monster(2,5),1000,'s','b','filled');
        end
        
        if monster(3,1)==10
            monster3=scatter(monster(3,4),monster(3,5),1000,'s','r','filled');
        else
            monster3=scatter(monster(3,4),monster(3,5),1000,'s','b','filled');
        end
        
        %顯示怪物血量
        monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
        monster2_blood=text(monster(2,4)-0.05,monster(2,5),num2str(monster(2,1)));
        monster3_blood=text(monster(3,4)-0.05,monster(3,5),num2str(monster(3,1)));
        
        %attack_status1,2,3 = 1: 表示怪物 1,2,3 可以繼續被攻擊，等於零則否
        attack_status1=1;
        attack_status2=1;
        attack_status3=1;
        
        % attack_flag 怪物尚未舉起反攻的號角(限 藍色怪物)
        %attack_powers 怪物蓄力區，超過三十則攻擊(限 藍色怪物)
        attack_flag=0;
        attack_powers=0;
    
         %% 讓槍枝移動
         %可以用 '左方向鍵' '右方向鍵' 控制槍枝(即 綠色方塊) 移動
         %空白鍵 (切記：要切換到英文輸入鍵盤)為發射按鈕
         %Ispress 是個 structure，儲存哪個鍵被我按到，或放開 (會用到 figure 裡的屬性
         %'KeyPressFcn','KeyReleaseFcn')
        IsPress.rightarrow = false;
        IsPress.leftarrow = false;
        IsPress.space=false;
    
        %目前使用無限迴圈，未來可以考慮加入計時器，但是如若沒有子彈、或是血量為零則遊戲結束，將自動跳出迴圈
        while true
        
            if IsPress.rightarrow
                gun.XData = gun.XData + 0.01; % gun 是 figure 裡的物件，可以取出他的即時資訊做事
            end
            if IsPress.leftarrow
                gun.XData = gun.XData - 0.01;
            end
        
            if IsPress.space
            
                bullet=scatter(gun.XData,gun.YData,50,'y','filled'); %攻擊生效
                player(2)=player(2)-1; %子彈減一
                
                %更新子彈數目資訊
                delete(bullet_num); 
                bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                
                %讓子彈移動
                while bullet.YData<=2.5 
                    bullet.YData=bullet.YData+0.1;
                    pause(0.01)
                end
                
                %到達則消失
                delete(bullet);
                
                %攻擊到左邊第一隻怪物
                if attack_status1 && gun.XData<=monster1.XData+0.15 && gun.XData>=monster1.XData-0.1
               
                    monster(1,1)=monster(1,1)-1;
                    delete(monster1_blood);
                    monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
                    
                    %怪物死掉更新資訊 
                    if monster(1,1)<=0 %怪物血量歸零
                        delete(monster1);
                        delete(monster1_blood);
                        %player(1)=player(1)+5;
                        player(2)=player(2)+monster(1,2); %拿取子彈數目獎勵
                        player(6)=player(6)+monster(1,2); %拿取玩家分數
                        
                        %更新子彈數目 及 玩家分數 資訊
                        delete(bullet_num);
                        delete(player_score);
                        player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                        bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                        
                        %怪物喪失戰鬥意志
                        attack_status1=0;
                    end
                        
                    
                elseif attack_status2 && gun.XData<=monster2.XData+0.15  && gun.XData>=monster2.XData-0.1
               
                    monster(2,1)=monster(2,1)-1;
                    delete(monster2_blood);
                    monster2_blood=text(monster(2,4)-0.05,monster(2,5),num2str(monster(2,1)));
                    
                    if monster(2,1)<=0
                        delete(monster2);
                        delete(monster2_blood);
                        %player(1)=player(1)+5;
                        player(2)=player(2)+monster(2,2);
                        player(6)=player(6)+monster(2,2);
                        delete(bullet_num);
                        delete(player_score);
                        player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                        bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                        attack_status2=0;
                    end
                    
                elseif attack_status3 && gun.XData<=monster3.XData+0.15 && gun.XData>=monster3.XData-0.1
               
                    monster(3,1)=monster(3,1)-1;
                    delete(monster3_blood);
                    monster3_blood=text(monster(3,4)-0.05,monster(3,5),num2str(monster(3,1)));
                    
                    if monster(3,1)<=0
                        delete(monster3);
                        delete(monster3_blood);
                        %player(1)=player(1)+5;
                        player(2)=player(2)+monster(3,2);
                        player(6)=player(6)+monster(3,2);
                        delete(player_score);
                        player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                        delete(bullet_num);
                        bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                        attack_status3=0;
                    end
                    
                end
                
                
                %刷完這一大關 (三個怪物都死去)
                if monster(1,1)<=0 && monster(2,1)<=0 && monster(3,1)<=0 
                    delete(monster1);
                    delete(monster1_blood);
                    delete(monster2);
                    delete(monster2_blood);
                    delete(monster3);
                    delete(monster3_blood);
                    game_status=1;
                    break;
                end
                
                %檢查是否遊戲結束
                if player(2)<=0|| player(1)<=0
                    game_status=0;
                    game_Over=text(0.8,1.5,'Game Over','Color','red','Fontsize',30);
                    break;
                end
            
            end
            
            %檢查遊戲是否結束
            if game_status==0
                break;
            end
            
            
            % Enermy attack
           if attack_flag
                if attack_status1 && monster(1,3)>0  %如若怪物具有攻擊力，則開始攻擊
                    enermy_Bullet=scatter(monster(1,4),monster(1,5),50,'r','filled');
                    while enermy_Bullet.YData>=0 
                        enermy_Bullet.YData=enermy_Bullet.YData-0.07;
                        
                        
                        if IsPress.rightarrow
                            gun.XData = gun.XData + 0.01;
                        end
                        if IsPress.leftarrow
                            gun.XData = gun.XData - 0.01;
                        end
                        
                        
                        if IsPress.space
                            
                            bullet=scatter(gun.XData,gun.YData,50,'y','filled');
                            
                            player(2)=player(2)-1;
                            delete(bullet_num);
                            bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                            while bullet.YData<=2.5 
                                bullet.YData=bullet.YData+0.06;
                                pause(0.01)
                            end
                            
                            delete(bullet);
                            
                            if attack_status1 && gun.XData<=monster1.XData+0.15 && gun.XData>=monster1.XData-0.1 
               
                                monster(1,1)=monster(1,1)-1;
                                delete(monster1_blood);
                                monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
                    
                                if monster(1,1)<=0
                                    delete(monster1);
                                    delete(monster1_blood);
                                    player(1)=player(1)+2;
                                    player(2)=player(2)+monster(1,2);
                                    player(6)=player(6)+monster(1,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status1=0;
                                end
                        
                    
                            elseif attack_status2 && gun.XData<=monster2.XData+0.15  && gun.XData>=monster2.XData-0.1
               
                                monster(2,1)=monster(2,1)-1;
                                delete(monster2_blood);
                                monster2_blood=text(monster(2,4)-0.05,monster(2,5),num2str(monster(2,1)));
                    
                                if monster(2,1)<=0
                                    delete(monster2);
                                    delete(monster2_blood);
                                    %player(1)=player(1)+5;
                                    player(2)=player(2)+monster(2,2);
                                    player(6)=player(6)+monster(2,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status2=0;
                                end
                    
                            elseif attack_status3 && gun.XData<=monster3.XData+0.15 && gun.XData>=monster3.XData-0.1
               
                                monster(3,1)=monster(3,1)-1;
                                delete(monster3_blood);
                                monster3_blood=text(monster(3,4)-0.05,monster(3,5),num2str(monster(3,1)));
                    
                                if monster(3,1)<=0
                                    delete(monster3);
                                    delete(monster3_blood);
                                    %player(1)=player(1)+2;
                                    player(2)=player(2)+monster(3,2);
                                    player(6)=player(6)+monster(3,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status3=0;
                                end
                    
                            end
            
                            if monster(1,1)<=0 && monster(2,1)<=0 && monster(3,1)<=0 
                                delete(monster1);
                                delete(monster1_blood);
                                delete(monster2);
                                delete(monster2_blood);
                                delete(monster3);
                                delete(monster3_blood);
                                game_status=1;
                                break;
                            end
                            if player(2)<=0|| player(1)<=0
                                game_status=0;
                                game_Over=text(0.8,1.5,'Game Over','Color','red','Fontsize',30);
                                break;
                            end
            
                        end
                        
                        
                        if game_status==0
                            break;
                        end
                        
                        
                        pause(0.01);
                    end
                    
                    if monster(1,4)>=gun.XData-0.1 && monster(1,4)<=gun.XData+0.15
                        player(1)=player(1)-monster(1,3);
                        delete(player_blood);
                        player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
                    end
                    
                    delete(enermy_Bullet);
                end
                if attack_status2 && monster(2,3)>0
                    enermy_Bullet=scatter(monster(2,4),monster(2,5),50,'r','filled');
                    while enermy_Bullet.YData>=0 
                        enermy_Bullet.YData=enermy_Bullet.YData-0.07;
                        if IsPress.rightarrow
                            gun.XData = gun.XData + 0.01;
                        end
                        if IsPress.leftarrow
                            gun.XData = gun.XData - 0.01;
                        end
                        
                        
                        if IsPress.space
            
                            bullet=scatter(gun.XData,gun.YData,50,'y','filled');
                            player(2)=player(2)-1;
                            delete(bullet_num);
                            bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                            while bullet.YData<=2.5 
                                bullet.YData=bullet.YData+0.06;
                                pause(0.01)
                            end
            
                            delete(bullet);
            
                            if attack_status1 && gun.XData<=monster1.XData+0.15 && gun.XData>=monster1.XData-0.1
               
                                monster(1,1)=monster(1,1)-1;
                                delete(monster1_blood);
                                monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
                    
                                if monster(1,1)<=0
                                    delete(monster1);
                                    delete(monster1_blood);
                                    %player(1)=player(1)+5;
                                    player(2)=player(2)+monster(1,2);
                                    player(6)=player(6)+monster(1,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status1=0;
                                end
                        
                    
                            elseif attack_status2 && gun.XData<=monster2.XData+0.15  && gun.XData>=monster2.XData-0.1
               
                                monster(2,1)=monster(2,1)-1;
                                delete(monster2_blood);
                                monster2_blood=text(monster(2,4)-0.05,monster(2,5),num2str(monster(2,1)));
                    
                                if monster(2,1)<=0
                                    delete(monster2);
                                    delete(monster2_blood);
                                    player(1)=player(1)+2;
                                    player(2)=player(2)+monster(2,2);
                                    player(6)=player(6)+monster(2,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status2=0;
                                end
                    
                            elseif attack_status3 && gun.XData<=monster3.XData+0.15 && gun.XData>=monster3.XData-0.1
               
                                monster(3,1)=monster(3,1)-1;
                                delete(monster3_blood);
                                monster3_blood=text(monster(3,4)-0.05,monster(3,5),num2str(monster(3,1)));
                    
                                if monster(3,1)<=0
                                    delete(monster3);
                                    delete(monster3_blood);
                                    %player(1)=player(1)+5;
                                    player(2)=player(2)+monster(3,2);
                                    player(6)=player(6)+monster(3,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status3=0;
                                end
                    
                            end
            
                            if monster(1,1)<=0 && monster(2,1)<=0 && monster(3,1)<=0 
                                delete(monster1);
                                delete(monster1_blood);
                                delete(monster2);
                                delete(monster2_blood);
                                delete(monster3);
                                delete(monster3_blood);
                                game_status=1;
                                break;
                            end
                            if player(2)<=0|| player(1)<=0
                                game_status=0;
                                game_Over=text(0.8,1.5,'Game Over','Color','red','Fontsize',30);
                                break;
                            end
            
                        end
                        
                        
                        if game_status==0
                            break;
                        end
                        
                        pause(0.01);
                    end
                    if monster(2,4)>=gun.XData-0.1 && monster(2,4)<=gun.XData+0.15
                        player(1)=player(1)-monster(2,3);
                        delete(player_blood);
                        player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
                    end
                    delete(enermy_Bullet);
                end
                if attack_status3 && monster(3,3)>0
                    enermy_Bullet=scatter(monster(3,4),monster(3,5),50,'r','filled');
                    while enermy_Bullet.YData>=0 
                        enermy_Bullet.YData=enermy_Bullet.YData-0.07;
                        if IsPress.rightarrow
                            gun.XData = gun.XData + 0.01;
                        end
                        if IsPress.leftarrow
                            gun.XData = gun.XData - 0.01;
                        end
                        
                        
                        if IsPress.space
            
                            bullet=scatter(gun.XData,gun.YData,50,'y','filled');
                            player(2)=player(2)-1;
                            delete(bullet_num);
                            bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                            while bullet.YData<=2.5 
                                bullet.YData=bullet.YData+0.06;
                                pause(0.01)
                            end
            
                            delete(bullet);
            
                            if attack_status1 && gun.XData<=monster1.XData+0.15 && gun.XData>=monster1.XData-0.1
               
                                monster(1,1)=monster(1,1)-1;
                                delete(monster1_blood);
                                monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
                    
                                if monster(1,1)<=0
                                    delete(monster1);
                                    delete(monster1_blood);
                                    %player(1)=player(1)+5;
                                    player(2)=player(2)+monster(1,2);
                                    player(6)=player(6)+monster(1,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status1=0;
                                end
                        
                    
                            elseif attack_status2 && gun.XData<=monster2.XData+0.15  && gun.XData>=monster2.XData-0.1
               
                                monster(2,1)=monster(2,1)-1;
                                delete(monster2_blood);
                                monster2_blood=text(monster(2,4)-0.05,monster(2,5),num2str(monster(2,1)));
                    
                                if monster(2,1)<=0
                                    delete(monster2);
                                    delete(monster2_blood);
                                    %player(1)=player(1)+5;
                                    player(2)=player(2)+monster(2,2);
                                    player(6)=player(6)+monster(2,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status2=0;
                                end
                    
                            elseif attack_status3 && gun.XData<=monster3.XData+0.15 && gun.XData>=monster3.XData-0.1
               
                                monster(3,1)=monster(3,1)-1;
                                delete(monster3_blood);
                                monster3_blood=text(monster(3,4)-0.05,monster(3,5),num2str(monster(3,1)));
                    
                                if monster(3,1)<=0
                                    delete(monster3);
                                    delete(monster3_blood);
                                    player(1)=player(1)+2;
                                    player(2)=player(2)+monster(3,2);
                                    player(6)=player(6)+monster(3,2);
                                    delete(player_score);
                                    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                                    delete(bullet_num);
                                    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                                    attack_status3=0;
                                end
                    
                            end
            
                            if monster(1,1)<=0 && monster(2,1)<=0 && monster(3,1)<=0 
                                delete(monster1);
                                delete(monster1_blood);
                                delete(monster2);
                                delete(monster2_blood);
                                delete(monster3);
                                delete(monster3_blood);
                                game_status=1;
                                break;
                            end
                            if player(2)<=0 || player(1)<=0
                                game_status=0;
                                game_Over=text(0.8,1.5,'Game Over','Color','red','Fontsize',30);
                                break;
                            end
            
                        end
                        
                        
                        
                        if game_status==0
                            break;
                        end
                        
                        pause(0.01);
                    end
                    if monster(3,4)>=gun.XData-0.1 && monster(3,4)<=gun.XData+0.15
                        player(1)=player(1)-monster(3,3);
                        delete(player_blood);
                        player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
                    end
                    delete(enermy_Bullet);
                end
                attack_powers=0;
           end
           
           if game_status==0
                break;
            end
           
            attack_flag=0;
            attack_powers=attack_powers+1;
            
            if attack_powers>=30
                attack_flag=1;
            end
            if player(2)<=0 || player(1)<=0
                game_status=0;
                game_Over=text(0.8,1.5,'Game Over','Color','red','Fontsize',30);
                break;
            end
            

            pause(0.01)
        end
    end
    
    
    function krfcn(obj,event)
        IsPress.(event.Key) = false;
    end
 
    function kpfcn(obj,event)
        IsPress.(event.Key) = true;
    end
    

end