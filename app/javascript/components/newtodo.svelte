<style>
    input[type="text"] {
        width: 100%;
        border-radius: 0;
        border-top-left-radius: .5rem;
        border-bottom-left-radius: .5rem;
        border: 1px solid #b2bec3;
    }

    button {
        border-radius: 0;
        border-top-right-radius: .5rem;
        border-bottom-right-radius: .5rem;
        border: #43c9a3 1px solid;
        background-color: #55efc4;
        cursor: pointer;
        flex-shrink: 0;
        width: 4rem;
    }

    button[disabled] {
        cursor: default;
        background-color: #8eddc7;
    }

    .contain {
        display: flex;
    }

    .contain > * {
        padding: .5rem;
    }
</style>

<div class="contain">
    <input type="text" on:keypress={addTask} bind:value={text} placeholder="Add a task">
    <!-- wtf? -->
    <button on:click={addTask} disabled={text.trim() == ""}>Add</button>
</div>

<script>
    import { createEventDispatcher } from 'svelte'

    const dispatch = createEventDispatcher()
    let text = "";

    function addTask(e) {
        if (((e.type === "keypress" && e.code === "Enter") || e.type == "click") && text.trim() != "") {
            dispatch('addtask', {text: text})
            text = "";
        }
    }
</script>