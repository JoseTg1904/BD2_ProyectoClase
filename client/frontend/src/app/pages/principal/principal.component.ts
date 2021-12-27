import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-principal',
  templateUrl: './principal.component.html',
  styleUrls: ['./principal.component.css']
})
export class PrincipalComponent implements OnInit {

  constructor(private router: Router, private snackBar: MatSnackBar) { 
    if(localStorage.length === 0){
      this.router.navigate(['']);
    } 
  }

  ngOnInit(): void { }

  carga() {
    this.snackBar.open("carga de archivo")
    setTimeout(() => {
      this.snackBar.dismiss()
    }, 3000)
  }

  tabla() { this.router.navigate(['/home/tabla']) }

  grafico() { this.router.navigate(['/home/grafico']) }

  modificar() { this.router.navigate(['/home/modificar']) }

  logout() {
    localStorage.removeItem("loggeado")
    this.router.navigate(['']);
  }
}
