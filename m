Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F75399CFC
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542958; cv=none; b=WBMeTCMh18C4QKyoZIEpLvL53AWWxaEdzcx7x9LeH4PH0wfyzSvFn/NJOEKQRBwZ8Jp3odkorwi1V+MWsjR8zL3G8f4GMocgzSfx4i3sMdjCjlAKdMI3/RqquQD/2TlIKkfzV2sGdwCPPO1DaI7faVfsICq5q+qIOzCTcQ9B+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542958; c=relaxed/simple;
	bh=dzvQpsaFNzTSQyGMaZf06rfPoX2v6uoyg3zaA9cEf4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUHcxpys95ea5FlLOkflL/QMbdftLbFmbPJG+FPBdc08V4HVM27mpGwDjbXuoRHrXWr6BtQWOHz28j9VrBHLx6up4nvpztLQ7qlRrP7AdoIpfgq4hoIyNfDQJOQ/poq1kq36kUW9TPxQ13TiCILCDK/cYd0qmlkN+5IFj5PqNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNTwbVmi; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNTwbVmi"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso9946902a91.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542956; x=1785147756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY7O09j1b/kYLX3ncq/pMHK0bqmzatxHIxsJQ5YPWmk=;
        b=ZNTwbVmiDwUTWOVfHisypj6rfTdKHePIgFszZetSeWqnlu3UGU/b1RgZKLzCZhnzfj
         pqDqPAai1xMRYDYXSYqHoh0XJEzZxvVy1Ou9xwwIvQpYOr2dbY3audHfm4JWImxDrIpA
         DSYbiqFptO1B8Mh58E2KTfXJvkRfaKuEc06WCea2k2V1nqO/+YZzdlidF3AZSUyPAk+F
         jlmpYiv502OxyL+zsenJjWS1WRLs2tBVKrDKQ4wBvSxI1s2Yg5Y8AXUG/cZANS4uvuXu
         exnpramXi14FLsiq+utcDnMmEN1V6X80guA4hntvToJcN+Ruu9Ye1XtBFRG5/xIMgCgv
         KoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542956; x=1785147756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY7O09j1b/kYLX3ncq/pMHK0bqmzatxHIxsJQ5YPWmk=;
        b=VzWvW8twjTpMFEfQcbUhPyer0AMm3AfIPe6Nc9b7thdfO4eQrlW/VVDOY9GDaVpCAg
         i6zqZQ0D6m0nf2aXWRWm3+yTHmGLYjCgwU8GxYOyKDMtYwzYKJYc0dqpQu8Crx1Fr3oO
         S3YjvUkchrvv28pugQOO6tSYpWcf0k2nNrv7sxVBYQpeeA97zcUaxLjqA9O0YvxxaMvO
         TrKDE0oMjvbrWv7lqI9Nwc+Jwqskn10/iOy+xaV0YpREYHVVXZfivv84aPsSea4rfWWD
         ODp5B7jAFrogAfb6lwq7OJWNgZ30IY4fcr8rQ8ObsRbNPMtHxGBx8FUmyu5qDXwpAgFz
         KZlw==
X-Forwarded-Encrypted: i=1; AHgh+RrUeJ08pu0P9wl1kw6njs8CP0jlzAWm/D/zVDJPjqXeL5saWFWGnJA5HhcLEkojQrTK9q82xlp1UNde@vger.kernel.org
X-Gm-Message-State: AOJu0YxWo8dI+PJZ0VraPVqv3tG89Y9MUy8Sa73I1PSgFwqBZL2efPdX
	3RR2/2zhsbHHeETQslxqOyawKPOZiBLmdrCpqERk6tPEhbqp8z5fdAUB
X-Gm-Gg: AfdE7cmX/e3QeQkwLCObdI4JdNks6eiFLYBEteX1J9S2LPMelEJZcTLksEYF4RovSST
	ajHQEeP0RKjQjgoDO8BJ6fyzZEVbu6d4xFMsvpThhDUzpxFilhmWn1VYreQWuN7seUYHkSrKWwt
	G5jsEjjGmksrllZhKwl98OGEAwawKisw2Tuw8Ya5OiR+qkOYAWXRWf9jhxP05Pu70VOaSvj0UhD
	uvp3LEeE35LQy3wxZRZfzIrSLMSStCYDC0VC0mn2NpE64JY5cai+WltJhxROFg26qXADGRkhyuP
	LY5Gv0+j1VNT0bkAOknKYQAhM02gr+YjzBMaVIMQwPI/a8FngXV2nV7qTBqPIsdqO+UmRNeWzqS
	88d8x68RYIDWq/v3WH7pjw7ZEoAz3QGpI8WeNnWoTjm/mW3CWlhvRIWNptXNi/FgXAfufwy8tqz
	QjpNWuwHjnpnWLGwT2+Xdst4vuZM76CCH+xi3fJnpOO+jHh1yA06SipXnZn5QG1xY=
X-Received: by 2002:a17:90b:55c5:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38e4b41713bmr14114572a91.7.1784542956061;
        Mon, 20 Jul 2026 03:22:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5616125a91.13.2026.07.20.03.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:22:35 -0700 (PDT)
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
Subject: [PATCH v4 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon, 20 Jul 2026 18:22:21 +0800
Message-ID: <20260720102222.251179-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720102222.251179-1-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
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
index 7228ad4735b5..5a7a39b1b514 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -88,6 +88,14 @@ sys: system-management@40460000 {
 			#reset-cells = <1>;
 		};
 
+		usb_phy: usb-phy {
+			compatible = "nuvoton,ma35d1-usb2-phy";
+			clocks = <&clk HUSBH0_GATE>;
+			nuvoton,sys = <&sys>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		clk: clock-controller@40460200 {
 			compatible = "nuvoton,ma35d1-clk";
 			reg = <0x00000000 0x40460200 0x0 0x100>;
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

