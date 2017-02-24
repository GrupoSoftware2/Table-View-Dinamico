//
//  DinamicoTableViewController.swift
//  Table View Dinamico
//
//  Created by alumno on 23/02/17.
//  Copyright © 2017 alumno. All rights reserved.
//

import UIKit

class DinamicoTableViewController: UITableViewController {

    let primerArreglo = ["Dato 1.1","Dato 1.2","Dato 1.3","Dato 1.4","Dato 1.5"]
    let segundArreglo = ["Dato 2.1","Dato 2.2","Dato 2.3","Dato 2.4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            return primerArreglo.count
        }
        
        return segundArreglo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        var cell:UITableViewCell
        
        let indice = indexPath.row
        var texto = ""
        if indexPath.section == 0 {
            //Obtener datos del primer arreglo
            cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
            texto = primerArreglo[indice]
            
        }else{
            //Obtener datos del segundo arreglo
            cell = tableView.dequeueReusableCell(withIdentifier: "segundacelda", for: indexPath)
            texto = segundArreglo[indice]
            

        }
        cell.textLabel?.text = texto
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Inicio de la Seccion \(section)"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Final de la Seccion \(section)"
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Seccion = 1
        //Fila = 4
        //let seccion = indexPath.section
        //let fila = indexPath.row
        
        let cell = tableView.cellForRow(at: indexPath)
        let texto = cell?.textLabel?.text
        
        var alertController:UIAlertController
        //alertController = UIAlertController(title: "Alert", message: "Dato \(seccion+1).\(fila+1)", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController = UIAlertController(title: "Alert", message: " \(texto!)", preferredStyle: UIAlertControllerStyle.alert)
        let accionOk  = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            print("Se escogio: \(texto!)")
        })
        
        alertController.addAction(accionOk)
        self.present(alertController, animated: true, completion: {
            
        })
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
