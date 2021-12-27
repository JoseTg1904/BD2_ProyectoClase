import { Component, OnInit } from '@angular/core';
import { GeneralService } from '../../services/general.service';

export interface rankingElement {
  nombre: string,
  noviembre_2020: number,
  diciembre_2020: number,
  enero_2021: number,
  febrero_2021: number,
  marzo_2021: number,
  abril_2021: number,
  mayo_2021: number,
  junio_2021: number,
  julio_2021: number,
  agosto_2021: number,
  septiembre_2021: number,
  octubre_2021: number
}

@Component({
  selector: 'app-tabla',
  templateUrl: './tabla.component.html',
  styleUrls: ['./tabla.component.css']
})
export class TablaComponent implements OnInit {

  constructor(private peticion: GeneralService) { }
  dataSource: rankingElement[] = [];

  ngOnInit(): void {
    this.peticion.tabla().subscribe((res: any) => {
      this.dataSource = res
    })
  }

  displayedColumns: string[] = [
    "nombre", "noviembre_2020", "diciembre_2020", "enero_2021", "febrero_2021", "marzo_2021",
    "abril_2021", "mayo_2021", "junio_2021", "julio_2021", "agosto_2021", "septiembre_2021",
    "octubre_2021" 
  ];
}
