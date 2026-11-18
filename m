Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981381;
	b=iZ/9FuM4cJw3+EpktF2nkLuIg9LteY6a0NgPETRXtc9K2Hi+9l/GSTSaF2F5z8I2DEID
	 tnxW0ps2O86OVMvvzxXb97z+JP3mRFzevAh47z/iMFz57WYex3hREQdNLdf1Jpqz/U2Y5
	 oK4YUi2JGmll7ZDogW5SNEnWCROHZ3Xar9qwn3WVnJFPUaFeKuMvzynir8qsCfiziO0UF
	 /nRVwX2tYyYzunvEksoHKge6sVRuMKCWJgr03r8mXXu/UunBHUTnjQhilXjVOaO0Ap7GW
	 Tq0GvnBdxshT4C0TYqGvEATgt4gaiXa8CPwk6XBezA8oN0j5Q6+CeR4xtp72M2ehdPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
	b=g+JmQ9fpIP+toT7/cmcf8FN8/xF0NwTfwNB6V5ZQvrVMTIhL5koRHFEqSRwf8TnbLmyJ
	 WVCQKpA8eAjwnwe2bq5m49O8Vigqoo6Bq8A9iK7QJ54X8EAHAr6KQYIkomJjhbVQi984J
	 u0/xX0fFTTCsJo+wVkYATDduvufMfZOdkawiwpUaxlKXshRhB+zyyQu1ULBc+aWgZSZf/
	 p6A4FZIip7D/FIaeyV5DH/Qp1O+nwUoQwGTS11YqUnjT8btyO7ZuwMqqh7nEVyUruF8Kh
	 8zMmpxKFOnErh8wRTZI2tGslWYxoTnhi/ZKQguCxdFaY6a06EsZ8Q4XZlmAQgcTBmMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIt3rOAZ;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306C9606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIt3rOAZ
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd63b18598dso5864a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981381; x=1795586181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=fIt3rOAZtPnzPaw8RLeDU4lrFzvZ1E0zMhdIhwP7cvtZGGoczAG6yZtQkwC5qy8duO
         ykjI4l3NqZCVZ42B3SArtDxwmILaC94yC3mHpYzIbIbg4r6TAt6I42U4F+nghkKmZ5u4
         8pnSl/E7jyXHb8EQrv2lz8h599o6bVHenNispOnSmZIKtu1wTGn8Dp6XjfLx6spwYVXg
         YjAIGUvMDgTBy+hd1PRXHCfecpKrK3fb2jUHpKVS3qEXlTpW2HX5iBoGP/2QeZM84Y7+
         jVW//Xjtg02cgWdOUgwMGGQBuwGo1o92Jsn9LoxYkxOZvgvh8cd4leYcquGW6qpRCygZ
         J6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981381; x=1795586181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=gZxV9V1Emw2J2G8XysSnGgYF9KlvmZwQmmftjsAk2aJc7UYC7A9jPCNK7Roe6ljApL
         C2LcqfGgTiXfT7/mExwiBhT2+C2uwjlDh7pEfEWhVJURReJZ2eCaYmIZKmz9Ay4jOn3J
         /p+vRx9FRC5aTZm+zV0vvI3wKhW1zIF2o50DdiBIaNoDFNCmamxLv6NzWR60FwMYLuW1
         vaOMjDRhknqK+gRENnorUqirGT0O2w1tky2Kak526A7WC+gPZLAJCxgGdpTdPTAMBt+r
         ViGp2Fan9b0e3uxiF4kwNBAHj7o2SI1pA2sZZVK3/8f0HhTHKq0fohvTZTHjnCDiQmZe
         +pMA==
X-Forwarded-Encrypted: i=1; AL+hErFjO5Flj8KpfVVLAhDo4nmqHTJ/33fE/XJah9SNUo84NBV4RBIi7IcDWWMrCwcXEa/DuXvY7mhRq+6R@vger.kernel.org
X-Gm-Message-State: APuU4Z/LnnpLjmQzpAED57zUQC5toyr8PO2NbDwV+qK3eFitu4v0yA9w
	Tgsz5cgUFYCJVApiDY8TB+n1u9cnRyOQu+ERIyTaBFEkOuyn96r6Mfji
X-Gm-Gg: AYBFou2HyjIwjdgu++/K78qtGOI7ZcyDIG7U76tg6dNl7G3qO9m/421ePm55ToEDMOy
	JbQxAo/r/Uvq2PlHoW7dEWqrKNimU9wAj81gDNFN6d0sOrF5mZSpLnYyP33LPDcVV9ij/ihQ7qV
	JMFXGPHm1YYnpVtnRBSBlZqv4x76rwmpmyb7XaD4uyPrIioNNcx0FrGagdhtaa6S5+hiHN2Gi7o
	MvVAoMPLZIBZBxYz28D94Fkq1WBGVlEKLaSp6CzPNCf35pw3UDkHH2j9agoBegrnyeIqWgXE6Ll
	TcHWARl9vxe+moASUIfTOsQdJ8SS/IuIOIRxP9q2CbZmOx5fBw5xLOXiD+BJWKZctL3zvNq6r+o
	Ihpd0l+3uAN1/hO9Mjb723oSv5cwxSqH2fgbyz9gwAAXLU3ocvWLW0s2e940evgh6bcz3Je9PE+
	zSH/0cMPsNIyObeFo67Dt8DltKbJpM5wD3cDMswnRcmPjtST8B9ZbuVLt2LH9xnewDSHeqDJ9HQ
	0MW/as5FpGT1l7uWIenzsUQR3/eTxwgCx3o0BPHDnpEnJXzu3m5TpLqYB0OuFfar8zwoOtfi3al
	COPgnvP+G4gB6Nw9fzej6S3BguJnSjumBmDr03Cxo6KPT+mtvnf1RwehmnJpiHo5uP8LKOuApOR
	yjK8Ne8aIuImES4Y135Vd
X-Received: by 2002:a05:6a21:c219:b0:3fc:7f4f:ba46 with SMTP id adf61e73a8af0-3fe888eb7b0mr1972957637.2.1794981380287;
        Tue, 17 Nov 2026 21:56:20 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:19 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:22 +0800
Subject: [PATCH v7 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
 receiver nodes to rk3588
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
Message-Id: <20261118-dcphy-rx-v1-v7-9-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=3591;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=wHYitdr9DGtZWdI+e6LvB71Er0urXzEmjuek2OzfqCA=;
 b=8DgSgyPhpQNduk9l/SM/4dMAVGgXDC3dSb7ZJjM9K4UTaLkxLcbj5MRsPNdpQa4pp54aTKeyl
 /jVizBopUDuA0gxVUv0l9MYhwPgtlRDmP/mh/ZJasL0zxGzgI4x0Zyy
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
wire them to the VICAP ports.

The csi nodes select the PHY receiver with the new PHY_DIRECTION_RX from
the dt-bindings header. The phy nodes need no phy-type: the DSI host and
the CSI-2 host both run the block in D-PHY mode, the default.

PHY_DIRECTION_RX is an ABI change: an older kernel takes any cell value
as the mode of the block. The csi nodes are disabled, so an older kernel
is not affected until a board enables csi0 or csi1.

Before v7.0, there is no CSI-2 host driver, so enabling csi0 or csi1
changes nothing. Since v7.0, a CSI-2 host driver probes the enabled csi
nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
that drives the display. The camera gets no frames, and the display can
stop working as well.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..c7174c2f15c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;

-- 
2.43.0

