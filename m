Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E74F4748
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624758; cv=none; b=icalcCZIaeIh1ytBkTJNSjmamKfgXg/PFgP1Uo9zDhSAUXymJk/2mxvG0knxYe/p3cZyrpNKpOXDm34YGS9Ryozy63eK3dyJBZtKF1D2YEdzJYdMu8mWdlp9buNpKAzXl/WCX5eyek9bofkG04vU7I1AN98wJWD8jUdR3H8zdAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624758; c=relaxed/simple;
	bh=eGGtJucMub/H5IDPYhp85xFBOadbNNPXVb/tk0RokT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h228Ii35cZzLXTKTPStQwbaSkB3SztOfs40bHTpTK2Zo79VpwXtEwXX4dsfr1HVMGCytetQB+3HGZmvz/pdVeKliXQZ/GYdumXziX191oG772XT1fvoXvvmb1ohE86v25Fwpepiym7IOCSUs6i6Crix24da4qSeJYVA56Bu/RUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUSodHcn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUSodHcn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so3099855f8f.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624755; x=1791229555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=VUSodHcncvOyo+vSbAMjoM4QCFS7HWvTAQhxBtD06zZTCiGmjML3GiWJTuQKHkLATM
         8GTD0fwxUXAo5S5py1FogWBFah9RT4fVa3VlzwCedtn3o/ycZTAXgpxT5rBhhR5hH93q
         GHG2YytaUBxEsyW/UticOkpr/2FU9mf6yIXsGbqH1QPSNLKEjKkkNtFsvUNzAkPdAupm
         gTEffTMTeKMlG8NSHRcH6Wshue6GOCPduQResboF0Bk3m4zYru8OfG5ueio9y68kl9jr
         sMA+4OQdr02xWNiR6QtuyAsPIywwkyIgl1WnYJqoU0kjr0wLFU0xH97W/RDwnVGUWeDf
         QHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=tl+7e/sCRjRAyUZbPY5qdAeLN4mM9ggNhQqjdzuD9gyyuRASmpJvOkaFJfShiqoLGr
         BaN4Rijj/408XzPuvgoq2ff8Z5NbbEiM8c0U5LBicji3otNfhi4Ga92cU7p0o/ef+FcZ
         K3AEfv+X2f8NlzvANEOjXJD9byN4O/9aV4UdinwIoJ0rOnUdJWShEGUsQHi3iNJzyokT
         xtQeNgfY1VPa7PaZac8ei5iW8EopLxsMtghVaprEnXePm5TxZr2+qbR91YFT1g+AMEXk
         RTb2q8QtcAOhO0uR0xyP8eOjMtZTfkNRzKyxHGVbAbOjdU21/TwwmWY/5kKkPKUXbqnu
         TJOg==
X-Forwarded-Encrypted: i=1; AKwUvBzwLsMakJPoCJqG3bX2fhAbQuU1TomLYL+rtpF31PNMIMTnoq4Yzzi2VYKrrdaYQQEpNPrGWFn5nkOX@vger.kernel.org
X-Gm-Message-State: AFq9FYI2VMpIHpKOdltKZ9bMo0xfOzKX1vqz0GcvFUYF2Do9eS2E+7ow
	BCPav7Q0AuqaMiHWLfQ9nrYTM/fz984eNBHa4P7SeYBSbvFnyYJZTtqW
X-Gm-Gg: AYBFou1TSy+DRtZnXwe6sLzctnWGMStT26NRgsUB6maUuupJWSoelqjh4bcHawVrSJG
	xv5kiIqIkGAKMSCXMPAKY9G5/q9wFpmTFvMPKls9zKTPlVjUCWE/9BZ7Y391j/QJsOnHrq7s6dg
	S60eh10jBpM6k0RzBqAfuphwWSGPrrkwg8iuz37r10l0Gf1erDDgqZTxTzDUaoCVdbIFqX43o0r
	xK60RblmaZLHqNeONAWDmjL2p5gZNezykqljQD2LGLP5Mv7jjSzH3TtlGDCfXViHxz7buJpwRgw
	UVezqHEkY8Xq0+PmgNPbFwMfOJMAtqRZTVqNij1XIbycaSwL8hXECc1b7QodLFYHXVlsR3+/JWS
	1vI7aiac39R7TEc0pYU8R6UGPg9XVk78pej7YZ+rqiPjORKSVLza076zQt7k0Id4dNu788VoAFY
	dzyHqp2OC6Xf2Y1RLNLlJRCS1TLLB2VpwEqVqWyf3JSCtKnzkIkm1GiP0ojlFcqz8E/G2yqb31A
	LA9C2vihYcBX5CruiDp8PIbogOl2ox3AN/eprARTemU4mbdn4zp9saRUXwqOpsd
X-Received: by 2002:a5d:5f49:0:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48af1fbe9demr313504f8f.21.1790624754940;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 28 Sep 2026 21:45:00 +0200
Message-ID: <20260928194511.41878-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.55.0

