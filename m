Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387E3A9DB3
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497458; cv=none; b=RDFv81Ke1EEEBu2MTQBXMW9b1N6yranSjRb1N4r5GegMFjwsY5maNClr46lsHiDZzDm/gYMzu8JxHS7WpMELJFUhyYrdgQReiNBR2VZkqk5ZgVYXuAwQMdj96mcExK0ZrdyYaVK0zP0MnSspiSPFkm5wUXQl2FOMfCnH0Jhh3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497458; c=relaxed/simple;
	bh=58vxLohvUEE0typs5e0KXlr/bKqVl4pPJo8aX4oeHFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGuPTGaYrJxkF71Qbq4/rbc1ChDtEPv5paQuHz1ZJ1YXWClNIhXYMaEI6jsRGjoF6DlYXMbAUT+sVwkCi0A7pAwxGrROFQ0evbExQ/rduDxhlT0oFKTdzqe1Hy3oiDQXHPtNbm+XVP3fltDT6rxPvnr+y07DOpa69FvINKqzzNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeqYa/bO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeqYa/bO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so12276275e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497455; x=1781102255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=;
        b=oeqYa/bOIf+Epiqmi6HuBHXALaa+fbt16JyEYl5fls1oixqRx6CHD6QfNRMUGYZ5fM
         1XUfXSpM815cp5hfnzDw0yf6N1ELbRQmpvoswRUNfIxDUhoYxRtqGoH2RKypD23sT+7p
         QKOdVziiMQk8xePpkx2Jv4EPrhL4deWzM+u3j5LIhHmeqZQbcV1Rb6Ulc3GCrfCax0xM
         RJTxiBTcOce5vsBgeUJRICS0wsAzjgTVSFT9W+s7LfuGM/WfbGq0Y056O8rTQyyqJ61M
         zx++Bj51triYLv+TCF4wIZMtxMUpEKweTLhwP7IfL44D0lL7uUqyD+UPqZTNY3KWdrfB
         EmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497455; x=1781102255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=;
        b=YVe5bDcXOaXCXeYbOrVg0VVggDB5tAEE8xYLCqYwNUwkubjjANe7P4he3aUHKeh9g2
         4PzWHzfnidxHx4ahzHoBpamuZVOlQxTCV3KLkNpcfVSWwJ3uDk6/Q6/g79w8E0Bc2kYh
         KftyuEfR4fntR77My/XhXXF2cT1XDHBiNw8fOpQkpwfN8FcAxd0e43VnDyrIJhSquHrp
         DQyHiRBVmAWVmc1W+U/eARMVWu4E1P1qZCsoOyHiNe8EPZqInaFLFJ7JZBXQnvd2cYdZ
         lmrfzzSlvqgE8GMlcR2DAv269jkhgGQu7Um+FocR2Kj+H4P1ZhdvmmLdkbA822es9CY0
         PIGw==
X-Forwarded-Encrypted: i=1; AFNElJ+9vp2ZaWwTN1a9f38I/ckJI9e5mvHukRIxNIfmaDN5Uh6pCREBcoeiT0f3aW24+xqq+jgfhM7AKi3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMByc1ZIfUYCr75Zc3DdB5VI7Zu/OePGtcveOxzjiU8o0Iws7
	03dPhuGiJYPR2vHcUyCNCO2v1SIHebouMDrmVXglBAD7tBZXqgneAfMo
X-Gm-Gg: Acq92OHF5n0h7DbhKVrFQaq/HlX2iqq2YpiRyw9tXLnU1cE4LaqdwtG92gvegFm8FzU
	LlnDXF1P9QUM/OFxIavS+kSra50AxudLe6wQPBxRylaJkFDojqT12G7VGCMroBaEyiWeBSwOBwZ
	Ew5JmXYjbpauN7Hn7Ln7B3AlkK/oEATuXuAEVgJmvj5kW5MtxOYT/QZrWEa+eLbX30qS/c02q5Z
	eoVqQPwYO1/2HMinhcA+t7c0knbKcg1ktJfqhIAw0oU3jKtiIuwvukAlBwnRZhgHfVsTSKyhatN
	d0orv/Hh21wKSojFCWQb2UJUHZi+CcYqmCt3ItjQPugWep8qKnJvgTp3iaopr8twwCksHzPUJSn
	zi/wsoqaYkp3Z69mzquaJ+uusOV/RhGdu0f+oPVLrZ8neoccmHPZmIQ3u5UtSBIHlNmwvE6rcD8
	rrGf0JgPdVnLs0BHebe12JBxgVS0SQhfRFUVW7g4BMahkKv8av6u7Kk1tr3C1EcFB5zAJ69LrVh
	bA2rBOOjvtO8s1oGiBgoIs6YYvludaRJovte2/2hSgJkil0
X-Received: by 2002:a05:600c:3490:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490b5eae2c2mr58556025e9.13.1780497454747;
        Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
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
Subject: [PATCH v3 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 16:37:15 +0200
Message-ID: <5c79f633cbc4606ccaa962bf7f3f92bbfe6b522b.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f7eebf265fab..93098799211b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

