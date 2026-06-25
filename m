Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F5346E66
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782355217; cv=none; b=Y3c+imtMvF+fAUj4uqpkj/igtdVJinL56dFuPYekE6SjHaUjqt0VQAopc2FKiZFMKEZTppzaq9VcQo0q+Z0ksarIQooL0zplR/vIIJ56FGqrIu+bd6C//6rIutixqGOpuIO5X1TDsas3gz7/nwMOZOyGaCzeOc3rmYvVBDFD3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782355217; c=relaxed/simple;
	bh=DNQEOTV1AgQD4syKZLtfXoSSgiPq62VwZPkT2C8ctKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzYwy1pGbuCL2nIvcZAfwwelhR8A+rq/88lJG+GhcEzcv+P0jZxdIpjQ3FLK8AtkrWYcBLuVVEDVa/Pn9h1FannNKwpXXQll0BD5LsemlLzlcdYQO5SOe0vixKnLqde4t2yMEICd1cUg0ETiHsAoIMAqTvX/LUxHhGI1D9vC4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+nMYD2v; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+nMYD2v"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7ebfbf2d4so8349765ad.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782355216; x=1782960016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdqmnYCmQ1lcOs8KCal+gHa/OKDAbNtziDqh652nnts=;
        b=o+nMYD2vWZM7b34kSXSQ3hC+7QiLQyBXPucyqzr/PwZtYEKV6d/U2+YMKD+OrNhxmj
         vtmmbzxTRUPkJICBDMWwITnUNuFxVMAclbOYT30dxmzH2zEMXo90r5SU5bmblQmYROY/
         eJsd5ZxdN75IxxEIyoZPFHH4kSjSL3MdHYLVm/uOJ5IAXsA9VfX6q4iXX4uy5OigVexR
         S8jNXcWM8HiyQQlPAkvDRHDpeYaGdPmBlC8biIuiUGgGP5x3JAQDA1FPrO0yLmhNsRSj
         TrD+wfPHi5scm7QLvfnZMn0NrgGns9GLtbYGmSTY886N43v0qkcJrldg0r5dirxCHfX1
         meag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782355216; x=1782960016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UdqmnYCmQ1lcOs8KCal+gHa/OKDAbNtziDqh652nnts=;
        b=ILp/Gv9Hjg2ZhYarPcEV7f6A6yGJVeM+BrP6SwwbtYnG0clQ674IkUTjw1ErUctqXA
         jvO2fpf9tuxoPYMHT6xqXfGc82B8PN2alVvZ9lXIp0g++SE0nNQ6Gd5YYfMPcBNLDJgA
         wXjOY5GaKwX4bHe6gb3U3jg2Lm7aX05jWC7p4xM2LsV0/RQd+twivORBcBcxx341yG4N
         kMVcD5hz4HDwkbRSJu4DJ6sl1jSFvbpwuMaN1J3LRw950WEm2J6Biil5SSo8eGEF0mle
         2jldJA5clw1QU4c4WGRRVCYarHH8mjYIXv8Vl0JjGLiRL9Srl3HHO9mfZbsgyf9nHJD0
         tyvw==
X-Forwarded-Encrypted: i=1; AHgh+RpZDrirNA38v6vjTeyDYgXzgqXlHNmDTnmasU/EvLFrpSGv+RLHHp4yNPUnaFsCzV1C+J/Xxrx+BGyW@vger.kernel.org
X-Gm-Message-State: AOJu0YwXeTlyfO5yvxEt1EuLfk69srygjVw8qT0PEUkIH97+LnmfRaMM
	z07/peuCOi0CF8fv6vHh/b8oUSyCZfAoA/DPVDSTo8P3QWmPzDEnBFnf
X-Gm-Gg: AfdE7clGQlOKuOxP4uPGQiLfIJtIDJpPUK2JBwXqcMgTteBPW/l8XpQEo7YSoa740vC
	0SpJAG30foBrN3zymDA+RmSd0KHejucuvMTYpY++9/t/UypWr0bXt69KA/V4U2aDg1gfUxbufaJ
	kbRfhTsL/AGr7ULbKqkqhiXh59DfDp1XkzGrqyDW2nibKyFPKic1QwV4p538ggLANVCs4cgbebc
	Ll6rWd20URiMTF4dQzC1F89sixrImQfFqwhq+0tZoIvruuxz2cvG6U6MGj2V4M9HtdAJNMEvMYy
	a7l8asUrHUQKoksEaXtYa/yWxGagiYuCrYY+T6/uUTlkNSa0JsgyjVbAq8k3PP/hsNs3otgOBU3
	B+F0qGDUCUxgp/+tHiX4fHzgVwicL46uPV5eWu3jwkRAK8RtYvlWUmqIRzVwmDyiHyBLbI7Q5Xd
	+7nk7BEJdUqkolDuvnyR7memLL0OJwyA4ZqHRn/ve4BNQUxx7GSXmdLl7z5ArhdFgxPvObs+WW5
	E9oOhPJHEfr
X-Received: by 2002:a17:902:db0e:b0:2b0:b016:773f with SMTP id d9443c01a7336-2c7fc730bfdmr7156625ad.11.1782355215677;
        Wed, 24 Jun 2026 19:40:15 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc839sm8538545ad.68.2026.06.24.19.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:40:15 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Thu, 25 Jun 2026 10:39:57 +0800
Message-ID: <20260625023958.569299-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625023958.569299-1-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
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
index e51b98f5bdce..a6a354f28311 100644
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

