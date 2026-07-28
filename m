Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD41330315
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253748; cv=none; b=QPXbCQig8fClBNA213alnWrp6y76wRRtHxHaeMcNiDm0GRhvB2X5iInJWJxNPLJPhYJXP6T2XoO1s0Gst8c6U0+hL0aRRv3GS25FDm9AgdOdFUB5QnIvfrYKF40PcNqRTF0s9jSv3K1qEFM1Mzq3mYnuphRwQiGRoq23G3de2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253748; c=relaxed/simple;
	bh=5Sm6KIJfhjcCGEhvCw+IXc43CVf5mJrLFBXr/fZhCvY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dc4hM4lma+MjuwMZVzUw/ujEP9DetTYQG8RvcqJyZ4y4ghG75JFghdkRp7o/ykQLGI67xfKNSd612t/TvBzY8bELbKp2XjpX6KMQncFACO+3VjoWDA54Xn9ttRGXvzgV7/3A5mf3gT2yVebJE3CB2HyDGqxeI0DhEySlRsh2YIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMxme+aW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMxme+aW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495635a85d2so14795e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253745; x=1785858545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=;
        b=aMxme+aW4i0oCQaZ1Ay8rbKgSRkMBC6y44L4F9FMHETpdd26g1WynW0q6iASzzqk77
         q80Jc4Mb1D9Jsg4Opd1sXRiz9D41sH5/njsMVw75pXO3QUAgDCBXAgyLCw+fVzD53RTW
         laUdR/TXAXEmP2HmlBni9OLdyS0Me/QV1VXkEzCjk48mRFJSwuTNsICkcLcfv1X0y/L9
         SVbXt1Et9oJwsDWtRYEA5bSebMO4Y9VohXJpJ+xrD/BJ1ekSKsk+Bk3MG/VpIu35aGh/
         ArK+c9Y/xL/uVLr+79RoygcCrQKbOf2XxSZkorpM7lpixTC4442n/BKCVsCX4Y4KGrUJ
         3zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253745; x=1785858545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=;
        b=d018eNEE1kwTM1Fdp8SQItVW49NZ9INoHZAUU2+PGYpQay2t7IEJ97qaqC7PKY7iua
         xfCcv7BvRXauMvJb33e7N5MyAITxEl00IqDkYztZ4/gFuPG6SZZzrSBl+l+DKY+lVNZx
         Qy5sD86bKHSuCH50By4szSUkszwLL0Y1Ox2BiIWEfy1BsYSbBVVorMyM9MDrIMHnPeaI
         612AjNVrthK4adh/QasiZ4wYOtSGB4LJ57eQqq3Rn+PLHgGcY0U0/6qloSLfkrYFHOVI
         f4HbhIBUspaaOBWE5exkeZtmBgqxIf3JdHE0P0HXOksQFB7neLHrPZDSgrG1Ke294vM2
         lggw==
X-Forwarded-Encrypted: i=1; AHgh+Rr56PjjnGtbuxJahVSqHag0IRy7kx5z8n8CLhfCf8u8nOu6SbGzsi8rJ2UV3Q51Ge78uCXLo+xaFw0Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwGt4WiGwNrh5NMC7ksRosMRsrmHaqot6k1mYi4pFHD61VOiFI9
	d3F9bnGxFGbh7nHPSP6DLCAsjNvb716oPWAdudqoZjnpidOiNR7d47+I
X-Gm-Gg: AR+sD13KEsO2rOdA+3QX5umY/CpFH5y4Asmw6567f0fg6X1HzNwa8BCOmF9t7ahZfhn
	SsjJb8u9iuoAcReetXJuAnu1ScnZ9oZT1lZ02ZmRU90fnVLAmUkjzmgz685kEAJa/+DIAzMA9k0
	J/2OQALAP4+DpZsp7k8R5xL9/kQsuBc21B9q1xX3GddlPUXtgRasSyFqR4a+D5lGOTFVtIsN7z/
	c7vnnFk4YiWkBZ/u7UI4tLCGZ5TJppqy9+6mcKn8sq79JH4Lvb+oFSldbk/PZSvUiy0IkNjlD5q
	8M/T8yunXoIHWtMBxkR+lGz44FIOK7ex+Xzt+HPHWtpvWOkai5Bcrw+uxwKGFh8DdhlDHVKkaU/
	Xr33sBOrNHBiSj4/vHrqyNtmaVWjQRnGljWAYsgpeREewS57XrgCRNaRFwoJvzPSIgj/6qOTpW1
	i9N3Ws/i9M9JnUVFIayw==
X-Received: by 2002:a05:600c:3b85:b0:495:6936:120e with SMTP id 5b1f17b1804b1-496c65a5f06mr34662995e9.39.1785253744771;
        Tue, 28 Jul 2026 08:49:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:04 -0700 (PDT)
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
Subject: [PATCH net-next v19 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 28 Jul 2026 17:48:28 +0200
Message-ID: <20260728154846.1828945-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
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
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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

