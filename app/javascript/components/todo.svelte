<script>
    export let task;
</script>

<style>
    .task {
        display: flex;
        justify-content: space-between;
        margin: .4rem 0;
    }

    .buttons {
        display: flex;
        flex-flow: row;
    }

    .buttons > * {
        cursor: pointer;
        padding: 0.5rem;
        border-radius: .2rem;
        margin: 0 .3rem;
    }

    .finished {
        color: #636e72;
        text-decoration: line-through;
    }

    .erase {
        background-color: #e17055;
        border: #a1372f 1px solid;
    }

    .active {
        background-color: #74b9ff;
        border: #5391cf 1px solid;
    }

    .done {
        background-color: #55efc4;
        border: #43c9a3 1px solid;
    }

    p {
        margin: 0;
    }
</style>

<div class="task" id="12312">
    <p class:finished={task.finished} class="bg-white">{task.text}</p>
    <div class="buttons">
        <div class="erase">Erase</div>
        {#if task.finished}
            <div class="active">Active</div>
        {:else}
            <div class="done">Done</div>
        {/if}
    </div>
</div>
