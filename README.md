*Shooting Game* 
==========

程式碼下載
-------------
請使用者下載　**_Shooting_Game.m_**　，直接執行程式即可。

(建議使用充著電源的筆電進行遊戲，體驗較佳)

-----------------------------------------------------
遊戲規則
-------------

* _盤　　面_　　黑色區域為遊戲範圍
* _玩　　家_　　綠色槍枝
* _按　　鍵_　　可利用 **左右鍵** 控制槍枝移動，**空白鍵**為攻擊
* _注　　意_　　請將鍵盤輸入改為**英文**輸入
* _離　　開_　　離開請按**e**
* _敵　　人_　　分為三種敵人
  * 紅色低級怪物
  * 藍色中級怪物
  * 白色高階雪怪
* _結　束　條　件_
  * 玩家按下 按鍵**e**
  * 玩家子彈歸零，但怪物血量尚未歸零
  * 玩家血量歸零，但怪物血量尚未歸零
  
-------------------------------------------
遊戲基本資訊
---------------
 ### _初　始　玩　家　資　訊_
 1. 血量：20
 2. 子彈數目：15
 3. 子彈攻擊力：1
 4. 槍枝位置：正中間
 5. 分數統計：0
 
 ### _怪　物　資　訊_
  #### _紅　色　怪　物　資　訊_
  1. 觸發程序：基礎遊戲盤面
  2. 血量：10
  3. 擊敗後分數：10
  4. 怪物攻擊力：0 (即它不會發射子彈)
  5. 出現位置：定點，隨機生成在上半部三個位置
  6. 擊殺獎勵：10顆子彈
  
  #### _藍　色　怪　物　資　訊_
  1. 觸發程序：基礎遊戲盤面
  2. 血量：15
  3. 擊敗後分數：15
  4. 怪物攻擊力：1 到 3 隨機生成
  5. 出現位置：定點，隨機生成在上半部三個位置
  6. 擊殺獎勵：15顆子彈 + 3滴血量
 
  #### _白　色　怪　物　資　訊_
  1. 觸發程序：血量與子彈到達一定數目 (血量：30 子彈數目：50 兩場Boss之間必須隔三場基礎盤面遊戲)
  2. 血量：45
  3. 擊敗後分數：50
  4. 怪物攻擊力：5
  5. 出現位置：初始在中間，之後會左右規律移動
  6. 擊殺獎勵：45顆子彈 + 10滴血量
  
-----------------------------------------------------------  
遊戲介面介紹
----------------------------------

### _進　入　遊　戲_
左右鍵可以使綠色槍枝移動，空白鍵則為發射子彈，但是必須切換為英文輸入空白鍵才可以發射子彈。

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/gameStart.png)

### _基　礎　遊　戲　關　卡　介　面_
黑色盤面為玩家遊戲範圍。
紅色或藍色怪物上的數字是怪物的血量，每打到一次怪物會更新一次血量；
左上角則顯示玩家所剩子彈之數量，以及玩家分數；右上角則是顯示玩家血量。

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/inGame.png)

### _藍　色　怪　物　發　射　紅　色　子　彈_
藍色怪物會定時發射出紅色子彈，子彈攻擊力跟著怪物一起隨機從1到3生成。

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/bulletAni1.gif)

### _綠　色　槍　枝　發　射　黃　色　子　彈_
若是玩家按下空白鍵，則綠色槍枝會發射黃色子彈，玩家子彈數量減一。

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/bothBullet.png)

### _進入到 Boss 副本_
當玩家 血量到達30、子彈數目到達50，則會進入到 白色怪物 Boss 副本

系統提示使用者　已進入到　White　Boss　副本，並且閃爍三次提示

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/whiteBoss_systemAnn.png)

系統獎勵給予玩家有提高攻擊力的機會，一顆子彈的攻擊力將會隨機生成，範圍為1到3

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/newAttack.png)

系統提示使用者遊戲即將開始

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/inBoss.png)

白色怪物是會移動的怪物，讓使用者必須追著怪物跑並發射子彈

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/bossMoveAni1.gif)

觸發白色怪物攻擊手段：使用者起動攻擊兩次

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/bossAttack.png)

結束白色怪物副本，會回到基本遊戲基礎版面

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/Endboss.png)

### _觸　發　結　束　遊　戲_

使用者若觸及按鍵**e**則跳出遊戲，系統公告顯示:　**_End the game_**

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/EndTheGame.png)

若玩家血量歸零，或者子彈歸零，但是怪物尚未被擊敗，則系統公告顯示:　**_Game　Over_**

![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/GameOver.png)

---------------------------------------------------------------------------------------
程式碼遭遇問題與解決方法
----------------

### _問　題　1_
##### **遊戲盤面怎麼設計，使玩家玩起來是舒適的?**

**_Ans:_**

利用　colordef　和　axis　的基礎設定，再加上　box　on　即可讓盤面看起來是舒適的。

程式碼如下：

```matlab
    fig = figure('KeyPressFcn',@kpfcn,'KeyReleaseFcn',@krfcn,'Name','Original Game');
    colordef(fig,'black');
    axis([0 3 0 3]);
    set(gca,'xtick',[],'xticklabel',[]);
    set(gca,'ytick',[],'yticklabel',[]);
    box on;
    hold on;
```

### _問　題　2_
##### **圖上的物件要怎麼讓它消失? (如系統公告、死去的怪物等等)**

**_Ans:_**

在顯示物件(此程式皆使用scatter)時，把那個物件命名，等要讓它消失時，就用delete函數將他從圖上去除。

程式碼範例:

```matlab
    %置放物件在圖上(此例為系統公告玩家基本資訊)
    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
    player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
    
    %去除物件
    delete(bullet_num);
    delete(player_score);
    delete(player_blood);

```

### _問　題　3_
##### **怎麼讓系統公告閃爍提醒?**

**_Ans:_**

利用scatter或者text和delete交互使用，適時加入pause讓系統公告維持在畫面一下子，照成閃爍的效果。

程式碼範例:

```matlab
        for ii=1:3
            system_announcement=text(0.3,1.5,'!! WHITE  BOSS  !!','Color','red','Fontsize',30);
            pause(0.8);
            delete(system_announcement);
            pause(0.8);
        end
```

### _問　題　4_
##### **怎樣可以邊攻擊邊移動槍枝?**

**_Ans:_**

參考網路上別人的程式碼，如何使用多重按鍵控制物件移動。

網址:

https://yuchungchuang.wordpress.com/2017/08/07/matlab-%E5%A4%9A%E9%87%8D%E6%8C%89%E9%8D%B5%E4%BA%8B%E4%BB%B6%E7%9A%84%E8%99%95%E7%90%86keypressfcn/

程式碼範例:
```matlab   
    fig = figure('KeyPressFcn',@kpfcn,'KeyReleaseFcn',@krfcn);
    ball = scatter(1,1,100,'r','filled');
    axis([0 3 0 3])
    IsPress.uparrow = false;
    IsPress.downarrow = false;
    IsPress.rightarrow = false;
    IsPress.leftarrow = false;
    while true
        if IsPress.uparrow
            ball.YData = ball.YData + 0.1;
        end
        if IsPress.downarrow
            ball.YData = ball.YData - 0.1;
        end
        if IsPress.rightarrow
            ball.XData = ball.XData + 0.1;
        end
        if IsPress.leftarrow
            ball.XData = ball.XData - 0.1;
        end
        pause(0.01)
    end

    function krfcn(obj,event)
        IsPress.(event.Key) = false;
    end

    function kpfcn(obj,event)
        IsPress.(event.Key) = true;
    end

```

### _問　題　5_
##### **怎樣同時讓玩家的子彈和怪物的子彈同時動作?**

**_Ans:_**

主要解決方法是將動作指令程式碼安插在一起。

程式碼範例: (bullet是射擊手的子彈；enermy_Bullet是敵人的子彈)

```matlab
    while bullet.YData<=2.5 
        if enermy_Bullet.YData>=0
            enermy_Bullet.YData=enermy_Bullet.YData-0.05;
        end
        bullet.YData=bullet.YData+0.1;
        pause(0.01)
    end
```
