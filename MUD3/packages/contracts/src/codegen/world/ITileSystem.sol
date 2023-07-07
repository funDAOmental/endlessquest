// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface ITileSystem {
  function setTile(
    uint256 coord,
    uint32 tokenId,
    uint8 terrain,
    uint8 tileType,
    int32 gridX,
    int32 gridY,
    bool isEntry,
    int8 doorDir
  ) external;
}