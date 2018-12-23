import java.io.FileNotFoundException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

PrintWriter pw;
BufferedReader[] br;
BufferedWriter[] bw;
int file_cnt;

//ICHIGAJAM参照ディレクトリパス
String path = 
  "C:/Users/Hiroaki-Kirisawa/Desktop/programming/"+
  "ICHIGOJAM/ichigojam-1.2b40/ichigojam-files/";


void setup(){
  setFile();
}

void setFile() {
  try {
    //count file without dir
    file_cnt = new File(sketchPath("./../")).listFiles().length -1;
    br = new BufferedReader[file_cnt];
    bw = new BufferedWriter[file_cnt];

    for (int i = 0; i < file_cnt; i++) {
      br[i] = new BufferedReader(new FileReader(
        sketchPath("./../ichigojam-file-000"+ i +".txt")));  
      bw[i] = new BufferedWriter(new FileWriter(
        path +"ichigojam-file-000"+ i +".txt"));

      String str;
      while (true) {
        str = br[i].readLine();

        if (str == null) {
          bw[i].close();
          break;
        }

        bw[i].write(str);
        bw[i].newLine();

        println(str);
      }
    }
  } 
  catch(FileNotFoundException e) {
    e.printStackTrace();
    stop();
  } 
  catch(IOException e) {
    e.printStackTrace();
    stop();
  }
}
