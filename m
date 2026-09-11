Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CE23AC0ED
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167274; cv=none; b=E316u6qZdHAx1QTirpeBUvEoZs2s3KxECKBLrormdXYp2rnT2dR4xzfu/eXOwDLvB/P5bVeTZ8wfpdklm9fTBOdV1sXHucHItn2ma8cXu65wO3NEDbK3yYIVY2bD17akOpQvD/yTTISJ3wk9Hqqmo83zmVbN3WEB66Xj2y3ISSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167274; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1d0az6EOvdaw2+4UjU6KmQbKDJ3cwSXsI1/lKD5Yt1CWnZ+upGynUvBDHm1ke3nUBtHIMTlYr2/l8aetiqZ0TJBmPPZN8Jb5aUCBdZH5XZtu1r/BvZ7E6NDr2KOFvVyvMD9pYYvn4ImhgvrTqf2zskVNkjRR6wapsnT4+I8mR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReaK1POy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReaK1POy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca94bso369105e9.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167271; x=1789772071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=ReaK1POyx3ucOSC8TKojumExq8vJsyp2mk01tghSqxDtCDbsCqqr4EPQVM5MKHKajA
         ip3Wk0MOk9q6EW9gaRUbXdKN1QfhdtsFfozcD5ePrcyCl02vGba33DXtVHSJTy8/Pgpi
         pc7XBe/cGspWcVTOEH3u061S0tctKxFxnHNCGe4V4JoMpb3HNhe6exOuWaSLwzET6kxB
         9tkJ9V5W9six4gmyebFzugsajVFQRMDACLI5tKVtMYyaDN5jTtV2sGgKygYHTqpKtj/3
         KT3MeYEh9X30iN7jXKmdtyhqErghmViqNdHMSCb6mGJE6rlfCrmdDaTV2BNpWk0tEjNw
         5Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167271; x=1789772071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=o6OcDYvItQtsR15ffOt3qzKICklo1A12h32f6505Soxg3SLjKykTQAvr1sIqVGDyFs
         E9JqjVvDM1uRrjVWq+t9eMyhy2KF5BRtM5P1bh3DcEutcqY3uJu7IO/3P7Epz11MghRe
         CbuS2BG6jDuAxBrzIDvNIIoj64ho+jTPXbTUEQ50/N6eMyilGm0ufiCFqMAasyf/1x+H
         a40GUFg2maBGpGxIJiG7fLB5Jzv1ckUTmRSVMsYtLt0ttHZpkensAke/hX04IybHA2Ov
         8nP64y0qe4j2rpfWku9bdr36AuovNXr+tMGS9yfR6VyVOvvBTUTEpxwyno6RsFC/T3zY
         ofqg==
X-Forwarded-Encrypted: i=1; AKwUvBxLv9omJLNr7hKinCPNICTd8OPDISUs4eL55jE8nAAeRfVlh4Nr5/nQW7Qb+c38Zk0KK3NRgPqKk/XQ@vger.kernel.org
X-Gm-Message-State: AFuF++mZ3W1SafY7GoPYeDKZtif0EK4xbrF/XuYJzRxxd2pbx57/4Lmo
	owWAGAfWrstQJjW/vTBmtTZ1w3Kr3MWiA+IIex+/64YlWg/46nwsUuhb
X-Gm-Gg: AYBFou3Q6sLaNimTIQOORgV0jbXojorcNBeXACJGuQFeQnha+24qXlfjAtuknQ5Wp05
	RT7QQ8oJCbH4gNNqMPs0z/HiK11NUjYV5mX0N8gE1Et0DAi0jggrMJPso5zqVEh02+vgmrxWl0M
	qgJT/3gv3ZTx31LrCbDjfnt2qgVF5XdnQLVBCoeN+QR0cuXeH7pkA5R1bAkdjPLpLmWe8fzMsBg
	JFk+v/aG8NCBPhEp+U331eh32bb4ug1aZ16QfKCTDZxX08Jg6nArynwvABXw/jcIisAAzVJwRqb
	wYNOhTufp0R/L6OIdes43LLckUmdFYQwE8q1iXF1Ln5uGaQCwR9eKj7cDulaXt2uF11Fxh7uGsa
	Z/K7IcaiG0m8shQKpEFhNM8i2Xf6JD7vKoFIn24zkhhxuo0rs4BXt76aF6Rc3rpUFffLu+CJrvP
	iYVF07olFR3JQvV82JpJHMq6Ybwg/MzMrACQZRiOrchxpKs5IcB4JVC2oibzbZX/8Ot0gu9mdyN
	i39iWTIBfPygZ2FBb3YRW68bfoKmMi0oAKpdO+dU3d+NRvr+1cdl3+/NaLcHro=
X-Received: by 2002:a05:600c:3e15:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49e6cbf84abmr1600715e9.27.1789167271202;
        Fri, 11 Sep 2026 15:54:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:30 -0700 (PDT)
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
Subject: [PATCH net-next v21 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Sat, 12 Sep 2026 00:53:25 +0200
Message-ID: <20260911225414.225980-2-ansuelsmth@gmail.com>
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

