import { Component, OnInit } from '@angular/core';
import { GeneralService } from '../../services/general.service';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

export interface banco {
  id: number,
  nombre: string
}

@Component({
  selector: 'app-modificar',
  templateUrl: './modificar.component.html',
  styleUrls: ['./modificar.component.css']
})
export class ModificarComponent implements OnInit {

  bancos: banco[] = [];
  seleccionado: number = 0;
  mes: number = 0;
  anio: number = 0;



  constructor(private peticion: GeneralService, private router: Router,
    private snackBar: MatSnackBar) { }

  ngOnInit(): void {
    this.peticion.bancos().subscribe((res: any) => {
      this.bancos.push(...res)
    })
  }

  modificarActivo(activo: string) {
    if (this.seleccionado != 0 && this.mes != 0 && this.anio != 0) {
      let ac: number = Number(activo)
      if (ac < 2147483647) {
        this.peticion.modificarPeticion(ac, this.seleccionado, this.mes, this.anio).subscribe((res: any) => {
          console.log(res)
        })
        this.snackBar.open("Activo modificado")
        setTimeout(() => {
          this.snackBar.dismiss()
        }, 3000)
      } else {
        this.snackBar.open("Numero no soportado")
        setTimeout(() => {
          this.snackBar.dismiss()
        }, 3000)
      }
    } else {
      this.snackBar.open("Debe rellenar correctamente")
      setTimeout(() => {
        this.snackBar.dismiss()
      }, 3000)
    }
  }
}
