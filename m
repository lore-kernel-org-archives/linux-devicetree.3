Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C46F418A58
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056455; cv=none; b=fWdEYuJdaU9eEGYgNzvpVFdgjywqg77F4BfSzFmiUiUKwhAN30ey7zDxsFCfbZBwx/OshWvD6iJnaFTSzf+SpLFAiirX5TCnPLWunDWVR95mNSgGVrUPTMT9sHMMlhwC6/5JXjuDcNOibschNgpSYBLJlgEUE1PrlbgLjjI1tnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056455; c=relaxed/simple;
	bh=aCAIB3Fx9iEVgSBKebY6vD7lWFtt97yz8FCDvVDuPCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkfOb5T7y0LERX/mR4fXnB0xcHaVqtD+MNwx/SUAW0mBsAVihwVEV8zET2fX92YB/1+2igKi2DumqcbwysnF9jzEBhf5K7XZJC55vBYKiKw/Gtz8+fpw2nmNth217ZHX1W4UfWC+GuP/8QRTRwRNZVYogxNRTpkw2pgQOzU1P7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAigRLSO; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAigRLSO"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so31004185ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056453; x=1784661253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puD3SxDRZK2kLUJhdwB2OWJks0pBuRZ5Hw4UZYV+czY=;
        b=SAigRLSOjBGpDPVr/Lg6hEAJcXDMGDQ2jpsYAvPjQfEcLeSNgWT7yAnNkQFUvU1rr+
         ll2AjDnUS9g0c0ceuP0k0uzivlwFnXYcGBb7EM6S7Hf/35eXXe6+jlbGwlQCN9sMMzCv
         Ml8W0pUMahkZzhH0zmMzZ/xI5VptBDoV8TnaRXR4lyIwUjumaouEmPeJnGaSOYIZv4uX
         kaoVAPhlshbwvjh/54l5FrUAj4v6yI0AgRt5Mb1GYtBu2VfrI53RceIoixKkBdhRHAMP
         ZJx9qLX92pmIp0b0CehJgVYZByAPTR14mw+kL+6+izAuuWcYAojwgi/N+Y8nFIc1Svx/
         Jyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056453; x=1784661253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puD3SxDRZK2kLUJhdwB2OWJks0pBuRZ5Hw4UZYV+czY=;
        b=PLdgPdFvTMbEnHzeOsmuPL0TnChtqQpqa1Qy43NWDlk/KFFkglk24RU2P4Qfs/hCUM
         dibDfPhqTnUY9/qBB2DH9NhETIiOH/I0j2RvObrOT0xgrXb3cF7s/11Rj1PqWLQMEXaT
         cryrwzoHGHXzwBFaKxnDMAnrFoOeHF8ydX/FT/0dBD7KI10fCH5V2b9zCaBcHhasmsvj
         3he2ROMzIy+Hd8qo0g4kgdf2co5N1Fh6qYvsGzSmP3h+7j50psoyqkaPyTMdBGWp3Aqr
         kuqnTgs1BBaRjpR6C8gq0rUHBaaZwI6A0rqI6AAz0fdm41zJQ2sF957/8riA1n4RrbJO
         gOHA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7WmPSJJciEp4tfjFg+wlyJjOyQ6r5gnE4KFZH6rt+FzHBtfBLcQHczsaKXCZ/a4LNQBHgVbr+HHd8@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8z/X3L7U0b3suyblm/xSIUNVzNcTCF/HVsspHj+CP2zZea7g
	IzFQHjyfwoDxlNntjflEoYA2AnvReeGcANLlyFezGX0uWTSwNRaXtqm0
X-Gm-Gg: AfdE7cn6DHZI3vRYMgiYrWw05bhsIhnUJNH4WsoZPqQo2SD7hqH7klVGU0DBS6/57qV
	sR43gAM5+sSs3ij2/KILGuJd+gZ+50U+2J74mHWLhWeq8KGf7HK+p6rB/XYUV3AZfzwcRVUK+HO
	cyOPCPtOxvMZltAP3Fkz/IO+mHVOVoQWhCMl8mHaDhOGec7wISsrDf1hMBKwJlvQpZqz8OUqYU0
	ScGm4kAy1BgiBtVaUJofsaPj4y+Y2YPsb+YJbW9HgkUQAnhzg0cHMoPfnO/ZzBE5MOR7iRfw7IG
	G+UM4d2SQYkTAu2Mbua/rPmThpQ03Qr5MVvBbp2JbT91Fl2kC9jWlV5XXWlVLJqtvCdTOnASniZ
	LlOmjSJseVsyTU+2PM47apjpEleP+fYoVWT6PONiJAvsXhaHHTeElSFHxfTD1VJRiTW7a40QSRb
	P8NYb8aFJg8BcJH3pY6CHjxg==
X-Received: by 2002:a17:902:cec9:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cef12fc6a4mr40014075ad.25.1784056453327;
        Tue, 14 Jul 2026 12:14:13 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
Date: Wed, 15 Jul 2026 03:08:32 +0800
Message-ID: <20260714191341.690906-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
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

The binding describes:
- Required properties: compatible, reg, clocks, clock-names
- Optional properties: phys, phy-names, power-domains
- pcs-mii sub-nodes for each MII port (reg 0..3)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
new file mode 100644
index 0000000000000..14fadf67c793a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
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
+  The block contains four MII ports (pcs-mii@0..3) that can be
+  individually enabled and routed to one of the Ethernet GMAC controllers
+  via the pcs-handle property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    description: |
+      Base address and size of the XPCS register space mapped over the
+      APB3 bus.
+    maxItems: 1
+
+  clocks:
+    description: |
+      Clock sources for the XPCS:
+      - csr: APB3 bus interface clock (clk_csr_i), required for register
+        access.
+      - eee: EEE clock (clk_eee_i), required for Energy Efficient
+        Ethernet (EEE) operation.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    description: |
+      The phandle of SerDes PHY (Naneng Combo PHY) that provides
+      the serial lanes for 1000BASE-X / SGMII / QSGMII.
+      The SerDes must be powered on and initialised before any XPCS
+      register access.
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    description: |
+      Power domain for the XPCS.
+      On RK3568 this is typically the PD_PIPE power domain, which also
+      supplies the SerDes PHY.
+    maxItems: 1
+
+patternProperties:
+  "^pcs-mii@[0-3]$":
+    type: object
+    description: |
+      One of the four MII ports of the XPCS.
+      The port number is specified by the reg property (0..3).
+      The port is linked to an Ethernet MAC controller via the
+      pcs-handle property in the MAC's device tree node.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+        description: |
+          MII port number of PCS.
+
+      status: true
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    pcs@fda00000 {
+      compatible = "rockchip,rk3568-xpcs";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x0 0xfda00000 0x0 0x200000>;
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      phy-names = "serdes";
+      power-domains = <&power RK3568_PD_PIPE>;
+
+      pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3

