/*
 * HeclBuilderGui.java
 *
 * Created on December 28, 2005, 10:53 PM
 */

package heclbuilder;

import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

/**
 *
 * @author  davidw
 */
public class HeclBuilderGui extends javax.swing.JFrame {
    
    /** Creates new form HeclBuilderGui */
    public HeclBuilderGui() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        scriptFileChooser = new javax.swing.JFileChooser();
        selectLabel = new javax.swing.JLabel();
        midletLabel = new javax.swing.JLabel();
        createLabel = new javax.swing.JLabel();
        scriptTextField = new javax.swing.JTextField();
        midletTextField = new javax.swing.JTextField();
        selectButton = new javax.swing.JButton();
        runButton = new javax.swing.JButton();
        editButton = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        outputTextField = new javax.swing.JTextField();
        outputSelectButton = new javax.swing.JButton();
        mainMenuBar = new javax.swing.JMenuBar();
        mainMenu = new javax.swing.JMenu();
        menuQuit = new javax.swing.JMenuItem();

        scriptFileChooser.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                scriptFileChooserActionPerformed(evt);
            }
        });

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("HeclBuilder");
        selectLabel.setText("Select a script");

        midletLabel.setText("MIDlet name");

        createLabel.setText("Create .jar and .jad files");

        scriptTextField.setColumns(25);
        scriptTextField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                scriptTextFieldCaretUpdate(evt);
            }
        });

        midletTextField.setColumns(10);
        midletTextField.addCaretListener(new javax.swing.event.CaretListener() {
            public void caretUpdate(javax.swing.event.CaretEvent evt) {
                midletTextFieldCaretUpdate(evt);
            }
        });

        selectButton.setText("...");
        selectButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                selectButtonMouseClicked(evt);
            }
        });

        runButton.setText("Go");
        runButton.setToolTipText("Select a script and MIDlet name to activate this button");
        runButton.setEnabled(false);
        runButton.getAccessibleContext().setAccessibleDescription("");

        editButton.setText("View/Edit");
        editButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                editButtonMouseClicked(evt);
            }
        });

        jLabel1.setText("Output directory");

        outputTextField.setText("/tmp");
        outputTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                outputTextFieldActionPerformed(evt);
            }
        });

        outputSelectButton.setText("...");
        outputSelectButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                selectButtonMouseClicked1(evt);
            }
        });

        mainMenu.setText("File");
        menuQuit.setText("Quit");
        menuQuit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuQuitActionPerformed(evt);
            }
        });
        menuQuit.addMenuDragMouseListener(new javax.swing.event.MenuDragMouseListener() {
            public void menuDragMouseDragged(javax.swing.event.MenuDragMouseEvent evt) {
            }
            public void menuDragMouseEntered(javax.swing.event.MenuDragMouseEvent evt) {
            }
            public void menuDragMouseExited(javax.swing.event.MenuDragMouseEvent evt) {
            }
            public void menuDragMouseReleased(javax.swing.event.MenuDragMouseEvent evt) {
                menuQuitMenuDragMouseReleased(evt);
            }
        });

        mainMenu.add(menuQuit);

        mainMenuBar.add(mainMenu);

        setJMenuBar(mainMenuBar);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.LEADING, layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                        .add(org.jdesktop.layout.GroupLayout.LEADING, layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                                .add(midletLabel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 79, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .add(74, 74, 74))
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                                .add(selectLabel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 86, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .add(67, 67, 67)))
                        .add(createLabel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 153, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(jLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 153, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                        .add(61, 61, 61)
                        .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                            .add(org.jdesktop.layout.GroupLayout.LEADING, midletTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 415, Short.MAX_VALUE)
                            .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                                .add(scriptTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 248, Short.MAX_VALUE)
                                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                .add(selectButton)
                                .add(23, 23, 23)
                                .add(editButton))
                            .add(org.jdesktop.layout.GroupLayout.LEADING, layout.createSequentialGroup()
                                .add(outputTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 248, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                .add(outputSelectButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 43, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))))
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                        .add(423, 423, 423)
                        .add(runButton, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 53, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.LEADING, layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                    .add(selectLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE)
                    .add(editButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(selectButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(scriptTextField))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(midletLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, midletTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(outputSelectButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, jLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, outputTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE))
                .add(14, 14, 14)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, runButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 26, Short.MAX_VALUE)
                    .add(createLabel, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 26, Short.MAX_VALUE))
                .add(31, 31, 31))
        );
        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void outputTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_outputTextFieldActionPerformed
// TODO add your handling code here:
    }//GEN-LAST:event_outputTextFieldActionPerformed

    private void selectButtonMouseClicked1(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_selectButtonMouseClicked1
// TODO add your handling code here:
    }//GEN-LAST:event_selectButtonMouseClicked1

    private void scriptTextFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_scriptTextFieldCaretUpdate
        midletTextFieldCaretUpdate(evt);
    }//GEN-LAST:event_scriptTextFieldCaretUpdate

    private void midletTextFieldCaretUpdate(javax.swing.event.CaretEvent evt) {//GEN-FIRST:event_midletTextFieldCaretUpdate
        String midletName = midletTextField.getText();
        String scriptName = scriptTextField.getText();
        if (midletName.length() > 0 && scriptName.length() > 0) {
            runButton.setEnabled(true);
        }
    }//GEN-LAST:event_midletTextFieldCaretUpdate

    private void menuQuitMenuDragMouseReleased(javax.swing.event.MenuDragMouseEvent evt) {//GEN-FIRST:event_menuQuitMenuDragMouseReleased
        System.exit(1);
    }//GEN-LAST:event_menuQuitMenuDragMouseReleased

    private void menuQuitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuQuitActionPerformed
// TODO add your handling code here:
    }//GEN-LAST:event_menuQuitActionPerformed

    private void editButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_editButtonMouseClicked
        String filename = null;
        File fl = new File(scriptTextField.getText());
        
        if (fl.isDirectory()) {
            // FIXME - insert some sort of dialog.
            return;
        }
        
        if (fl.exists()) {
            filename = fl.toString();
        } else {
            if (JOptionPane.showConfirmDialog(this, "The file " + fl + " does not exist.  Create it?")
                != JOptionPane.YES_OPTION) {
                return;
            }
            filename = fl.toString();
        }
        System.out.println(filename);
        HeclEditor he = new HeclEditor(filename);
        he.setVisible(true);
    }//GEN-LAST:event_editButtonMouseClicked

    private void scriptFileChooserActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_scriptFileChooserActionPerformed
// TODO add your handling code here:
    }//GEN-LAST:event_scriptFileChooserActionPerformed

    private void selectButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_selectButtonMouseClicked
        scriptFileChooser = new JFileChooser();
        int retval = scriptFileChooser.showOpenDialog(this);
        if (retval == JFileChooser.APPROVE_OPTION) {
            java.io.File file = scriptFileChooser.getSelectedFile();
            scriptTextField.setText(file.toString());
        }
    }//GEN-LAST:event_selectButtonMouseClicked
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new HeclBuilderGui().setVisible(true);
            }
        });
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel createLabel;
    private javax.swing.JButton editButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu mainMenu;
    private javax.swing.JMenuBar mainMenuBar;
    private javax.swing.JMenuItem menuQuit;
    private javax.swing.JLabel midletLabel;
    private javax.swing.JTextField midletTextField;
    private javax.swing.JButton outputSelectButton;
    private javax.swing.JTextField outputTextField;
    private javax.swing.JButton runButton;
    private javax.swing.JFileChooser scriptFileChooser;
    private javax.swing.JTextField scriptTextField;
    private javax.swing.JButton selectButton;
    private javax.swing.JLabel selectLabel;
    // End of variables declaration//GEN-END:variables
    
}