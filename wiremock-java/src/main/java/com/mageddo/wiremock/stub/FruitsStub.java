package com.mageddo.wiremock.stub;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.github.tomakehurst.wiremock.WireMockServer;

import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;
import static com.github.tomakehurst.wiremock.client.WireMock.get;
import static com.github.tomakehurst.wiremock.client.WireMock.urlEqualTo;

public class FruitsStub implements Stub {

  public void map(WireMockServer mockServer) {
    mockServer.stubFor(
        get(urlEqualTo("/fruits"))
            .willReturn(
                aResponse()
                    .withJsonBody(
                        JsonNodeFactory
                            .instance
                            .objectNode()
                            .put("name", "grape")
                            .put(
                                "boughtAt",
                                LocalDateTime
                                    .now()
                                    .toString()
                            )
                    )
            )
    );
  }
}
