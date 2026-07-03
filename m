Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CF377550
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068378; cv=none; b=nIQoHWrgx1CRTPn9mANTBk6Fkq/mc9uczr0QCjOOILnpRZw/+iPQyC4Oz3S9hkLPvb05+apulj0MtRVhhb4bTdGlc/LPsaEG8V12BZzWjLhQOhVrKzChhEGbY1MiC7wIp402ytH7TSXkolbNHDe5yQhPDt7PUsnCYrQRvKr1U7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068378; c=relaxed/simple;
	bh=VRBW4GXddARzk520bbj1cGN4dyH9TW2+0tDM6/TIAcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjU56r49435HLShdFmOaJ3IQF+qwE9ndDNo8mjOK7YpFWsgFu8EdK2coSIB5n/Sb5WciJJzhbLcFhxjuTA9d8CWMYpCxiSiPAj4GP6THX6/94BKGKsEtv/KXYmAyVeUBtsweUoseGzECOckRiFmKztiUucMF+mWLJGWzoH9d8Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvxoKIDH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvxoKIDH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1796405e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068371; x=1783673171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8F9qiRLZL79jukVGQvDFnHMsBH+07ucBndobdY7s6jE=;
        b=SvxoKIDHA0y1C7d+skNiLNNH7wiPDAXkU5eFstpu9O3ioIh+jnWZHLxyjYVCceWoL1
         E0nKY8pDuWLyv9NSnMxnL+Op7SRAeScqI62ZLfYrjyjHHGQ7r104SZqe/SpYUlWTFO1p
         aVdRgwSDQ7Timr/ZLe+rEDnRWsDvvBHd/UFxhnHlsU5AFYxawq8KtNiwY7Os266/4QeO
         idpaAJ4vY2q2oPdxDlp0tuO0BTzyvQezniGnGyxsIqXvOlvG1TpWF3GB8bTBZWiwHMHX
         UtJ9FX4+bLwh7j0SsxiXgT/hnXN7kxG381ANco8W2r0nnL1oQRlhuBeWzFZRUf9vOwll
         Gx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068371; x=1783673171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8F9qiRLZL79jukVGQvDFnHMsBH+07ucBndobdY7s6jE=;
        b=k0GI4Wzh5UAN6oOc4HMMRdx3/bmWDuYvZ6vmhIVzkAMKog4kl3MgEZM3dTC10U2sU/
         r5pkNR2C8mmkAodSLXC7fkc4+WXYPoavuf3VY+qP6jeZ2jEj5SczAV+LsL/dzrLbOqOD
         dYshBtOzXHv8pxNF5m84/iRXMBZG9RHiaVDdWFkS0U0OUZ3E1Bzky/vLMKiilxPhBwhX
         s7arGCCoxY2wobniGIApqs9K5KJVXHHXSyfDQyAl2FN1bZ2TJxsUMTzFP4TTqil/Xb00
         v5eqifAw+hC5oA64RZV/QvKMarp8PQEOjKlNnmzAZvuAQZcW8J1oCb7HmFzAanTQVO9u
         U/5w==
X-Forwarded-Encrypted: i=1; AFNElJ+2tEnWCAfVaF9dU71v/y0tVoiwi2eEDsa3VMDJ4Q3CsHPqsgvU5e4Nscq+4RbqRrTBH0zGkhV82UG/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yRsWfMF5B7R2ZrYQpk0/2ccRCmVtEAud/t9gi18x5H4I+n8d
	AWGBbmh1aj6p7u6XmryK8+VU7MM/hMak552CobTxU6QNcvJdLa4CPwNE
X-Gm-Gg: AfdE7cmgFshy8xlPIuPSr/V2z+UxXxBpjHtyhTRIvrq7OHCjRn0QhbMgzgzbPWX9Wy/
	6RdiJYtIHKO/ko4XqTOqTXBRF5D8gEqtG0MvxFGVhFge2CvJmgaNu7+LHSu/DP6lJHH49ItMNwp
	cUPMGj7pcjU1En7JQnbxmtRI1BpJoFl3TbwFeFWD/pq0DlRldIRKZd8kQhWHoqSI4m+0Iwf9N7Y
	3Zw7f8UQxXNcIutew4qheqsUT/Tl4W8nhhHJ4Xe1N3Lsyvp/qPO0e1mLvgVsG5X+d37bKdnAkCw
	RcnDvyOkxEmyb+g0EAi8jLVtemaAZhA30vGCkpROVJgtpt0qdGtQNL+jlV3tc4TtVHz4dB66PzT
	4X//qBm1Fj/N8B39CBlacC+kbCQcEktcC0JO+xKler+c8EzJMhyB3n9ds6TrXiOZSSJqQ8/M9qo
	mS0tM2X7hzyw2xqdzBorWVZ1fOpUnujIDXB7iCkk2J1ONcpXze3qdiDGj6/qmjvfMh/WwjbmY7z
	beBRyGjDLoPNpM005g9E2S/gzIBu2JK0cFo
X-Received: by 2002:a05:600c:6986:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-493c2baca0cmr125928495e9.34.1783068370735;
        Fri, 03 Jul 2026 01:46:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:10 -0700 (PDT)
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
Subject: [PATCH v1 03/15] arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
Date: Fri,  3 Jul 2026 10:45:50 +0200
Message-ID: <4e401b619fa0a88ab89b5d1685b61c43a1802b1a.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
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

