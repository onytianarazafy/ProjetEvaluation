<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Parking extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->model('ModelParking');
        $this->load->database();
        $this->load->helper('url');
       $this->load->helper('assets');
    }
    public function ajaxRequestPost(){
        $data = array(
        'title' => $this->input->post('title'),
        'description' => $this->input->post('description')
        );
        $this->db->insert('items', $data);
        echo 'Added successfully.'; 
    }

    public function AjouterPlaceParking(){
		//$this->load->helper('assets');
		$this->ModelParking->insertPlace($this->input->post('numero'),$this->input->post('remarque'),$this->input->post('taille'));
		redirect(site_url());
	}

    public function AjouterVoitureParking(){
		//$this->load->helper('assets');
		$this->ModelParking->insertVoitureParking($this->input->post('idPlace'),$this->input->post('idTarif'),$this->input->post('matricule'),'2022-07-12','rien');
		redirect(site_url());
	}

    public function RetirerVoiture(){
		//$this->load->helper('assets');
		$this->ModelParking->deleteVoitureParking($this->input->post('idParking'));
		redirect(site_url());
	}
}
