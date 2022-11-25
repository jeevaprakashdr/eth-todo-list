pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;

    constructor() public {
        createTask("learn truffle");
        createTask("go to the website, https://trufflesuite.com/");
    }

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);

    function createTask(string memory _content) public {
        bool isNotCompleted = false;
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, isNotCompleted);

        emit TaskCreated(taskCount, _content, isNotCompleted);       
    }

    function toggleCompleted(uint id) public {
        Task memory task = tasks[id];
        task.completed = !task.completed;

        tasks[id] = task;
        emit TaskCompleted(id, task.completed);
    }
}