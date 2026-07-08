Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC943AFCF2
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506997; cv=none; b=QwY1m1t+nXZp3lzD2cHCgfb3wLa95L2pvg1HVrASG12dEYFdSDVQd717PnawiJ5i+K0QZXUsxif8+CTZR9F0Z1KgTSNcWvksWoD58lWB3nMJjVq2OKQwRP8Q7PNzmFTf15qutmVesB1qtY7/hrCvEI4L0eHPw9vsvf2A+yIy6Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506997; c=relaxed/simple;
	bh=8KtbuVruq0Q1QGHlLWLaYjY5NM2Kt+opc7Rb2rB4TGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukCSrU0DpdL7RWqnS5hdbc5Qss0kDtOFZz39DHdaF0D9LIXx23GLnAOy5MKDxKBndBwp/ysEl7c2gbNYePHm2R2k5akK+eNHFW2CWG1BcYLzIFweiLqp8GS/DY2AFH7BgyEQ0RA5oiCaP4QtLeHU2IKoQ/ZIvxlNh8mW4GBwivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jstTdQdM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jstTdQdM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso6336055ad.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506980; x=1784111780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phrqd1lecyMf28t/u+W7zekPmM5RqS/waumL1i8YI0k=;
        b=jstTdQdMOMPa6ZTkjWo0dFR+oQhTT+PFKtpv2zfEoNK8eE3FfqL08FIxrFLE3EEk1R
         OYg37WsOeZifDmW13TKqhVJUdtqebLHbAWm/YjMAPzRLGCKyG5e7PeL/dNj0ZytVGGDR
         hOR6hWsi0zQ/9+jc9DmBKLzqjR49ZgxHewMYhPRgkr5BwVfBAgQW2PHxJrvtgFQTSLKl
         zpMbChW+24if1J0NHOpHeYsI1j1WcC7UKr4i0JL6AgyUxyFK6cjaJeqKFCPlzkmtorPG
         GFA3PExXjJVQkJxD5reV76dHlfANcR4BiAWIZHm58QDoa/PP3TVK4DxET7aRqJKCCLaU
         iQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506980; x=1784111780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phrqd1lecyMf28t/u+W7zekPmM5RqS/waumL1i8YI0k=;
        b=oF/OM3o5NsXxn7vGsYwYYVnNHRybvQ2s+ReWVd5GaLCeZBwLZktUZ1dAI/E/v0nUZ1
         XvinJGp049pK5/0LGQ9M2d0JVWDDM4NEX3IlDnG5Bi/Gp8bCb7wc14ZJ8NGY7be3L1/h
         /pOthGSOk/gEfMqZUXIiACSmXzsJhr0rF3MIQ2RcHoHIBw80BZp2vxXqJaP22d4XnheA
         qZxdf4JkiudnpgsmSLA67aMjh0jLzUzaf4OwGXChyTRFQgliGtTcrn1ymaYQAgzO6j7R
         ja3NU+o0mUDg5T2t9F9Fo22/BnYoLjgt19n3pUPBau5qEH7THLRe+F5AL/zj2XSY2LKX
         UjdA==
X-Forwarded-Encrypted: i=1; AHgh+RrNvfW8NzUUfFVXpOWp2Ei6V0aZh8GHozr9v28xCH5x2/yRmHWGL0Dgx/MjwH8ytEQfkCsedUujRoRk@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqhvaJ5UMwxP8ygc5qjlJ/JyxgaxYuEAu2uuixAgKmVYpSKCu
	FUgXlXkzksdbOAXrCD71mn2KnBQZ0QpuoFXuNZSNE0jryC+patzuh+nQ
X-Gm-Gg: AfdE7cmLCROdZP+nGysVciaX00wbXX0x7iLdWxl8N8FIGiRkoiyJpt2+hbUSUuv8Mvt
	yHT9CwbdXi0HIG5oWENCtskP6Gpsz2/JLD46H/Yh0t9Qx/uWTdq4qGb4hDhzWkHgNP2SfqAK6/5
	NyZ0OHl+/bDDn1rSyPgo3BdxnsC3tSW44bA5PIMhQNhftTunNNyI3jxEVCuu3Ht1Nqfdp35cl+T
	XE+XxRZ0WzYL1R8a+QHaRDVjf3TIWpr/ibzMph02v08GjYMeEsdgoolDxidxpn84YCRW8w24iRR
	evfZrKp5UxMMF1ka0O/3VbUNUghMTrwrH2dqm5eN5G0o6+A8PvXP/HS+aDnh4b9msmMzMhp8zuY
	mB+jb5pVWRFtfNvetEzbfgKfSLXxv1CpMZkffrZWUsVyP2+IPj9XXGPrnZ+EHAfrzLZWGdwQ/gR
	ohn+UaN+zTGWIeiAvruHD0wf3hw6grl4KDQuB0jbU9cQKeGHlvCTmwHp+pcslTgRfbobqN9TTd5
	A==
X-Received: by 2002:a17:902:ce04:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cce9f79c01mr19599535ad.2.1783506979889;
        Wed, 08 Jul 2026 03:36:19 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm25987525ad.13.2026.07.08.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:36:19 -0700 (PDT)
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
Subject: [PATCH v3 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Wed,  8 Jul 2026 18:36:05 +0800
Message-ID: <20260708103606.1462960-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708103606.1462960-1-a0987203069@gmail.com>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY0 is referenced by both the DWC2 gadget and EHCI0/OHCI0 nodes because
the USB0 signal lines are physically wired to all three controllers
simultaneously; the on-chip hardware mux, driven by the USB ID pin,
selects which controller is active.  The PHY framework handles this shared
reference correctly.

OHCI companion nodes are required alongside their EHCI counterparts so
that the EHCI driver can hand off full-speed and low-speed devices that
cannot operate at high speed; without them those device classes fail to
enumerate.

The board files add pinctrl entries for the HSUSB signals (VBUSVLD,
PWREN, OVC) because these lines are routed through multiplexed pads and
must be explicitly configured for USB function.

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

