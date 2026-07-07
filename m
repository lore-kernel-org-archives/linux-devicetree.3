Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994338E8BE;
	Tue,  7 Jul 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417866; cv=none; b=KQ7H6NStCDvKa8Q/vnAgJVFUVhcLRMHBzUKXNfune5woqpmyFX0hdx5pftdGvlXKYVuGDeC/BwTOYF/t8+3HjuNkwkWg/NGUcIQbWC1uedlK0gwsMPyU3HGKvdx4QOI2mRdL7vKGLzbXbPRDcvJLpsnq/0FwDyc6gKd54L5X2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417866; c=relaxed/simple;
	bh=RYH6aQZ3AHFKTLYeKZONOg9X8p4e+rHG21t/zX1wmZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ms4YiAQqf0buKtxKC4h5SWx5DlHZKDc0LYw3RN0Djm3Y6R+IfJ+C/SaCxE5n6/XHFpL403hrNMmcoi1H1NSJqOioowA69exxofWNNp+ff3x256mZXR75IoYi+Lsj8diqAdXRdDfFicIGeuY8+odUP/CGXtZ7NKPcl/XD8Vp31/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=He5dCxqh; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="He5dCxqh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Am0NLocsWvONNqEB/DzW4Db9kldaVkSiNfu4dGHoSWg=; b=He5dCxqhjlUXTlaQBa+4Pc+XvC
	TOgp486rZa2jnRW/r0cB/iGt+pFsZUdxW2Mdzp9rjZPLAqe7Jgk+QQdyPs4Vk9pZOOIJ0xQZvwCTK
	WQrCySH0bxJvvI+B5a32cNpE34HhSHDhSwb5NwT4HTcELzKyoliuqeQj5vJewsUU+5PSeEAKKH5eX
	gJRYZLCKNbAHCkW/XE1BY7rDYH10YnBrlQKGupwDNDbpm8tNwRWGbQ+3yua1Cz0fTbMjUz8wNsETl
	dzzQ0iofS20UCIv7wFyOBNaCNBE2hXSCW+QFarqUu9UT+TD4fxEQKlEh57nqU651QvfeLd9oaAOi9
	fUSf8cYg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000PWj-3B;
	Tue, 07 Jul 2026 11:51:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000Ck1-1A;
	Tue, 07 Jul 2026 11:51:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY reset GPIOs
Date: Tue,  7 Jul 2026 11:50:53 +0200
Message-ID: <20260707095057.1745867-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Correctly describe the PHY resets.

While the TI DP83867 requires only a 1us reset pulse in RGMII mode, 2.5ms
are needed for SGMII, where series capacitors would result in incorrect
sampling of strap pins if they don't have enough time to discharge.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index 46a9fdc92bb56..687fd0d62235d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -106,36 +106,59 @@ &dpmac18 {
 	phy-connection-type = "rgmii-id";
 };
 
+/*
+ * Assert reset for 2.5ms on SGMII PHYs to let capacitors discharge before
+ * strap pin sampling
+ */
+
 &emdio1 {
 	status = "okay";
 
 	dp83867_1_1: ethernet-phy@1 {
 		reg = <1>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 1 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_2: ethernet-phy@2 {
 		reg = <2>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 2 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_3: ethernet-phy@3 {
 		reg = <3>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 3 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_4: ethernet-phy@4 {
 		reg = <4>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 4 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_5: ethernet-phy@5 {
 		reg = <5>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 5 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_1_6: ethernet-phy@6 {
 		reg = <6>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 6 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 };
@@ -145,16 +168,25 @@ &emdio2 {
 
 	dp83867_2_1: ethernet-phy@1 {
 		reg = <1>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 7 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_2_2: ethernet-phy@2 {
 		reg = <2>;
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 8 GPIO_ACTIVE_LOW>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 	};
 
 	dp83867_2_3: ethernet-phy@3 {
 		reg = <3>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 9 GPIO_ACTIVE_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
@@ -162,6 +194,9 @@ dp83867_2_3: ethernet-phy@3 {
 
 	dp83867_2_4: ethernet-phy@4 {
 		reg = <4>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		reset-gpios = <&gpioex1 10 GPIO_ACTIVE_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
-- 
2.54.0

