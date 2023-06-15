package altenpfleger.sample.controller;


import altenpfleger.sample.MainApp;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;


public class MenuController implements Initializable {
	

	/**
     *  die Methode setAltenpflegerScene ändert der View zu Altenpfleger, wenn der Taster geklickt wird
     * @param e verantwotlich für Anhörung einer Aktion
     *
     */
	@FXML 
	private void setAltenpflegerScene(ActionEvent e) throws IOException
	{
		MainApp.setRoot("Altenpfleger", "Altenpfleger");
	}
	
	/**
     *  die Methode setPatientScene ändert der View zu Patient, wenn der Taster geklickt wird
     * @param e verantwotlich für Anhörung einer Aktion
     *
     */
	@FXML 
	private void setPatientScene(ActionEvent e) throws IOException
	{
		MainApp.setRoot("Patient", "Patient");
	}
	
	/**
     *  die Methode setAdresseScene ändert der View zu Adresse, wenn der Taster geklickt wird
     * @param e verantwotlich für Anhörung einer Aktion
     *
     */
	@FXML 
	private void setAdresseScene(ActionEvent e) throws IOException
	{
		MainApp.setRoot("Adresse", "Adresse");
	}
	/**
     *  die Methode setArztScene ändert der View zu Arzt, wenn der Taster geklickt wird
     * @param e verantwotlich für Anhörung einer Aktion
     *
     */
	@FXML 
	private void setArztScene(ActionEvent e)throws IOException
	{
		MainApp.setRoot("Arzt", "Arzt");
	}
	
	/**
     *  die Methode setDienstScene ändert der View zu Dienst, wenn der Taster geklickt wird
     * @param e verantwotlich für Anhörung einer Aktion
     *
     */
	@FXML 
	private void setDienstScene(ActionEvent e) throws IOException
	{
		MainApp.setRoot("Dienst", "Dienst");
	}
	
	/**
     *  die Methode setArztHasPatientScene ändert der View zu Arzt_has_Patient, wenn der Taster geklickt wird
     * @param e verantwotlich für Anhörung einer Aktion
     *
     */
	@FXML 
	private void setArztHasPatientScene(ActionEvent e) throws IOException
	{
		MainApp.setRoot("Arzt_has_Patient", "Arzt_has_Patient");
	}
	
    @Override
    public void initialize(URL url, ResourceBundle rb) {
    	
    }    
    
 
   
   
    
    
}
