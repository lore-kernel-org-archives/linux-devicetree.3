Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203593;
	b=SE5poJxxrOu+f2Q1O5uqvCGVME5Sl+mC8wPViwIScOsYgjnl6MkupE3iDUfrtVxgoQAz
	 jF8PT56iZHA8E3LhhxnEVVs+GkIzcb5RcTSIkODVUjPLnDPsd+6/+yLFeQfezkOEzoe1D
	 2Mvt3SdMRPzdHbGlcUDMG7aVD2OjyRyTWteR3ASVllHeES/vBOw/v21AfMR4brcFH5oVd
	 WBGuUBlWSFUee9IgoRXNbjLB4TymCe60YwECwLqOOFCQqxUjxO7pYgHSAw/mLLzS8QaHe
	 Fq4K0/nl7XblUWWqAua+nx7YtxdEk+Uks4MVBjC+Ia8rfOgTDigX+hko91P5K6kS0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
	b=vdz3fCyvkngER7k2SU7SksIFiFpqC/tAaZTo35XoRa0HdwIE3KXNIW0QqY1E17wJeudR
	 WLfLBcNljzjiu+R55gi9fnFW/ehOR4g/lMhAGNZkY5tWZ7E6/y7KbdCTyEmIXGTQO9XP+
	 uhhlrpJdn1w4AY5ec/ed7OTo3GnM+KdWNalH+b3tILrke6B33qpxPfilXGYee35gZv3ci
	 E80AEt5CbM8ORu0JED8AZpBxaPdQLy/tv1L+r12vSyP862D1SixFHC0VTtwbkGFfhi+XB
	 JL4O6y/UkOOz8z/RFrc8HYb/HpDLx5nja2LDpbxi9eBry1+hPcXrgQGpPc+UAKSXixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cxt3iCfe;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBED606B269
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBED606B269
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cxt3iCfe
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7756095e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203592; x=1793808392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
        b=cxt3iCfeaXPmT0e03ZR6Gpu7Ti+yT+t39ypsg0oOnFF8HvvWrgTuKHbstmvDceG62G
         nxHNMwbr3vbApZ7ymqgN5mrcvKhVB0N0JB67VgY4T3ULqOZZi8W6gjnHK4baZX+OaLsK
         8VGtlexj07cz9Xk0JXKAHsoSFVtezCnqKi28n6QWh+MxLX6zSPeUVDEuMSGdZetZ7kjM
         iN4/MF0rCH8YJknGwMGmkpj8cTedHwTAkdky+8DAjwMTqGZfEp6TDzUMdLHYzYfYWTbW
         etjTUe4OyAyZ+b4Q4muqSikggEymJ1Tlj8tZocnMtIvwCpVBx5fSU+R9jMscUpyoJT3U
         Zhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203592; x=1793808392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
        b=Chg7m6Ex3/ZeOiyx5xZewv+Xf5ATpsQux8uVIpQlMRaOVEs8WMAgqiAD6pp9cArigh
         pfizISWy13M3ELRwL5be6ZOsZy2WpfdheurnCiX4tYiuGnh7nDEholhJ95QFzdjIRgQH
         4C6DgOswstidR+8U8L5DXYNrEVWsfQeEqtEfm2pLoXJsuH/XsnO/vRkBh2RS04TD7PSw
         kxtSi6NPVXHaE0tNerq2aBwCGmxNdrDwsi57KzWhaWARA8T6DYKo2iAaHFOLo0AotoVl
         Bt+cott3JHs1eqflnOBzefe8RlMKx45Yv7gFfQpqFT6WbHNT9W8FMPLXFmbVs5DkdLH8
         WEyg==
X-Forwarded-Encrypted: i=1; AKwUvByuhAjqsTbNxYoGi2oNYeZUxGv7WINHCmb2PPbNvgR2kIzEQdZCpRSv3PDiUGPCUeJc+kLCC8G9ttgO@vger.kernel.org
X-Gm-Message-State: AFq9FYJfCZ32zm8fN2Vg3dUZWLF5QPjMWeIJDnZ8PstmYexhTD8o5rQu
	ZdBU+Zjwn6yzVm7RA9lnepTmOiWyWHwsEYQvQ7px13BPEATWC7dElotQPTnAKqN8j+GBPI6RTQK
	EpVooYW6TVA==
X-Gm-Gg: AYBFou2/42hgLjB6Pk3OkbgHnW+FmeptcL6PYraNcGi03+p4m01ObZtedijDldrcybi
	WUv6/jJ2DzodFHqbledTYa5cDug1FezMzbyJ2Pu+JcU4r8Bhp0H02Ot8Z7KO2r9rWwNgyzdG0Iv
	RLUTbcm5Ej9oAVbiWoNQ2zfQpuFjTuck53dSh5V+yDRR4fp1iLPoXuv1hVoaD2eKTKkf5Nh3/ql
	Q4f69Jd/XyNf0EEthZHe98E7pYUfiEA1gfHS5jBZWAaFEk6/RnOMZ0i7J/xqxIzs+yxaL3XepH+
	UsyBFJ8htI+ZVAvPSLZV5aNlNUq8BF0T7nJPMc2mAC7wngLfFhXdXcVHWtVSMIZIAnzRXpR6nxf
	Pff5RtKHfEafl+OG5kEy453qmECBCZq6ehNOjd6Dwp1Kx78iYSD5B5sXN0HWPJwYYtyIzrZyeWy
	9u9q7ouQc3LwUefTjQ/HGmRx+N7/lKUavuTjVzlpfsEbAJ0JbmjvbZXSRyUPyM2+KTl8M1YsIw7
	S7Ffgg6Po8tSftxHeMg840lKf4lUmHMRBACQeDh7PncOFFl0+zsz9vp9TEJIQN9nSsU2/3AhE5V
	CQC6xkEo2W5hAClBD7bgSW/jRn30UehRneO9orJqSgvs80npEOI74mY3dj8fzVzoG+HORcrXqen
	QF+WCSO5BLJnij/o0NSrRwRP0BQ==
X-Received: by 2002:a05:600c:3556:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a9678c3cadmr65712265e9.35.1793203591617;
        Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:08 +0100
Subject: [PATCH v2 7/9] ARM: dts: omap: dm816x: Remove hwmod code for USB
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-7-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2202;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ny6o+8O75PYtwR2Tbz8N21c8sCnj9yIYkNJzjWqiRRs=;
 b=e2Cm89NUh+NWLAqlSGnjPS9Qu2O++UotrEcH7tte7NtpZVzxvOd9M+H4nKGn+8JXxX8PSH1PL
 NQS5foBIQrUBlTbY4ZPammQ7bf2KFpxUI4ifneZh92O8oRNb5O/qxZD
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Remove the hwmod property from the USB controller node and the matching
code from the hwmod data file as this is now deprecated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi      |  1 -
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index b839ee29e9eb..55f4b91fa1fc 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -576,7 +576,6 @@ uart3: serial@48024000 {
 		/* NOTE: USB needs a transceiver driver for phys to work */
 		usb: target-module@47400000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_hs";
 			reg = <0x47400000 0x4>,
 			      <0x47400010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..b9735b507d6b 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.clkdm_name	= "default_l3_slow_clkdm",
-	.main_clk	= "sysclk6_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.class		= &dm81xx_usbotg_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
-	.master		= &dm81xx_default_l3_slow_hwmod,
-	.slave		= &dm816x_usbss_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -1250,7 +1230,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
 	&dm81xx_alwon_l3_slow__gpmc,
-	&dm816x_default_l3_slow__usbss,
 	NULL,
 };
 

-- 
2.56.0

