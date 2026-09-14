Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706783515E5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355960; cv=none; b=sD4KaoZ4vE4vpLG5K3zo4d6LmsqMmOHF1GF6VqtRLjCZgBGYtv6jCewPoKBvF4eGHdk4bhlwW/EmvjG4ONcULBjfhtP9mOxpwNuBYTafFzb31ku8a8fzSHfD85ld6MUQFiNtHhwMepXvmDkyZuklypJRZpanshzk23yHFndFmY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355960; c=relaxed/simple;
	bh=axsBfJKc8oG5HoXuwFL3eDZHYWq1TE3XvrLzqiJRRJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvabU76b5n3ANoMT9JLb2kAxFueo39YtNtf58J6L1TwZwl5+WAp30YOLgsTjzZVTYodxwWE1sb3yM2nAnsss/tFtLkMKffiFVVxOlk6YWJnU8f9oUO+zfibC7sA3Ffphe0L5ayDiMeovKDZFQ/PZAzUUfNaj5NFqAHdDD1E39Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUlUw/zT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUlUw/zT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso26205955ad.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355953; x=1789960753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lFtXijizYAouWVN9+dy0kDOQ2hTGkK/90hktZxmu1c=;
        b=dUlUw/zTShJ4Yog0a9olOUfWcAEDQ6LsE7nktclyzH7LJBjioIFumqPUk4V0ED7jaY
         fsolDRmcLVpITl6EhnLXF6GIBAaTsR9Orf/uikgu8dZchlQei8vSIZXmqngxHGi4n0E7
         yh/vwVaCUWzgJCBy5wwyxOJ6ar9s1e8BIaK4176qpQcsO8EyjbWkAQjOVNUty17T4J6K
         K3anA8ugksma00exYWluX2tkb89pCBJi4Xwy8cU0K6IIUREcCvzdWvzfa9AGAkdKOMMI
         pekZ3vNbPX2Drm0iWSfdevcgRXkHO1YWdNp39knI+kKqXjN2ByNc9Db1E6hcuhubgmKe
         cVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355953; x=1789960753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lFtXijizYAouWVN9+dy0kDOQ2hTGkK/90hktZxmu1c=;
        b=FqUYj1F9BZyblHCmY7nOSC0P5/LKpA7WmXeubeylRardNToZ8uy2Vi6Y3zJ1qgMU6L
         Yd6ziokCk9AYPxM0d4sO8+C16pWgJwr+uRSiZy3kQhZl3+oCxf3kr80vkdJ+qxOJnfI2
         5pKl3IfvJKqH2TWK9wE1Lflm5/u2BcqnBagxeSdyw4t7ZkLO3WBvBlnzLOFsFJ/JEI7D
         h04GJdJn0fcLqtukWIXRI9DOOxHMlondQ/JJlXzFZotXj5Cslkr+bZ/+7VXnsrWU/xHc
         Xkcc20m4rPhp3FbY2C+Lhv2SIKeRjYN/ucE27n4jDpzGOzUfERVlBYmo4bVAXDV6I/wI
         pw+w==
X-Forwarded-Encrypted: i=1; AKwUvBzsIIdRVTCZ2AIFJII/dVHhyPYN3upLyOBgPNo0M4oqitk5+LIfCSNl31UsihgtNoCRKkOlLbf3m2u8@vger.kernel.org
X-Gm-Message-State: AFuF++nuy6f2IKILId6kSTqtPjNh4B9Cm66ysP4Rv1aB2K6Fd98WhaXb
	Pr6z280H9pDhSAQ7quitPR1iapHLoBAuk4Y+kV4EhFvmBkHY1Umc3ukI
X-Gm-Gg: AYBFou2r7J4YHRDEqwe587TIlf944cWCtj/H46TIY8mku6/JX+4rBFtPcGKgflt45kY
	HtE2r/9fraX/FwDBZdF7r1VMyjHbUhAC1X8Wj5L+Key/FwcHOKAp9IlTtXIyPaOzp79pDJZFnFZ
	DJ2Wd3dkPEk8ZhA6yVALHI3wghcRTnLF6GK6YfgSKqKCYgt6iaXeKT7gi2qF1r+J66LHxy+hLEZ
	6CHpaQDI6ZvA2XNFjc4BeIWHOa+5Hlqp27q1qQwCrraR8Rbvt6G6fxuTTNfwDJvorgUjUyc1yy2
	QGomc2SKM35MqOz6S4RTHyNDERtSl5YrjzLlxmzSZQSdhhHkCCdmRm8JaSbz+vaoM5F8jpo2NnJ
	SG+VQKKMurRyv5G+72GRLcjIvKQwRaeTDRj1x51WKEDYN/tYxwSrewxYcJHUJHACbT56UKvq8Ec
	jscaMCYjHtfhWGi+0sXWOrodb8lEKK/Fmj9OrLVgGwBhG1jP3xK47nYzL3FRDCNrEVX8xwhWalN
	Rl/Ng/Wb6DDl+2/2MaWIZw5e+SNk8O9/nyQIqHjo2Kf0aYpSA1PzTRxZ/bg/xU=
X-Received: by 2002:a17:903:38d0:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2dd5f16b17bmr58734135ad.14.1789355953180;
        Sun, 13 Sep 2026 20:19:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:12 -0700 (PDT)
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
Subject: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon, 14 Sep 2026 11:18:58 +0800
Message-ID: <20260914031859.385224-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031859.385224-1-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB subsystem nodes for the MA35D1 SoC and boards:

  - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
    the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
    Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.

  - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
  - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
  - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.

Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
VBUSVLD, PWREN and OVC signals and enable all USB nodes.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..0a068abda6e0 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -151,3 +161,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
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
index a029b660e8dc..7f1e6d2a1fc2 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -153,3 +163,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
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
index 7228ad4735b5..72a1659207fa 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -76,6 +76,14 @@ IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
 		interrupt-parent = <&gic>;
 	};
 
+	usb_phy: usb-phy {
+		compatible = "nuvoton,ma35d1-usb2-phy";
+		clocks = <&clk HUSBH0_GATE>;
+		nuvoton,sys = <&sys>;
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -431,5 +439,62 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
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
+		ehci1: usb@401c0000 {
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
+		ohci1: usb@401d0000 {
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

