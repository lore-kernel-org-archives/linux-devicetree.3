Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765705;
	b=2z+sMJn2BZRQssMWs1YFO8kM2AXq6i2kLdentqC41bKYRKpplrvXUeTDUy0+sIvkXpQU
	 PFAJbZ5hlhqDC1phovQe/xUf4uYLNq/P1xEHqjv/4EJwvRwzqRf+Qh5PiHm/ZcMrp3pD7
	 5flgwOz1ienWj5Mxmen8g/2wSLxt1uc6ttDnEZ8U0Prgytn2fFR10N6o6FGvHnd1BF6UH
	 Q56hZmL5cePkTiH5vRCo+Snm56ldBs35Lkn9Djn1JByTvAqbzc8I40mN+K9fZek+1FuqJ
	 TGT7E5vNIy3+D8xZq0Tp4HtsIchkSeqFHzikXRDVpk10t6DUReceMuKVx9fSyG8HrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
	b=cUIY9YeWHhi6GjGKhhEPvk4lPE/DPm0ilrnd34Nf396iLs+6ix/5CCSNiszk713UI65L
	 2zdfqrVkz1yVQf62FlF6jqP97tRE/VwTjFSTvwRLUdRgQqsA7mWSsIshDQr0P1YhmHOkk
	 0QyOCCQUTBw12wlywJwXayNK+OXcdG4MehpowkHk5VeglT5l07SjoPTwyOgvTE6MEAsLd
	 yp1IoQJgBRfAkM+bqyjBOO6bXPNm0uGqcpdDKqYTRxV6FnNoCqG3rr76Qf4mNq6wmfIFe
	 8K+agYNMn/6yP1MGoOtzo7LA11OVrRc7avfDbnzpAaP44wTOpzg08odbIEdyREeUqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMiqHLAn;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD61606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD61606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMiqHLAn
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386d822a548so249173eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765704; x=1796370504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=eMiqHLAnhGDN8oVgC23Ywafp1eMnQPM3V+RkTFtvnkZDfMkSoeCOdbKA+oxzOAc20S
         4Z4gaIoL6Md+ly+b98m0t/jXb91BoJ5prA21UhWvnvChgZelnpGkCDMeR0955aG/Pp/g
         jwhsXPz//s+Aklece9XaUK+F27SVajGpzVwCNTXfg6UXxHtzTpC9Zenav3EfxDLZvrZK
         kecwqBrK/WbULxZmeSfoFWpc8Q4yzF8m4MdlLnpwY8FrzNmQvizE1LdKL0yKRrk/URWl
         uUGwMx/hjF1uVJQeM1nLXWCxL48VsBpR342aMF0fJJbwCtfQn31VkOMeBbwWKAJ5CzGI
         L1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765704; x=1796370504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=oIkEteI0kf3QFnDXNiUYaMdBX2ShvVUqeiGbI1tNC0SisVySYbwxa2ih1x3Pg1CmSy
         J2L4NzxzLBQXQ+EKF9IC6vNUsNL/6KvkaGkWh/aZlNoJxGA51QgqMkNMCgDlL/BgULPW
         SJPyiyh2jnjrDdtYmRYnLagHWSRLDHB98O4lspIgqob3M97xurP+r90PMblz7F0KwUUD
         tU75nEKHbA5WW43b0CbiIv3BJ1/M0LEfTK+pVILuqSuU5xaP8o/GdZj3J72OELhuBr7B
         8eoErX51SjjwtC+USPv9r9vAwXnErGzDykNCr4h2sLjpF3AisxAHm8r057E/sEYxT2nJ
         pi8w==
X-Forwarded-Encrypted: i=1; AL+hErGhTKse9wA0ZKxuSqR3KQatGg0VK1a2VsiN9D0A/2CmbeV39epgNJc7g712dfcFdpDqTZZvL4y9Zc0K@vger.kernel.org
X-Gm-Message-State: APuU4Z/I9nwiiXiNEfb5JWKn4yqYxHmVi0z9OhpnnTpZR0Bn/x/at3aA
	XwBVk33A9Dh6dx/k52L7hY1Dda6xYHLFn7mpTr1FMPs1GKp4YmaOmdES
X-Gm-Gg: AZFdTZcqjvyrq7iaW9zQQ08pSx8DIp9MqBl4AKjkEz/+pjHGooNkAOEzzeZQYKgVrgC
	m7sz/O1YJZ//2636kgVXcW15yPVfCSbXyKnTN3S4xtBpgRCuFHtv9TNnD+uv6y5HbDDZb/mGcmz
	1jjb+kjSaOEGHiSo4rnfxpDXKVebNChUFinJ3jW+2/GfhwgF/cN+CFMt2krDdiSrKgxLvHbLtH3
	zs6EwNRk6bfBgck11Ai7EUnGTZp8XMltDyp9i7hy0oZZ7jn6ZUNvy3pV1wXmqp7RpUClvhk9RO8
	pAUPYuMEZIAzHlfZ5iUTvPFhRDRj5jThbzan8JQVdGTmet3V6Y49hTO1spVb63PsWB/WZJi+juW
	LZzIVRKMPiA+lzEkjuVHuAjTA3pZXWju8ASWN3llL3y0OGUlVS32SmTlYmQScLFPidU3O4hyD3K
	uB999MQ73duYkGuTSU0Iutbv/+kY3aRjO9ugqpji4c3uWSX9H7MvwTYZVqgv13ySRqX53xgg++L
	mnsiypKYKTCWYWIBLz3tw9A/TMLw3ibstJf47fH5FDMIXP/QqinNgTfZYHVvzCna1k+rBaXyqvD
	xUuEhr6SNVaOZ4nIuO246jlJevK3YKmOXLeLhoLogGjhQC3j0ld7Z2KeD9R2BUqVcGA7rfxxvnl
	9OQo9S0QGWe3/bbUe5gMe
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr38262478eec.1.1795765703177;
        Thu, 26 Nov 2026 23:48:23 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:22 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:45 +0800
Subject: [PATCH v8 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
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
Message-Id: <20261127-dcphy-rx-v1-v8-9-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3591;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=wHYitdr9DGtZWdI+e6LvB71Er0urXzEmjuek2OzfqCA=;
 b=x0Eoz4Ybdy9c1XvKnjo/yqIl9hqyaAcBUU0jRw3PI7nE/mnUYSWZQHERZwCA7q+BJ+79/HpZd
 lElzx8f/wgEClUUQIs5L3e8ZodSwC3V6x4ufyRlZ8cSnMgr5Oku67mf
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

