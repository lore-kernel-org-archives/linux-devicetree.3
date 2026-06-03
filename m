Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE084657C6
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492390; cv=none; b=HzdtOQQhNlhWQsc8UE5JCuafCeZbLmKPLEqzmTFZpMQA4iE0GNkiZBDK7DPzGdZ8tfWABKDJMSEkZSSfyysT/uW20yCWnHFOfyBS8uZp++neGcZW/1m7D3HPAdGmnPqi6kKVBRliC9B5lQCeNzaoAhN6+uCW+NCeSrhacEU+cZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492390; c=relaxed/simple;
	bh=SINbveJea1E27zpNhVxP42K2XN54RBbQyrlrw9Tt7No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0O08YlCuGGKNiitvLdE3l1q1fh+z/vfFdUX9dqs9aYL6NgCXF78fiv1hhqI6E2XlufZMd0uXlkhgB36dymq/0EAYRDapOmqMvHZpMJ/9/yGU97DAGicsCx3OSmledHQk/kXO/Y4oFnk7RsRvU7xKNNOERhX8NrUelGCw8P6nBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC2lRZqx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC2lRZqx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2981827f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492384; x=1781097184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=;
        b=mC2lRZqxS3XXdHnME7U0MpOqXTwm/hF2GMJ1WRY4sBPB3ujhk9EZ8hVh1YddGrCB7c
         0pLcOTswIcPuVn4914g+q2UhzLenidwnc2a/ohfT1Q6WIzXIsbPh8F47yXyDooeKwM8o
         zaggjtaRJ4/tVvm90AD3o2Nnr4qXXZkMKyuE8wasOE7SqT0HXgRZCZ02/ZChm/YSjAac
         a/GfjwvNTG59FlNA8+4yvq/TAoEsZt0NFpjLa/aCJWCzgMkKMTsq7qH3e1e885jELeCc
         k3UKsNJiW+beadkXkyVU1hLheW0LXsmPMTBU2XJzsQTq8ilnX+m6daEcFSEsUsPloGlT
         cDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492384; x=1781097184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=;
        b=cJ83Xgv0UzASLHfCD4NPa724WF+7ogvEIgxTA8n22KOEsCTMKh/fGJDcPjTiBszjfD
         9sYwRM8SONDDyOcLz2iKjCZo7W6zdPlazUCq9jqiHlruI6IPj/chNjyo2ZHyviBKtrXh
         B3Lx29PGiLHaD6eYCurpUKpy4j6w5U8iRk2b1RKXQ45K4SfMRSjx7ZA4zhxaW4S5P1/N
         tfNur8rmm92vzb3k4v8+kFhfPZKhysKhZcdUyCzU8/6aeGPwJCv8GzCB4PehXzjDWAUb
         OUidBiW5QpbUOy9EvAtCBXDzzG6/wh390eTv9JDsw/R5v1WvV3QZT/KsDwwuRQjirB3j
         LptA==
X-Forwarded-Encrypted: i=1; AFNElJ8krqmb278qXTnJiSGunV6snnlbaqVGphzcSzB/D7eFAsmTlYhL27mVCq9lcIZlO5bIN5Sy2qLFN2jS@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNGBmsSNovTpyGY8FDhv66Hv80z+2rXGd1mP+q2eHkbFEblQH
	ZguNOvnZHlaNuGcc43ageOKTv4oXge3aQxOBFPLUrob1KLjWRGikOSRl
X-Gm-Gg: Acq92OFYkdev+fkCp4P3gyBl+IxkuC3DALJXfctxbJlc4jE6i4Fc0QTh2z8xoY0NFrc
	5Eoy4PDNYngpxSLcmMhjjqYr+VV4drELGsaS3P0qMrrD3qO/RqZGf0ZcV7k6y/yLAbYMJGUIMVC
	wgrx/rALlGFFEeL9WCeamA38+qWgylGjTHxNMZKjqGfj1Ig4y6/DEcCxJ/FLPSZiZy4Z7he+28L
	4uBZ5/uJ07I5rJB2iQ40YsOQLWHgQNPaP05QF/UdDjHY943wuai9bEntngW3iSI4xkpiLh+soY6
	fNo7qc0Kn55CzWg1NxWFlycSTHmDlEJJGVMB9JCad3tSSPBBLriftu7QIk6cSK9MIZdMA/6N9NB
	MoWggVtIlozY6Mqy14GCSQ+3/SRaxaTwVMDxE5wI+0hTrkBSnXD3qeQEruEm6QvgiYEjuzhKdJj
	iUw4wbgmvjORp2VUkSLuQx+BrfDyJEeojS+CkdPAvkvwOSLQ+/1ypEGN3UmQd17Scfb5t9hX/EH
	SNtTCeUFSyhocp7jNq4o5KJV9mxo1czqAM0vxFhL0WibiYFdAELZ+4K5uI=
X-Received: by 2002:a5d:42d1:0:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-46021783ce1mr4027348f8f.2.1780492383633;
        Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
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
Subject: [PATCH v2 09/12] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 15:12:47 +0200
Message-ID: <bb0c43d6aae79786a351083e5b2000b1ac8fb6e1.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index ca0fc66193ee..98aea97e9438 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -326,6 +333,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

