// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract IssueTracker {
    // Define enum for issue status
    enum Status { ACTIVE, IN_PROGRESS, COMPLETE, CLOSED }
    
    // Define Issue struct
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
}
