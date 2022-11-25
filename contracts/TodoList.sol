pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;

    constructor() public {
        createtask("learn truffle");
        createtask("go to the website, https://trufflesuite.com/");
    }

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    function createtask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }
}