Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604748;
	b=02D6YcjHOpknjyBA0BJsPJsMk1VAO4rj2TMLf7X4M91/R3ipr7w8dSe5h7pnRM5cr2Ve
	 fcZfhyOOotHYwLBm1pAWhID2frVjYe9tIdokxlOe/sAP5xUdWOb4biRgAkXWsFOfbOB9y
	 yTpUs04c2FOII4GvZE2c6QsRaZi9kCtI3U5Wvnzr2OSbM3EXI5p1MLtwt1eUfrbtcyxlo
	 RYMZIAuCBk1tLpyHFpVgi9wZfId/zNMPU/IYO5bHLWwEGQWRB+WNoQcOK0tpxWBXYCJ1G
	 ATSjo2Ridp8+XEqrZk7fHGkFZ3B1DGhKs9xRuzIsXjIS377ykmJatMOb7zoAQzpqMqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
	b=bjntyIH8njcnLJoxgObxhDl2yPJVzzEgamnX2gdx8Jr2ZyzTRAmIgnhXcve17qt7teJZ
	 8zbX7S08DE0dtCfgX5qDqwyCf7F5ipUZA/Tq+YlbikHeFBZ0/oxSeVMECOq+Q6gXS7lEa
	 cqvv4jd4D56NLzGthHOjiDzUQYCXHt/kDvzJ3GRf0VJfAZNkYWkYpk2Zi0UVdxHJLzDhW
	 gvuhRuEbb8YKDS+WFMxk/qh8FTY7MRjSlHblo8TRkKPJmWwlKUdHHMmFYt9v7VtuIvo74
	 w2dbe5eC3uaW+jOUXDc6glYzTpAxG3Odnknkg+58p0Z4GcvQHjsbjpwq08G+tKoHymA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkjE+TZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2F606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD2F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkjE+TZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so72262745e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604746; x=1796209546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
        b=lLkjE+TZG0FMymlcIM6k3QhwL9ItWQW4XWpCQqIs9aKXPsKB+sJBtaIU3V15LINH/M
         uEKwRvo8v3JVOWr8mejNoAKHkUZPRtwVjjH5gJw3wIFL2DEVRGynF3LuWfuBRGvnSXR3
         bP05YbTmsVkFqHVFF4vqarI1kwEFDrQFJn+sLrrkZS4hUd2A0nB6Cg/HbpsU4qpIOkt6
         6cQcF5rSMCTPlEDrErd8CU/9Vd/v0Bvwwt5KtMcZY6A741n8zPJWvoS94nEuBMIMo9XC
         Uui7l8bTSSe98eEyBl5qZuj8jie5IjQKrC22yuxXdw+HDOPZ6tsGQBCx6RLDZUV3U0nK
         Ts6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604746; x=1796209546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
        b=DUo60aO+3EPg7B0H0ceJ+iFzkH55tpkILqgH9FZymqzlElq3WeyEgUMFsoclyro200
         L62PUJ8fJZ+oEibzYbgCoQXA6e6+w42ieeukwayQydPOTBXkAGYgHdmL8Z102WO6uuQx
         yZqrZZCRfuh1bf/afdNmI8ItoArcuD3kUobiXfddIQDpzPaRlkAETVh6e/5ZhAhZ+hHm
         OdwNLJLBdW45+Wg3IBzIDeca3F7lJs52MITYt7svqamCaS1aylbVA8nkFK8ayWpw5aHv
         hQ50JSXm1Hbi/ATNTABBnjyZhoWCZ7b2zwo13HnBDEGB7WhxyUvI9bF99CFATx7xY/zB
         lwZg==
X-Forwarded-Encrypted: i=1; AL+hErGVpZEioYHoj7KTBLfFxujgNNUjwoPc7JR35wsLlJ4PwCYT+aLQzgeCykhxXzTnRBefRgPNrmOjj0kA@vger.kernel.org
X-Gm-Message-State: APuU4Z/fA2fGgsaZA+67wFH7Q+vlGN3vGbVIaGPU+u0xZueH0nTYdNBz
	vOEbULB/vowPCs8OyuFQLtcCUk9s2D38fvKYslwQ6QCu51ThjWzD8fOf
X-Gm-Gg: AZFdTZd5zJwvNoXP5mzd2dzpB0Be+1cydm16UpKH3I9wTniK2XrBAugLgIypWIVYKjX
	mzzLq4BIa24KqHPTafdIiP3BswoPUaWWakv9AxM+8meSh/4j+7E8/ih7FxDcxs4DW2dtGUwiKEp
	p0Yc9UEcUzAUDVaKL9hlTTn+UPW3t9J26rTLVjhDALB49YWVd6IEmQVriZ3PrmHDKq5PsEE6tha
	oh8vf0cc+kJ2/mEh7LWjtZFAYG+bDO2twHKxyu1P649Ci75Hq312n5QdstCqyG7K5OIa0TFMwSe
	DhygGeDPtO+BtptiqPfwo7IPLoj6WFFF/JQsmHLkLFEobE69MSbB/QuC9/GuWTiNg9SRlTuuUDC
	LbxKPsMkRk2wO8Yult9fNZnytGJgr/vUREEGbufuUqU/SMb1RI2luHPeGMur6ZiqE4Ww/BDfteb
	jQPVGrqCM7EsWjYtioqHZARCGvQkXW01ViAa8gBvmfYxLMPQNPOSKZYDmbArwwe4yfYK2OpRamJ
	vk/mAaQpBPEIsEuaryrC4AZx39lmpNdgfc8yySF5a8jj2gwMWuFYT7B+fjqBD63QzwXS0VxaQp8
	Vn3frYOWPzMVk+9RGilj56nz4CDcVK8n7ZjzPbEv7HlaA4LDGuNyx3t9jiZtdPKi
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr360275975e9.3.1795604746080;
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:45 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:43 +0000
Subject: [PATCH v9 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy
 device nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-usb_rzg3l-v9-2-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=4199;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Y4aH+161y3MIy6RJ8G27J8Wexgq8ykbImur/Ccjduhw=;
 b=5mSlwxytSbQnH3wCUEBOoi7ca0IlcXwuQb7jvpYENWoaVJaecZmX6hhjg8VrimnvMJU8PXVSU
 bq50RRDT6ODCYydDEIm2lMwzutXIXm51CnrIBtr+7+RUkkrErKvh/wG
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Replaced place holders.
v6->v7:
 * Updated commit header
v5->v6:
 * No change
v4->v5:
 * Dropped renesas,sysc-pwrrdy property.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 92 ++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 241ba7b5da74..b41a813b01b8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1413,24 +1413,108 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
 		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e10000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e90000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e10100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e90100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		hsusb0: usb@11e30000 {

-- 
2.43.0

