/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Extractor;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Shreeson Shrestha
 */
public class JobScrap{
List<JobClass> joblist=new ArrayList<>();
    public boolean add(JobClass jc){
        return joblist.add(jc);
    }
    public List<JobClass> get(){
        return joblist;
    }

    @Override
    public String toString() {
        return "JobScrap{" + "joblist=" + joblist + '}';
    }
    
}
