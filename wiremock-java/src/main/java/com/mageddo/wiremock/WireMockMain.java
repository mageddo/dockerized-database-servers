package com.mageddo.wiremock;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.mageddo.wiremock.stub.FruitsStub;

import java.util.List;

import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;

public class WireMockMain {
  public static void main(String[] args) {
    final var wireMockServer = new WireMockServer(
        wireMockConfig()
            .port(8089)
    );
    List
        .of(
            new FruitsStub()
        )
        .forEach(it -> it.map(wireMockServer));
    wireMockServer.start();
  }
}
