package com.mageddo.wiremock.stub;

import com.github.tomakehurst.wiremock.WireMockServer;

public interface Stub {
  void map(WireMockServer mockServer);
}
