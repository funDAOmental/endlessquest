// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface IChamberSystem {
  function setChamber(
    uint256 coord,
    uint256 tokenId,
    uint256 seed,
    uint8 yonder,
    uint8 chapter,
    uint8 terrain,
    uint8 entryDir,
    uint8 gemPos,
    uint8 gemType,
    uint16 coins,
    uint16 worth
  ) external;

  function setChamberMetadata(uint256 coord, string memory metadata) external;
}
