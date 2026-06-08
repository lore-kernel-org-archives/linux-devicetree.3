Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF43C4B71
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913387; cv=none; b=pmTH+nTz9Y16Ul8dZ+odfk+YdBfetA8Vz9zpDzdE0PGup+ZTewPfKZq6ma6hULXy+QpIq4+pi4kIJfy6HNnnPvcRvlT2a1t9bU37hH4+9N8BpkRIFkQFFMu0ck5d+dfrMcmpH3g8cvR1hUBEuD9WGXEbcAixOalUB2aeqOJMG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913387; c=relaxed/simple;
	bh=bx8iNwIPqJAsdhHleFFlqYoEusm+OxMl/JHwtRXHV2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyYL385bKyC59hvPXzcqznaKANePCsM5o7U687Ea3G98bCf09jxKPCAQ7PhREZ/P0NjW14fCzOYv3gvRyILnoO+qy2CiMnmaBQ+Ea240vxuiAkXCGxfXVpy9P3zYWt2bQIse1U9RZF4C+4mU0DMMOU/UWJgiL3sv3VBngnzaMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4BICkXH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4BICkXH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso33268085e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913384; x=1781518184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=;
        b=F4BICkXHttWS949gUIl8qHDp7rIsP4EvatHIht0g1Tiza4EZs0Eg/5IwDE4YOFO7rx
         GYIXthJLdtO4Ud8uxRRdc9b8tcI07rC4y5qjADLDmUmyI0q8MZsHJp+S/x83Ml++GGwW
         1BhW+PjtP5uFtt6yUfhkYHyBzop4mfnAJiLH8GmlRD9FFVq0YnSXGuMwvLIr4+OVqOPC
         FreUJwEpB8u9ARaDz+1RWGNGmqbS7Ta5JKs90wesqIc7Aa77S1263tRtmXMpJTQDo3G9
         HRWhRUpCpu++ZV1RjyQmal2Ay+WP3nuR49zv4FB47RmXgmD3sOHjJl3QaXd9a6aUtOcz
         l5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913384; x=1781518184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=;
        b=NZrXJujgd6uxuLKUMOfG0tWjBCX0+q3QbGiKlCNF7IQawsKMi9W5cdP6uNrg9F8Q6u
         0GojH0cKEnAH6Ai2UMKT1PCDfQuahzvtAvsvUgVl2Qb6E81GLnGV2SBEFixG/tnmSDIv
         Q+n7h80CaM7gnqsVuep5noN8RQ3ZV/w/G8QAmJCO7jm3SBnL5kfhEwpCr83bK+J+fbYH
         6WTp6UPGpCcnyLG7bIbhXiERn0p3qeQyp1NNiPmeeLfxx4+r8S5eB2X43WUB2qb2FMwA
         P6I+iNv5cGNwZhGMiwLYmfKmJjU1ZcGigJRFjlgR4xthPbjUWIrEIP1mTeX02S8PWu5s
         Ye1w==
X-Forwarded-Encrypted: i=1; AFNElJ8d6/CCRRHNPrse+Jm66cWp4uvOIjKQjaMpuSkloKw3u7RoT1aeS9q/30yGAqPKaypOWOg1X7ae5a7A@vger.kernel.org
X-Gm-Message-State: AOJu0YzFldXYubv5zRPR2dg+m92c6IkLql3PHL60Ly7NYucimrEwnSEM
	5jm/ho6fK9zX8lnzAen5ZlYPZC/At17Q3BvwLfiIti8IZud31fYTiJYD
X-Gm-Gg: Acq92OH4sia0k1LG/oWZXcRDZbteG8iJVmjy6RL7a2FTGxLT44mFNP8U8K4K93B6ufF
	KlGHV4vlvwskMS4WMGko5m2RZJXhdVosbJlOv/FoZ69qQTUmVlH5N8rOUkAZll+T3AWzFVhT2Al
	7ruQPwSNTJrJZ79cqIlUdN2E4Og1gPBlrQbx5XqeCefNPxnHK/RUNKi9Dw8Bhz/0spFJ+QShxOT
	5fj2UlTYBX83ZQxaw+HJlEmOoyf5HYOPs30SLX5O9M156+iNqyvIAK3Cvlyr6QkR8SqjcPx++LN
	2G8nf8PwhE2NTFhwg/9CgSrqMXTnRFuM7LD0xgC9V+HbLz2T0v1TGAhxtXVcuI0YgbWeh3Aw6js
	lo5vVpLfpT0Bly8CXlGsgxD95ceZxd9YX659cTrThmxyIgw1toRagbCVLfF75LdSeQeyheastJ7
	idGHNZdy0wWGK/Y2Y9NzX1AwwYD+fP/YYCtYeQsUF+wuBajJNLQKghTkxKHOexhhP+yoEVKF8ks
	02No+/DOVIhQEnCRfqc08jxVZJFQXAJve5kYQV6xjqUk3oz
X-Received: by 2002:a05:600c:4e47:b0:490:9bc2:bf8b with SMTP id 5b1f17b1804b1-490c25acd68mr249144475e9.5.1780913383529;
        Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Mon,  8 Jun 2026 12:09:24 +0200
Message-ID: <46f059124fc039b83ff3b8d9efb2fe3da55dc7ac.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add pcie reset-gpios instead of deprecated one

v2->v3:
 - 

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 34a956c98635..a2becf5409cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

