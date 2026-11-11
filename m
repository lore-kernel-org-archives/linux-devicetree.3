Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382312;
	b=EvBf8T7bsYPdx/ZYqaRAwDXFe5fCSH15RWVj3v9WiDO5U7M2H39JCapf0+cYrnT2yE95
	 +xJ6HhN3WiNJACa7FG0w08ufsFLSZnzMnhFhD8UQOcMnA1zkSSKbxPtZLEHrQDtdgRdeF
	 BUytZm/yuNp5lLhNxi6xnHTThT2sjFsxU+lis7JQiPNBI3QhN0ldvtCLAzos/SWJQC000
	 Wh8Qr6oWDfEn8kLrpCYjzcEi+ZTJ2cZtIdddMYlh1m03vGhS8uR9Op954LIdMUQd0/A4d
	 0t5A5Um4LOHW1LmeKfd2OgfnNm82yjLcYQb/ArQzBPTOCxB7kJPkSl6Z3NMJ/8vEjdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
	b=uP//MWTr/9vpIwG22+QcHIFcawykCCfzdkqSUrhCjhD7dR4GqVAt7dPqMCHJ5TWOdos2
	 kmBCi0PFSRFobUh7kqJ4Hm/vYIt9R5oBsFuL25vZtkpowHS38U2X5Jium8h4Jn6rMnIJg
	 UfoMM5e+Dtk8GIewOG6oczbOlZjCjL23SXBWM9PJYYCLIG8gfunccOsII5lcMNSFcL9gK
	 O/w9yRM4lM3VePZbz9fcj2e4kq4IQS45RdEz9vrbFn5dLCyNvYKcxPtFcD3HKKLsYJ3yo
	 EuspvsfJ1wt39o72tEbsIJeTINRlVrSI1DCKHuTk9TovnlpBBKMVJ4UmxAjyQN4JpTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Am2A35i/";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8760A2610
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B8760A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Am2A35i/
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37198ed3727so3599605eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382311; x=1794987111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
        b=Am2A35i/ARLEwfSWRSIGzv4+F3ffSUmPGi7dIFs+Hg+K9x48LlkxX77mTAyeUWPHWv
         EC/uyhVv6knarVN5HVhtMyZ9H5dxglDgDxHuhOJHe81upa2g5XLA1nJa2v+dXVi8SUGp
         qmRSPA2zcX7C1e0WIar3vrrnl0LuPu/99Y66YNdma9p/Ui3qbyST/OmPjmuJ8V73k7no
         Xod8G/DHXmkIuVkdZABYsuUbOx++tU2McPs1mHkTvnDpKoEEGEeClZUR6DTKwvxIAOEn
         68czYWLOB+JQ2FedAKrk4DNdPbPqrUs46K7e4Om/3jYRt+mASH7yCp00bo4SDc4z14m/
         RFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382311; x=1794987111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U35AzZ/XWEKZdjjiv348TI/fLy1BVLDjtqngJWn8/1k=;
        b=YqrbDOW6MfFPtRuc9+Do3MyBxo/5nKZe6yBX9lsvr8lF9c6xmVOPkgU9gAwZnXseuh
         l+FdcNAUvye7Ab9SVDxAf/qHNZuSQb8zvWqr0Y0/YTHT6SiuTL1112ggvkmCeJ1OUDZx
         G4IcQjP4xVDQUNTadc0d3gANT8ukscXuc1WbzdcsJPCO6RLsBpPnkmJ5LfyQLEh0KpLT
         8YvT9J7r6rz3YSMHpOmTtJS6oHvyxfRK7zCQcCufm5kYPlb7ZrNETOGzzobmSaMqXkPb
         8PzHvjVw06fCqFPtcYKjOyzfUj96J8iPhGTGG1uca2DmS2FxMu3p0i73oFa9MG1sY5Hb
         MTyw==
X-Forwarded-Encrypted: i=1; AL+hErH33vXh8h7h5yI+OLhhj/I7yJi2GnTkGYjwqZ7Cvv444XeE0Vls6mHMD6lLjT8hFUXJ8+7K30waIn3C@vger.kernel.org
X-Gm-Message-State: APuU4Z+26zE00XmipoA+I0n/PBVzYuT+lbuQ/CZXPzNDGjSa95zmEI6o
	5XHRzGAWcvPEUaxvs7rN+coB/MI+QMcKEVUbDaBENFB2o4JtH3KY0kme
X-Gm-Gg: AYBFou28IxhxF7gR6wmZHKRSh+MscdQNntUChK5kKLxsviA50OQsyT8P8Iveg3Yakyq
	htPCViHtvy+ooe1UZT9EWzi0ba4gg64ID95VbzwJxNdNpFtxfgKoUVDjHf/FZdFvlWPjYvO2dYw
	Oy/W5UIZXmmZKKdZOCfcctnJ5yvLxCrM9KcLg5P9MY6MXiMf5Yj1Uroi4Iz2pxDOhrZDvta6cgZ
	pzp0e2GSWDztlwMhIlLaGVuRDo/EGOvL7MF5cYtZWpk9ABGGmZunHBY9BbFg3ZbRHSoZFLZ2VKA
	zON345Kd89hz7ld3anuAjEw70eLCuS0o5nLfEkmVYjzPnM+Jt7s3IGdzyhkBPam8vMQHMBVW0tA
	jLd2vEF8/Om1oASIV1jP0NjtThAdp5VQBeWaAJKhxMVS6BQYtG6212HHDjG5Eo83ejCWT67h/x0
	RX7xHwuzt7l0NttTsRKqgAkBKOJCIvRw/4xBkcjK1jnoymQem7sH7sYZpRE5Rg4lYFBomB4zCIG
	qRSVu+TlP6sEguxSenWsYRZ+HhYkxR7UeyLCu2fXhLEF52A0So5fxOLEznyVlGDmRTXi219w1fH
	Om5UUxjJBJUQjrSiJ6mIOyWL3rbphJAm8ZyFdajJbGnSmYgyB2wnUn0b872gxO/ucQJCIOBnYGn
	hFsMV7HjN62ZBwVtWHA==
X-Received: by 2002:a05:7300:dd08:b0:376:c9de:ec3f with SMTP id 5a478bee46e88-376c9df08e9mr1172019eec.7.1794382310760;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
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
Subject: [PATCH v9 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Wed, 11 Nov 2026 15:31:35 +0800
Message-ID: <20261111073137.381966-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
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
index 7228ad4735b5..ede0d42d2d78 100644
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
+			reg = <0x0 0x40200000 0x0 0x40000>;
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

