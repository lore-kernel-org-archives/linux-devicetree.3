Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D644CF25;
	Tue, 11 Aug 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464264; cv=none; b=UAkRHnY0T2zC9utWV9qSmRsGgu0evQmAqs6L/31lUpBV1Q4N144PTWiCmziwSDbdsJ0+qdpS05SvfrccsO0U4fFOtE47w+UHuz6Ngw3OUNC6XfY3tjmxtH9vZa1z2iIQa6R9ZU+KelvnPbtsxP4be5Mdf1YlJzhR7kFq4412FD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464264; c=relaxed/simple;
	bh=FqFbK4KpdGlkNZietP69oqW51qLSXbPgbYrtUFNu9Zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=foC94y0IFEjXDSOy5r5Abmw8h+PB5IQoFyxNQ+GLjYWgvgEuJjKBgQVsn3dWmUNpG+TIqypSzjkS/sminbMr+NpSIBTKIA4PBiG++wFHCmR/FWY1SPOEtULRb1HTMDFhzSehfcy8z3lNLoeeql6kRHlCk5rEAoVWiKjupbjCOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xr9xb9zr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sQQQuvQU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xr9xb9zr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sQQQuvQU"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptgbg2rZaEsTjE9dLT79mTbDs0W/jNl0+5wzhjip51A=;
	b=xr9xb9zrTfHNTZeaj5MGgn0tyThqOx/RCSoZjSPSlo+Akg052DnNmPKATeCfNOpEi4NC/g
	tgWDU1S1bj0UjWRZ7OjUUUqW6RFleBxAkcQ0fqp7whUsEtnc7AukvaoKPqwZOamFonig8X
	2XbN91ii3ZbKtj7yTlq4AWkGGuNeeeWJIdnHb0j23UInf9bJEs3t7FHNusHTNFuF3/8Da+
	RiCjCHbcklMj0+x1HjIm3zucOLhMda4cwgaB0mmdGArYG/2uv0IUn4gF9GDKYmAqlZ5/rp
	KSzFUqsBjiInWkONZJtM2pCLSowCFQ5y36pb30Q+RCPayWtT6nK+2HqDIIzWUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptgbg2rZaEsTjE9dLT79mTbDs0W/jNl0+5wzhjip51A=;
	b=sQQQuvQU9bqBEBvfQzlakrKZ4HGiHWQSxamvy/zoJeVhMQg94uiIWrED98Jc68Lg3cURoT
	OW2PNlF+zkr19KCg==
Date: Tue, 11 Aug 2026 18:04:15 +0200
Subject: [PATCH 1/2] arm64: dts: broadcom: rp1: add spi controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bcm2712-spi-v1-1-4c1708d354bb@linutronix.de>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
In-Reply-To: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464260; l=3713;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=FqFbK4KpdGlkNZietP69oqW51qLSXbPgbYrtUFNu9Zo=;
 b=JELCilY3swOAHdx7HexxZOuK/fCO0wHMs3FrfqCULObgSSNNgd2xg9JpLyQIk3ivCmKrkrIjr
 llMGKllo2GiDf6g0pCso0s04+i/PtetnpQ1b+/RAFarzSvCup5xFjUt
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The rp1 processor found on the Raspberry Pi 5 has nine Synchronous
Serial Interfaces.

Add the relevant nodes to the devicetree.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 119 +++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..8d9de71efdba9 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -26,6 +26,125 @@ rp1_clocks: clocks@40018000 {
 				       <200000000>;  // RP1_CLK_SYS
 	};
 
+	rp1_spi8: spi@4004c000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x4004c000  0x0 0x130>;
+		interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi0: spi@40050000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40050000  0x0 0x130>;
+		interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <4>;
+
+		status = "disabled";
+	};
+
+	rp1_spi1: spi@40054000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40054000  0x0 0x130>;
+		interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <3>;
+
+		status = "disabled";
+	};
+
+	rp1_spi2: spi@40058000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40058000  0x0 0x130>;
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi3: spi@4005c000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x4005c000  0x0 0x130>;
+		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi4: spi@40060000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40060000  0x0 0x130>;
+		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <0>;
+		#size-cells = <0>;
+		num-cs = <1>;
+		spi-slave;
+
+		status = "disabled";
+	};
+
+	rp1_spi5: spi@40064000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40064000  0x0 0x130>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi6: spi@40068000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40068000  0x0 0x130>;
+		interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <3>;
+
+		status = "disabled";
+	};
+
+	rp1_spi7: spi@4006c000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x4006c000  0x0 0x130>;
+		interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <0>;
+		#size-cells = <0>;
+		num-cs = <1>;
+		spi-slave;
+
+		status = "disabled";
+	};
+
 	rp1_i2c0: i2c@40070000 {
 		compatible = "snps,designware-i2c";
 		reg = <0x0 0x40070000  0x0 0x1000>;

-- 
2.47.3

