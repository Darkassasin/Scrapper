/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Handler;

import Extractor.JobClass;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Shreeson Shrestha
 */
public class FileHandler {

    List<JobClass> joblist = new ArrayList<>();

   /* 
        try{
    File file = new File("C:/Users/Shreeson Shrestha/Desktop/jobs.txt");
        FileWriter writer = new FileWriter(file);
    }
    catch(IOException ioe)
    {
            System.out.println(ioe.getMessage());
    }
*/
    public void export() {
        BufferedWriter fw= null;
        try {
            fw = new BufferedWriter(new FileWriter(new File("c:/Users/Shreeson Shrestha/jobs.txt")));
            fw.write("hello this is web application project!!! jobscrap");
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        } 
    }
}
