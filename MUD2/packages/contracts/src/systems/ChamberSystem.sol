// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Chamber, ChamberData } from "../codegen/Tables.sol";
// import { Crawl } from "../utils/Crawl.sol";
// import { ChamberBridge } from "../utils/ChamberBridge.sol";

contract ChamberSystem is System {

  // Bridge setters
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
  ) public {
    Chamber.set(coord,
      ChamberData({
        opener: _msgSender(),
        tokenId: tokenId,
        seed: seed,
        yonder: yonder,
        chapter: chapter,
        terrain: terrain,
        entryDir: entryDir,
        gemPos: gemPos,
        gemType: gemType,
        coins: coins,
        worth: worth
      })
    );
  }
}