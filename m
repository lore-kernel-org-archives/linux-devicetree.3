Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611988;
	b=qomyImSIZOux/n7d5T9jISXHMuD3+291OhO/PkC6hGWZtRQLXJH3rDFiS3HQ2AW35pUV
	 qU4XaecbvMzlVcWpbZmV5vIxSF6CSJXGTzWAiqzkVdFJqC1SOjIgvcn0aijRJNUsZ1Kmd
	 ApB/KhXc7k9GQAgTGhYbnBK8ssryyzYkBBcMz6I/3vs1iiLiz4uEQiIKbSF+4oxKNRMZ3
	 iQtZc0HMNLhsKWyxMmP/JqrxSmAa4AKDn0SX3z7+w4IMih/6DQ38lOUW1qy5rS+Ytm5Td
	 7v/nqFpiXjx3Dx62Unl54AXS3ogRGCFgq2tOcq3gXrM9E0M1sK4pLVDbarjxmz7OvLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611988;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T8r5OprFacKOUSezedRKI/rS3t5Ekz7lkeilvlKQv4s=;
	b=iMEPd0Esr3u5o1uSKZvhL59h0eOWGHb5HWjTmp/SNH9ZyW5EjKXce/5bbYVGotHMNnuj
	 U4oJ3TOVRcqkpSnrkxldnjCKONek3U+QBf1jAQSSQDkFJTwV37/m71EY91INR8usILqgg
	 Eq5t6TOjWjJKx2jZYta9zyTMQkiDCL177Gncv6JuXMvaMmohJlmjbV4GDPMoWZsOiPUFT
	 Y71Q/AMwWkX+m236W1RcsC5E/gfmDQ4bBVnOBqhYL3ShzYVGivRepq/6E0oWDj6wDnkvg
	 Khv9cToem2n+OxMr+OAN/NPB6X50z+OvF3Cc3JTgE75LM1L+LHKQOruwd91DxBscQcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=l+g8zmTL;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A20606A32E;
	Wed, 25 Nov 2026 13:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A20606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=l+g8zmTL
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 61A4E4C94C;
	Thu, 26 Nov 2026 00:06:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795611979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8r5OprFacKOUSezedRKI/rS3t5Ekz7lkeilvlKQv4s=;
	b=l+g8zmTLzQanp6RLO2g5OiUuRyAwIsnxkIs/H91kwda2FAvgyvoOvuSHg1nmqI/61YA0Q9
	8amN2TMsxKEr7wlKllKl4abGtyf0OPRbzU8dm0nBTFeT0s1tKKbghXk5Mfn4Uo1V8XCKr3
	ZwCVZr3eK1dDE8ELl+ltxf57fLt8LQnxMKXUCE7IabD+KvEK4ReW1hUUMLu2yYZLmn3A/+
	q/WVYFGXahwVtAYJG+FSy53PUPH1k3N8R/zELFFs5olFhnlNV1Sa/yi9abaoTgKcSZIzUU
	4CvgiTbOdNYNqqv0S6/e1Caua836/UY6YquWUSL+VdPSH7XNMOKK73CmOuOmGw==
X-GPT-Reason: legitimate; the email is a technical kernel patch
	submission (dt-bindings) which perfectly aligns with the
	personal/professional context of the alastair@d-silva.org mailbox;
	the From domain (d-silva.org) matches the recipient's domain and
	the signed-off identity; there are no phishing indicators, no external
	links, and the content is highly specific technical documentation
	regarding SoC integration.
From: Alastair D'Silva <alastair@d-silva.org>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/5] dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner A733 GMAC210
Date: Thu, 26 Nov 2026 00:06:09 +1100
Message-ID: <20261125130613.4191841-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125130613.4191841-1-alastair@d-silva.org>
References: <20261125130613.4191841-1-alastair@d-silva.org>
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

The Allwinner A733 SoC integrates a Synopsys DWMAC 5.20 (GMAC210)
controller. Unlike earlier Allwinner SoCs that configure GMAC in a
shared syscon, A733 places the GMAC0 glue registers in a dedicated MMIO
region, so model them as a second reg entry rather than inventing a
syscon node. A733 also omits a power-domain wrapper, adds a second
reset, a PTP reference clock, multi-queue/LPI interrupts, and uses
5-bit MAC delay fields in 180 ps steps (0..5580 ps).

Document allwinner,sun60i-a733-gmac210 with snps,dwmac-5.20 fallback
and its schema constraints so A733 device trees validate cleanly.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../net/allwinner,sun8i-a83t-emac.yaml        | 136 ++++++++++++++++--
 1 file changed, 126 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..94af58d369a7 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -22,6 +22,7 @@ select:
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
           - allwinner,sun55i-a523-gmac200
+          - allwinner,sun60i-a733-gmac210
   required:
     - compatible
 
@@ -44,25 +45,38 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-gmac200
           - const: snps,dwmac-4.20a
+      - items:
+          - const: allwinner,sun60i-a733-gmac210
+          - const: snps,dwmac-5.20
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: MAC controller registers
+      - description: Glue configuration registers
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   interrupt-names:
-    const: macirq
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_lpi
+      - const: tx-queue-0
+      - const: rx-queue-0
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
     items:
       - const: stmmaceth
       - const: mbus
+      - const: ptp_ref
 
   phy-supply:
     description: PHY regulator
@@ -87,7 +101,6 @@ required:
   - reset-names
   - phy-handle
   - phy-mode
-  - syscon
 
 allOf:
   - $ref: snps,dwmac.yaml#
@@ -215,6 +228,36 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-a83t-emac
+              - allwinner,sun8i-h3-emac
+              - allwinner,sun8i-r40-gmac
+              - allwinner,sun8i-v3s-emac
+              - allwinner,sun50i-a64-emac
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        power-domains: false
+      required:
+        - syscon
+
   - if:
       properties:
         compatible:
@@ -222,32 +265,76 @@ allOf:
             const: allwinner,sun55i-a523-gmac200
     then:
       properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
         clocks:
           minItems: 2
+          maxItems: 2
         clock-names:
           minItems: 2
+          maxItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
         tx-internal-delay-ps:
           default: 0
           minimum: 0
           maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            Internal RGMII MAC TX clock delay chain value in ps.
         rx-internal-delay-ps:
           default: 0
           minimum: 0
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            Internal RGMII MAC RX clock delay chain value in ps.
       required:
         - power-domains
-    else:
+        - syscon
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun60i-a733-gmac210
+    then:
       properties:
+        reg:
+          minItems: 2
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
         clocks:
-          maxItems: 1
+          minItems: 3
         clock-names:
-          maxItems: 1
+          minItems: 3
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+        tx-internal-delay-ps:
+          default: 0
+          minimum: 0
+          maximum: 5580
+          multipleOf: 180
+          description:
+            Internal RGMII MAC TX clock delay chain value in ps.
+        rx-internal-delay-ps:
+          default: 0
+          minimum: 0
+          maximum: 5580
+          multipleOf: 180
+          description:
+            Internal RGMII MAC RX clock delay chain value in ps.
+        syscon: false
         power-domains: false
 
 unevaluatedProperties: false
@@ -412,4 +499,33 @@ examples:
             };
         };
     };
+
+  - |
+    ethernet@4500000 {
+        compatible = "allwinner,sun60i-a733-gmac210",
+                     "snps,dwmac-5.20";
+        reg = <0x04500000 0x8000>,
+              <0x04508000 0x100>;
+        interrupts = <0 172 4>,
+                     <0 178 4>,
+                     <0 173 4>,
+                     <0 174 4>;
+        interrupt-names = "macirq", "eth_lpi", "tx-queue-0", "rx-queue-0";
+        clocks = <&ccu 229>, <&ccu 92>, <&ccu 227>;
+        clock-names = "stmmaceth", "mbus", "ptp_ref";
+        resets = <&ccu 94>, <&ccu 93>;
+        reset-names = "stmmaceth", "ahb";
+        phy-handle = <&ext_rgmii_phy_a733>;
+        phy-mode = "rgmii-id";
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ext_rgmii_phy_a733: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
 ...
-- 
2.53.0

