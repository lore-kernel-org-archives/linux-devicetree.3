Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83853D8903
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167280; cv=none; b=kwqPnsyYi9AgxAPrZSiA/PeuuRUjchvmtYasm/++RjdOqPQrgsQDm5BJaNEkiLUxHNwkcct/K8HSWkT2BXmGOk04Zeo+Qh3JyNaoIpNLQIJGCiIeEZs0JoXxjtujuL70UMb09hCuMe3vCalO8ZCF/A3W1ghUucb8w5A2idbHETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167280; c=relaxed/simple;
	bh=TtDaz1S2XoJCAkQ6yMlNi5cT9gUGaF3jEIf99JQb45s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E59EAETpdfbztJBF2CaiVlplVJiAcoyAmxloZCjzbT5rwlD3jT9y9Ldegrfa8BChzcF/RH4p9PEfp5dFgS8JuQeH4WC6A1HtuHnUpPf6QSSeQXPjs6ZAnq9cdMNmzHPC2cPUv56qTHwkX8GbfWXUxbcnOk1zWw1b+R5JDtGcf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2EHP1nO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2EHP1nO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so11257895e9.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167277; x=1789772077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=D2EHP1nOadJyrN3UbzEWTPncKw1hH87PoVQJ1F3/YAMg19WoFZdTHrm27sFdP0dumQ
         TTdIC06g80+vRAOsvRXzRfwc1t7Ao8uxy2Cv8oGotMBMAKiPvE3wUU6J2tgrKovkp6je
         wFJtpK39nx1v1+N/CfwXnqTn0xujSyA4vJp2KQx6MuS9nUvGJXf623b8i3PSozSYycdn
         F3dIyUbRBqFhYv1UzUhtoMAOR5fX8mhnIItd29UczC4OQaoM1KqRvhYJ4rViyiShncie
         YUySh+WKfQErAo6dBie25KFGJHlsJs2AdZTfON014x3zkpRoxkKRvz2F6NK8PGVJc3IU
         zQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167277; x=1789772077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=a2anbByl9+vhpdYnl96Fo+J7ncn2EY4CRJH5yWhE+l9PLQGWr/EI7hDrgzbfVQMEGm
         Y/IZRgS/Ccg0As2D03PuzHgISsGSwZM5NdudRjk3SPixDsPSzE73ag2DPjrYF6a1eoXO
         D8BA2cfaBnzWfXu3tGnNz3Dl4jyxfuNriMF5XKuIyTaIJFkhOz5q6ZJjJAmG/xGQGK7m
         wD+m0x7Yama9luNXPL9tU0Ohs/5HnYfsnNUMwXwHnaaFqFC0XGgQ6ncUW4pXjEu4f95o
         LCB83/Fzn31PaDYe3MxsICaADNY89D+P3iH57XsBDvRcJ6bnQfl+1txyM7S0XO8+Hz8+
         JSWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx34HAjJl+1IN+o0neq1RQ8G5E2Z0kop8QYwZLxtg1KKBSOFiheAar8sxAxahAWli7puhl0UQzV/gV5@vger.kernel.org
X-Gm-Message-State: AFuF++lwDDMUGUfssdF2fpLIhk7mNJcSTzRYsWfIgEFXSvVY7M+xi2Fr
	k09Sa2q3EBEocKirAyC6nbcrCrO+fUon2F/Ryn1XQoHM+6O7m2S68Xsc
X-Gm-Gg: AYBFou0CuQBsuFUdjMT18Tn5kEccbE0E6TKltLG91sRhpp7mMZI1NR2MpPcD99wpBxv
	11clS1slXp/XY6XndMACN1RYOqwGlwE8aBQCpeQHbcn9JsaDjSZJK1+IJkcNSxnuVNO6m71PmhY
	aaDUltCzFf5+CP0l7o5Tfux0N8xr4/K2rK3oG4Tu+W289MK9w6f/23iVqHoKC73op7N9EC86z9H
	c8R1003245ATyHL33641ahHh5R2QXmpqzGQ0U0gfN+CvdX0WrwF0NNJlWm82Q48X0SmUdI42gca
	cPfDRf4V2qeOGJNfhrsKxm2o7KYvTqoDvXxycKy5mp8CWMQf3/hk4vj9T8ci3dCakyNmU4i1fDB
	k7+MiTVH3B+MtPtibsHVOOgfOe3GpCNfYXBMhjD36hMN8OQgHV0pAmT2eYKkHXvQW0cqHx8zOmW
	h0tQk49swm8UxyWhocK1yR0axeQeNOX1Yso0WHFPAJnlLR1jDmOosCAv40bUsdjKMIH8FatNH5e
	KoMe+yJvObsv6IGsFUssQmALdioQR+5+jXgMVuwTTVy+MOiu39gJMhCoBZoQgSQBhpyFUhmDg==
X-Received: by 2002:a05:600d:864d:10b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e61983764mr53966765e9.2.1789167276867;
        Fri, 11 Sep 2026 15:54:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Sat, 12 Sep 2026 00:53:27 +0200
Message-ID: <20260911225414.225980-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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
2.53.0

