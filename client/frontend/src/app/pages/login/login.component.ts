import { Component, OnInit } from '@angular/core';
import { GeneralService } from '../../services/general.service';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent implements OnInit {

  hide = true;

  constructor(private peticion: GeneralService, private router: Router, private snackBar: MatSnackBar) {
    localStorage.removeItem("loggeado")
  }

  ngOnInit(): void { }

  login(user: string, contra: string) {
    this.peticion.loginPeticion(user, contra).subscribe((res: any) => {
      if (res.estado == 1) {
        localStorage.setItem("loggeado", "log")
        this.router.navigate(['/home'])
      } else {
        this.snackBar.open("Usuario no encontrado, intenta de nuevo")
        setTimeout(() => {
          this.snackBar.dismiss()
        }, 3000)
      }
    })
  }
}
