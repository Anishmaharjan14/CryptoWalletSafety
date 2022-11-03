pragma solidity 0.6.6;

 contract BEC_Target{
     mapping(address => uint) public balances;
 
 function batchTransfer(address[] memory _receivers, uint256 _value) public payable  returns (bool) 
 {
    uint cnt = _receivers.length;
    uint256 amount = uint256(cnt) * _value;
    require(cnt > 0 && cnt <= 20,"too many receivers");
    require(_value > 0 && balances[msg.sender] >= amount,"not enough balance");

    balances[msg.sender] = balances[msg.sender] - amount;
    for (uint i = 0; i < cnt; i++) {
        balances[_receivers[i]] = balances[_receivers[i]] + _value;
         payable(_receivers[i]).transfer(_value);
    }
    return true;
  }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
 }

