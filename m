Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6E3C10B6
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954848; cv=none; b=aQ+NEVewj6CFsGGuDM1a/StqTr6k0UTlwSxh8FT3p8o2B/MLh0y7wvfy1jN+OramHwTADbRYUv8TklwBh0WAdOIHelIpgSilt87hKbIOZxdm/39ye89qXOIZafuagx09SLGUgm8YICOCEZsNRXLRcLjvtut5NMkRTLXUarwkWRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954848; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvzgEUyDCOoexNNwJIBZG35vFLn2qnw4JlioebLUwuSBkVyYFmhCIw1BxwtseChNtPzS6J/7QsOt3gNa/C1qVJs6cNPZf/TRj/iwrxx9Tz0xU1Ag4p7klX+3vz9riMxCQW3hqFdZ9ci4dQga/le8RUHMiDehRcA05ID4bMrby6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwd9D9rD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwd9D9rD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495590dde14so38480335e9.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954845; x=1787559645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=Wwd9D9rDX03NzlGHnF0wv5wkzIlPZzAhhdJRU6C7g1KaST6ijoxlVhtnAU0yC7Gm/2
         /j7Dk7mlms3pVtXeMcsOatz8NSzFl2xuGPZHhgocCRlSrgI5Rr5K9mWfIlSHz+Uq/H1/
         ZD8b/epOQjqi7iVlt1Xy6z9Ho2Dk3xbV4yPH4IFyw26JzBZf1iKw7GztSmOTDiSkD19g
         utt79HS4+naL3T+d4ytT1eXvZ7oztkLw0j9SQRdHeSFDe/LHp+fPB7LjufiqQRa0191Z
         e7Q+9Nu0CC6vpRPvNS8AXkNAJvhVG0w2fEyB0CgtDPEnREO7neaA9lRjtvdXfreTG9q9
         UdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954845; x=1787559645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=aEtDYuogYaLvhiGPv77/7QXzRBAmoTsQLYfqq535Md8Bb6Hojf5YQXVs35trhGxYIf
         5Mg5oXLWcRO4pZPJhM8DysGYcstO2x8/6AFhNuhVRHa77jDdL8GNlsc5E0H4K0aAniGJ
         r/COU4YAC9lIsBUVxDp88gyEF/QD2gubMARjfyi98G6KvuKJFMTmhqvr2ItbbafgdtTX
         7xnnio26MMiWqqsKow0JEEHWIWarK/CvEgaKFUe5dsxazDzhbGkrquhFwmWF2/m31quK
         9MVDaZvIogUAMnGbFcsDwsmah0P++sys9p1Bs3S1cZ51odf9fFPJf+aA8pWP2NbYdcNX
         ELhA==
X-Forwarded-Encrypted: i=1; AHgh+RrZNO2xnn7S5JmHk5PXkGW6Up7K6HSH9XHp8PuIWD1mGTX+K3mDs4ckNZHrJDxU5095vBMIIB/SG6zF@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOpHOPijV4rDDv7yR38UHfMJvmPT5ZgkFPPnEMMdczJnIA88i
	Cg0RMgJ7zhHns/DRdXO1cryUvxu5pa5MOQcC6Tp0xQUosfTe+SaZl0iL
X-Gm-Gg: AR+sD11IW47dPNbr6a4HV8vB64YMoBfIUjbAKDNooJo+D2DuxWPmQa3sRchWNHekXUY
	bHpnJ9/aCXF1mIUQh7djxZ0ZWnymDTJzrLp7WIYH30kW/kdDPJkKqLUV7+r+/t7cQ54JccSgwVE
	ueUMJCq8v8rQXeESgYhD5Krh/mH0S/w2jKXwcumutY5VA98Gt6hU0bB7CVluT3IOxXM+Kd7dru6
	bVVWdhLFIo+Gqc3FhYkPXfXwKe/xvy64gfA5yTfiaJVLTDpeG8yDrxLouViqG1VCiuWDketbYgL
	VHBt0PpIuQpkcLLMH1QBwZ4jcuQ8960mGSnmuaXMXl3spwAIDwUvz0OTk2vxbwRAizRb9FDK9gc
	7anX2kM8oddwo5teezDU+yYX4U2Zrlef6VyR5nN94xup4SyjgQCf6apL6LVeC+/lcnmDRgJWy1d
	BZrOcbW4BuGpEiqmA+15Gh+V31iXiWsvu2DLqq8kIYDu+lt3gRrvRGu5JhuFXsprJBIw9BhmsEt
	XxszoXsLq2Ec3DGkf1gEFW2DLZRfksb2xq5LECN14RoSzVyfOWgEHMS/051G0ScLON5
X-Received: by 2002:a05:600c:8218:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499879357cemr398067875e9.1.1786954844530;
        Mon, 17 Aug 2026 01:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:43 -0700 (PDT)
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
Subject: [PATCH net-next v20 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 17 Aug 2026 10:20:22 +0200
Message-ID: <20260817082034.20326-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
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
2.53.0

