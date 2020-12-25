# final_project-chenyangdai
final_project-chenyangdai created by GitHub Classroom


*Shooting Game* 
==========

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
![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/gameStart.png)

### _基　礎　遊　戲　關　卡　介　面_
![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/inGame.png)

### _藍　色　怪　物　發　射　紅　色　子　彈_
![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/bulletAni1.gif)

### _綠　色　槍　枝　發　射　黃　色　子　彈_
![image](https://github.com/NCTU-Math-Software/final_project-chenyangdai/blob/main/bothBullet.png)





