import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './pages/login/login.component';
import { PrincipalComponent } from './pages/principal/principal.component';
import { TablaComponent } from './pages/tabla/tabla.component';
import { GraficoComponent } from './pages/grafico/grafico.component';
import { ModificarComponent } from './pages/modificar/modificar.component';

const routes: Routes = [
  { path: '', component: LoginComponent},
  { path: 'home', component: PrincipalComponent,
    children: [
      { path: '', pathMatch: "full", redirectTo: 'tabla' },
      { path: 'tabla', component: TablaComponent },
      { path: 'grafico', component:  GraficoComponent},
      { path: 'modificar', component: ModificarComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
