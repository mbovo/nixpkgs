{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, cython
, setuptools
, libyaml
, python
, requests
, deprecation
}:

buildPythonPackage rec {
  pname = "pdpyras";
  version = "5.2.0";

  disabled = pythonOlder "3.6";

  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4cn+075dTsUy3mKkk7Ie/z0EIQprDWu6R7Y3w79Oz4g=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [ 
    requests
    deprecation
   ];

  #pythonImportsCheck = [ "" ];

  meta = with lib; {
    description = "PagerDuty Python REST API Sessions";
    homepage = "https://github.com/PagerDuty/pdpyras";
    license = licenses.mit;
    maintainers = with maintainers; [ "mbovo" ];
  };
}
