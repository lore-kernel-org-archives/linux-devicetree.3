Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933716;
	b=0MOX3Sb4ULFqmTByAitgM7efkqGR6tX7xwX5u3+4xDygSSC7wwWXJWkPqsZkLYcEVzWV
	 f/pR+JRP2KEwdR5/SKWzYrm6AJkkcA2DuP5KEiecHfboNaoZ+Eo78yKgR/MMepXXjTb7h
	 t5lkH3NEYZm/BYaFbVO1qCP7uf8YyJMxL815efAcr1oWCr6OJnm2srx3COwSgayRd16eS
	 62BvoqeacaxvdrDapLb5BSzQ+rY6Xv/bQdFQnhfffuqkHSixKOUY1oN18eRvq5JTqpaop
	 mNT9dGh6biJFhuHu39JGLgMmTk376jgyH6yG97E2SHv+LhXkorvmrX1Y/khYzfcFskA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=3dvXsxjp8G2qJJHHTiil5N5n020gQr2WoRN2xR6XH6nvtFuieLQL6JrV0+oYDkNnerPi
	 pl3IQC5VGavXIunXWJGnYK5yvXfhucBrWbFTla424zcFD7esBDxUPToSts1NxggBhaZiM
	 oPvGeOsNO6yJZqF47QFTRt8mgGIE7p3wpnFydqpCOq83dFavbuvNr/dfLqyXpcmnRWVdA
	 qms/cxDKqAyf5K09bnnDkqerg3TIPO59lpDx6sjEGilp5puoBKYvQHUtgQGyptAfYygc/
	 mgByX8da777Lx72nj4ZCg/f04kUE7qdXvK55/t/wXg+p4oHYKfeBcMqwvohPoGqixYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcYeJNp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73CE606A89A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73CE606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcYeJNp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so668135e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933714; x=1795538514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=sEcYeJNpeRv+Lts5wXZy6F0llPLMKNXQQzf3kNPXLIcl7F9lC98wbGCW+aTRts2Lpc
         Gu6Ud0A59ond0ewTVe1gxYQekw72vv2WdeMenM1Mev3n0wX8qmEjXlAP+bwNKXaMj84g
         SIym9BXPsxXCLDQpD3LiSGJ9Kj5GSptF8eR8zoY8WJcX8g5SRmu0PltUDLu53lQfLPSF
         j7JUlz8jIWGpihAyWWS8zhnftQhLxI3isRoAQ13WjWxEv5YJDX0AjygasZp1jNYsVKjF
         cxrRuabweevUR9VcFbUgDLIka1w1dX248YaWugml0Qm+6TMl0ntWmlM9hDD4c7Rkn2sd
         0fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933714; x=1795538514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=cejBKKCf1NlL6MjZe1jUhmcsES6JKchCTBgmqUpkFbKAIMLJ5FfwLBf2vUe4CmLiRa
         7OHxa7BLUSpUbJV+sf3hPFJWlB+8Jc442PRjxaLoPuVbJXoONyBrxtdS7R4umuW2TV+l
         paLpA1QMVHoFOECKxUvfUUOgTRC5eJEBXv//HlQnSjbZj95p0A7it+ZRFxPphYTKnPjO
         gTKF+FpDChn5USUF4SNYZ+3CoEla4/rKxRrm9IOcVNryE+yY3rCzhwX20cumWFXiNkJl
         AHG6Z452RhLLuR8seNwuzAXdjXYBrvDUahZXQXNOmWOddvROPXg/s45mFm6aLiWEd0rH
         4UfA==
X-Forwarded-Encrypted: i=1; AL+hErH8ZIDQ0zbTwLCUm2JeY0vMojywSb014NgDcIdTGZoa4Xgt0EYTDjuhXFLHlu22hk01+vGco5bydJGd@vger.kernel.org
X-Gm-Message-State: APuU4Z9mc+nvjLOlv75BiNMheGPR3wpmidAibl6VWOug5H2a5ECUWDZh
	KMq1EDHhg4nFPcPqmPQxlI4rsEsVwovImnEJQaHqudKuayZgqRV/Ay4J
X-Gm-Gg: AYBFou2+m8CxtEeCh0QKncDIsU4g0Lig1aCck7A4gWe+aHkOHU++LZ2+dKpTiPFC941
	rWIABauL+Gzr2dpvDuO/ZEy3sBMe9Ef7HSBB22gNQhdbE3n2lJWwgTQqQfLcGhsq7Q4Sufz7SbA
	7SPighaRyiM5OmFqDJIFVG+RBUxpVjriBg7fuVFOTFb1wRlLldTV5a50iwJPSEgvM6HKq9BxC7j
	IQ9wZc+hMJDV9s0zYxoqKzT6o2D5hosL9h4eiGJAvXA3mxccpj/yLTJixxez71I/bZ0JHG0t4cy
	17W5VqS2/X6LuBhyq89UPQafXJJHrlfVeqv4KiCNsfqeSjNQNjRbxuZP+pi+MGz0A8QFlro8b6N
	7E3LQrnr6Ntoowl27DL07fKF317MPbuPv+N9eDJ+55HH5TTp0CfDWhJ+MhF9AsrZTImKaV3P3Rl
	lMKiu/80GEGq3801aRCVy/DWQZc7iWG3dFonEEEHua4Hpvbg2R8lnLFwRGNSP59T0PvPFNMw74A
	R+BQoZ8SDQuROgESh152PDk8wgKBo0PZaegeUHDfn93MtNgKuET+ZM0KhqriE4qvXN9f9XFS50x
	Nkt2YpHEev/Ev3GphVt6QL09nd1jxqFgJiH4e14BqNBoFQNviIstU7vT0FqlfUSlBLRfspNOn2W
	tbSXC+h8/w2SA8o+VZKBNfr+tUy/hv3YtKlU=
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr237923745e9.16.1794933714168;
        Tue, 17 Nov 2026 08:41:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 17 Nov 2026 17:41:30 +0100
Message-ID: <20261117164132.47167-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0

