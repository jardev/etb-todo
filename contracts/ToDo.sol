pragma solidity ^0.5.0;

contract ToDo {
  struct Task {
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }

  uint lastTaskId;
  mapping(uint => Task) tasks;
  uint[] taskIds;

  event TaskCreated(
    uint id,
    uint date,
    string content,
    string author,
    bool done
  );

  constructor() public {
    lastTaskId = 0;
  }

  function createTask(string memory _content, string memory _author) public {
    lastTaskId++;
    tasks[lastTaskId] = Task(lastTaskId, now, _content, _author, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, now, _content, _author, false);
  }

  function getTaskIds() public view returns(uint[] memory) {
    return taskIds;
  }

  function getTaskFixtures(uint _id) public view returns(
      uint,
      uint,
      string memory,
      string memory,
      bool
     ) {
    return (0, now, "Create more tutorials for ETB", "Julien", false);
  }

  function getTask(uint id) taskExists(id) public view
    returns(
      uint,          // id
      uint,          // date
      string memory, // content
      string memory, // author
      bool           // done
  ) {
    return(
      id,
      tasks[id].date,
      tasks[id].content,
      tasks[id].author,
      tasks[id].done
    );
  }

  modifier taskExists(uint id) {
    if (tasks[id].id == 0) {
      revert();
    }
    _;
  }
}
