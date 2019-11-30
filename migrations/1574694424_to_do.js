const ToDo = artifacts.require("ToDo");

module.exports = function(_deployer) {
  _deployer.deploy(ToDo);
};
