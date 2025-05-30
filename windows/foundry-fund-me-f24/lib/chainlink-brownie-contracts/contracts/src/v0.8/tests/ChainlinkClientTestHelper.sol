// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../ChainlinkClient.sol";

contract ChainlinkClientTestHelper is ChainlinkClient {
  constructor(address _link, address _oracle) {
    _setChainlinkToken(_link);
    _setChainlinkOracle(_oracle);
  }

  event Request(bytes32 id, address callbackAddress, bytes4 callbackfunctionSelector, bytes data);
  event LinkAmount(uint256 amount);

  function publicNewRequest(bytes32 _id, address _address, bytes memory _fulfillmentSignature) public {
    Chainlink.Request memory req = _buildChainlinkRequest(_id, _address, bytes4(keccak256(_fulfillmentSignature)));
    emit Request(req.id, req.callbackAddress, req.callbackFunctionId, req.buf.buf);
  }

  function publicRequest(bytes32 _id, address _address, bytes memory _fulfillmentSignature, uint256 _wei) public {
    Chainlink.Request memory req = _buildChainlinkRequest(_id, _address, bytes4(keccak256(_fulfillmentSignature)));
    _sendChainlinkRequest(req, _wei);
  }

  function publicRequestRunTo(
    address _oracle,
    bytes32 _id,
    address _address,
    bytes memory _fulfillmentSignature,
    uint256 _wei
  ) public {
    Chainlink.Request memory run = _buildChainlinkRequest(_id, _address, bytes4(keccak256(_fulfillmentSignature)));
    _sendChainlinkRequestTo(_oracle, run, _wei);
  }

  function publicRequestOracleData(bytes32 _id, bytes memory _fulfillmentSignature, uint256 _wei) public {
    Chainlink.Request memory req = _buildOperatorRequest(_id, bytes4(keccak256(_fulfillmentSignature)));
    _sendOperatorRequest(req, _wei);
  }

  function publicRequestOracleDataFrom(
    address _oracle,
    bytes32 _id,
    bytes memory _fulfillmentSignature,
    uint256 _wei
  ) public {
    Chainlink.Request memory run = _buildOperatorRequest(_id, bytes4(keccak256(_fulfillmentSignature)));
    _sendOperatorRequestTo(_oracle, run, _wei);
  }

  function publicCancelRequest(
    bytes32 _requestId,
    uint256 _payment,
    bytes4 _callbackFunctionId,
    uint256 _expiration
  ) public {
    _cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
  }

  function publicChainlinkToken() public view returns (address) {
    return _chainlinkTokenAddress();
  }

  function publicFulfillChainlinkRequest(bytes32 _requestId, bytes32) public {
    fulfillRequest(_requestId, bytes32(0));
  }

  function fulfillRequest(bytes32 _requestId, bytes32) public {
    _validateChainlinkCallback(_requestId);
  }

  function publicLINK(uint256 _amount) public {
    emit LinkAmount(LINK_DIVISIBILITY * _amount);
  }

  function publicOracleAddress() public view returns (address) {
    return _chainlinkOracleAddress();
  }

  function publicAddExternalRequest(address _oracle, bytes32 _requestId) public {
    _addChainlinkExternalRequest(_oracle, _requestId);
  }
}
