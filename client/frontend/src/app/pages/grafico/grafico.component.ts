import { Component, OnInit, ViewChild } from '@angular/core';
import { ChartConfiguration, ChartEvent, ChartType } from 'chart.js';
import { BaseChartDirective } from 'ng2-charts';
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
  selector: 'app-grafico',
  templateUrl: './grafico.component.html',
  styleUrls: ['./grafico.component.css']
})
export class GraficoComponent implements OnInit {

  public lineChartData: ChartConfiguration['data'] = {
    datasets: [
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(242, 177, 90)',
        borderColor: 'rgb(242, 177, 90)',
        pointBackgroundColor: 'rgb(242, 177, 90)',
        pointHoverBorderColor: 'rgb(242, 177, 90)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(230, 139, 18)',
        borderColor: 'rgb(230, 139, 18)',
        pointBackgroundColor: 'rgb(230, 139, 18)',
        pointHoverBorderColor: 'rgb(230, 139, 18)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(150, 91, 12)',
        borderColor: 'rgb(150, 91, 12)',
        pointBackgroundColor: 'rgb(150, 91, 12)',
        pointHoverBorderColor: 'rgb(150, 91, 12)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(90, 73, 79)',
        borderColor: 'rgb(90, 73, 79)',
        pointBackgroundColor: 'rgb(90, 73, 79)',
        pointHoverBorderColor: 'rgb(90, 73, 79)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(236, 58, 58)',
        borderColor: 'rgb(236, 58, 58)',
        pointBackgroundColor: 'rgb(236, 58, 58)',
        pointHoverBorderColor: 'rgb(236, 58, 58)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(169, 16, 16)',
        borderColor: 'rgb(169, 16, 16)',
        pointBackgroundColor: 'rgb(169, 16, 16)',
        pointHoverBorderColor: 'rgb(169, 16, 16)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(61, 6, 6)',
        borderColor: 'rgb(61, 6, 6)',
        pointBackgroundColor: 'rgb(61, 6, 6)',
        pointHoverBorderColor: 'rgb(61, 6, 6)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(39, 69, 61)',
        borderColor: 'rgb(39, 69, 61)',
        pointBackgroundColor: 'rgb(39, 69, 61)',
        pointHoverBorderColor: 'rgb(39, 69, 61)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(144, 128, 29)',
        borderColor: 'rgb(144, 128, 29)',
        pointBackgroundColor: 'rgb(144, 128, 29)',
        pointHoverBorderColor: 'rgb(144, 128, 29)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(81, 72, 16)',
        borderColor: 'rgb(81, 72, 16)',
        pointBackgroundColor: 'rgb(81, 72, 16)',
        pointHoverBorderColor: 'rgb(81, 72, 16)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(92, 9, 9)',
        borderColor: 'rgb(92, 9, 9)',
        pointBackgroundColor: 'rgb(92, 9, 9)',
        pointHoverBorderColor: 'rgb(92, 9, 9)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(178, 140, 190)',
        borderColor: 'rgb(178, 140, 190)',
        pointBackgroundColor: 'rgb(178, 140, 190)',
        pointHoverBorderColor: 'rgb(178, 140, 190)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(190, 140, 152)',
        borderColor: 'rgb(190, 140, 152)',
        pointBackgroundColor: 'rgb(190, 140, 152)',
        pointHoverBorderColor: 'rgb(190, 140, 152)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(190, 153, 140)',
        borderColor: 'rgb(190, 153, 140)',
        pointBackgroundColor: 'rgb(190, 153, 140)',
        pointHoverBorderColor: 'rgb(190, 153, 140)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(55, 34, 4)',
        borderColor: 'rgb(55, 34, 4)',
        pointBackgroundColor: 'rgb(55, 34, 4)',
        pointHoverBorderColor: 'rgb(55, 34, 4)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(39, 69, 61)',
        borderColor: 'rgb(39, 69, 61)',
        pointBackgroundColor: 'rgb(39, 69, 61)',
        pointHoverBorderColor: 'rgb(39, 69, 61)',
      },
      {
        data: [],
        label: '',
        backgroundColor: 'rgb(248, 209, 157)',
        borderColor: 'rgb(248, 209, 157)',
        pointBackgroundColor: 'rgb(248, 209, 157)',
        pointHoverBorderColor: 'rgb(248, 209, 157)',
      }
    ],
    labels: ["Noviembre", "Diciembre", "Enero", "Febrero", "Marzo", "Abril", "Mayo",
      "Junio", "Julio", "Agosto", "Septiembre", "Octubre"]
  };

  public lineChartOptions: ChartConfiguration['options'] = {
    scales: {
      x: {
        ticks: {
          color: 'black',
          font: {
            size: 17,
            weight: 'bold'
          }
        }
      },
      'y-axis-1': {
        position: 'left',
        reverse: true,
        grid: {
          color: 'black',
        },
        ticks: {
          color: 'black',
          font: {
            size: 17,
            weight: 'bold'
          }
        },
        min: 0,
        max: 18
      }
    },
    plugins: {
      legend: {
        title: {
          text: "Indicadores bancarios de Noviembre 2020 a Ocubre 2021",
          display: true,
          color: 'black',
          position: "center",
          font: {
            weight: 'bold',
            size: 14
          }
        },
        display: true, position: 'right', labels: {
          color: 'black',
          font: {
            weight: 'bold',
            size: 20
          },
          padding: 25
        }
      },
    },
    elements: {
      line: {
        borderWidth: 5
      },
      point: {
        radius: 5,
        borderWidth: 2
      }
    },
    layout: {
      autoPadding: true
    },
  };

  public lineChartType: ChartType = 'line';

  @ViewChild(BaseChartDirective) chart?: BaseChartDirective;

  // events
  public chartClicked({ event, active }: { event?: ChartEvent, active?: {}[] }): void {
    console.log(event, active);
  }

  public chartHovered({ event, active }: { event?: ChartEvent, active?: {}[] }): void {
    console.log(event, active);
  }

  public hideOne(): void {
    const isHidden = this.chart?.isDatasetHidden(1);
    this.chart?.hideDataset(1, !isHidden);
  }

  constructor(private peticion: GeneralService) { }

  ngOnInit(): void {
    this.peticion.tabla().subscribe((res: any) => {
      console.log(res)
      for (let i = 0; i < res.length; i++) {
        this.lineChartData.datasets[i].label = res[i].nombre
        this.lineChartData.datasets[i].data[0] = res[i].noviembre_2020
        this.lineChartData.datasets[i].data[1] = res[i].diciembre_2020
        this.lineChartData.datasets[i].data[2] = res[i].enero_2021
        this.lineChartData.datasets[i].data[3] = res[i].febrero_2021
        this.lineChartData.datasets[i].data[4] = res[i].marzo_2021
        this.lineChartData.datasets[i].data[5] = res[i].abril_2021
        this.lineChartData.datasets[i].data[6] = res[i].mayo_2021
        this.lineChartData.datasets[i].data[7] = res[i].junio_2021
        this.lineChartData.datasets[i].data[8] = res[i].julio_2021
        this.lineChartData.datasets[i].data[9] = res[i].agosto_2021
        this.lineChartData.datasets[i].data[10] = res[i].septiembre_2021
        this.lineChartData.datasets[i].data[11] = res[i].octubre_2021
        this.chart?.update();
      }
    })
  }

}
