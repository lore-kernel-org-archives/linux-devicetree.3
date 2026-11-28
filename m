Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850174;
	b=giePr/2KcrqGbIexgQ3gr1pLgCTtgS5OtFt59t+J0qyp92JFcjj1RY/EQjhdcHYtED+l
	 luNnpcFnCZsC1vZrEIU2+B5rKyC3eAskOEefPiLOYPowWcpOdFBWXblDnbRXK+/ts4B6O
	 uwUSfWHfRzhhbrz7L1moXcIRdB8DWe5FE0CRJdLeL+n3ep36frAYP5VBx7lVUiEoKoyAZ
	 tlHg9V0SdC/Uj8CQLDhS7pNVYPp2nQFDPPaDmqMyaoCeQIwr94twAXa5suy8DoocMIKJN
	 u0KxCkeUXLNb/ztjftF1dnP5KUmQe+v0XqHQLLrxV0wVYo1jgdgyXzN8mUKzhmChQLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
	b=l8q79Qc+WerZeM26Zdmsf1C+JMm38pOLE9mqwaF6dDzFL4OQNm6grGOplbF55CUhVSCK
	 ym12GMEAGf09gWY862UurocMCiM2afvw1No2LfVXh0H3Z9DnqPqx1U5tvbpu8H5Sae0y2
	 YpC1rliwJK4xGzWN7IPliBwBWyEHFrLhMNH8y0YI+HLmedNGr+CMR+3uL/ln9/P7nrTvQ
	 MI8fyqcNH6qL0l0vXyEPd8blvIH7jMrGfekZP64axLuZMtxYXY/XNUFFVj6xvDQlZjMGy
	 KfcilzMrIZVjaloPPjiY90u7CYE6SMt6+YeJA6YnsPr3VnbEBxo+HJgAF22Gg2GTlDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C1606A327
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 870C1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7983663f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850173; x=1796454973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtqYmTVYC4JBzLZ7wsVy+ZmEXW7ipAMfwG1KmZFCxQs=;
        b=h82DHLYsZahVPBkRc3O4EQm+GrDt9ZjBo37rbKth+3A6wIWdTL7sXvOHacN4BYbXsV
         HvE3ZD78kqwpwmHpduwbkq6Vyyi/nC5HIMBmSruwNuN7uKJwOgq5Gml78yV0gY54U+Td
         B3H+MxKitU6CIwUCPu8F0yM8M/CeR71RYb602sMRV/X8/ltsLpYdDo2seakNZrhKUfwY
         2iBg98quKpo9cYQdN3LouDzFSGrChUamdAPp7oGpfmRbHcrjjacv2NATug7woU9xzz4n
         HJfOAI92ZeHBUPa5M8WPA8daztezPmL9iOGdH8YMN+68k+FF1yoLho0uBKR0abQLKVv4
         bU8Q==
X-Forwarded-Encrypted: i=1; AL+hErF2/kKpsT/7SSau3M3VUfc6T4F6EliVDRfi94CBWBVMsk2P7YLxWSnv3i72/U++PV5/wKFI3snYeTi2@vger.kernel.org
X-Gm-Message-State: APuU4Z91oOqLskZKvB6WDY9va+1b2r0Mcsx24OxSxSkt9cT4hB9yiWtX
	c+afNHXOJ7aipK+C9vrc4Y531YkhLwyU0pRH8WP23UnSGmBuuGya2drJ
X-Gm-Gg: AZFdTZes1aSA2oopUvjToF4Vk/SHxUFdnqsuPQqN1rsTUKj79EcP96GXSujfxeV4mzq
	IvmlqAxqOD1Y5vtBkSAj+8HtVOfTkg2GaWTY478V1ygBlQzp29rNB57ES5l3irncOpRnI4p8S91
	PZJY7kZ7alEg1mqr/pb5J6EAyBq69+jieRGhUhILKqhco3l+GSnSej0uWrlOwxl9iHhAEsGzdzl
	FN+zzGRpcrwB3GRIeWrLk36+j2RiZYmbiNXPGTh2RXIM8FC11FBuHXYMgtBmqNM6gBJCKKXtv3Q
	XUIlzayyZN9S17TUkPWgh43vSQTsUOG6D+YesYL9UicxaD9gHgfiPj5EB/Q3OMsrHIkbB2Pce86
	D8BnFL0Xy1oGfxhNYiGXCHiOO9eZBvoE1e0thQ/aA99ch1xU+3T58PsQNH/pJ+L4lqa5/qdTWX2
	MwQuYxxOfaCSm72ZwuGkrsPw9UNRuAKewlA1G8LSKdsnC56zBACgaLCpmyYz/EmlwoS/oT4bK29
	5tRv+fkZgh2FdSl3o90jgoAVSsXxq1kd1P2E2FeAzuTfYqURvEOHmvbMxMZEpJCPXgWOYAb52Sv
	CN9EVFtwi9uvfqRa8EpImH0XidW+oAVgSV906mVo0h/8iI4mqJD1s1q2aHE4XbGUsdvHDa5qzUg
	kk3mzW3BO/fn2icCym49nR1o=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr687806825e9.5.1795850172794;
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:12 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
Date: Sat, 28 Nov 2026 07:16:07 +0000
Message-ID: <20261128071610.27855-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Amlogic T7 has the same MDIO multiplexer as the G12A. Document it
with a compatible of its own and the G12A one as fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..ad95562d1f3b 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -19,7 +19,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,g12a-mdio-mux
+    oneOf:
+      - const: amlogic,g12a-mdio-mux
+      - items:
+          - const: amlogic,t7-mdio-mux
+          - const: amlogic,g12a-mdio-mux
 
   reg:
     maxItems: 1
-- 
2.56.1

