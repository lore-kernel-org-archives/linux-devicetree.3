Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0083E16A5
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239442; cv=none; b=mKxQlIXLU6Kc5JZmq/oUePMvd+IecsSMhKI8Y2LC3Zj8GuGiH4YZYc533ssqGFEjAjh8DAzesyd3lL/+Yh+D6oRCs5jKmdxw6/P3VdQAgEOLYC+NdVgGzRKoT4YF2faGSeAJ5rRWGIXT6Hs1uzoHZnUtyzG/i6QzI7+UMj4FCGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239442; c=relaxed/simple;
	bh=uIxFaIx1maUJPzb10cLtB0jKa27JO2f3e4ujLzs23xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KG+xoAnZS3581IFIPfnVGMfwAeTcY0wfeitLIPTFzueoMp6Lzh3wKIa5SSrt2HXK7+BZZ0aUdSBaBm7jwgqIf1tfKQ1GfskulkcSNWZ5AUiD5v/xI7euadOgNFiNCJRKvQag0PUq79LCbn/4phHv6m3+wpGrcqr1vedVei1PWDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw8rd9dm; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw8rd9dm"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e4a647d776so15053985ad.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239440; x=1791844240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=Yw8rd9dmM9w57pjf/WxlcUYymF1z9IUG/rkBGTbwdo7ZfJh89ZXHdNAopExIg30//g
         pKbZ+u4W4EDDHdrXKAI4zsoFWJDc3yrtsu+omFqgzKGKaNgqKWPhDmXZ+pfcEU+FtvPh
         F935NW/ZWmcv1vY50qZ/wdl5xYdjRPcPS/tsi2lUAa2nVlqi/mX9p4PTSBobfQ06kPTF
         ariYSwqtES7TiSoOT6C+lTnMr9fV6zutbbeL2IfaYgaByrq33MAxvlrdPqwCkZ6Yoka2
         tPBZsVSIqoIZs2ar/+2c0gcOQCrgCkpjlO07gvRonvtHY6DllEvoembWZ97koIO3wZSw
         nf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239440; x=1791844240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=y0ZLAaUxryEcmPeGvoR4Evtiw6V/imlzdPxUc7EVcu+YzIQqXsEdqzpt3b41Tic3Jh
         BiWZpCW0wwCCNBZX8U+WY8KY1dS8o+y4s0T1i7d7q0APILtib8F8cFsRxLYTXXWwaahp
         ULhVEoCczYVViV1atLzCznkFOMDEEcf64lE9YOWa8IbVCDHaussXBmEIDonqp5v9FA/F
         9jI2hAYD0A6Dhdf6n85zp+BTFCiksaSiCgs2ylvL28aqmejaBtIFc2iX1DY1YXfOZ7zW
         u11WY1ew+n3u/mPqSadY0J7AfOUQXVw/Irv6WsHG5Z3zlayyN61PBcvgtJeFWmSseTsm
         uCeg==
X-Forwarded-Encrypted: i=1; AKwUvBzR0hgpG/UR5GPr5jKPpLshGfI2zHWoYEAE4DHYrXnzRudhpFTWVRFw5oNqwElCXFkOHyvJkukqO/33@vger.kernel.org
X-Gm-Message-State: AFq9FYLqWZY5XQdBOBAeNa46kFn69O+ZYhE6flQPEVPKn3umI2yOgN/k
	qM2MzynxrVw8A79h6045LBkDqhC2xCm/uoeooXTLNvoU7SMGZaICNWQt
X-Gm-Gg: AYBFou1WwrTpK2owXwuwoAzMImktxID3io8ciWSI5Any6eIhttcgUEH2MIsowBOzynW
	4vcipwj6SOLMkXCI0pqk+/JJpHxrdq1pkSdGFE7Oxexu7bhQpmre3IsFgVaC9yobiur4JHE4x8M
	3ctMWph2ppYWp42uG5cmCTDtpveZefSqi8LYDht9HYKW/gpJ8F6s/lssTwwbH5Obj0EPc+nkoX+
	lGf5iTfUPKi7gaYUWxZqhgjnYn4UOdbboVGLq1X2uxozN9cW9w+gtjGklhBRaJ4p7b5XQiXgKyv
	3IEYIdGt67bM5Jhaf3XLG9RzPdWt34sVCQZA+ALqtaRf/fLHRvssIghPqgk0jSjAbZH/So44fhH
	TzFT0cCexmuZE+yXFsjBrP5W2O/tklkhBvBFIzty68SMiKaYss9Gl54ef75mx+dYB+EN1W5vi9/
	Y/LsbEEPuLNpAUyMuDGqcrCNmwBUh4O1Rzjz3mFM+syGsb9wa8pRsEPV+rDuJpaysTQOgzlebcI
	4z35DZG
X-Received: by 2002:a17:903:f8e:b0:2e5:397a:b70 with SMTP id d9443c01a7336-2e5397a0cffmr76287505ad.56.1791239440308;
        Mon, 05 Oct 2026 15:30:40 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:30:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 1/6] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Tue,  6 Oct 2026 06:30:03 +0800
Message-ID: <20261005223011.1124347-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

The XPCS is accessed over the APB3 bus and internally connected to
a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
QSGMII modes, with four MII ports.

The four MII ports are described as ethernet-pcs-mii@N child nodes,
consumed by the Rockchip XPCS glue driver later in this series.

phys and phy-names are required because dtbs_check only validates
required properties for enabled nodes. The SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others), so these
properties must be provided by the board device tree, not the SoC dtsi.

The CRU reset lines (SRST_XPCS*) are intentionally not described: no
in-tree user requests them, and bring-up relies on the PD_PIPE power
domain, the SerDes PHY and the in-IP soft reset. They can be added
later as optional without breaking ABI.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
new file mode 100644
index 0000000000000..703fcff0e3f70
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip,rk3568-xpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Coia Prant <coiaprant@gmail.com>
+
+description: |
+  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physical
+  Coding Sublayer (XPCS).
+  The PCS provides an interface between the Media Access Control (MAC)
+  and the Physical Medium Attachment (PMA) sublayer through a Media
+  Independent Interface (GMII).
+
+  The XPCS is accessed over the APB3 bus and internally connected to a
+  Naneng Combo SerDes PHY.
+  It supports 1000BASE-X, SGMII and QSGMII modes.
+
+  The block contains four MII ports that can be individually enabled and
+  routed to one of the Ethernet GMAC controllers via the pcs-handle
+  property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB3 bus interface clock (clk_csr_i), required for register access
+      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^ethernet-pcs-mii@[0-3]$":
+    type: object
+    description:
+      One of the four MII ports of the XPCS. The port is linked to an
+      Ethernet MAC controller via the pcs-handle property in the MAC's
+      device tree node.
+
+    properties:
+      reg:
+        description: MII port number.
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/phy/phy.h>
+
+    ethernet-pcs@fda00000 {
+      compatible = "rockchip,rk3568-xpcs";
+      reg = <0xfda00000 0x200000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      phy-names = "serdes";
+      power-domains = <&power RK3568_PD_PIPE>;
+
+      ethernet-pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3

