Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517240D596
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330500; cv=none; b=gKKaKgGOo01QNLfvrxeQRSa1171mzjjAjv+Z58BqAu1J9YtNj1H1ErtQXv+GZxOoWpCQS0bJWpH0zAPnRdiyjlkH99c2uywLmVQz7ZgdlHPI13c7sh+36sXU2NFjM+FIEqK3DYxEitdzs+m3krcKjHR3UYFQm+CK0Up6Vx6c8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330500; c=relaxed/simple;
	bh=GU5/RnoVzHwfSUp/xzhJzCSq1LZpr2g40/YZZ3wwEY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArT2JdJ0OW9aFku1yHVvvSsfxamTKy3aGDnWa5x326xpDUziSeOYF2xe9T2dijtdpEy54opAhRwXeLyAuOU1nL6TICVYaU12oq00Vqdhwg5s7j40arQXIFVf5RTPel8ETWKfPb96OyOShXZuNUIzW1gZWgYN5PUICWIRD/9jwis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE2O6Urj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE2O6Urj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so18840465e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330494; x=1783935294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=;
        b=lE2O6UrjPwO+JycFUP8lTQ+lKrfxaGqo2of4Vr6sy0td/Orxg28fm0ndUupOEoxkaQ
         vPD5A3mF83OjcP8bZYvB68hd+8+QEx5vd/elO/PvKu+e0Vq1db4n0VM8gDu1O8mK+a4j
         9BFBY4akSNY38XY9GS6ff93DlpaFVdtWxtb0oie2K2/szKLPLTqquUr25nTObYiHAN5A
         ca2UYGdTjwRL0JAATcaLja3pXhobOkJEUrXZQOBlO5Y2gvWX49bSEeBWyywagGl2abK+
         phT6DaRDQ3zVOzkl1KdhhCFzgGMKWtYWijcepl8MIA0y3JhBapxC/anR60k4SthDuQPb
         S/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330494; x=1783935294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=;
        b=DdBAzbFCtqDHnow7nZfK9Ahh3Sy51VwuzAS/3FhTugXPWiU8+grxKSx3LmCZp+rXdr
         xiyx5JVZjkfW3vqGY/XXI+zjuUdo8TTeHsFr8SmE/dS6U51bvnmEVQE/YVAWwRPeuwdB
         Z9GXPWuIQDpFsQw31pdskvyFL7xchR90UYWBB4lntaLm/dsoky+nttIkQu0On24Uai6Q
         FFNzVWUaytn0jS6TiiEyvfvCZoILRHqyJ0kq85UL2fffTsz7gIWkEj1XbL9rAFy4gcHj
         gaqi/NWHd92SuiJUH0ijEfVpKtJR4wQ3Zul+x+d3x5poe27Mwj0x/iVcRFon26CUlH3g
         gXEw==
X-Forwarded-Encrypted: i=1; AHgh+Roo7zRqFIgr4ez7HKtA4qX3G0qcMZklrQ2phXW3yQ42Zf56xqkmeDXymU/GKg12khSNduy7cwYpX4FV@vger.kernel.org
X-Gm-Message-State: AOJu0YxjzoUCPCdA/wS0tQ8ZbwLztxlHLQ0jrbegZnSVsmA9gorv4wGU
	5lalCnYHIIsAy+iwpfoEQ6A0RLPsOl2I6tvPA1d4RvsF2BdVfyKLbXrz
X-Gm-Gg: AfdE7ckHPJfuNLWLJliFj/dVitX3vzs/dOjAtHT1a9gKg4RqmnXA9SBlqJi37NRxs58
	EWxsSs06pg6f8W1nds5uNFBFpWgFn2qMm4nPStuugeYyNfXf1z808eMDBepNngYFDSDoz/lZ/7G
	RlVgWuAg7mm3zF7AgvkDFGHEibzQ9ryjBIS0ULNDcgSnBGZKe1nfDM+HdqYKdLtvb7JlARc1wUP
	duC+DKHyCru07dmB7kJGkRXu67FPrlMFcfHIQ3aAfrVVlbc9w3a73m+umLN4F7kaHicSGOYhXwq
	9tdLGlp3LHPVFWXEJBK6CQB6DoFgzF80Km3KlzaK2DAMxXPLryWjcIisLPVOzETWCoBjJH4aiwt
	mK2l7L7karw9QGIGOiMt1Q6fyhdi6Nq57SXLF0b+Z0/UJQ6RG+wXSTxQeBHNDaiOHHfE9P7Kmqi
	1ew0xELvzf/Yhg3h8/iNEukOAYjJIj2RW7yJ7EHZHBmKwbgrNLVooF0qHPHmT4RVlAQhJWfBv3Y
	NVcG7TNSVrIQpW2dhw7d8wnJw==
X-Received: by 2002:a05:600c:35ce:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-493d2396eccmr114312345e9.21.1783330494156;
        Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 03/15] arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
Date: Mon,  6 Jul 2026 11:34:33 +0200
Message-ID: <bebc3185b37c48d6a6a2cf3e09d02751c77a2cd5.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Reformat the fsl,pins tables in the i.MX8MN VAR-SOM device tree to use
consistent column alignment across all pinctrl groups.

Align the entries to match the formatting already used in the
pinctrl_fec1 group, which contains the longest pin definitions,
for improved readability and consistency.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 126 +++++++++---------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e1d2e2a72e1f..71a2f0866822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -368,129 +368,129 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x141
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
 		>;
 	};
 
 	pinctrl_reg_eth_phy: regethphygrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x41
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41
 		>;
 	};
 
 	pinctrl_restouch: restouchgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x1c0
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX	0x140
-			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX	0x140
-			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B	0x140
-			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
+			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
+			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x140
+			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x140
+			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x140
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d4
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d4
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d4
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d4
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d6
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d6
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d6
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
 		>;
 	};
 
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
 };
-- 
2.47.3

