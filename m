Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12647A0B6
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488012; cv=none; b=SY39IHkwCun51/bw/lzyoNRdNCkkYrP9XQhDUozbz7DUSxNPLyZ5KeckJBQqFxPQFHn0BNS8duHOaAOSjf89ckrETLKob/hfjDXCAh6zvcwvN6zxMZLk8ag1E2o3KdinWorPVVU2VYXkNPvj2NECohHU7J5b29b7T8btVhExMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488012; c=relaxed/simple;
	bh=Hz5gw6ZiZTRDi3T6Y82XHviqJ/HDBrRBmM/1Ow+latA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YO25F1tNGBF8eMF5y67E8V4UO5SeI8OvUpJpvFbfPHU8nwkMMTuRYObtjcu9OXjTJfprwZtnA5LqiVdoHIox0CcLXLm3AJZ0czw3Hi9Pn6bHgAaGcUO7p2/VKMr6jyVCAFA7Uvl8IgS7h0rCnSYgNmpI+I66eeTuPr2DjLlnpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKjRLNZA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKjRLNZA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-460166910e6so1712016f8f.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488009; x=1781092809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=;
        b=oKjRLNZAeG0rwDFBLodIlUmww24SgVCj3MUUr0sOm199286CrIJ/go7ZC1zxw3V88K
         12rOGBNeEyGwf7bfOiMvdDxQzylgM4rJ3JB/w3k90FuEjR1n2hjBMvWT3XCtfFn+JKeQ
         pjOn9cs28J7edLDTnWlOIugPiUMWUXQYtivOKAGkc/5S6eCPZUtOWoIpIZvmqtRvvCtk
         Qhi5GMzdbKhirlJrvH3S8zgVKj7qC38W5BV+D/I+BvHYgpSGEZ8kUvzZWWb+raxKhv6K
         xVvmJzDAtszQA8tBJSgmNXMkVUklNLOhIrMoHZySyOV6WRoPGzJrtjJ3geDXF4kBpPwm
         idQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488009; x=1781092809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=;
        b=QijvzPPytR6AeVKpUcJ5FkOcpnUE4lqEQOsTHYr+ktSz0aGjhCIISjBGAaetviiZWk
         pZZlSL++JzRPGxa5wwwFSvDuj3P3E3FtDnK2NLLTJskSdW2ktHicH2fAbOLo2oJzVcq6
         4BW1CRFdKHhGRHy3HzyEPEfDZSPDpIPctr4DjmKFWC1mM70bVdRhhhai9BEGfT3bIZhX
         mTB1rWqMKL5V7cScnnuk0MJJOJfEq7PlulmJ8SOAoAU+4Y0BQl5QG6MX7ub+5dUoeUCH
         Lf/er4rTwL1yJ/py/SgVabeZ5Lfw3Y42HWt5zdsYnIPhxGn86NzGTTuOdG63JxgnKHnE
         Av6w==
X-Forwarded-Encrypted: i=1; AFNElJ9/Ku0MvRyQmSVARLwHMo83NK5pUUY4JNBRUvsPRF/ljhClOmva9/7igqs7ebFBXAHCxjXWKGwO4yO8@vger.kernel.org
X-Gm-Message-State: AOJu0YxqciZOzJb4bLJLpk7WCyZ+D6yt8PyaGii2BrhjE2692WucTYft
	qE4QmR1JAIolwzXTtdoQpl3wn3Zo4Jn7tS2AxPfqgBeWf6RK7fCqGdN6
X-Gm-Gg: Acq92OE3xW1v33TR6n6NtmWoNrjhVt00a2YR/+vfnLZMBCpWWnkBKSE3JtAsmwtjbB4
	1Onzd+dgVaSnZcYTJWy/mKmzYYUnAYgJFWpFAhl/n64qmo4rXXd4pJeJ6O8MFQUGrk3h1yYFezO
	w5pZndcbqfxVgA0ze6Z6uo6KIxFbw6DyR8ZyH8Ji2IUPb5Z2tKQQk/KV4QRbkXKI/aKadXw62xs
	DeldbzMwt4XscreEtny8zJh4P7hFdMs2MAini8ctHI6fos91WnX/ZKQL4dteiJcTKPxSv4dG8wz
	qOQKNwujn9x8+zOAyWqbz5l2w6N77J0fqdC+Rtk+STT1dG+POv37fO/kfVBZHhVZhNW2vW62B0y
	Zhs2pUBxyvJDJ05CuhBHxPvvEHmBrxv8TaLNNFGFesF9ad5JfFa2msZuOS2LTPLqXkLedbhyCwL
	Ipu39nHxD5oCGQ+m+VMRJ2fV4cTvfxMwQwuCmjR1ROTBzsi1ITi/5142rnfWrQyvV6tZATTD59C
	hw6rs4gPQ7hRrJBPheRdRaQUManQdWw1psuoPF41cGqNRGm
X-Received: by 2002:adf:f50b:0:b0:45e:f073:d2fc with SMTP id ffacd0b85a97d-460217a92afmr3856857f8f.11.1780488008559;
        Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
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
Subject: [PATCH v1 08/12] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 13:55:46 +0200
Message-ID: <db8411dc811bd9fcc76ca72cfbfdade2b1eef99b.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
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
 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6878b89c4db8..9622f77f8f13 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,21 @@ st33ktpm2xi2c: tpm@2e {
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
@@ -300,6 +315,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

