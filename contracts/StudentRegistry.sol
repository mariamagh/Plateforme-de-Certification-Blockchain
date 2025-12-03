// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract StudentRegistry is Ownable, ERC721URIStorage {
    
    uint256 private _nextTokenId;

    struct Student {
        uint256 id;
        string name;
        string course;
        string birthDate; // Nouveau : Date de naissance
        uint256 grade;    // Nouveau : Note sur 20
        bool isEnrolled;  // Sert à savoir si l'étudiant est actif ou supprimé
        uint256 diplomaTokenId;
    }

    mapping(uint256 => Student) public students;
    uint256[] public studentIds;

    constructor() Ownable(msg.sender) ERC721("StudentDiploma", "SDIP") {}

    // Ajout avec les nouveaux champs
    function addStudent(
        uint256 _id, 
        string memory _name, 
        string memory _course, 
        string memory _birthDate, 
        uint256 _grade
    ) public onlyOwner {
        // On initialise avec isEnrolled = true
        Student memory newStudent = Student(_id, _name, _course, _birthDate, _grade, true, 0);
        students[_id] = newStudent;
        studentIds.push(_id);
    }

    // Mint NFT (Inchangé)
    function issueDiploma(uint256 _studentId, address _studentWallet, string memory _tokenURI) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _mint(_studentWallet, tokenId);
        _setTokenURI(tokenId, _tokenURI);
        students[_studentId].diplomaTokenId = tokenId;
        return tokenId;
    }

    // Nouveau : Supprimer (Désactiver) un étudiant 🗑️
    function removeStudent(uint256 _id) public onlyOwner {
        require(students[_id].isEnrolled == true, "Deja supprime");
        students[_id].isEnrolled = false; 
    }

    // Lectures
    function getStudent(uint256 _id) public view returns (Student memory) {
        return students[_id];
    }

    function getTotalStudents() public view returns (uint256) {
        return studentIds.length;
    }
}