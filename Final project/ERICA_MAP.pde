import processing.sound.*;

PImage preStage, map, logo, character, textbar, text_hanyang, 
shinansan, design, core, col_inter, col_busi, 
col_com, agora, sci_1, confe, col_sci, 
shuttle, erica_convention, eng_2, col_art, stu_wel, 
stu_union, lib, col_eng, col_pha, col_comp, dormitory;
PImage[] img = new PImage[3];

SoundFile background;

PFont f;

String thisLine = "Hanyang University ERICA map";
String messageline = "";
String messageline1 = "";
String messageline2 = "";

String[] messages;
String[] messages1;
String[] messages2;

boolean preStage_show = false;
boolean preStage_end = false;
boolean stage0_end = false;
boolean inputWait = false;
boolean clickCheck = false;

int[] visited = new int[21];
int preStage_tint = 0;
int lastTint = 255;
int stageNum = 0;
int textInter = 100;

int lineNum = 0;
int lineNum1 = 0;
int lineNum2 = 0;

int charNow = 0;
int characterX = 405;
int characterY = height/2;
int count = 0;
int ran = 0;
int add = 1;
int rate = 1;
int soundLoad = 0;

float stage0back_amp = 1.0;
float textBarSize = 0.1;
long pTime = 0;

void setup() {
      size(800, 480);
      orientation(LANDSCAPE);
      smooth();
      
      f = createFont("NanumSquareNeo-bRg.ttf", 35, true);
      textFont(f);
      
      messages = loadStrings("introduction.txt");
      messages1 = loadStrings("messages1.txt");
      messages2 = loadStrings("messages2.txt");
      
      preStage = loadImage("preStage.png");
      map = loadImage("map.png");      // 배경 이미지
      logo = loadImage("HYU_symbol_basic_png.png");      // 한양대 로고
      character = loadImage("hy_character.png");      // 하냥이 캐릭터
      textbar = loadImage("textbar.png");
      text_hanyang = loadImage("text_hanyang.png");
      
      shinansan = loadImage("1.PNG");
      design = loadImage("2.PNG"); 
      core = loadImage("3.PNG"); 
      col_inter = loadImage("4.PNG"); 
      col_busi = loadImage("5.PNG"); 
      col_com = loadImage("6.PNG"); 
      agora= loadImage("7.PNG"); 
      
      sci_1 = loadImage("8.PNG"); 
      confe = loadImage("9.PNG"); 
      col_sci = loadImage("10.PNG"); 
      shuttle = loadImage("11 (3).png");
      erica_convention = loadImage("12.PNG");
      
      eng_2 = loadImage("14.PNG");
      col_art = loadImage("13.PNG");
      stu_wel = loadImage("15.PNG");
      stu_union = loadImage("16.PNG");
      lib = loadImage("17.PNG");
      col_eng = loadImage("18.PNG");
      col_pha = loadImage("19.PNG");
      col_comp = loadImage("20.PNG");
      
      dormitory = loadImage("21.png");
      
      img[0] = loadImage("scissors.png");    // 가위
      img[1] = loadImage("rock.png");    // 바위
      img[2] = loadImage("papers.png");    // 보  
      
      background = new SoundFile(this, "GoShanghai.mp3");
      background.loop();
}

void draw() {
    background(0);
    
    switch(stageNum) {
      case 0:
        stage1();
        break;
      case 1:
        stage2();
        break;
      case 2:
        stage3();
        break;
      case 3:
        stage4();
        break;
      case 4:
        stage5();
        break;
      case 5:
        stage6();
        break;
      case 6:
        stage7();
        break;
      case 7:
        stage8();
        break;
    }   
}
