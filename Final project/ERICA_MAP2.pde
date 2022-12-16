void stage1() {
      image(preStage, 0, 0, width, height);
      image(logo, 30, 30, 60, 60);
      
      if(stage0_end == true){
      tint(lastTint);
      lastTint-=2;
      stage0back_amp -= 0.01;
      if(lastTint < 0) lastTint = 0;
      if(stage0back_amp < 0)stage0back_amp = 0;
    }
  
    if (preStage_show == false) {
      tint(255, preStage_tint);
      preStage_tint++;
      if (preStage_tint > 255) {
        preStage_show = true;
      }
    }
    
    if (preStage_show == true && preStage_end == false) {
      tint(preStage_tint);
      preStage_tint-=5;
      if (preStage_tint <= 0) {
        preStage_end = true;
        noTint();
        pTime = millis();
      }
    }
    
    if (preStage_show == true && preStage_end == true) {
      delay(1000);
      image(map, 0, 0, width, height);
      stageNum = 1;
   }
}
 
 void stage2() {
     image(map, 0, 0, width, height);
     image(character, characterX, characterY, 100, 100);
     if (characterY < (height/2)+130) {
         characterY += 5;
     }
     else {
         stageNum = 2;      // case2, stage3() 로 바뀜
     }
 }
 
 void stage3() {
     int page_num = 0;  
   
     image(map, 0, 0, width, height);
     image(character, characterX, characterY, 100, 100);
     image(textbar, 0, 0, textbar.width*textBarSize, textbar.height*textBarSize);
     if (textBarSize < 1.0) {    // 대화 상자가 일정크기 만큼 계속 커짐
        textBarSize += 0.05;
        pTime = millis();
     } else {
        fill(10);
        textSize(20);
        text(messageline, 60, height/2 + 60);    // 대화 상자의 색깔, text 화면에 띄우기

    if (inputWait == false) {
        if (pTime + textInter < millis()) {    
            messageline="";
            for (int i = 0; i <= charNow; i++) {
                messageline = messageline + messages[lineNum].charAt(i);        
            }
            charNow++;
            pTime = millis();
            if (charNow > messages[lineNum].length()-1) {
              inputWait = true;
            }
        } 
    } else {
      if (mousePressed) {      // 마우스를 클릭
        inputWait = false;
        lineNum += 1;
        if(lineNum == 10) stageNum = 3;
          messageline = "";
          charNow = 0;
      }
    }
  }
}
 

 void stage4() {
     image(map, 0, 0, width, height);
     image(character, characterX, characterY, 100, 100);
     
     if(characterX < 570) {
       characterX += 4;
       characterY -= 3;
       delay(50);
     }
     if(characterX >= 570 && characterX < 723) {
       characterX += 5;
       delay(50);
     }
     if(characterX == 723 && characterY > 211) {
        characterY -= 3;
        delay(50);
     }
     if (characterX == 723 && characterY == 211){
       stageNum = 4;
       delay(1000);
     }
     println("x : ", characterX, "  y : ", characterY);
 }
 
 void stage5() {
   image(character, 50, 50, 200, 200);
   rock_scissors_paper();
   if(count == 3) stageNum = 5;
 }
 
 void stage6(){
     int page_num = 0;  
   
     image(map, 0, 0, width, height);
     image(character, characterX, characterY, 100, 100);
     image(textbar, 0, 80, textbar.width*textBarSize, textbar.height*textBarSize);
     
     if (textBarSize < 1.0) {    // 대화 상자가 일정크기 만큼 계속 커짐
        textBarSize += 0.05;
        pTime = millis();
     } else {
        fill(10);
        textSize(25);
        text(messageline1, 60, height/2 + 140);    // 대화 상자의 색깔, text 화면에 띄우기

    if (inputWait == false) {
        if (pTime + textInter < millis()) {    
            messageline1="";
            for (int i = 0; i <= charNow; i++) {
                messageline1 = messageline1 + messages1[lineNum1].charAt(i);        
            }
            charNow++;
            pTime = millis();
            if (charNow > messages1[lineNum1].length()-1) {
              inputWait = true;
            }
        } 
    } else {
      if (mousePressed) {      // 마우스를 클릭
        inputWait = false;
        lineNum1 += 1;
        if(lineNum1 == 5) stageNum = 6;
          messageline1 = "";
          charNow = 0;
      }
    }
  }
}
 
 void stage7() {
      String string3 = "Mission 2. Visit all 21 spots.";
   
      int d = day();
      int month = month();
      int y = year();
      int h = hour() - 3;
      int m = minute();
      int s = second();
      
      int next = 0;

      image(map, 0, 0, width, height);
      image(character, characterX, characterY, 100, 100);
      
      fill(100, 100, 100);
      rect(7, 7, 345, 30);
      
      fill(250, 218, 229);
      textSize(25);
      text(string3, 10, 30);
      
      fill(255, 255, 0);
      circle(780, 280, 20);       // 캠퍼스 혁신파크 0
      circle(490, 260, 20);      // 디자인대학 1
      circle(335, 330, 20);      // 본관 2
      circle(190, 310, 20);      // 국문대 3
      circle(115, 310, 20);      // 경상대 4
      circle(140, 370, 20);      // 언정대 5
      
      circle(410, 240, 20);      // 2공학관 6
      circle(400, 190, 20);      // 예체능 대학 7
      circle(295, 255, 20);      // 학생복지관 8
      circle(300, 220, 20);      // 학생회관 9
      circle(305, 185, 20);      // 학술정보관 10
    
      circle(195, 255, 20);      // 제1과학기술관 11
      circle(130, 240, 20);      // 컨퍼런스홀 12
      circle(140, 210, 20);      // 제2과학기술관 13
      circle(110, 180, 20);      // ERICA 컨벤션홀 14
      circle(90, 220, 20);       // 셔틀콕 15
      circle(40, 285, 20);       // 아고라(정문) 16
      
      circle(220, 180, 20);      // 제 1, 3, 4, 5 공학관 17
      circle(220, 140, 20);     // 약학대학 18
      circle(190, 120, 20);     // 소융대 19
      circle(380, 70, 20);    // 기숙사 20
      
       for(int j = 0; j<=20; j++) {
         if(j == 0 && visited[0] == 1) {fill(255, 0, 0);   circle(780, 280, 20);}     // 캠퍼스 혁신파크 0
         if(j == 1 && visited[1] == 1) {fill(255, 0, 0);   circle(490, 260, 20);}      // 디자인대학 1
         if(j == 2 && visited[2] == 1) {fill(255, 0, 0);   circle(335, 330, 20);}      // 본관 2
         if(j == 3 && visited[3] == 1) {fill(255, 0, 0);   circle(190, 310, 20);}      // 국문대 3
         if(j == 4 && visited[4] == 1) {fill(255, 0, 0);   circle(115, 310, 20);}     // 경상대 4
         if(j == 5 && visited[5] == 1) {fill(255, 0, 0);   circle(140, 370, 20);}      // 언정대 5
          
         if(j == 6 && visited[6] == 1) {fill(255, 0, 0);   circle(410, 240, 20);}     // 2공학관 6
         if(j == 7 && visited[7] == 1) {fill(255, 0, 0);   circle(400, 190, 20);}      // 예체능 대학 7
         if(j == 8 && visited[8] == 1) {fill(255, 0, 0);   circle(295, 255, 20);}      // 학생복지관 8
         if(j == 9 && visited[9] == 1) {fill(255, 0, 0);   circle(300, 220, 20);}      // 학생회관 9
         if(j == 10 && visited[10] == 1) {fill(255, 0, 0);   circle(305, 185, 20);}      // 학술정보관 10
        
         if(j == 11 && visited[11] == 1) {fill(255, 0, 0);   circle(195, 255, 20);}      // 제1과학기술관 11
         if(j == 12 && visited[12] == 1) {fill(255, 0, 0);   circle(130, 240, 20);}      // 컨퍼런스홀 12
         if(j == 13 && visited[13] == 1) {fill(255, 0, 0);   circle(140, 210, 20);}      // 제2과학기술관 13
         if(j == 14 && visited[14] == 1) {fill(255, 0, 0);   circle(110, 180, 20);}      // ERICA 컨벤션홀 14
         if(j == 15 && visited[15] == 1) {fill(255, 0, 0);    circle(90, 220, 20);}       // 셔틀콕 15
         if(j == 16 && visited[16] == 1) {fill(255, 0, 0);    circle(40, 285, 20);}      // 아고라(정문) 16
          
         if(j == 17 && visited[17] == 1) {fill(255, 0, 0);    circle(220, 180, 20);}      // 제 1, 3, 4, 5 공학관 17
         if(j == 18 && visited[18] == 1) {fill(255, 0, 0);    circle(220, 140, 20);}     // 약학대학 18
         if(j == 19 && visited[19] == 1) {fill(255, 0, 0);    circle(190, 120, 20);}     // 소융대 19
         if(j == 20 && visited[20] == 1) {fill(255, 0, 0);     circle(380, 70, 20);}    // 기숙사 20
      }
      
      if (mouseX >= 770 && mouseX <= 790 && mouseY >= 270 && mouseY <= 290 && mousePressed){    // 캠퍼스 혁신 파크  
         fill(0, 0, 255);
         circle(780, 280, 20);       // 캠퍼스 혁신파크
         image(shinansan, 10, 10, 780, 460);
         textSize(15);
         text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
         visited[0] = 1;
         characterX = 723;
         characterY = 211;
       }
    
     if (mouseX >= 480 && mouseX <= 500 && mouseY >= 250 && mouseY <= 270 && mousePressed){    // 디자인 대학
            fill(0, 0, 255);
            circle(490, 260, 20);      // 디자인대학
            image(design, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 433;
            characterY = 191;
            visited[1] = 1;
        }
     if (mouseX >= 325 && mouseX <= 345 && mouseY >= 320 && mouseY <= 340 && mousePressed){    // 본관
            fill(0, 0, 255);
            circle(335, 330, 20);      // 본관
            image(core, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 278;
            characterY = 261;
            visited[2] = 1;
       }
     if (mouseX >= 180 && mouseX <= 200 && mouseY >= 300 && mouseY <= 320 && mousePressed){      // 국문대
            fill(0, 0, 255);
            circle(190, 310, 20);      // 국문대
            image(col_inter, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 133;
            characterY = 241;
            visited[3] = 1;
        }
     if (mouseX >= 105 && mouseX <= 125 && mouseY >= 300 && mouseY <= 320 && mousePressed){      // 경상대
            fill(0, 0, 255);
            circle(115, 310, 20);      // 경상대
            image(col_busi, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 58;
            characterY = 241;
            visited[4] = 1;
        }
     if (mouseX >= 130 && mouseX <= 150 && mouseY >= 360 && mouseY <= 380 && mousePressed){        // 언정대
            fill(0, 0, 255);
            circle(140, 370, 20);      // 언정대
            image(col_com, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 83;
            characterY = 301;
            visited[5] = 1;
       }
       
     if (mouseX >= 400 && mouseX <= 420 && mouseY >= 230 && mouseY <= 250 && mousePressed){    // 2공학관  
            fill(0, 0, 255);
            circle(410, 240, 20);      // 2공학관
            image(eng_2, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 353;
            characterY = 171;
            visited[6] = 1;
        }
     if (mouseX >= 390 && mouseX <= 410 && mouseY >= 180 && mouseY <= 200 && mousePressed){    // 예체능 대학
            fill(0, 0, 255);
            circle(400, 190, 20);      // 예체능 대학
            image(col_art, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 343;
            characterY = 121;
            visited[7] = 1;
        }
     if (mouseX >= 285 && mouseX <= 305 && mouseY >= 245 && mouseY <= 265 && mousePressed){    // 학생복지관
            fill(0, 0, 255);
            circle(295, 255, 20);      // 학생복지관
            image(stu_wel, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 238;
            characterY = 186;
            visited[8] = 1;
       }
     if (mouseX >= 290 && mouseX <= 310 && mouseY >= 210 && mouseY <= 230 && mousePressed){      // 학생회관
            fill(0, 0, 255);
            circle(300, 220, 20);      // 학생회관
            image(stu_union, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 243;
            characterY = 151;
            visited[9] = 1;
        }
     if (mouseX >= 295 && mouseX <= 315 && mouseY >= 175 && mouseY <= 195 && mousePressed){      // 학술정보관
            fill(255, 0, 0);
            circle(305, 185, 20);      // 학술정보관
            image(lib, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 248;
            characterY = 116;
            visited[10] = 1;
        }
        
     if (mouseX >= 185 && mouseX <= 205 && mouseY >= 245 && mouseY <= 265 && mousePressed){    // 제1과학기술관
            fill(0, 0, 255);
            circle(195, 255, 20);      // 제1과학기술관
            image(sci_1, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 138;
            characterY = 186;
            visited[11] = 1;
        }
     if (mouseX >= 120 && mouseX <= 140 && mouseY >= 230 && mouseY <= 250 && mousePressed){    // 컨퍼런스홀
            fill(0, 0, 255);
            circle(130, 240, 20);      // 컨퍼런스홀
            image(confe, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 73;
            characterY = 171;
            visited[12] = 1;
        }
     if (mouseX >= 130 && mouseX <= 150 && mouseY >= 200 && mouseY <= 220 && mousePressed){    // 제2과학기술관
            fill(0, 0, 255);
            circle(140, 210, 20);      // 제2과학기술관
            image(col_sci, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 83;
            characterY = 141;
            visited[13] = 1;
       }
     if (mouseX >= 100 && mouseX <= 120 && mouseY >= 170 && mouseY <= 190 && mousePressed){      // ERICA 컨벤션홀
            fill(255, 0, 0);
            circle(110, 180, 20);      // ERICA 컨벤션홀
            image(erica_convention, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 53;
            characterY = 111;
            visited[14] = 1;
        }
     if (mouseX >= 80 && mouseX <= 100 && mouseY >= 210 && mouseY <= 230 && mousePressed){      // 셔틀콕
            fill(0, 0, 255);
            circle(90, 220, 20);       // 셔틀콕
            image(shuttle, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 33;
            characterY = 151;
            visited[15] = 1;
        }
     if (mouseX >= 30 && mouseX <= 50 && mouseY >= 275 && mouseY <= 295 && mousePressed){        // 아고라(정문)
            fill(0, 0, 255);
            circle(40, 285, 20);       // 아고라(정문)
            image(agora, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 0;
            characterY = 216;
            visited[16] = 1;
       }
       
     if (mouseX >= 210 && mouseX <= 230 && mouseY >= 170 && mouseY <= 190 && mousePressed){    // 제 1, 3, 4, 5 공학관
            fill(0, 0, 255);
            circle(220, 180, 20);      // 제 1, 3, 4, 5 공학관
            image(col_eng, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 163;
            characterY = 111;
            visited[17] = 1;
       }
     if (mouseX >= 210 && mouseX <= 230 && mouseY >= 130 && mouseY <= 150 && mousePressed){      // 약학대학
            fill(255, 0, 0);
            circle(220, 140, 20);     // 약학대학
            image(col_pha, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 163;
            characterY = 71;
            visited[18] = 1;
        }
     if (mouseX >= 180 && mouseX <= 200 && mouseY >= 110 && mouseY <= 130 && mousePressed){      // 소융대
            fill(255, 0, 0);
            circle(190, 120, 20);     // 소융대
            image(col_comp, 10, 10, 780, 460);
            textSize(15);
            text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
            characterX = 133;
            characterY = 51;
            visited[19] = 1;
        }
        
     if (mouseX >= 370 && mouseX <= 390 && mouseY >= 60 && mouseY <= 80 && mousePressed){      // 창의인재원
           fill(0, 0, 255);
           circle(380, 70, 20);    // 기숙사
           image(dormitory, 10, 10, 780, 460);
           textSize(15);
           text("Now : " + y + "/" + month + "/" + d + "  " + h + ":" + m + "  " + s, 20, 30);
           characterX = 323;
           characterY = 9;
           visited[20] = 1;
       }
       
       for(int i=0; i<=20; i++){
         if(visited[i] == 1) next += visited[i];
       }
       
       if(next == 21 && mouseX >= 0 && mouseX <= 30 && mouseY >= 0 && mouseY <= 30 && mousePressed) stageNum = 7;
 }
 
void stage8() {
    int page_num = 0;  
   
     image(map, 0, 0, width, height);
     image(character, characterX, characterY, 100, 100);
     image(textbar, 0, 80, textbar.width*textBarSize, textbar.height*textBarSize);
     
     if (textBarSize < 1.0) {    // 대화 상자가 일정크기 만큼 계속 커짐
        textBarSize += 0.05;
        pTime = millis();
     } else {
        fill(10);
        textSize(25);
        text(messageline2, 60, height/2 + 140);    // 대화 상자의 색깔, text 화면에 띄우기

    if (inputWait == false) {
        if (pTime + textInter < millis()) {    
            messageline2="";
            for (int i = 0; i <= charNow; i++) {
                messageline2 = messageline2 + messages2[lineNum2].charAt(i);        
            }
            charNow++;
            pTime = millis();
            if (charNow > messages2[lineNum2].length()-1) {
              inputWait = true;
            }
        } 
    } else {
      if (mousePressed) {      // 마우스를 클릭
        inputWait = false;
        lineNum2 += 1;
        if(lineNum2 == 6) exit();
          messageline2 = "";
          charNow = 0;
      }
    }
  }
}
 
void rock_scissors_paper() {
    String string1 = "Your score";
    String string2 = "Mission 1. Get 3 points";
    
    image(img[ran%3], 300, 70, 200, 200);
    ran += add;
    for (int i = 0; i<img.length; i++) {
      image(img[i], i*width/6+200, 300, width/6, width/6);  
      if (mousePressed) {  
        if (i*width/6+200 <= mouseX && mouseX <= 200+(i+1)*width/6 &&
          300 <= mouseY && mouseY <= 300+width/6) { 
          add = 0; 
          rate++;
          if (ran%3 == (i-1)%3) count += 0;
          else if (ran%3 == (i)%3) count--;  // lose
          else if (ran%3 == (i+1)%3) count++;  // win
          delay(1000);
        }   
        add=1;
      }
    }
    fill(250, 218, 229);
    textSize(25);
    text(string2, 10, 30);
    println(ran);
    fill(229, 250, 218);
    textSize(40);
    text(string1, width/2+150, height/2-75);
    fill(153, 199, 245);
    textMode(SHAPE);
    text(count, width/2+225, height/2-25);
}
