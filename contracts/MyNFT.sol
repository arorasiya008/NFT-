// SPDX-License-Identifier: MIT
// Contract based on https://docs.openzeppelin.com/contracts/4.x/erc721
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNft is ERC721Enumerable, Ownable{
    uint256 public constant MAX_NFT_MINTED = 3000;
    uint256 private token_id = 0;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(string memory imageURI) external{
        require(token_id<MAX_NFT_MINTED, "Maximum minting limit reached");

        _safeMint(msg.sender, token_id);
        _setTokenURI(token_id,imageURI);

        token_id++;
    }

    function changeImage(uint256 tokenId, string memory newImageURI) external onlyOwner{
        require(_ownerOf(tokenId)!=address(0), "Token does not exist");
        _setTokenURI(tokenId,newImageURI);
    }

}