Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48483845D9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068383; cv=none; b=evVIFX3LlaHW4furvFHg38mW6D+cDbO22gd7eQMuGyuRpbjXrxqcFxrHDynDMI4Kf9BzUSS1zhCyeUYscfsDufE0hk4XcxFsDiTRI5pjJ12M8v/tskSbJ3c6xe1DgnDAGXYNij1jTUng6QzYNkYMLA1U6CI1ITVQEHzw+8kjby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068383; c=relaxed/simple;
	bh=M4TjwNnnExGF2NSAafTC2CjfSzRsgpBd9vrEbOOROvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFmKIvrYSdoO9DajAdKTYhBnNYEOC0KU3Db9AMVKv2+3OQCmIME+p6oaip+V616QCOCPNGWLv8DcLB8ujTLYIM4Fs7xjiBgUEK/PPg3SaANdVRYZMUdHkmk58KFZfgZD79np963Ej4aOn+PcoQAZmfUXUVLBK09j4hO4rhxVi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCMIKuzx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCMIKuzx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so2116675e9.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068380; x=1783673180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=;
        b=fCMIKuzxVVnvc8ME5UXaGWYClIPEdfTmm8xQTlqHMdIRrFRS1aKCD2/dHivyNbEbbF
         rWrrUqnbGgBcBigpTD2cEBVWRnntkqWEib9Pz9rqQoeuoKafoQVyadRAI9j64WezzPX8
         5mzXRonNZPLF3r23OpdwWPaUA8uP8Pf0tb7R3TNNXJTDbD8nDOAZxrk0GkfZCvPLJqme
         pObqcyRK1OcPt6n2q4wb2wfne2F674FN7rA3aHz0F2Yumt6Y2Njzw7DIp3t7YBpf7//f
         My8pssno18yivxuupMUBCPRWFwuZy4Bsenf8bFSfsWRX6OeB3xNFnPoVixGZ+rSd7Zqg
         W/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068380; x=1783673180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=;
        b=WrKS7McNl4XH1bg7rnfWUY4TeoW82Hmgv+qNVSIHAnvl8J5UdHRPORwy1bG6djBMvA
         yruaKaRW0ATS1DCkt9VzX1m4GSvEqrCWNZbK36XsgXAYu94C2bGELEyll9THw22Ezl/b
         1SeQ7pjXik9SB8VEScS5Z3tAYuDyu0Hz73D/DVARD+ZFOrY07tL/mf/GFKNljhFC2QZi
         YiWwKoe9pgOY6PHR9kmPHC/ETzt3IC9raDVVRiN0HKtrYErMXtIznrhi3Kn117FzayiI
         Dx0OnyOL/N0Py9ECi7qJtej7XU0oDsOUgNhmqmCAu+StCNNsBk3hI/56Vt9alR34m69R
         UiQg==
X-Forwarded-Encrypted: i=1; AFNElJ/XQ3+tOMisT1E5PXIw9umEXHwXNraknTIphQFc2YMyh0qyROerMB6JdTQlVT2jbLd7GLdFGR3sR0Qg@vger.kernel.org
X-Gm-Message-State: AOJu0YzKBXcUuvVk82DyHgA6nFMeE7YtAani0KPCKfBZaDIT9sl07Vo8
	wkSoMArVbEAIeKkQz5DtN7GR51Xfzx474Iz/i9U0Xun/X4JWv8DlX9nw
X-Gm-Gg: AfdE7cng2dlMWRSCb8/upuuTiziXNIEoc0ujSsXI6Qv/FxDZB80SBwxT1IvkDv9kZnY
	t9ZK+yHWv3tRZQ07YCGeCLyiTAsM4Z+m7MBizZjyhVVgewFmI8SV3w9lOXF5A7e2GV5aSkQy8eC
	gZranz8fRAUqxAYAUZ05zL22gOEcLxQHFZjPWeFkeUt0biWOzMN37lYR4TXsifyWtsV5qLOx2jl
	xGrLeEIKYyZ131kosBjjBd4V2laXXR+66kkU+3vm2V3vgmgHFWGZ1Zg+wpLJdTFTLsYi335mafh
	PxoQMuXQuZy+MPCXf84Kp24DZG7HNzXNEsTwqcfuoWLPvRgsWjUmqZWXES9ZEuI0gEBa2VRiEDs
	z8WPs2Jg/H+VIUtJx1Cbvli0Gbngxz8+9bkBKwLeCYcrwu0JAOOcx8cnBFaU/m8Sz00B0zl1IRd
	s59aHwgC0zGlUxCMZyrRsGwHQOovshxMUFuS3MBw49UuwAscBn+lM4KE6VKl3Klv6xdM9xKkup7
	ddUIM5klcSzfo+ux39W4jDmWQ==
X-Received: by 2002:a05:600c:8183:b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-493c3df34d3mr108791735e9.37.1783068379993;
        Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
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
Subject: [PATCH v1 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Date: Fri,  3 Jul 2026 10:45:58 +0200
Message-ID: <92d57a1af29af4b2e25d654bf7379cd96e3e5128.1783067947.git.stefano.r@variscite.com>
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

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7d016ed5e911..4898018f030c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -262,6 +272,20 @@ MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3

