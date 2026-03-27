Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82282242D62;
	Fri, 27 Mar 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774576696; cv=none; b=PQXoG05ZlJlgSXfBkfV/SBbPJ5/dpivvFXD6Lzq4EEh+VhMlqCOggGjVtlHHd0MQ2bzPi2zPOlYRI4SIYgMo9I90aQRM/+8B/ZBHxSCCx2FcvHahIwvCR4B+DH42Z45Ixds/CuSG7KW7XDN8evmsAmPUAo4vI/VqiFC6ysZhCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774576696; c=relaxed/simple;
	bh=zjsrYiyS5R3u3HNSn/zBZPIrCD0+6PLtVmbqWN2NWeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=fPWXEMYf/RQPGOSLauVLmiDrlEy/OcDc5W+gyBEHBZWr/vdW3UXhzdTZZ3w6kXsni+Gqj2Kvg4kgLpn1M5XB/EcHJQavaijiGykjZ13PflyN4PEzEdWuadjhy7W7RYvyOsUSbB5EQCiSAD40bXEdsnri8HJcQzQXbhl9c2z/ahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Mar
 2026 09:58:11 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 27 Mar 2026 09:58:11 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Fri, 27 Mar 2026 09:58:05 +0800
Subject: [PATCH] ARM: dts: aspeed: g6: Add missing uart nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIACzkxWkC/x3MSwqAMAwA0atI1ha0RSteRaRUjZqFH5JWBPHuF
 pdvMfOAIBMKtNkDjBcJHXtCmWcwrn5fUNGUDLrQdWG0VfGUwOg3t9RuCuKi56Bs46sRzaAbayC
 lJ+NM97/t+vf9AKJ8+8RmAAAA
X-Change-ID: 20260327-upstream_g6_dts_uart-78a5ce3b2873
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Jammy Huang
	<jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774576691; l=2359;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=zjsrYiyS5R3u3HNSn/zBZPIrCD0+6PLtVmbqWN2NWeQ=;
 b=7sG1WokGh6V3U460lJfPkX2JUl/SXsBpfuofApq8t65i0n+ASmk6qw5GnKxScpETF95CXWtN5
 R2AMlKXJAuiC7O7Am6yHahgpW3cCRyPCJYmMhrObBVCZ463dA3ngdvt
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=

Add nodes for uart10/11/12/13.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47..0ffe386fa9d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -835,6 +835,62 @@ uart9: serial@1e790300 {
 				status = "disabled";
 			};
 
+			uart10: serial@1e790400 {
+				compatible = "ns16550a";
+				reg = <0x1e790400 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART10CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart10_default>;
+
+				status = "disabled";
+			};
+
+			uart11: serial@1e790500 {
+				compatible = "ns16550a";
+				reg = <0x1e790500 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART11CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart11_default>;
+
+				status = "disabled";
+			};
+
+			uart12: serial@1e790600 {
+				compatible = "ns16550a";
+				reg = <0x1e790600 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART12CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart12g1_default>;
+
+				status = "disabled";
+			};
+
+			uart13: serial@1e790700 {
+				compatible = "ns16550a";
+				reg = <0x1e790700 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART13CLK>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_uart13g1_default>;
+
+				status = "disabled";
+			};
+
 			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;

---
base-commit: 5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
change-id: 20260327-upstream_g6_dts_uart-78a5ce3b2873

Best regards,
-- 
Jammy Huang <jammy_huang@aspeedtech.com>

