{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, cython
, setuptools
, libyaml
, python
, poetry-core
, click
, pyyaml
, colorama
, rich
, pdpyras
, humanize
, jsonpath-ng
, deprecation
}:

buildPythonPackage rec {
  pname = "pdh";
  version = "0.3.20";

  disabled = pythonOlder "3.6";

  format = "pyproject";

  src = fetchFromGitHub {
    owner = "mbovo";
    repo = "pdh";
    rev = version;
    hash = "sha256-tWSOgnXcJfI5GYUdfnwejWHssq7cfiQG+ISBU2uK1qI=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [ 
    click
    pyyaml
    colorama
    rich
    pdpyras
    humanize
    jsonpath-ng
    deprecation
   ];

  pythonImportsCheck = [ "pdh" ];

  meta = with lib; {
    description = "Pagerdurty cli for humans";
    homepage = "https://github.com/mbovo/pdh";
    license = licenses.gpl3;
    maintainers = with maintainers; [ "mbovo" ];
  };
}
