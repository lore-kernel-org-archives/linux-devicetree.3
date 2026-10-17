Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E383390204
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215896; cv=none; b=DuzkSyHCjIvNEyMlRv+cZZbidsX7wfNcj14CW7SVfsa+T0FLaL4u5mGtkBgIoCRap+5eynNOtE5IB4g4kQa79klKzu1cbdQMNimioKE+tAIDIyT1Z/SgYBIog4d+J2A/CflhG/1fiqqbAkLrq9p1vZVlQa4N7T5fEZb5cFrnymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215896; c=relaxed/simple;
	bh=+ojFAngay73d5/WyAyhtk7ad9QvimhvdpmPfb6gztdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGQ8XYwRIXW0jjjUfLR7tgCwyJtXxB5EA/rLhipL+ABbDuc+y4IiX/SQoH7vpGlsSDmvaRVAqRkvUqw9RmSnZycpHFXzHyf4qQw9dasOH1RBDZ3fpgfH2KQ4j60WlsY/3pQKTJ/9gbsjF9yFJniK6M7jwhuCtLWTtY08dAst1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNMXi5kk; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNMXi5kk"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc75f2924abso447180a12.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215895; x=1792820695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oT/1KwqbtpFXM8iCK2NrIcWEMqWijDvNOiD3geX4Tok=;
        b=HNMXi5kkF7KjZJs6XBi5hcja4K6dT/WUgYU0Z6r2rKhUa3kaimOTShnNtxcLqyypwZ
         jzpLR76Goi1nDRIGgnbHaDLepsbqf06T+L36SpYza4cdvT69BE7KaiEeGVlu1Dw499nN
         AcTgq9X29Q7G8rEBnPTtYtSWGuVs0/GnlFq0WDg/ulU4qNteuPF29AE8vEaE+sbCVmxm
         alb7JjJdbvgqmBw3I3qwBpZRUG/2qqggfK8tVAo8WmwoUymqqPTmq4erhZT6IS7BG+O+
         IBPoDde1bnisKjCCOTwQZy/V+LsrIb4s1AUGNzorXskfNFZJuDQCTZ/ptArV/SsOOHXi
         ls1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215895; x=1792820695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oT/1KwqbtpFXM8iCK2NrIcWEMqWijDvNOiD3geX4Tok=;
        b=AE3GPwFz5NzhA3+bY/VsIQZuSFAEy0JkAPzOeN4DheNGgj9KzNl0bNbeInoTZkEqf4
         Hzti197GNXEkA9NpiEbbwDnd/PgJ/d4A1S98quqAPAwOSdv/+zCuji+ehGlpUV7f0qc3
         qTaxBImHdnN4+16JZAH5HoPPyMmlG/8xMM3Mp4GjOceebnzDpdQ5AfnTp0cONSgFgenp
         U+gSH/JCQyQkZx//uQ+L2sF8TzENO/qS1oZoqgyk8C7htaFo0oShdRzSwmQpBs2HjAaU
         mVgnPrbWJym5kVGf1PRWe/a8g3BBHcj6Me1mJH/Ir67mHWiKHi+M5OwPuepSTgk8k2Du
         Jb+w==
X-Forwarded-Encrypted: i=1; AKwUvByOQDbPesrxSZIpfDF6AW5AL3Gil4E0co+GgOd/qbjncm43nVrDCgCnzGUb65g3+phhOwyVOUN8l7mB@vger.kernel.org
X-Gm-Message-State: AFq9FYJciEJ4gXnZob4KuJ42CNzYgCcH6p3Sb3DwjsxPWm6nx/KfUNfZ
	2KSNS4BH92EHKFqF7GwevRvj/G0I3gRWs7L6Z9MB9eJazxYCUdpvZ3zw
X-Gm-Gg: AYBFou2gJfiTgO7/DDjfwpg8PZvAtGeovuLy8KfdCDJOma8Hlp3aIsh6FYcBLEr33y2
	fIBLFip7NGrDyvvKIUiGisa81sAGiS1HSKtFqo5Mep06eNeCMTZ32j/Y8+2vlzRxmGqbjfSsN5p
	6Fqrwcfx2NeHbhVRcxXIIJaoWxSBPXEESkBerIoHTNAM1sWMVpxqppeWJ5RK4tzj5xgGtCmZ+zw
	VzXa4zNVE5v7hS7+/6iYcOz+W6YVx+edesurnaAA0hUPmQGsvc1nCw+a6psty2ZOv/vJGIdb46r
	qKGH5j22Vo5uoBjryzvp+wMzR9ExQ8sosSoeYNYDFTtLDcFLd/VplQJe02e86I/tduFYsoYPvUF
	jE9L4w+hmK/nTLIAJOLL8PAjMXB78xw13YVfcZwggQ5YSqKHmzrm9GUGz5eGbl8E4a0VMBevL/g
	ovL0lOXQ2FCeWzjgm0vZiPUTsDLQR0+mv7ZBrAD1m2olP8+A8J2rb6BJ0zqW2Wb/Z37ZjoPzCGi
	X2c/1Y=
X-Received: by 2002:a05:6a00:408d:b0:89f:b166:bde6 with SMTP id d2e1a72fcca58-8a04c43805cmr1583712b3a.54.1792215894837;
        Fri, 16 Oct 2026 22:44:54 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:44:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 2/6] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Sat, 17 Oct 2026 13:44:00 +0800
Message-ID: <20261017054406.1828061-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
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

The MII port used by the SGMII link is derived from the MAC it is
routed to: GMAC0 uses port 0, GMAC1 uses port 1.  The port index is
not an independent board-level configuration, so the binding does
not describe the ports.  If a future SoC needs per-port configuration
that cannot be derived, pcs-handle argument cells can be added then.

The CRU reset lines (SRST_XPCS*) are intentionally not described: no
in-tree user requests them, and bring-up relies on the PD_PIPE power
domain, the SerDes PHY and the in-IP soft reset. They can be added
later as optional without breaking ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
new file mode 100644
index 0000000000000..a331880eb11c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
@@ -0,0 +1,69 @@
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
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  reg:
+    maxItems: 1
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
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - phys
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
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      power-domains = <&power RK3568_PD_PIPE>;
+    };
-- 
2.47.3

