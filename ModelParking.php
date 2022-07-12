<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class ModelParking extends CI_Model{	
	function getAllPlace(){
		$sql = 'SELECT  * FROM place ';
		$query = $this->db->query($sql);
		$produit = array();
		foreach ($query->result_array() as $key) {
			$produit[] = $key;
		}
		return $produit;
	}
	function getAllParking(){
		$sql = 'SELECT  * FROM parking ';
		$query = $this->db->query($sql);
		$produit = array();
		foreach ($query->result_array() as $key) {
			$produit[] = $key;
		}
		return $produit;
	}

	public function insertPlace($numero ,$remarque , $taille){
		$sql = "INSERT INTO place (numero,remarque,taille)
		VALUES ('$numero','$remarque','$taille')";
		//echo $sql;
		$this->db->query($sql);
	}

	public function insertVoitureParking($idPlace ,$idTarif , $numVehicule , $dateDebut , $remarque){
		$sql = "INSERT INTO parking (idPlace,idTarif,numVehicule , dateDebut , remarque)
		VALUES ('$idPlace' ,'$idTarif' , '$numVehicule' , '$dateDebut' , '$remarque')";
		echo $sql;
		$this->db->query($sql);
	}

	public function deleteVoitureParking($idParking){
		$sql = "DELETE FROM parking where id='".$idParking."'";
		//echo $sql;
		$this->db->query($sql);
	}

}
?>
