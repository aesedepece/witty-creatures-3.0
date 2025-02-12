// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "witnet-solidity-bridge/contracts/interfaces/IWitnetPriceRouter.sol";
import "./IWc3Decorator.sol";

/// @title Witty Creatures 3.0 Token viewing interface.
/// @author Otherplane Labs, 2022.
interface IWc3View {
    function decorator() external view returns (IWc3Decorator);
    function randomizer() external view returns (IWitnetRandomness);
    function router() external view returns (IWitnetPriceRouter);
    function signator() external view returns (address);

    function estimateMintUsdCost6(uint _gasPrice) external view returns (uint64);
    
    function getHatchingBlock() external view returns (uint256);
    function getSettings() external view returns (Wc3Lib.Settings memory);    
    function getStatus() external view returns (Wc3Lib.Status);
    function getTokenIntrinsics(uint256 _tokenId) external view returns (Wc3Lib.WittyCreature memory);
    function getTokenStatus(uint256 _tokenId) external view returns (Wc3Lib.WittyCreatureStatus);

    function preview(
        string calldata _name,
        uint256 _globalRanking,
        uint256 _guildId,
        uint256 _guildPlayers,
        uint256 _guildRanking,
        uint256 _index,
        uint256 _score
    ) external view returns (string memory);
    
    function totalSupply() external view returns (uint256);
    function version() external view returns (string memory);
}
