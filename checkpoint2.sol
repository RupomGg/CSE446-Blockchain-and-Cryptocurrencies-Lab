// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract IssueTracker {
    
    enum Status { ACTIVE, IN_PROGRESS, COMPLETE, CLOSED }        
    struct Issue {
        uint issueId;
        string description;
        Status status;
    }

    mapping(uint => Issue) public issueList;
    
    function addIssue(uint _issueId, string memory _description) public {
   
        Issue memory newIssue = Issue({
            issueId: _issueId,
            description: _description,
            status: Status.ACTIVE
        });
        
        
        issueList[_issueId] = newIssue;
    }
    
    
    function updateIssueStatus(uint _issueId, Status _newStatus) public {
        
        Issue storage currentIssue = issueList[_issueId];
        
        require(currentIssue.issueId == _issueId, "Issue does not exist");
        
       
        if (currentIssue.status == Status.ACTIVE) {
            if (_newStatus != Status.IN_PROGRESS) {
                revert("Active issues can only be updated to In Progress");
            }
        } else if (currentIssue.status == Status.IN_PROGRESS) {
            if (_newStatus != Status.COMPLETE) {
                revert("In Progress issues can only be updated to Complete");
            }
        } else if (currentIssue.status == Status.COMPLETE) {
            if (_newStatus != Status.CLOSED) {
                revert("Complete issues can only be updated to Closed");
            }
        } else if (currentIssue.status == Status.CLOSED) {
            revert("Closed issues cannot be updated further");
        }
        

        currentIssue.status = _newStatus;
    }
}
