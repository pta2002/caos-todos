<script>
import Todo from 'components/todo.svelte';
import NewTodo from 'components/newtodo.svelte';
  let todos = [
    "Hello"
  ]
  let activeTodos = [
    { text: "Active #1", finished: false },
    { text: "Active #2", finished: false },
    { text: "Active #3", finished: false },
    { text: "Active #4", finished: false },
  ];
  let finishedTodos = [
    { text: "Task #1", finished: true },
    { text: "Task #2", finished: true },
    { text: "Task #3", finished: true },
    { text: "Task #4", finished: true },
    { text: "Task #5", finished: true },
    { text: "Task #6", finished: true },
  ];
</script>

<style>
.card {
  background-color: #fff;
  padding: 1rem;
  margin: 0 auto;
  min-width: 20rem;
  border-radius: .4rem;
  width: 50vw;
}

h1 {
  margin: 0;
}
</style>

<div class="card">
  <h1>Todos</h1>
  <hr>
  <NewTodo/>
  <hr>
  <h2>Active</h2>
  <div>
    {#if activeTodos.length > 0}
      {#each activeTodos as task}
        <Todo {task}/>
      {/each}
    {:else}
      There are no active tasks
    {/if}
  </div>
  <hr>
  <h2>Done</h2>
  <div>
    {#if finishedTodos.length > 0}
      {#each finishedTodos as task}
        <Todo {task}/>
      {/each}
    {:else}
      There are no finished tasks
    {/if}
  </div>
</div>