import { HttpClient, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})

export class GeneralService {

  constructor(private http: HttpClient) { }

  headers: HttpHeaders = new HttpHeaders({
    'Content-Type': 'application/json'
  });

  loginPeticion(usuario: string, contra: string) {
    return this.http.post("http://localhost:5000/login", {
      'usuario': usuario,
      'contra': contra
    }, { headers: this.headers }
    ).pipe(map(data => data));
  }

  modificarPeticion(activo: number, id: number, mes: number, anio: number) {
    console.log(id)
    return this.http.put("http://localhost:5000/modificar", {
      'activo': activo,
      'id_banco': id,
      'mes': mes,
      'anio': anio
    }, { headers: this.headers }
    ).pipe(map(data => data));
  }

  tabla() {
    return this.http.get("http://localhost:5000/ranking").pipe(map(data => data));
  }

  bancos() {
    return this.http.get("http://localhost:5000/bancos").pipe(map(data => data));
  }
}
