docker:
  swarm:
    token: SWMTKN-1-2nnz1mdv9kgpmi5a4yuv2p0ywzu6my5a80omoovnk0y75x080l-9gdpvu6imv4rjgor106d237xj
    manager: 192.168.1.106:2377

  registry:
    certificate:
      name: docker-registry.sethmiller.me:5000
      certificate: |
          -----BEGIN CERTIFICATE-----
          MIIGsDCCBJigAwIBAgIJAMwss3BYUr72MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYD
          VQQGEwJVUzEOMAwGA1UECBMFVGV4YXMxDzANBgNVBAcTBkF1c3RpbjELMAkGA1UE
          ChMCTkExDjAMBgNVBAsTBWFkbWluMSYwJAYDVQQDEx1kb2NrZXItcmVnaXN0cnku
          c2V0aG1pbGxlci5tZTEhMB8GCSqGSIb3DQEJARYSc2V0aEBzZXRobWlsbGVyLm1l
          MB4XDTE2MDgxODA0MTQyNVoXDTE3MDgxODA0MTQyNVowgZYxCzAJBgNVBAYTAlVT
          MQ4wDAYDVQQIEwVUZXhhczEPMA0GA1UEBxMGQXVzdGluMQswCQYDVQQKEwJOQTEO
          MAwGA1UECxMFYWRtaW4xJjAkBgNVBAMTHWRvY2tlci1yZWdpc3RyeS5zZXRobWls
          bGVyLm1lMSEwHwYJKoZIhvcNAQkBFhJzZXRoQHNldGhtaWxsZXIubWUwggIiMA0G
          CSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDo9T4iSB06EQULgu/pASPHAJNoRVAl
          jbQ7irTtF9RNawwdwnBqDqiKvHedv1SPwrhdwEkYkwIC71WyvPBCZKQ3EiF5xD06
          GJPaVRTjhMhkC1wbqQu+ZXeslWFw268gOBgDzxRSHqqsNBxYXWeky/yaqSMh3nUv
          354YsC6ryzGpby3oesMPHBrnTZsbvHBEO67GM9IT1Y9XO0E6Z87H5ZmoqSUiLhaP
          UJkaWvLw20tjd3yZzUWL202/n9lCnDhzK5tMM6Wgp0/LLHVijr90kPWmCQYk+86Q
          +z2Wi1ATnr7IwAZvrl6uIFSZhVy6EzC9Of3FGIWeBI3BXguyQYuz42EIvvSQ7lmq
          Gk2BFR7wgGo8OxGEps1BFbYsUFL9JM6NHofWfZA2zYGMcI0moxo2xUZg7g2yRGn+
          kzQGUr3eRLVsvwi08vOnEdXiucZYmxE/kmj38T8jxOKSsDooDzaZ4ObHHE8b3BcZ
          sOtPECgnT507vBecBTPMUD7Gqp0lQ6KR/0kSa8juUzW+Xj3gd0WgeC5tV3VA4jAQ
          vVyFo8DLi/eP2sjLc85h6ysSXoI44kOZ5UDO9lEri5h9+UKuqAZ1hPdRoyE8Xow4
          no0CfiX40tGzDNf59PWBAIvUg3MxBdQqycNyS+MNDxU0zE4Ejtm24E4dMSmIjybA
          N9RirqHeumFeswIDAQABo4H+MIH7MB0GA1UdDgQWBBT3+Eyinx6S3Wqwf6sUPa5U
          oxabdzCBywYDVR0jBIHDMIHAgBT3+Eyinx6S3Wqwf6sUPa5Uoxabd6GBnKSBmTCB
          ljELMAkGA1UEBhMCVVMxDjAMBgNVBAgTBVRleGFzMQ8wDQYDVQQHEwZBdXN0aW4x
          CzAJBgNVBAoTAk5BMQ4wDAYDVQQLEwVhZG1pbjEmMCQGA1UEAxMdZG9ja2VyLXJl
          Z2lzdHJ5LnNldGhtaWxsZXIubWUxITAfBgkqhkiG9w0BCQEWEnNldGhAc2V0aG1p
          bGxlci5tZYIJAMwss3BYUr72MAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQELBQAD
          ggIBADTpuNv80DmMz6nu+2ZM3lUTptZgC0e7KmsICK8/YPHcoY83l91o+p1U17Xe
          iA3Uk1B/fza9oTvrFPQiqYPH+2TiIqfFU5SjidSNZze+YZy0t3sfwTKhowKDKTdc
          7rz/Qi7Q/2N01CjcZxPPp7igVOTQe5T5SWZhNhLOt3PhzHTwMVipo74H9bvlXWhU
          vxzBWH3YTCY6o6SG/UaDdr33IVptLl3G1fYrN0VHNnYAY2DWEuCC8x5c2lnNmrZV
          5qy2RLhLLUU3xhCDetf4cbyTAjUObpCenJjIg89Ltp5Yv8df84+HKgDMs++i12+I
          5tNUi4+jLGnDm7dluXIOq+HUdu64rreX4FdGSffTuKbqllHMNGzvidwcKXI4Tf7/
          TNneYtr4obOyl2Lionp+dTQ2ERS7aQYiaL8/KAJC/YpYCoJoVbay/LdsXNucp2uG
          CIr0InRDKcNAWVtnkOkaSpzBa7MOYDU/+Enk5JmIerNkQzP9zMBP/9uJz5TjtCgx
          NqqKyp/RVFBAHuzLgFSc5si6GV5ee55U8S1dhHFRs+cwtIL3fkUqV9OUTr8jwGvE
          BmE9wH0HfRmFzfRyW24vq+2UCwWaXPDka6QHnCfpa0uAilKVJle3etunicTzrh0+
          diJX2HRrw2j0Q+aPkbF4VsSzDisKBgCndNW5oVB+jh5g1CCQ
          -----END CERTIFICATE-----

hostsfile:
  hosts:
    docker-registry: 192.168.1.106
    docker-registry.sethmiller.me: 192.168.1.106


nfs:
  mounts:
    - path: /data
    - device: storage01:/volume1/docker
