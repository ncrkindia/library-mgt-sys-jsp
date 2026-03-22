/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NCRK;
/**
 *
 * @author Naveen Chauhan
 */

import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
public class Session implements HttpSession{

    private static int count = 0;
    private String[] name ;
    private Object[] value ;
    public int total=0;
    public Session()
    {
        count++;
        name = new String[50];
        value = new Object[50];
    }
     public Session(int size)
    {
        count++;
        name = new String[size];
        value = new Object[size];
    }
    @Override
    public long getCreationTime() {
        throw new UnsupportedOperationException("Not supported yet.:getCreationTime"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getId() {
        throw new UnsupportedOperationException("Not supported yet.:getId()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public long getLastAccessedTime() {
        throw new UnsupportedOperationException("Not supported yet.:getLastAccessedTime()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ServletContext getServletContext() {
        throw new UnsupportedOperationException("Not supported yet.:getServletContext()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setMaxInactiveInterval(int i) {
        throw new UnsupportedOperationException("Not supported yet.:setMaxInactiveInterval(int i)"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getMaxInactiveInterval() {
        throw new UnsupportedOperationException("Not supported yet.:getMaxInactiveInterval()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public HttpSessionContext getSessionContext() {
        throw new UnsupportedOperationException("Not supported yet.:getSessionContext()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getAttribute(String string) {
       int index = search(string);
       if(index==-1)
       {
           return null;
       }
       return value[index];
    }

    @Override
    public Object getValue(String string) {
        throw new UnsupportedOperationException("Not supported yet.:getValue(String string)"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Enumeration<String> getAttributeNames() {
        throw new UnsupportedOperationException("Not supported yet.:getAttributeNames()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String[] getValueNames() {
        throw new UnsupportedOperationException("Not supported yet.:getValueNames()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setAttribute(String string, Object o) {
        int index = search(string);
        if(index==-1)
        {
            index = total++;
        }
        name[index] = string;
        value[index] = o;
    }

    @Override
    public void putValue(String string, Object o) {
        throw new UnsupportedOperationException("Not supported yet.:putValue(String string, Object o)"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeAttribute(String string) {
        throw new UnsupportedOperationException("Not supported yet.:removeAttribute(String string)"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeValue(String string) {
        throw new UnsupportedOperationException("Not supported yet.:removeValue(String string)"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void invalidate() {
        throw new UnsupportedOperationException("Not supported yet.:invalidate()"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean isNew() {
        throw new UnsupportedOperationException("Not supported yet.:isNew()"); //To change body of generated methods, choose Tools | Templates.
    }

    private int search(String name)
    {
        for(int i=0;i<this.name.length;i++)
        {
            if(name.equals(this.name[i]))
            {
                return i;
            }
        }
        return -1;
    }
    protected void finalize()
    {
        count--;
    }
}
