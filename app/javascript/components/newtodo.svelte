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

    .contain {
        display: flex;
    }

    .contain > * {
        padding: .5rem;
    }
</style>

<div class="contain">
    <input type="text">
    <button>Add</button>
</div>