Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5503D7D77
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929694; cv=none; b=sowSwgG5tuRW/LUhi/0c9F/TkMKn13+BgA1xsmCLNRcCWae3ry5rzF1GkXPBMykNiuqhm2uS79jUsDP3Htkslulb5TbkHiVRC831M2VpOCI//IEkt6VkCXsw0wG6Lh2mFY/NtAalwlFKTftv2B6+LUwgXW9mcoMC/2nA9x4+gFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929694; c=relaxed/simple;
	bh=MkKtOKSAFSfH3HpuvW02i0uEm9hF7g1DUQA7Q9AMED0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3lgBXS5lukFAGRyd4fNo1a1PkV25LvibPLCHLD+Yfmx3d4uw23XjDGd2wBzjYC/dG9BTqq13H0JVW3S712hkJrcG5MkCkY5TwjM1X4oWoZkpJmX3VHxCX3vUu3D+G0zqLBAM7iS1YIr3VFx/GZJAapGeaRqoff7kjcRPJi7Aw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCVGYqhB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCVGYqhB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3341462f8f.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929692; x=1781534492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=;
        b=LCVGYqhB/JfxyydFtF12BPdtIT++vBAVJ+oVkvO4aFtGPxV+JkXhnza9KpGMpWG6gs
         UvntBMm8PhUfeDa41dTWkRzRF6DqY437VAUyCnPq29XY1ehaBwDWP71kRii1a/kcxU5i
         4vEmEyJGjS58aQa4eDmA3dr4BYV46Qts1IMIX0kNlmlBCex/JR45f3GfZxMeQXA/LrQL
         7/maslYM1du/X1e3gI3mb2+B6PQCj/wraQRVENKVGgAw8SwHuCJMl63z5dw2EF0LJNLZ
         itN3R/zl2z1MLxz7yZYjb8N1EbrjPP0ytzH4CK7iqBjxYG8it2r/m6HnMsmOozqYM7g8
         i5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929692; x=1781534492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=;
        b=XcQL2LvoNa2zdjX/4+7C0X885en9h3dul0PFaFWuXLf9MicUIm2scnJ4YsyTB4GW08
         LTazJNgvt3YiqQ0rVGSps/V38nATx0uI2Lgte6CZEf8ROaIyHVXs/yPBJy7NMLeg4Bw6
         Pj3RVs2Qkvg03NRD2gC6KqOWHK/jx5y77HnwQqoHGdwmXMmRE2AeJHfA/4GkCBQYK+So
         88Oj3FaE+Gq9ghoIAeVDdMo91WR21tmhlUCdsJ6HO+DHUSpNbzl1NQVbN5KLJqL1Rt+g
         9m+Zam0Out4RUGCirG7zeWJDEGeDbElnRqIM5e+fjgzmYO036iDVxbS12Ef61e+kFfag
         O6YA==
X-Forwarded-Encrypted: i=1; AFNElJ8XAHu10ErWzXxScKJaX3slUuE/QLK1ccR++kXmmWiVRDnB6Vm9m+waAafvnNfzQlrYaCvqwYwDjANW@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuGZavgkoh/o5WIpAnQMwXliTuFql0V0x24fwAu/0HOs2ki4D
	rdQ6dQYDEDIx4Zhb7dgNi7R95JaPJnsq+y9+jv9xIfAzLL0JxIOR0+yG
X-Gm-Gg: Acq92OHcNNTTfypdOaT8S8cxz/YSkJvtaJPmbneJwFnImMUm+SbUh8+AKOjFNerwG+b
	/Us69yQK0Mia2wPyUeaG9BqNXx+bLFCeTy/NRySZrwmdqPWI6aNrXdb6XIzZLH3RdKvBfG5WlQz
	JEX2CvFqg3tRMueNzMZ/P/EVAXEHviCSqyfj31JoxLd9TfofkZaj9JyO4YF7+o3+bb57ti27Ong
	McekF1a/jWEJckuQJtoi62A+NoK7+j+eQrHgLqJ1TWAxHb+9MR5YL4J137AJeaJ8hRrU6zXREw0
	3kb+5J1q6e0b4KfHX/hS/xkWl5cVaK5I+21rXfeucr0pB8JnrAQzSYP2PMKv9vQ971qgQ4Nm6xD
	kks/1/0ydo/9az7B0WTJhnCIILPTpem2AXAMgJfJtniFsR2xoPFnGeRK1r61EKLtLbT1MgVSn+T
	GNsKwzBmG29lBIvwZoi7HN3tzosH+TDGETFYSIvxeWKGrD2JF67FvHTXJVSk4/jlrUwNN2/bDYw
	JPHeR9jBTvIJ4nfNG6Rame7+ixTrTULsNeelr82KGxvG4mN
X-Received: by 2002:a5d:4610:0:b0:460:e00:1215 with SMTP id ffacd0b85a97d-46030617c50mr17401096f8f.31.1780929691647;
        Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
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
Subject: [PATCH v5 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Mon,  8 Jun 2026 16:41:09 +0200
Message-ID: <cf961b59769f34505a9b6f1f73849346c57ca7c0.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
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
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 0beaee5f81c9..f8a4b5b2e9fb 100644
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

