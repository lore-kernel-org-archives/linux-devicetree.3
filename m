Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933714;
	b=QjKaymhED7P64g+YG5OMcqO/3X8NWzlUfpqV+BkxQuCjA6zsUfXHg51u65hkr8HtfMCK
	 m0b+WPSaMDns8zrusjLBf8jg2hciAizo6Ukx7ChkNtHr219u+RO9CkU95J3NueFrQnE/9
	 rtEaJLj7ILwraW07MDMDOd+fKZSmmOaTuyZpdUA9OPGAtX3zXMBvLOsCN4HlhW0NWLoOz
	 kLzRm+X5vRw5E8jAsQhyxp9zE2k0yG5m/l7pAPiLrLjjN+4gbI1VK5Z9bRLNWTVE6jnGb
	 wWvdCNpSAM2hhPvaTeN7wDg+C0KaIZgluNvzbNqM7vt1sk8DD104+T0DAvGYeXJbVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
	b=ejNFpotJBxPOZga1BYSkesu4+AeB9XI3O8bxyCKoIwkhKm0BnaA27m3lkfYRjGmNwQN2
	 /Ga6p/yirNQewXSevc6SOEcX3hH14ccuYjNkEpHffPuAgUBAC8Ov4io8gr7xbQ+uZj0tW
	 DXFxE7wzNVZgls2Z9PffoHY1kGsHtPFaXSR8Erl+uNhPF8Zlrx2gCmyX9mWE3x9BDnFZO
	 zSwoe34ryG9Ah6MVqcAW1d00dG/QBk4vy/Fa4hVPaKXb6sfsUctIeAuXxUzt2obA29bLw
	 +eMM0RaYkKwWS5BabeAlMtrKzxj8o4L9JAPfJpe2beTCOPslHnXRai/FkwLWMLdALvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr3dxYS8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994E606A33B
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5994E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr3dxYS8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so616415e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933712; x=1795538512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=Wr3dxYS8E/sYgWPey/0VSPT1Gfc1PRONLdWZ+g/P/yGPigjE7HGMAvvplayOPv7WOH
         Gkjdjwv34Iy8UuYflzXUCqU6kmi4fVnB6Fk+N0fNQHjRxHeLEeiZb/j1g8tjKCLgMsN5
         YyMD0yfaBYIfuj10gUKwwwSjhZkU5+AzRjdih3sqiAMZFNymcpnH07O8k3igCNI3keRy
         Ssq0vtdPV9i1Grj6jwmLAGksAK4fJroUzS+xxTpKP8NhI+1ujjKQ9rrUmPvF8Cm4qlRv
         wdUbn6l59WkhiYKC51m+4PFDz6fMOGZt5CUvl/qj/AhDgoUHfdnEawKj/lqEUikAvMoV
         0YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933712; x=1795538512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=q0VyWKCZd94iSO31mOYr21Ky7FVOZLECvUnPIyk6qX1lWpswYD1KLvj2hnxIRzQXcC
         7QDDjv6Y01Ry6q8OZAk51PN214+hT33HSbscYx3eFMqp5d/CXJM7rBqCUc9HvWY24fbl
         Dg34fTgyUV20QCROMa3DR54X4jY/GoZbxZ3/NeATpRFy0dyFt77RfRQrPwZu/HJtDy8R
         2ZbPmwVOEmgKjf7JPF+mhdV7OVrZT92jPt4kbbAYa9rsr9DVF1qtk9ma/XTMxyHPE+pZ
         tEvbQqxmZeqH4MFDzcvvvhUUwl51hqPoc6X0CS0V/byYNPkveieZQndu2AFPTfsAT6n6
         woLQ==
X-Forwarded-Encrypted: i=1; AL+hErEzspg0Hctglj+u9+sh+OIHOQCTS/V8ezWqHb4kTS67pFsMUFG56ZCdQ2APdS3pd/mw/miZgq89B3v4@vger.kernel.org
X-Gm-Message-State: APuU4Z9qmZp+4zujFAZfolEXwQzw0hcWCvqNMz5V7sQuc2bphgbjixhM
	7MSTNlyJZMcqKwj98yEQbH0zFfy1y3B2IYiIGzE1FVTg5TLB+/aRWG2g
X-Gm-Gg: AYBFou0V8/kYCaUguoThrkrAowGjmfB1NW7rs+/ieLqpFESrkVQoMq9KKMLQA2kONmk
	+GtZiPJMpJJsX5aHrRGk6SE/yyEv0Suoz9ivxJfo8C2aNAdw/ZFQy/ZSbIHomYF47whSun1bLIX
	jVocHhFbJrQ2YTHlaLca5Q15nF+hdn+pKgRN5XtmdNbshmcCFQGacy5XeDJXJ3njsJiKWELl0c+
	xjKtEAdu79bU6yOf6pgcyuj+RevIc2+60kWjlG/YeEEtLiVS/2J+mWh2GbvzR5ZZaIrBjeg8akd
	SKI0hdoqNPIlXIjhqKtWzLiTN/lRClSlY1wbSj9EW7bSSl3C+xTUj5kaitVLPbnQFi6as/QtpXj
	FjpD9gktbP+m2B9ykWRx2SeRq1NHKmGlB+7ETn/EKq60udOpAKC7mLfDMmXdwdAP5PjzJ90bVy3
	yy7HuI/2UzH1UQS6YEligzw/Xitc8k8RWmqbGVAY3LfKagXCDb25fTNoIRPLWYTzXYHfocRW9wP
	jk7+ieo1coY1zfQ14tIcUKx8wxpjH9YBHJlckyYvY1ovLVDOfQKScY2Mwy2rIyCEzxdXawsPQ+W
	TOlQo2//8C/spf5tedJinFZBcYIrNxK16TUDga9yvDLt0rlKAekZcz9UohGrRy/Aowe6wLwc3Ay
	6/6DZCMd8/8VCYSBE31PbbAXPekx6+KuotELo9Cl4ReUJwxC9cDMCEzk=
X-Received: by 2002:a05:600c:3509:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb55c5f579mr313862835e9.2.1794933711523;
        Tue, 17 Nov 2026 08:41:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:50 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 17 Nov 2026 17:41:28 +0100
Message-ID: <20261117164132.47167-2-ansuelsmth@gmail.com>
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

