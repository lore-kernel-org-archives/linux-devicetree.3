Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFFE4483A4
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011771; cv=none; b=Od89oof6flurBKW8Yn7nc0rac6CBLKBUr8yLqOBmRp5I1/IVEeXhLDZNahr9wjXc0v3j7CNqOMdpRXs1u+HxBdICV1HxuXCXEDuBhzZVMoIJiool4R3qJVcA4eiY4zxyIaixtEj4FnSYDAmBinDJNuADi7E5LMg4p1PwM18eiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011771; c=relaxed/simple;
	bh=otVo7kWN9n4xyv8PYWqeOig3Ui8iLIzoeWuuCxp67vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezgUrgtxSVWHalCJjGXy/NGb0rVi+PPZWiJuONzJm94OBe7/JqjXeaByo8GB9jmGE4EQJnY57d7gSsdpnaHnrFvF3tfJyMCAEJm+U4uD/1oqAbE74zy2EdyG/0BqNp6acv4eQef8cvxGtbrWAtD/RXgSgr6LpHzNgqHsYUQsCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C19RR9RV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C19RR9RV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954afac04bso22252955e9.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011768; x=1786616568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BAniibCBfDGSGa2TaGwKrhWLtY5pGQ+5hCLK6RkG6w=;
        b=C19RR9RVl22pC+7KdLMYOIzl5Nl4F+R7hG7gcuYDuIKKFJ98RxLUEFC0g4gON6h+vL
         C/kLIfOStoivW9xEaYs26TMxtYn+u/fUa/LgyGsNPMK+udxzZIytvJhrQCe0g9cEXOcG
         1tsEY0oQlX0hX9nn7/L2SZ6ob9uLQos1AuZ/oioyNnGLmCdpKB9NlB2uE0183aF3HKaz
         XNjv2jhTlrKSuZYUeELlOa0Eqw8sbi5UYSGLC++d1xWhKUpQ5f+aai5pj1yjihLbIOs2
         XASudmTacux6n5FS2ilm6qPcbC09/6EyavwAYS0Fk4siRM+ue8XXEzxSduWJxqlxIwTk
         ie1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011768; x=1786616568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BAniibCBfDGSGa2TaGwKrhWLtY5pGQ+5hCLK6RkG6w=;
        b=DvlaA/uYD1eGFmlQRDshbg+nRc9Sds1TwoikgO1DsIueLnlwNBvv3zZis3LckZHAzd
         rk/0xHMfAGanigaWZDQWvWKpk3OIaYsHbqJ/JhsjTAnyuwk2LAxVvlzQ1TqipD4uPxSN
         KCcftnENWAwdXUXSUDZH6iwS/jfNF9RAEosUZs5jHUJD1u2K2dPJlqy0UiJVXwsH+hEE
         z7pdiWJZk2aKnoOJCACL4rk/xUWVD5soKOvoQ+qM87Y2/cQPqWHAeDrbaNMaxjerBgg1
         IXVOW7uHotj9kG121yNTHYOm2cxz7vmhe51bFfLAnjc7SWsdv2DFpglKLoIvXO7pzvPQ
         of6w==
X-Forwarded-Encrypted: i=1; AHgh+RrgNMrDY0JqJAiXCOg9lctx9FNo5mVwKie/bke4zSN+LpfqAVPY53exjxkzxZQNO0ttZVnZBDr7uXfV@vger.kernel.org
X-Gm-Message-State: AOJu0YzFt73M70UegZq4fBK8JUtgZlJdHqhEGcYppaDzqOgDArbi/tGN
	axjABiQz+0Ycffi2fQOymS7J5EvowMXTduc0DDU95gegV8Xyu1nn7vFj
X-Gm-Gg: AR+sD113dv+9RofafgJqhT9dO12BJD6tgHSKdfBV1MWuQgQaHSzVKWSguKW7EnG2wEY
	+Y+iSNVta2F2ePoSb0vKID3KoZ5qObMFU4u4uY4VO9zoxEn5HfyXp0W/ESO7TXRNRByROyZaIXj
	tKZCPFWkfeIZYOqDz0eL3UFLzbN4taWyp92qj0wgb++PuNxaev4/cVHieXyDaOIrE/I0GJK9ljc
	ckDpQs2ygryGr9xJvHupdmtqGbUC4NTP1j1vPLx+5SA0M7cys8GyofViPOiEVIKV9sRTe7WhZK2
	mEyvLQq+2UCtWAHvnfNTcXmwcJQbwz9YqIBMI4V/rZhltwPi4dJRm/1hzRzzpeYLFyifC2g/7Hh
	GsHx0hcGB3uNc5DLJCu1Ak/YZ97NgUPmq5yfCbamcQ/xfky4Tt2+Ua5FEojtyPKKL8ZTci4pvW5
	X7wy33F/9kPFux91fXuw8suWKXgo07TD1JuK1YiuQ2YtTnIuDU3qVEw7/hvfTGGi4oVabLEKEAi
	xRbFXRRC2m+
X-Received: by 2002:a05:600c:1f86:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-49952aba5b3mr74732155e9.1.1786011767522;
        Thu, 06 Aug 2026 03:22:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 09/10] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Thu,  6 Aug 2026 11:22:28 +0100
Message-ID: <20260806102236.149159-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..bf0dbac66d14 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,110 @@ queue3 {
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
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
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
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
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
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0

