Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723841;
	b=e8/+ZDIFKLehpy1USEKWRQPBScnpt1Hm5RxdjQ0TQA/AG9pkheDCgb7aBqDAzRnfeoYo
	 atUPNfdMlVF4QpJm0Sa+KpLywyBlQq/pxVnME4aSGjWsbr2C2fQHeZPnSFGwlxrlbn3it
	 GN32vzSPCpOe/20N6pZIh2g4mO8slI0cD8+CG3cLPIKVvFYrS9YVJWmPl04DnpHDT8N5t
	 a7P8+Iw53UoCcwsrPY4ZiGB4cUkVk//MhDpZW5tLhEvGWDgKPP3eJidcMQ4B2lGu/UgRR
	 sybBQ1Bq3iODnLbOTLcgL0wSQiMM+kLD6TooATQ5TEU9C2I9LVEAnVkWzsqOPHdTLVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zl50UKdvdlW8XEIziu1Zq0cNn23HYvybJSqNilE3YHc=;
	b=Nf3UibI9TsuBbwoY2C62NF/sugKa8RrQH+KARPyXooKPK6Xi1wVdzkytqSHL9zfsJu0c
	 /Y+sjNWmZ5+hYotCuXNjgvLmx7CqYofEQGp0SZ01HAPhPSp1omaamqlwQqztwaUm6a+jo
	 bcqbB/DYzJW3aVmTXTigfVJB6EcOMpYUyvX2c+5jbgTNKzJcrZ5/GKcAXdIUNTnobes4M
	 tui8SEuHotEAFZXhKibV11O3qhtpeqdL/cz6xfTvUI8qPwdVWaf+tyHTiDZ497cV2t42N
	 ISjeFqHXWZcV4SOUnkrfUz2JTxWcbiNBAuvzNvct+L3iqg0QpJhcnHxpIgnrEneBO/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069FA606D81E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069FA606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759920f8f.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723839; x=1794328639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zl50UKdvdlW8XEIziu1Zq0cNn23HYvybJSqNilE3YHc=;
        b=hyzE4BYRQXZLeT0QNn0FCXmXswTrBkfuTRkEqfKWuLQ/vZWK/6YtNKoYLYVGK63xr9
         oqthuRMIj9EJYZNaOYDQp6Lvfp57WEncW1j0G0vVVIrlWt9rHRVWqeLu2qfGo1ApqCRr
         j1cRcCOoUptIfAHom9br6ZzjyxAbDqbejRGTNK3nK9yLJ48QxDCerU7A51n7fIFD7oqy
         mxjgzftIx1hPXekPUTIA0SVB1w+JMejIsr0HM1Hg7itokWArSSJp7n3evEYwLP7rgGCY
         5VYPdEJQyxre8dBkjU3BW7i531RApO7DgsnMM+jgOmgKHD2QrCw0VeQW6ncm7MA3m4Xl
         x2mg==
X-Forwarded-Encrypted: i=1; AKwUvByZGRph1GTGDk84JcVco/6JOygSdi8+6Ea8O4DeBhf6LhuoGA0c2c87oNlJDb9bMLu7GVuh80BwFT8h@vger.kernel.org
X-Gm-Message-State: APuU4Z/IBcwSySo5wjeeneoA8lwmxNVXtKe4derKswq9ozL3debZz/Gw
	U8EgNcN+ue+WA0H3wWIVPIhUOCIWiWBVGVdGg43sK+bx48kpKjnFgTrt
X-Gm-Gg: AYBFou1YXK+CDzhO4xbP0oPP+9m8hoV+78UzH/xrRTN4wl/3YlTtszI+yrlilW32mzQ
	xKst5mYN0ihRmAILOHESL96usWZ5c5O8mPTVCBDsTYPInP/PsztkF0npXB8Brw9V24V4Wa9X7RX
	+P9o6QjPPqLXfh2Hv+SH/CcU0YBwcG9/4kLtKFQhkpgeNBKdmTr6T6hu3W69rAiqvCHgSmogbZH
	serU4zzflHQ7VdHTfBVK7CuWP1IG4mJYF1Kk6YrYI0zgGCh7Dp6ipe6l0M1AKCb09UYMxY/63Vz
	l2PC3RldDq9BXaAlSTWHML1bTV2hPYi0EpUs8Hjb0t+/Jeo+0IKxuYaQqpi4Qq5SxYTD476Z0vc
	NVN4R9seS7Jc02Do3wfvIfNQPOf0gXqJRSJdyG3C6tSjLoP492rwLtdwbWFbe2BgoFOeEJcaHA8
	RFUjHqyFYRvc3nV4YudbY30cOoqbLLfQYt0puYIj4uviz69YdlXpse4S1i+9s8TsOXg4cK/GYUZ
	ib5wRiCqfMWjStQ4OjF1nUstLo1XAViB5y48pn4GgKoTyA6qDDFjCFUk91kHsj5G9Bjuh4hdhUE
	VnwW6ZjOmjQf6fNJOuVpONPdgVbVuxJDCVQt1PLO1xnjXbg6TTWuONBPoqFGJ/KntDFAlMMxOyG
	wyrl4J2V4CN4xUqQTKtBxiY6Knw==
X-Received: by 2002:a05:6000:2082:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48e6e2cb572mr32349416f8f.10.1793723839219;
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Tue,  3 Nov 2026 16:37:10 +0000
Message-ID: <20261103163715.385394-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers sit in a block clocked
together with the MDIO multiplexer, which probes after the controller
has programmed them: the writes are lost and the port keeps the
bootloader's delays.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
the 2ns, and only the receive delay line offers fine tuning, so only
rx-internal-delay-ps is valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..6de013e3e8f6 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,59 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
+        # The RX delay line of this glue is fine tuning in 200ps steps,
+        # added on top of what phy-mode describes. The TX side has no fine
+        # tuning: its only step is a quarter of the clock period, the full
+        # 2ns at 1Gbit/s, so the TX property is not accepted.
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
+  # Delay definitions for Meson8b and newer
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +160,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +197,10 @@ properties:
       - items:
           - const: amlogic,meson6-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0

