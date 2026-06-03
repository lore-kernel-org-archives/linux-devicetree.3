Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E253481FCE
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497456; cv=none; b=YDwVCUD68sJg4YAB5jyDgHKBD/96Q/EXMZWJ+pIfQN1+c9dKWgSZChwRtudbN33bFTq9LbfWVuUJN89sruq3fE+ufBkL8SyWmC/U7XSuEB4kuJdR9ki10VpYZV2M9GQ5NTTa9jZaoHmlNSB3NpbVDKO8RmyGE5dJCGu7ZnsDCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497456; c=relaxed/simple;
	bh=D8mkQWXDrwVabfBff4MbGw889p9AbueZ3qFYR4OWXdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBUoOJGMRAZaAmkG4MEzP4k3Eg/UgBtNbSuciJ0UKxt2OLyT8SX1S0fbVSHzKcCZMPna918TY2L8pSysMFisOq+F+WlY/yCDFafj8taudlPrLriZnYjocyG8lX45jR9vMeioCfkqtY5ajNt7glxWBrdX9JyVqnMJcxFWt2Dk6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpsByYD7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpsByYD7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4617455e9.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497453; x=1781102253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=;
        b=IpsByYD7aRZoG5tpZrOE7WgdPp8qxGHl7ZVUiXn78uSYb7uYoCT6ifywjOsU00lS10
         aM33d7C1UsodB6VuaNApUd6Mugz6Dwd2iTbRTIRmHlZXCdWCx3mearWUqQeKqI25/LUW
         6Bzz1eBKbSW/4uxFMppAsP8Ml4ovm0sbnu0xeQw+AQzCOYgRVfaW5Pc7qmy/Ix2G/86G
         Opbwu2CTt0MPO7OkirednYyKeAT0kYI5GukY2a6o3sE8wuJ+80rogMqoJM0AwWM8WQxO
         AB165WbAN4s2WtAugKZj0YUYaCN/BJANe5+2guzijkuLGX7VIFLHvO9Qh2dcQP6fESFj
         oTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497453; x=1781102253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=;
        b=CcLocydrvv2kFKjatPAsCOVyMKVKw8U4eJm+rJljc5VVM6Wsn5cjtgJQZpZjBFhnfP
         I+i6zJ0RuGjAo3tIx1yfDU6UYdS/f2ChCXuB8QZUElBRCBsiNy9PapEnfWexNTKKKsbk
         R/R18mAgmOxP9gZZneDxPRhUK/8pWnOC8R0bp14cwQHYTIVUllVXXhKGe6qWcM+IKpQ4
         lefCe3r6i/peuqqOPT8MMZIR6jMCNoz6MJ0et6Vk+d7BFo7ZAUEYvFvbgDTMpY9AW2Yb
         KWALhM8mhzcmh0t7+ugeZMp8aZMzGmI0OEn2VB29AxCD/IJtAjWyVaMfRJhveRtFHFUE
         FrFg==
X-Forwarded-Encrypted: i=1; AFNElJ9BbREITG9/d/DbazJd+0GRb+ia15SL6p3vPybLg/GhZAOmu5KSbhrVHfdzt2Z4Nj5Ly+VMfT1hYZ8S@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPExvT/XTEPNd0noChp94vfgUMgUTr4hRe6AaHrcODNRl+Hgq
	OEQyueZvUNgtMgQs5v0P8o4v3pgHhoxnpwmqoV8G3qjIF+TTBkuoAwD7
X-Gm-Gg: Acq92OHf9AeMUc02yj3TSlr7udGPB7BVbHotbx6Grb1WghaPqZmtv4zVFA6outFDCzQ
	99xz1u7tVlk9FhfJl4b+dJLu+pfqCxvlwL5EdovcWg7P8lwj0uTTELE8IsFiVZKhjlTqWXpE44h
	ktNPhOF8FBdyoC/2B9ucV45beqYwPipWTy7xgqLGfi5+CgwvUJObfu21/9ZGAen2gpyQ7g9Pt7T
	d/lwLVeSFHTgbEl/aTILu5BjdvDNgxBN3h83p2caPTC9KgOrYLIxYZRvUG0oAmoMP0lxzXkHXlW
	o7YdvOBIoUbHJtEvVQr7zeTUkHfKGOFCskgj6sVIrv0TclonyRYfMAJF7UJFn9ZpuzkEzyByNwO
	sahkSgysi7CgPskiDm47KOSBQFiT6lSpdRwQgnl7LmdwijBGSlw/neSD6ZHymVorn4c9Q1e2Fuf
	7aKWp6SKO4hd+T8Tw92CqyX2VrQ8KBpMczUZld6eLxL3JxCVSFMsAb+xYVCO0TlMa3IvNapC4FB
	KR3I7MxWT6Bfr1mKDrSVkGKo+93z5hQqMpY0T3KLFZDkn61
X-Received: by 2002:a05:600c:4509:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490b613c9cfmr42823005e9.11.1780497452743;
        Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
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
Subject: [PATCH v3 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 16:37:13 +0200
Message-ID: <12749af99fa4316a43d5aa9233ad8e99da9f221b.1780497188.git.stefano.r@variscite.com>
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

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9500c9bf0f42..db0ae706f648 100644
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
+	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
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

