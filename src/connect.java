
import javax.swing.table.DefaultTableModel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author laptop ko
 */
public class connect {
     String database_url = "jdbc:mysql://localhost/sad?user=root&password=";
     
     
 //=====================table models======================================================================================================    
 //  
   ///===============Start of trip table========================================  
     
  DefaultTableModel tt= (new javax.swing.table.DefaultTableModel(
    new Object [][] {

    },
    new String [] {
        "Control Number", "Trip Date", "Destination(s)", "Purpose", "Team Leader"
    }
) {
    Class[] types = new Class [] {
        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
    };
    boolean[] canEdit = new boolean [] {
        false, false, false, false, false
    };

    public Class getColumnClass(int columnIndex) {
        return types [columnIndex];
    }

    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return canEdit [columnIndex];
    }
});
 // /====================end or trip table= =========================
  //=====================start of driver table=======================
  
   DefaultTableModel dt= (new javax.swing.table.DefaultTableModel(
    new Object [][] {

    },
    new String [] {
        "ID", "Driver's NAme", "License Number", "Contact Number"
    }
) {
    Class[] types = new Class [] {
        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
    };
    boolean[] canEdit = new boolean [] {
        false, false, false, true
    };

    public Class getColumnClass(int columnIndex) {
        return types [columnIndex];
    }

    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return canEdit [columnIndex];
    }
});
   
 //============================end of driver table===============================  
 //============================start of car table===============================  
   
  DefaultTableModel ct=(new javax.swing.table.DefaultTableModel(
    new Object [][] {

    },
    new String [] {
        "Vehicle Name", "Plate Number", "Type", "Color"
    }
) {
    Class[] types = new Class [] {
        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
    };
    boolean[] canEdit = new boolean [] {
        false, false, false, false
    };

    public Class getColumnClass(int columnIndex) {
        return types [columnIndex];
    }

    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return canEdit [columnIndex];
    }
});
   
 //==================end of car table========================================================================  
   
   
   
}
