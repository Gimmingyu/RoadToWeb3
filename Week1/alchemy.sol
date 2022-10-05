// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.7.3/utils/Counters.sol";

// Alchemy는 이름, ERC721 이하는 모두 상속을 받은 컨트랙트들
contract Alchemy is ERC721, ERC721Enumerable, ERC721URIStorage {
    using Counters for Counters.Counter;

    // private, public, internal, external ...
    // private은 스마트 컨트랙트 내에서만 보이고, 내부에서만 수행할 수 있다.
    Counters.Counter private _tokenIdCounter;

    // MAX NUMBER OF COUNTERS
    uint256 MAX_SUPPLY = 10000;

    // 생성자, Alchemy는 이름, ALCH는 Symbol
    constructor() ERC721("Alchemy", "ALCH") {}

    // minting은 새로운 토큰 혹은 엔트리를 만들어 내는 행위
    // action of create a new entry or thing onto the blockchain
    // nft를 전송할 wallet의 주소, token uri를 받는다
    // public 과 onlyOwner 를 이용해서 모두가 보고 사용할 수 있다.
    function safeMint(address to, string memory uri) public {
        // 현재 토큰 id를 카운터에서 가져온다.
        uint256 tokenId = _tokenIdCounter.current();
        // MAX_SUPPLY에 도달했는지 검사
        require(tokenId <= MAX_SUPPLY, "I'm sorry all NFTs have been minted");
        // 토큰 id 증가
        _tokenIdCounter.increment();
        // nft 민팅
        _safeMint(to, tokenId);
        // token uri 세팅
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.
    // overribe 한 메소드들

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // internal은 private과 비슷하지만, 컨트랙트 내부 혹은 상속된 컨트랙트에서 호출할 수 있다.
    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    // tokenId를 넘기고 tokenUri를 리턴 받는다.
    // view는 reading 역할을 담당하는 modifier
    // write하지 않겠다는 의미, gas가 발생하지 않는다 !
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
