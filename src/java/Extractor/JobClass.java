package Extractor;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shreeson Shrestha
 */
public class JobClass {
    int sno;
    String jobtitle=null,company=null,type=null;

    public JobClass(int sno,String jobtitle,String company, String type) {
        this.sno=sno;
        this.jobtitle=jobtitle;
        this.company=company;
        this.type=type;
    }
    public String getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
