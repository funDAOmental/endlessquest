// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import {
  Token,
  Chamber, ChamberData
} from "../codegen/Tables.sol";

contract ChamberSystem is System {

  function setChamber(
    uint256 coord,
    uint256 seed,
    uint32 tokenId,
    uint8 yonder,
    uint8 chapter,
    uint8 terrain,
    uint8 entryDir,
    uint8 gemPos,
    uint8 gemType,
    uint16 coins,
    uint16 worth
  ) public {
    Token.set(tokenId, coord);
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
        worth: worth,
        agent: 0
      })
    );
  }

  function setChamberAgent(uint256 coord, bytes32 agent) public {
    ChamberData memory data = Chamber.get(coord);
    data.agent = agent;
    Chamber.set(coord, data);
  }
}
