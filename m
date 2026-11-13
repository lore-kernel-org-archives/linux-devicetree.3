Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572337;
	b=nTThNm2ToWsmXfFUyJYn/7vw12qse13665YqR+AQybdSaWDsGVLyAU4fPtCYOz47+bX9
	 28zCvhlUKkAd/5yG26Rdb62IRM0x2z/xOecJ5f5mx1xCbcgUFFpJk4T/Ar3c9D0D+3lAz
	 BDMEtgK9QRG/bzMM7n6/KWsuFet3ShUp6UiKcVQp1Jx78cgcMZg7B15LoT79wAyiMNVgd
	 fUv0zHj3xVmK7XBwsZNc1Nml/W603vXl4JcLBR39Kip9mQ+ViYH3ZD0t5jXCTpRkd7a8Q
	 bc9mG00DTDVX+era4MTvRgRNaOx9+2Tahk6adFfQnFBz+4k9RTUAuhj7/io0snr2NIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572337;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=;
	b=uhJnluq8SpyleAHE0eX12o2irply7S8r3PaaRHTM3k6En2AnbpvG8s3vxpvr0ik3iHzg
	 GYDHzOi1KMkEAhA+l+riQqwVdkyzqddW/ZtsvIWpk+3Q/+MwP+4QMWA+V8SeYHjDKRU7o
	 9Lo4Hun1m6+zf0IZi26d2AlqqvUevVt3nkLhvyXbBLn93cz83eo85GtvqMqTsJ2DrsLyU
	 lP9NLS7qh5ygoVCAElq5sGjEMWrL0pBf6E81vcS0dOf01+2RQCTB4A8MWDi5wS1ojVQ1J
	 08eMPZLvOgMXcAFS6tKSRpwp3AqNAwO222lWvvlxTUAYRcrgT201oKQJ7pZUeUSnSBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF5606A88C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECF5606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso279366f8f.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=;
        b=W/mQieohJLo/ChbWo2U3RwkS2Bub4N231N/zY3G+B9CY3zRVJNNzF8nEwGRGQYgWPD
         LHXfIgO/Qu2nyi5zYlAgSyXfhWhYWoI8vYYx9Jawvo9biqQ/t1JZFZIo6T+6WLrs/0el
         94q9NJu+/oFC95rNqqpM86k3GFgNtkSdozoFt4gn4RHHzfGmnYKl5sZ3DbOlaP8LTwI3
         XYrZamSrpzFtoTbysQdt+OD6Xa/1uikB4h6qhWfX/KmobpZywbcQjn5viOiEmtzJdN76
         PLeiYDABfJpeDrXG6PwqBeuDkQCZsF6JU/TtzF95TSjn/5TH/jLiDzhjnoC5685mGa4t
         RXPg==
X-Forwarded-Encrypted: i=1; AL+hErFnSSdO20w5SJMrhw/YvSCnTbfOFIz9T+xtxYROBTGw+q7xJ/w17V5coW1JQkiLLKJbuWSyQBwXmSxu@vger.kernel.org
X-Gm-Message-State: APuU4Z9XzZK+4qK6Ck4N9bI+aA2oNFbj1dfsMxxBrwwDcl1TwRvUZFw/
	ikjCBJxS1m4OPMNAZiJ6mebncfHoTx8mEAmIi7DhPhSPCfQg4iy+9gME
X-Gm-Gg: AYBFou1d/W+6ae06cs4CO4ziw/OpEd1IBiYi6gHSDwm7cuqUt9B2VvAe/ZHweNj+aUZ
	mkBd27KwQWknVq5c8Vx+QY5ctc+JMpYXUl/T6CU89CfQWW2ycPPQV4B5GYaDETeB/in5dHwW037
	8aaMH+Qsqh1Vaasew2q3FKoMdoV2cdRfTyS8QXeyZjGTOqMJpOWe9rz6DODqzJJf/xyJ3cetuDb
	Nb0pO6AlcSwhzmkM+swRWkXWgC42aHuVtEDUY1r92eHGPc4riuyXm8mR7kmLPFc0+Si0HZeMojP
	GP4CNLy21gbBBFW+3EcuZDCc0fFeraTukq0+/x9Y6r2Vk6q9hKDX+K0hP+OXmgIxL7Ozg6EQCh6
	wk23FOx5/Kn7ZCcK64NdsC7IqbVYNRv3aCl+LhEz8kvp/PFlsXGVFcmW6aFoF7FVUm+sAnLa2r7
	HnHFbmmYXn1ViADJbYuUpVVEM9Byl0CYuVDFCyCHCbo+XMXoFc/jUuhyMIdNtIGd3Es/kd30Fhr
	XRFK9pGrdiXRob6nEmophVy7X4BC6bbij4RYO3O1yCOePEfDZS+Fa8Ihb4G2AymBBx+Rq3n+0Ii
	6ZeWvE75Drsl8e9qO0T40VCXUiUm5DVOZkvuceYWRhfRG/GfwSBP5rDJU5ElX9cZT7iipyGJKYM
	UO5PySC3uv5yWgc5hYKWGTP+h
X-Received: by 2002:a05:6000:2003:b0:490:411a:1eed with SMTP id ffacd0b85a97d-49c72f7a66cmr5198418f8f.39.1794572335385;
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
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
Subject: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
Date: Fri, 13 Nov 2026 12:18:47 +0000
Message-ID: <20261113121852.334604-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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
and transfers never finish. The glue registers share a gate with the
MDIO multiplexer, which probes after the controller has programmed
them: the writes are lost and the port keeps the bootloader's delays.

With a newer core, a clock list of its own and delays that follow
ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
adds the 2ns, and only the receive delay line offers fine tuning, so
only rx-internal-delay-ps is valid here.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,t7-dwmac.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
new file mode 100644
index 000000000000..9b7c3864cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/amlogic,t7-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 DWMAC Ethernet controller
+
+maintainers:
+  - Lucas Tanure <tanure@linux.com>
+
+# The select keeps this schema from matching every "snps,dwmac-5.10a" node.
+select:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,t7-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,t7-dwmac
+      - const: snps,dwmac-5.10a
+
+  reg:
+    items:
+      - description: registers of the DWMAC controller
+      - description: the glue registers PRG_ETH0 and PRG_ETH1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: First parent clock of the internal mux
+      - description: Second parent clock of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
+      - description:
+          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
+          Without it, they read as zero and ignore writes.
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: clkin0
+      - const: clkin1
+      - const: pipeline
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  rx-internal-delay-ps:
+    description:
+      Fine tuning of the RX clock, added on top of the delays that
+      phy-mode describes. The PHY adds the 2ns RGMII delays, see
+      ethernet-controller.yaml.
+    default: 0
+    maximum: 3000
+    multipleOf: 200
+
+  # The TX clock has no fine tuning, its only step is a quarter of the
+  # clock period, the full 2ns at 1Gbit/s. The PHY adds the TX delay, so
+  # the property is not accepted.
+  tx-internal-delay-ps: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-scmi.h>
+    #include <dt-bindings/power/amlogic,t7-pwrc.h>
+
+    ethernet@fdc00000 {
+        compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+        reg = <0xfdc00000 0x10000>, <0xfe024000 0x8>;
+        interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clkc_periphs CLKID_SYS_ETH>,
+                 <&scmi_clk CLKID_FCLK_DIV2>,
+                 <&mpll CLKID_MPLL2>,
+                 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+                 <&clkc_periphs CLKID_SYS_ETHPHY>;
+        clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline", "pclk";
+        power-domains = <&pwrc PWRC_T7_ETH_ID>;
+        phy-mode = "rgmii-id";
+    };
-- 
2.56.1

