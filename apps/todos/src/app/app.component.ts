import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Todo } from '@myorg/data';

import { environment } from '../environments/environment';

@Component({
  selector: 'myorg-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  todos: Todo[] = [];

  constructor(private http: HttpClient) {
    this.fetch();
  }

  fetch() {
    this.http.get<Todo[]>(`${environment.apiUrl}/api/todos`).subscribe((t) => (this.todos = t));
  }

  addTodo() {
    this.http.post(`${environment.apiUrl}/api/todos/addTodo`, {}).subscribe(() => {
      this.fetch();
    });
  }
}
