// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

contract Portfolio{


// Resume link - https://drive.google.com/file/d/19YoeTgdLBydaepXqZRQf7a_t7i_cpqvF/view?usp=drivesdk
// Nike Store live-  https://krritik01.github.io/Project-Nike_Store/
// Voting Smart Contract - https://github.com/krritik01/Project-Voting-System-using-Solidity.git
// Ethereum E-commerce Smart Contract - https://github.com/krritik01/Project-E-commerce-Smart-Contract.git

// Profile pic 1 - QmSWG35sSdb6UEtevQUsSs3JDoZKn6NSTu4W4JjmTSbDTW
// Profile pic 2 - Qmek8NzwZr7eQ5pcp7eYohz4ZBFjqThCTNEeekSDr8ZdA9
// Profile pic 3 - QmRYqfSys1wKHSgLtFgLHhS4k7B2jpwxh5CZ6TqtrFPTjj
// Profile pic 4 - QmWiLqDP7cXe84hbh8Qb5Bi1CGLmp8eTnzNx5tgYVmSBhh

// Nike store image - QmVQWqaSFTx95FsAXFtEQKvfwvaHab4NG7KJiM4hdDxSh9
// Ecommerce image - QmX9gSNbhw7jjr7z6paq6xBFk1UBd4ncazG18JupopKFFe
// Voting hand image - QmU5mFAa3dhSrsYT9GiY1pbPm3qCCLURErwyvZ21pWSyYG
// Voting image - QmZ3PUPWjXLTvaUVmtWjXh9B7CHGUiDdxNyMBQ4gu1AurY

     
      struct Project{
        uint id;
        string name;
        string description;
        string image;
        string githubLink;
    }

    struct Education{
        uint id;
        string date;
        string degree;
        string knowledgeAcquired;
        string instutionName;
    }

     struct Experience{
      uint id;
      string date;
      string post;
      string knowledgeAcquired;
      string compamyName;
  }

    Project[3] public projects;
    Education[3] public educationDetails;
    Experience[3] public experienceDetails;

    string public imageLink="Qmek8NzwZr7eQ5pcp7eYohz4ZBFjqThCTNEeekSDr8ZdA9";
    string public description="A Tech Shaman Crafting the Future 🌌 Master of Shadows in the Blockchain Realm 🌑";
    string public resumeLink="QmNc5N8qpFm9t7rMeqB7EzJwwmPcfzrJBpdH4EX2Ybm7ED";
    uint projectCount;
    uint educationCount;
    uint experienceCount;
    address public manager;

    constructor(){
        manager=msg.sender;
    }

    modifier onlyManager(){
        require(manager==msg.sender,"You are not a manager");
        _;
    }
// We use calldata here because it is less expensive and memory is expensive and in calldata information can not changed
//Project
    function insertProject(string calldata _name,string calldata _description,string calldata _image,string calldata _githubLink) external{
        require(projectCount<3,"Only 3 project allowed");
        projects[projectCount]=Project(projectCount,_name,_description,_image,_githubLink);
        projectCount++;
    }

    function changeProject(string calldata _name,string calldata _description,string calldata _image,string calldata _githubLink,uint _projectCount) external{
         require(_projectCount>=0 && _projectCount<3,"Only 3 project allowed");
        projects[projectCount]=Project(_projectCount,_name,_description,_image,_githubLink);
       }

    function allProject() external view returns(Project[3] memory){
        return projects;
    }

// Education

    function insertEducation(string calldata _date,string calldata _degree, string calldata _knowledgeAcquired, string calldata _instutionName)external onlyManager{
         require(educationCount<3,"Only 3 education details allowed");
        educationDetails[educationCount]=Education(educationCount,_date,_degree,_knowledgeAcquired,_instutionName);
        educationCount++;
    }

    function changeEducation(string calldata _date,string calldata _degree, string calldata _knowledgeAcquired, string calldata _instutionName, uint _educationDetailCount) external onlyManager{
        require(_educationDetailCount>=0 && _educationDetailCount<3,"Invalid education Details");
        educationDetails[_educationDetailCount]=Education(_educationDetailCount,_date,_degree,_knowledgeAcquired,_instutionName);
    }
    function allEducationDetails() external view returns(Education[3] memory){
        return educationDetails;
    }

// Experience
  
   function insertExperience(string calldata _date, string calldata _post, string calldata _knowledgeAcquired, string calldata _companyName) external onlyManager{
         require(experienceCount<3,"You can only add 3 experience");
        experienceDetails[experienceCount]=Experience(educationCount,_date,_post,_knowledgeAcquired,_companyName);
        experienceCount++;
   }

    function changeExperience(string calldata _date,string calldata _post,string calldata _knowledgeAcquired,string calldata _companyName, uint _experienceDetailCount) external onlyManager{
        require(_experienceDetailCount>=0&& _experienceDetailCount<3,"Invalid experienceCount");   
        experienceDetails[_experienceDetailCount]=Experience(_experienceDetailCount,_date,_post,_knowledgeAcquired,_companyName);
    }
    function allExperienceDetails() external view returns (Education[3] memory){
        return educationDetails;
    }


// Description

   function changedescription(string calldata _description) external {
    description=_description;
   }  

// Change in resumeLink

   function changeResumeLink(string calldata _resumeLink) external onlyManager{
    resumeLink=_resumeLink;
   } 

// Chnage in imageLink

   function changeImageLink(string calldata _imageLink) external onlyManager{
    imageLink=_imageLink;
   }

// For Donation

   function donate() public payable {
    payable(manager).transfer(msg.value);
   }

}
