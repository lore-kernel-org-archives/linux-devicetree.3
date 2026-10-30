Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378164;
	b=SKFVLE9UpCasoSUisYjjbRCF1a5O/rPXTHbFSyt8Sx576Tgl4BK7WCksz7q1TtXufbpn
	 87ml6tkBoYZORJFj22m2i7ObN/9Tfiofll6fbgVx2DPajBvBaJToWMtXOb/cdzNrrsLOz
	 5W5WqubuhG8vCTNKNlqNcxKmKHGBvmad9FY0BsebUMLkiCNlb6aoaIF+W9ZJTL/X5xYZg
	 l6FCFildr/VgUWD4A3vOTYc3CqApwKxHlZTFhDDSZn4f6CJXYU7gKScXsIDqdaiPGPtdt
	 qaloPPMwNBEb84MDZZ24eglHvG3hRLAMrJmGnuYEkcGDDHmMwdWWx/SVLIitKppnuuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
	b=AM4UaLSEoXNat2Zb1IDMgA+UXkWQKqUuDcaeskKnjTuBw7v5/KYkpk/OMhdgs8HXj84T
	 RBwzkpjqnd8CdRbCM/YcEM8E8+2wWOTX9K4mum5lXb25SwYIjLza4uRYsvRu3Vadlro0A
	 sdrFJCJHuVE5TJL44y44QJgtkGf54RZExDEWNmM8NZs7rXSpSNzvO/ya/ISEFWMIRlsVM
	 y49uyUJr3vgZi5BjrGy3UMU2nos3rWGy77QhMw1Uc844QAUHlzMFRrqaYv0ChJaBNWFj8
	 kUOlraMrp7BI2lFzAGxW2p0mQ7ROLrIF/l9D7JfP6xLDF1CDcX1V53yjqi1M6z2jW4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=EwtEwBh3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2CB606A330
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2CB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=EwtEwBh3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5752165e9.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378157; x=1793982957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=EwtEwBh3l0LsMt3xAg2MLjTmnzz5m6FBqaOzEgePXYlVcoS8x40gmSYXRk/336EiUZ
         TDt9Ib2mMGMtIqbsJU/H10Oa9RV417jWYShhe1cbp1daQAu45qaYrlMwmGzHlHBGRfV4
         4ZoHdlI2HJOoOgjBQn6G6Ma/pqjUH5ydA4i5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378157; x=1793982957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=LSjOsuU5wAKp3G5StvfO7jXSm4KGGcN7K7XpbzJgVOzrI4h++iQPt61keOcLRNNOgw
         1WlYH8d1wDNW6SrBQLn2+9XZQx5GIiRJfRcP4o8Jy+Y7J/SQcgECA9MUIWHJtYjrLUyM
         1h/BoQqAXfjPPiMu07vkyOKlM/+256Bplvup0mjz9gRCdv7aLJIcIC2E13MVuw7ziOdH
         RrE9oNLZmoOMr2IPOeE20NOdd2X+lSH9qweo/tG65H6hqyEzdt4fParGAqPpr7x42R6W
         2U2o3H5zVotWZaEx8+JX7Tn+e/H11Ico2l7RIhW2c2UqJryTYZz5WGJf47lEkbZjB9si
         dRzQ==
X-Forwarded-Encrypted: i=1; AKwUvByhsaVZI+vbmpAkfG9+dc5UqyJ2ZtjVrM8ZcxLesfmEXu7IQpVZk4YLL4xbVGG+LqMNfQxNS++GVMYI@vger.kernel.org
X-Gm-Message-State: AFq9FYJCg2e7iNsQzqPipyc/KzUey29LiKK8QYt0JtpSF7aRumN5j+jt
	n69wufi/3o6JyamkV17PR2606+bZ5CYtnEbigDhwIRqGs/CHr1ejJ6TCxYqlA0LJv+gSL2EosIG
	hSslc
X-Gm-Gg: AYBFou1ciwJrqXllfVmUC/uBjwjeOLXNb+VveDMjuw+3fQ8gb1KEpOkZiGGf/J2mcwx
	Z8J3FLaUMghgncVRA1+o+spxKFBjJWABwGKvkBCaX6IpsEkoNm8SbTvGShUIydVQ46L9H0PiImY
	J9cD23EbRYAnrQKzWn15Uk+fP38Qe/rJtEeUTz7BsD7HdiQzNQjMRHc0AnouapHbpEATAzp+dbO
	+A2aelWx8YR7q2MF/Q8/r8+MtBNNebvPAlYysN95vI7WqEeT9Y3kemLr1Spfw93kAaOCN4nbwQI
	5IqzQG6Ilmo4dpVq3PP1v5b0KDG+SIh1PW+kJCg95bOMzfja+b1RleAPI5ZBjFLYze5zqi8KXTY
	RdL+cX4UI7rRf6kT9SrWq7q3b5L4WxsWm+ZbDRVmClGyyXFK/597IQ8TGPYqr3knwP+CjklnVCF
	Oatn1sLd6Q4hlp/tL87dc7RDyW+suZry5Y1AXs8UcHvzcjvKDVd//IRGIcdE9CeVJjlsN4s0FaR
	UwftoX1F75dgK2lyYeDetb9i2wB0PRxFcyD7w1kwj12mFGk0VsUw883dr93W5MHAKxtWhgfkPK/
	ZQsnKYXRyrWPimYipib8+Rf2kB2MtWlqIuDvOpw8X1sR8jFFsC2Fq3K0risurx89pxEYva4fSqL
	8j8M/Li2KIPZiGYFgKKQypEn0IJFjcdFf7Yd/1DuuR41fKWZvCS8Qu8NzKjjveWP9MA/uOO1noO
	fw/fRdKUxkYNrBFgAkka27tLEv3A==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr63214265e9.0.1793378157371;
        Fri, 30 Oct 2026 09:35:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
Date: Fri, 30 Oct 2026 17:35:42 +0100
Message-ID: <20261030163547.2682583-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Support Engicam i.Core MX8M Plus Fast Ethernet SoM, a variant of the
i.Core MX8M Plus SoM which embeds a SMSC LAN8710 10/100 Ethernet PHY
connected to the EQOS controller in RMII mode.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
new file mode 100644
index 000000000000..1341de0ba4b5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+#include "imx8mp-icore-mx8mp.dtsi"
+
+/ {
+	compatible = "engicam,icore-mx8mp-fe", "fsl,imx8mp";
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rmii";
+	snps,force_thresh_dma_mode;
+	snps,rmii_refclk_ext;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {	/* SMSC LAN8710 */
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy0>;
+			reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500>;
+			reset-deassert-us = <500>;
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x3
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x12
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12
+			/* RMII reference clock input, provided by the SoM */
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x12
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x1d0
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER				0x91
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x1d0
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x1d0
+		>;
+	};
+
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_RD3__GPIO1_IO29	0x16
+		>;
+	};
+};
-- 
2.43.0

