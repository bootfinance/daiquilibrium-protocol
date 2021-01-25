/*
    Copyright 2020 Daiquilibrium devs, based on the works of the Dynamic Dollar Devs and the Empty Set Squad

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity ^0.5.17;
pragma experimental ABIEncoderV2;

import "../dao/Regulator.sol";
import "../oracle/IOracle.sol";
import "./MockComptroller.sol";
import "./MockState.sol";

contract MockRegulator is MockComptroller, Regulator {

    address private _treasury;

    constructor (address oracle, address pool, address treasury) MockComptroller(pool) public {
        _state.provider.oracle = IOracle(oracle);
        _treasury = treasury;
    }

    function stepE() external {
        super.step();
    }

    function bootstrappingAt(uint256 epoch) public view returns (bool) {
        return epoch <= 5;
    }

    function treasury() public view returns (address) {
        return _treasury;
    }
}
