Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207384;
	b=R9xfeZC+0O1mD7Sno6LOPq7/vAuJI/hANtHezVtWBRx01Y7h4eCf0iU5UW7RkJQSMvRA
	 uBazhbee/4b8EdoJYRlbaNUkRK08R64+6P790JuVrlsRTLA24FmDxPx3bcZHrUdbSh3YK
	 cEiUsxZuZgiWeXUWYc7giWTKQmagRUZts+Vtab12xvIDmWm9T7kHTV/y16IvFlJPTIr17
	 B7aDvsGgzJGbfT/mq1yuiJAvEOG5gZcO2xZL/o3CU7iEsqmK2PmRCb+PApdmjP9JEVNRs
	 vLDRp2t7N9eyh2yibupr8X6CeulX6CfKWQ9ppZMOD9rKUOeqG51fS6CQjMW2SKlMEig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
	b=cZvrbpkf7R33mFWexOmKGOSlVkZOk0mlR3mmU5L4cT1pR4T/bwjM+PECfKcd90OttjVR
	 NvtXEXk5S/Yi28qaGf9KPtTu4dkKZ5fdjH+VUHO7OkZBNeamm/wkQveoAlmnEBSdvEeG+
	 s/qiyn90l5WA4qGGJP53S+Az3JIlyTmdLpPMpCgm85f3xagW38GapAYrr4RhTOsYvPqlk
	 8a6ewRutUDWD3RDWeywu5e8i8EYShXBt9i0bxnourGYM2m2vvnrAIfnbk8cvYYRgE87HO
	 dtKKMtFPFrn9BRxVTvBDLPVe6kYiXdaswAkKK25Z0RRWHhVtrEChjrr6P/z3Wm38jCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZlDBAHJ;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393F606A332
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6393F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZlDBAHJ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so1057442c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207383; x=1794812183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=dZlDBAHJ+jWwUQYuzDJnbM0dRqzcFhY4Es4JOYqgVxpqDTSIhdUz5jjD15iDEuN95t
         eP9lO/8Z+BjF6pyeypY47hwSDOt75uCHoBdqIEcMInSWITxfVSoLZHYGGDvhb3CTUT1B
         sx0SsJBh0yLWiOGpzbNVdGwNApD38drm4S03MmARuOZ6b6M7WGULGHzOeSBn/NrP9iZy
         ZfBoTRXAEzem9qlL20qU2A8OB0WKSTjmZD/t9U73pcK2JO1NcTpm+x3VNoNqK2oL0EXt
         OWUAsJZzk+kpoqxwHTMLEDBdun8Xct2U/8vsFH6ZwyUCKl4cwqTFm1Pg2cyCz26lnHMk
         cb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207383; x=1794812183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0Q1lb4Qqoljlh+F9k2cVtvGnbnmDGMBxQf3ZK0rUb8=;
        b=M3yOVqkoyVN/idOoXcufUgZHlUNNQs3kgn1uZUARQdoSV4K5aISYDZIAE6noFPFB4X
         DLq3++7dNngGa6S46PP1QybuL4tvjmeoEMfxhWOEdgLdpGSOZWgTeBTP5grjIu6o8/jI
         434BGTlTFcb5WucZiz+LmtD0rZx/orGh2qXZyvZhA/JBviCJ8k5xp6rg5/4ARUZzOgAo
         1TZAeJy3WjrjvM8Np0/FobdgU1h0z3lls2fUf8tBI2KBSMeiupknVXEO00uWUzC3GLbG
         dLIH7yL+uQbvjcZFON7A2NPy3BpDB/1MrklHxsXCt5TOAj6XvsWY05mCKX3WgX+fXwFD
         Sb3g==
X-Forwarded-Encrypted: i=1; AL+hErFCLVauf366PRug32Gaj5bvTiqV1yIgSnb5DPjE910WbUZ3M2fdwk3EPgNyuHDlvqlqcYnsIyOFND94@vger.kernel.org
X-Gm-Message-State: APuU4Z/IgWN5otIM2EvtKC7f/8cko7j1gbQS3UzhUa2PKRw1zXLCaP1I
	10q3nVRsRfuA7X3lUK/27F9rbWp7e+bHEwZoWd4g0sKtYXX1IXUU4efv
X-Gm-Gg: AYBFou2A1V3Bd8pzpd55mvp1bpZFIjrhHz9oHFS9ZgEGaPImr8sXoVyped/fq9RH5Ar
	WYpAD4Xn/r/mhXRJx5OsuvsJQWWlP3Zpg8CTdBR95ix5shCqro9ihweNAWsVw64VqxgT4+fNzKT
	jaPN7u0H3FMH019FQhcwp38uJj5+MfjwzCaNxv27TZTLKRe5fKecQiQA5fKWafe4Kqrmq9ykDrx
	YtuPv4M7qS+alXZRAx7EJCyubqXRonrYM80KM/AcgplG9vNn+VdqQBDV60r0QR2f1Bas4zaL5x5
	cv1tCU5HO+dUOm2r3hB4r3t2oNQ4fUYzNWnbg3SzcohLL74aVw2OZT5f8OaVXsyIxOH1//Y+aC+
	Q7QGcAeANPONfNZNyBtEd69Z82Prj0/qUvFZaZZ8zJqf8imRCaeySH0jVV+yh7qMEgC7Xca67sg
	6uei9NzrqwStRpaPXUAgFPCXv8cZaGHtn8P61Hk/W8jUMfPojwusrTH2KC/unqtIp68a6ztAnxv
	u3VOfgcKvw77bEz0JyTmsU1ZVfEVNLgE2hIKPnZHCTIwnkv7MoihRH42AGNoSaQHWFItwY2/3bw
	fKiDCNp3dSzKnjwcJYkAOnug/A7RBN6TQu5X9eLggxN5+W18chhwGN4EmgUJU0YJeUCwFMlZ+Mg
	0Ln7BI7xPhJO0TW6hxQ==
X-Received: by 2002:a05:701b:2214:b0:1a6:4679:6cf4 with SMTP id a92af1059eb24-1b39feb9511mr5037784c88.36.1794207383471;
        Sun, 08 Nov 2026 22:56:23 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:23 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
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
Subject: [PATCH v8 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon,  9 Nov 2026 14:56:04 +0800
Message-ID: <20261109065606.62641-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..b2f25de2ae44 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
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
index a029b660e8dc..58349470bc64 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
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

