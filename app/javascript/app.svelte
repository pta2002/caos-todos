<script>
// TODO: Add fetch from /todos.json
  import Todo from 'components/todo.svelte';
  import NewTodo from 'components/newtodo.svelte';
  import LoadingCard from 'components/loadingcard.svelte';

  let todos = []
  $: activeTodos = todos.filter(t => !t.done)
  $: finishedTodos = todos.filter(t => t.done)

  let tasks = fetch('/todos.json').then(json).then(processTasks)

  function json(r) { return r.json() }

  function processTasks(data) {
    let t = []
    let i = 0;
    for (const task of data) {
      task.i = i++;
      t.push(task)
    }
    todos = t
  }

  function addTask(e) {
    let text = e.detail.text

    let task = {
      text: text,
      done: false,
      i: todos.length
    }

    task.promise = fetch('/todos/', {
      method: 'PUT',
      body: JSON.stringify(task),
      headers: { 'Content-Type': 'application/json' }
    }).then(r => {
      if (r.status == 200) {
        return r.json()
      } else {
        console.log(r)
        throw r.status
      }
    }).then(json => {
      for (const key in json) {
        task[key] = json[key]
      }
    }).catch(e => {
      console.log(e)
      todos.splice(task.i, 1)
      processTasks(todos)
    })

    todos = [...todos, task]
  }

  function taskDone(task) {
    task.promise = fetch(`/todos/${task.id}/finish`, { method: 'POST' }).catch(reset)
    task.prev = { done: task.done }
    task.done = true
    todos = todos
  }

  function reset() {
    for (key in task.prev)
      task[key] = task.prev[key]

    task.prev = undefined
  }

  function taskActivated(task) {
    task.promise = fetch(`/todos/${task.id}/activate`, { method: 'POST' }).catch(reset)
    task.prev = { done: task.done }
    task.done = false
    todos = todos
  }

  function deleteTask(task) {
    task.promise = fetch(`/todos/${task.id}`, { method: 'DELETE' })
      .then(r => {
        if (r.status == 200) {
          todos.splice(task.i, 1)
          processTasks(todos)
        }
      })
    
    task.deleting = true
  }
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
  <NewTodo on:addtask={addTask}/>
  <hr>
    {#await tasks}
      <LoadingCard/>
    {:then}
      <h2>Active</h2>
      <div>
        {#if activeTodos.length > 0}
          {#each activeTodos as task (task.i)}
            <Todo {task} on:erase={e => deleteTask(task)} on:done={e => taskDone(task)}/>
          {/each}
        {:else}
          There are no active tasks
        {/if}
      </div>
      <hr>
      <h2>Done</h2>
      <div>
        {#if finishedTodos.length > 0}
          {#each finishedTodos as task (task.i)}
            <Todo {task} on:erase={e => deleteTask(task)} on:activate={e => taskActivated(task)}/>
          {/each}
        {:else}
          There are no finished tasks
        {/if}
      </div>
    {/await}
</div>