Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924CF3AEB35
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502567; cv=none; b=JdUO0x9Ag3Pae04ZiL0kAHLne9fTBCOmeWkNlwEam5HnrgyEUVhXL5ez/QtFifalZPmQCEh+27qOYR9qorAI8X69+J+/yYBeOQ04T/kTq/PdKy1PvSJ2k7k969rJ4bXaD1viT5aSx02xnHb7YrMemrGh2CRR3EI+WcM8a2H6rmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502567; c=relaxed/simple;
	bh=T7hVqqNuqzbKSwtvgb7QQgoGYZlUYTOwBXB6MtvmqVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKX9ieHFAttn7iCcc0Uc9RqDh3aCTZFV7i1dwWd7sJ+m3EoGim8mf9sBSmv2DIUMoG7k6RsG4bCb1dgLUJ9JVLJSMvsYy28glR2/vDG0NMxg0QY++faSHGWRHa2foXXLPyT8B1ZMPeQAxXU6kaSbSP9WDCGW2B1f0jqE+1DsNps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKgf23s9; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKgf23s9"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1370417c01cso3560955c88.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502566; x=1782107366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0UWtt4coThKyPKnZ5mqdOHry2K2IKnmgBl0O8XMrW0=;
        b=bKgf23s9+eYjV1PiHNGNKSX6FI02xGDag6Z8l2LC6fvtCgM9Lh6IgsahNZ57XEcKKI
         5nnqI0AvbjaDcATmRlMRxycyH6WE0IRXzUU5+e4ReDGb57eGxYJCvt/9Ok0EwPusb8+Z
         /gaA8y6jomyQxfdFeGPcLeheKlzONupYyA4GFRCwBnk5/7O/p4wV8IvV6pERHpBrRIvU
         3yqIA+L6FEtxyc/guHH4lmN1DKkd1OfcqfhOelk9mYDgwhTrgOMP+kO9Y4GpRCZF6ESZ
         FmhSSmgx4aGtaKyJ+4Vn8BtiG+lkpiijvFMP8ZAjF2qATsxd39z7HVLd6ENulNef7LrK
         So2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502566; x=1782107366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0UWtt4coThKyPKnZ5mqdOHry2K2IKnmgBl0O8XMrW0=;
        b=nvdzYZ1FBcGRwcnjQVuNp3GgenKr6WB1x38dnRPo4P/yD8uTiVujwxMBxrj6yvhQL/
         AMbmJai8AJMbxYDkNXSRcjopH1NDWGCKsrf1BHOVimJgTOzY+dU8BiFnBNheVnejiSpg
         Adf3xkq7lnxzroCH8K/tdJeb7HfAxljLuq0rO1H5blMQ02u1TU7q+aP91TNSOb+YhkNo
         ld6gvbjqAgMfLuEL98HmnlBZ9h1g0LPUK5HxWA4Ij0wFO+QQCI8I+Uvm7wIkjAsi5mGw
         qozrSpG6RMpti+jHQYJp9MjB5pJur5MXnlCXkilIuG5+KwFK1BkUPB+ZmRx9muUTVj14
         61Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/Kj7CXLdPJNtG4YQbptPb+FECz+DMAaOxCTPCKrsqGhLnoqdIwx8rKTopf/pNDJDkngNijJ7HqFOI4@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzmPSWEUkGqB6OqxxIlqhXIEuGUsKcjB9DBDCgqSQvxlr0BIV
	JJRLYopGqN72cf9EQT9BH2qWFBLkROTwDq7Z3SGAImZ5hIh8q8vKMBKl
X-Gm-Gg: Acq92OHomvZuUZyhe0B3fjX9EqkAthP9VdSZK4yJIeuJw55hbTlxNGVzVfZttZg0fak
	KP3ff31G4dCyAfxhAVuEY6Ul7beJBcNSSG78ZGD5kGCs5ECf0DDXhpzM4BORF9hobZPbo4Kw1x5
	m86d4Jr/mTnJrv5/FgkdogKJIHCiESTnX+AT8wJ/BAhR6HNY6vgECaVsfbek+0eIObvEaZ0r52+
	sq2vTEixzPpHhjl0A1mN99Zm0niR5eAR6eW+byEN9qUm+64xLmiyaYNlUSCGPp7G/+y4yI/pNTn
	XyfkVrzx3FOtQxURW3CyIvyhnrofrbqgvx6DDIpk72XJFEX+Dw80tmmp0jCZlL0MBv5rJvQ7ZUe
	P9xJJLOckOumt9Xm03wYk+oZ3JVBgUNkuM9DY7z+cvbQRtf20iwloXFc7hp1XWp5IyqWFAb2cGe
	KLb9ZAF0lfLmQlIOFZmLatmkoB1tojGuFRDaCTxJOTerpYIRkQPA7G96zOtYnXqgSvbBdplosVL
	dANEop2HPy1
X-Received: by 2002:a05:7300:3202:b0:304:d788:ac5 with SMTP id 5a478bee46e88-308200c9097mr8011634eec.35.1781502565474;
        Sun, 14 Jun 2026 22:49:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:25 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon, 15 Jun 2026 13:49:10 +0800
Message-ID: <20260615054911.48821-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615054911.48821-1-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree nodes for the MA35D1 USB subsystem:

  - sys node gains simple-mfd + address/size-cells so it can contain
    the usb-phy@60 child.

  - usb-phy@60 is added as a child of sys, using the combined
    nuvoton,ma35d1-usb2-phy driver with #phy-cells = <1>.  No clock
    properties: clock gating is handled by each controller node.

  - DWC2 gadget (usb@40200000), EHCI0/1, and OHCI0/1 nodes are
    added.  Each controller names its clock gate directly and
    references the PHY by index (0 for the OTG port, 1 for the
    dedicated host port).

  - Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) enable the
    PHY, dwc2, ehci0/1, and ohci0/1 nodes and add pinctrl for the
    HSUSB signals (VBUSVLD, PWREN, OVC).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 68 ++++++++++++++++++-
 3 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..32fea36da7f4 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -95,6 +95,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>,    /* PWREN */
+				       <11 13 9>;    /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -126,3 +136,29 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..85d1c5db8bd9 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -98,6 +98,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>,    /* PWREN */
+				       <11 13 9>;    /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -129,3 +139,29 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..73ff1d78d284 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -83,9 +83,18 @@ soc {
 		ranges;
 
 		sys: system-management@40460000 {
-			compatible = "nuvoton,ma35d1-reset", "syscon";
+			compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
 			reg = <0x0 0x40460000 0x0 0x200>;
 			#reset-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usb_phy: usb-phy@60 {
+				compatible = "nuvoton,ma35d1-usb2-phy";
+				reg = <0x60 0x14>;
+				#phy-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		clk: clock-controller@40460200 {
@@ -379,5 +388,62 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		usb: usb@40200000 {
+			compatible = "snps,dwc2";
+			reg = <0x0 0x40200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk USBD_GATE>;
+			clock-names = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb2-phy";
+			dr_mode = "peripheral";
+			g-np-tx-fifo-size = <16>;
+			g-rx-fifo-size = <0x100>;
+			g-tx-fifo-size = <256 256 64 64 64 32 32 32>;
+			status = "disabled";
+		};
+
+		ehci0: usb@40140000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x40140000 0x0 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			status = "disabled";
+		};
+
+		ehci1: usb@401C0000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x401c0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			status = "disabled";
+		};
+
+		ohci0: usb@40150000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x40150000 0x0 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@401D0000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x401d0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

