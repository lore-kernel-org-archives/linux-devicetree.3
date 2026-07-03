Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEB3815FA
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068382; cv=none; b=qXgs5bfXIEdsLAkgtkpUNHuiwbHXh7ZomdN0jwJLTXA2sYcUX2V0kS6x3QHxL/Xd8DXNp8wotoKkXKsb7icqZfm5Laffwv38t6v2/70HNBtLyzngbZsi7A18E4p0Dr/JfZoZuZi5iJHY+RT/2LVXab0WXCiOYxLXF3lSM4fKhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068382; c=relaxed/simple;
	bh=aZs/1nV4qk4ZnSM6LmclRKUh04L1ajGC61MnDb2DOY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3rq0CQGT+k4t7bj1aWxxfDiLYhWbmWuNZtiq7X/LctkZYy8H7RG4ROkeMU8i+tw5MWzMi2J3Ct2kFzpOPmY7i9M6XqHDLBWZIJnkGFMZWxv3OofaVnP6n1wKZXn5guwf4poDMJ+L/Fpyq4rn7dhWc7pDfHBlKigcYhJH0yMRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaU+0mk+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaU+0mk+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so2386215e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068378; x=1783673178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=;
        b=YaU+0mk+Fb7oeeHGlkZrZ1EIEGoX2PcQM/xN1rFGMWSv2Y5PGWSA4HLTnLBtGqUu9Y
         f7zjq1glBQJfGsAFsgUPvRCqfkihB53d6PlRVD7YUPbGoYMrgx42O9eBUnjxoiatpcnP
         7czjdB0eoGjaWH9Kue7iXImJQtrk4ltaMwPnpPJ6KMJydPiDEwJHvDFRaV416q1oqd+n
         3zg1LiGJ5lFE7LYZvvuYuZBsOnFYpz9akTbZWbVJommHUZe1mE0GZzPSA462c2lMo4sF
         I5pyxJY9qQ260zxSrS5AT9qaHF9CMfB3c/59VKbsJ/WJc4FOkNLmWBoQAkDPHV0ScT/Y
         CaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068378; x=1783673178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=;
        b=ZU7HnA6s3uxSEZ69L/UrmRzj4TMTSLVBd28D2RKo7vcvGwyqhBMvk4W+WbYLeJTaUo
         LNmeFjgMwNw5jRyDhio47nodQKgDGDL6+M0oxjpryk4jCB6jGmq52uXvGYNtDMSd/VQi
         zu0AUJdJLlwR8eytkvQDlBChGct68akXA7CMx7pxVVOhkn2mzDuRvNog/6hBIkmBwndq
         M3LidfXrATwzpqB40WHBM4UmsJLK4JEFGZDew9M9JbxMkzB43NyiO8XtqgFFoQGp+O6H
         Ltdv3CjJdeXZsNaBgYRJHIPMgH1oYITcu8EDtxa0lP5OIhiNac9i63g0IDPqK1qs4oHN
         I2EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Y0+XRcDGEtJ+hhM7khXLerY2CSezV2q9VS/lfd8jHjvjwA9BNfLU05Ttx0FZS+lUB/wPZPJ/c81SV@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7VVJjbPW6JJT2ZHGBK7NcjsTloLGkst27pmsL28bzzCVAMnB
	lPXvMtwl+0yMN3OFv9Hl5KS79+lTf8+iD8H/q8ngoGdqDepeET2tn5Fv
X-Gm-Gg: AfdE7ckVTnbm64iJVBgB3OPaXv4I+caSVCmC1oEyRBZyZGKwCtke3eC5uP2PSDhgFHJ
	HfK6oBXoDX3nChkrs5XukyRB+7bRoCXIbZXNQjBSryCDnFEJMD45wAfyO4h/u3bJjiYdjdhg27Q
	iJGFEenrngtLdW13D+gvxY3sAXsV2HveFq3ht72lRgaUCOPozSLHtwAKbEJTPae+aSsL5lAVfj5
	LpgangzwBBA/oAknupqZCWTdWlmgixQ8xREWft/rCA6lZexlocySwNkz/oCGNirLmHonkSMfVtJ
	/jGfM4wlzvtN3tbuBtgxEotanlZ6azTV8DjIv9W6Q7/Bw1wfkq+Gs+9YUmUMwgUpCrIEyd+BdVM
	BtXpAiUjiJIU1JfV3QY78CLfsVMryigAwUnq4OUdVpQG3C6RYaYk3pH4IAgZd2kPlUoVxFRGX0U
	bzyBgxNbN3sOcshfB2i6q9+1W4T7ihb/kc+o7MJeQjETy2b2EFw8IcBoY6zclhEWo6Z2+CDLBHV
	3Kx7dMKGCiX9QRyDO551/mGPQ==
X-Received: by 2002:a05:600c:c2:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493c3cd9c2dmr74057675e9.12.1783068377769;
        Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
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
Subject: [PATCH v1 09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
Date: Fri,  3 Jul 2026 10:45:56 +0200
Message-ID: <858f10730612e0225b69257eef833c3b84052ded.1783067947.git.stefano.r@variscite.com>
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

Enable the FlexSPI controller on the VAR-SOM-MX8MN and add the
corresponding pin multiplexing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 0abc2d33e711..259d9f36f8a3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
 	};
 };
 
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -456,6 +462,17 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 		>;
 	};
 
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x1c4
+			MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x84
+			MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x84
+			MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x84
+			MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x84
+			MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x84
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3

