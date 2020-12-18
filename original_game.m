%�����i�ϥΤF�h����L��J�A�ѦҤF�H�U���}�G
%https://yuchungchuang.wordpress.com/2017/08/07/matlab-%E5%A4%9A%E9%87%8D%E6%8C%89%E9%8D%B5%E4%BA%8B%E4%BB%B6%E7%9A%84%E8%99%95%E7%90%86keypressfcn/

%�ݰ�--------------------------------------------------------------�ݰ�
%�ݰ�--------------------------------------------------------------�ݰ�
%�ݰ�--------------------------------------------------------------�ݰ�
%�ݰ�--------------------------------------------------------------�ݰ�

%�ﱼ��������� lag �ק� Ispress.space ���O�A�״_ lag
%�[�J BOSS
%�[�J���a�j��פ���
%�[�J�C�����Ф�

%�ݰ�--------------------------------------------------------------�ݰ�
%�ݰ�--------------------------------------------------------------�ݰ�
%�ݰ�--------------------------------------------------------------�ݰ�
%�ݰ�--------------------------------------------------------------�ݰ�


function original_game()

    %% �C����¦�L���]�p:
    % �¦�϶��d�� (0:3,0:3)�A�Y�D�C���϶�
    % ���W���Ǧⳡ���N�Ψӭp�ɻP�p�����
    
    fig = figure('KeyPressFcn',@kpfcn,'KeyReleaseFcn',@krfcn,'Name','Original Game');
    
    colordef(fig,'black');
    axis([0 3 0 3]);
    set(gca,'xtick',[],'xticklabel',[]);
    set(gca,'ytick',[],'yticklabel',[]);
    box on;
    
    hold on;
    
   
    
    
    %% �[�J�j�K(�Y�Ĥ@���������a)
    % ���a�Y�O�@��| '���k' ���ʪ��j�K
    % ����k���ʴN�u�O²�檺�����k��V��
    % �o�g�l�u�O�Q�� '�ť���'  (���n���� "�^���J" )
    % ���a�Ҿ֦�����T: 1. ��q  2. �l�u�ƥ�  3. �l�u�����O  4. �j�K��m (x,y)  5. ����
    % ��l���a��q��: 20 
    % �l�u�ƥ�: 15�A���O�����@���Ǫ��N�i�B�~��o �Ǫ���q ���l�u
    % �l�u�����O: �ثe�Ҭ� 1 �A���O���ӥi�Ҽ{�H���ͦ� 1 �� 2 �������O
    % �j�K��m: ��l��m: (1.5,0) �A�H�ۥ��k��L��ӧ���
    % ����: ��l�Ȭ��s�A�C�����@���Ǫ��A��o �Ǫ���q ����
    % player=[blood_Val, bullet_Num, attack_Val, gun_xPosition, gun_yPosition, score]
    
    player=[20,15,1,1.5,0,0];
    
    gun=scatter(player(4),player(5),800,'s','g','filled');
    
    %���a��T
    bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
    player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
    player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
    game_status=2; % ��l�C�����A v.s. game_status=1 �����O �L�F�Y�@�����d
    
    
    %�}�l�C��
    while game_status==1 || game_status==2
            %% �[�J�g�����ؼЪ�
            % �ؼЪ��z���n�� 1. ��q  2. ����  3. �����O  4. ��m(x,y)
            % �����O�ثe����ةǪ��A�Ŧ�Ǫ��㦳�H�� 1-3 �������O�A����Ǫ��S�������O
            % �ؼЪ���m�ثe�O�w�I�A�ݰ򥻹B��ξާ@�����A�A�[�H�Ҽ{�|�ʪ��ؼЪ�
            %���]�ثe�@���X�{�T�ӥؼЪ�
            % monster_Name=[blood_Val, score, attack_Val, x_Position, y_Position]
            %red_Monster=[10,10,0,ii-0.5,2.5]
            %blue_Monster=[15,15,randi([1 3]),ii-0.5,2.5]
        
        %�L�F�Y�@�����d�A�������y�A�l�u�[���A���ƥ[�Q
        if game_status==1
            player(6)=player(6)+10;
            player(2)=player(2)+5;
        end
         
        
        %��s��ܸ�T
        delete(bullet_num);
        delete(player_score);
        delete(player_blood);
        bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
        player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
        player_blood=text(2.5,2.9,['Blood:',num2str(player(1))],'Color','green');
        
        %��ؤ��P���Ǫ�(�Ŧ� OR ����)�H���ͦ��T��
        monster=[];
        
        for ii=1:3 
            red_Monster=[10,10,0,ii-0.5,2.5];
            blue_Monster=[15,15,randi([1 3]),ii-0.5,2.5];
            if randi([1 2])==1 %�M�w���@�ةǪ��Q�ͦ�
                monster=[monster;red_Monster];
            else
                monster=[monster;blue_Monster];
            end
        end
        
        
        %�P�_�n�άƻ��C��e�Ǫ� (�� FOR �� �A�� FOR ��)
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
        
        %��ܩǪ���q
        monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
        monster2_blood=text(monster(2,4)-0.05,monster(2,5),num2str(monster(2,1)));
        monster3_blood=text(monster(3,4)-0.05,monster(3,5),num2str(monster(3,1)));
        
        %attack_status1,2,3 = 1: ��ܩǪ� 1,2,3 �i�H�~��Q�����A����s�h�_
        attack_status1=1;
        attack_status2=1;
        attack_status3=1;
        
        % attack_flag �Ǫ��|���|�_�ϧ𪺸���(�� �Ŧ�Ǫ�)
        %attack_powers �Ǫ��W�O�ϡA�W�L�T�Q�h����(�� �Ŧ�Ǫ�)
        attack_flag=0;
        attack_powers=0;
    
         %% ���j�K����
         %�i�H�� '����V��' '�k��V��' ����j�K(�Y �����) ����
         %�ť��� (���O�G�n������^���J��L)���o�g���s
         %Ispress �O�� structure�A�x�s������Q�ګ���A�Ω�} (�|�Ψ� figure �̪��ݩ�
         %'KeyPressFcn','KeyReleaseFcn')
        IsPress.rightarrow = false;
        IsPress.leftarrow = false;
        IsPress.space=false;
    
        %�ثe�ϥεL���j��A���ӥi�H�Ҽ{�[�J�p�ɾ��A���O�p�Y�S���l�u�B�άO��q���s�h�C�������A�N�۰ʸ��X�j��
        while true
        
            if IsPress.rightarrow
                gun.XData = gun.XData + 0.01; % gun �O figure �̪�����A�i�H���X�L���Y�ɸ�T����
            end
            if IsPress.leftarrow
                gun.XData = gun.XData - 0.01;
            end
        
            if IsPress.space
            
                bullet=scatter(gun.XData,gun.YData,50,'y','filled'); %�����ͮ�
                player(2)=player(2)-1; %�l�u��@
                
                %��s�l�u�ƥظ�T
                delete(bullet_num); 
                bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                
                %���l�u����
                while bullet.YData<=2.5 
                    bullet.YData=bullet.YData+0.1;
                    pause(0.01)
                end
                
                %��F�h����
                delete(bullet);
                
                %�����쥪��Ĥ@���Ǫ�
                if attack_status1 && gun.XData<=monster1.XData+0.15 && gun.XData>=monster1.XData-0.1
               
                    monster(1,1)=monster(1,1)-1;
                    delete(monster1_blood);
                    monster1_blood=text(monster(1,4)-0.05,monster(1,5),num2str(monster(1,1)));
                    
                    %�Ǫ�������s��T 
                    if monster(1,1)<=0 %�Ǫ���q�k�s
                        delete(monster1);
                        delete(monster1_blood);
                        %player(1)=player(1)+5;
                        player(2)=player(2)+monster(1,2); %�����l�u�ƥؼ��y
                        player(6)=player(6)+monster(1,2); %�������a����
                        
                        %��s�l�u�ƥ� �� ���a���� ��T
                        delete(bullet_num);
                        delete(player_score);
                        player_score=text(0.06,2.7,['Score:',num2str(player(6))],'Color','yellow');
                        bullet_num=text(0.06,2.9,['Bullet number:' ,num2str(player(2))],'Color','white');
                        
                        %�Ǫ��ॢ�԰��N��
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
                
                
                %�꧹�o�@�j�� (�T�өǪ������h)
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
                
                %�ˬd�O�_�C������
                if player(2)<=0|| player(1)<=0
                    game_status=0;
                    game_Over=text(0.8,1.5,'Game Over','Color','red','Fontsize',30);
                    break;
                end
            
            end
            
            %�ˬd�C���O�_����
            if game_status==0
                break;
            end
            
            
            % Enermy attack
           if attack_flag
                if attack_status1 && monster(1,3)>0  %�p�Y�Ǫ��㦳�����O�A�h�}�l����
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