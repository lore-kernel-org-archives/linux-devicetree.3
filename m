Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A77381E9F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632910; cv=none; b=ZjcC/ziufPtBsW1BDXe37yKyGNK3Zkt2f1xKQSU+hQLJwMTb4r04I26e3bUI+7TMEhkGIDW83VPWpIdM5Bl6t+CgtXE6oZW2ONcI1wXeG24VLlGi8gx3wWUsW1yPudnwA7iF8lqk3mYncOcN2mRtoHcZkNIaRTcsj6rhKgFOjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632910; c=relaxed/simple;
	bh=kqwgEUYByWeKCt8A1G20ZW6yeKjOibdlAuv2gZFEVqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjSQZXdIVF1rdvpLthzzt8+lKO1J/CyjZAPDTimMdeIr6r2yHUpa4NzgTNpRUBR2yV7ApjyoF0sX0bXskvLZfUoYbWEaXek28PYIR9bYBzWr1j5Ouy5gs9KxSrIDSxZcTXsdA9X4W+EAQfHw+uoXORX50K6cAeZbELfUg1TqrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCLOX5T8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCLOX5T8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475417f010dso6314099f8f.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784632907; x=1785237707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6g+koxDLN1Chjep218/XBMsTlfwQifOiOfABmvTzX4A=;
        b=WCLOX5T8gPpqqM9R5xlOrvVFEOCs872mEi27vbIk0bhnOhxNiouYUcAHcP7KxHsJ+3
         FYvySC9+prsa2xYmyozSF2N5/PBoKIyIlhqlC2qKehuBCacLdz+O7T6EQE/wi+qvZBBw
         oUURnrlGVduCvC9FYvUYO7nX6o4LWy/pyhy4E3znfRFjlBMa9uc/aH7HPpPnQAfR7ldy
         PMOxN7XnxbBLL589pyqoub9i1gFI3rcv6AwJSk1pZf6qJutvTRDBNt4kaQ8TrCIcMn/w
         1H1As+NGZskm1d99aMlerkmmoMB7I/2GWctdxu/CGIThVy7VxgzvqJ91jnFNzPdqW6JD
         lbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632907; x=1785237707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6g+koxDLN1Chjep218/XBMsTlfwQifOiOfABmvTzX4A=;
        b=rJz5g69Tmz3LDRCHWKinx0gin5GXlzOt9+ar168Ax1Qn2EE7IyiAcXbdToD13LzIvJ
         CQdbHzBFwxr6qs0PiqKVxf/M5pWM+g0yPRVlRQotSKY2dxRg4gy9s08M+v1mfUHX4UsK
         EMVRsU2HBRLYmAyoIz9HSipm01hsMOShUXUTA1hFJMzB/z1r/uyQmFDj5jheuWC0q/yD
         BbumDEGt40qy8u8KjAsZPWnBgpturOjr/UWcm45PDCLa/pivQjbfwp40CeZg6YZGtaGj
         lU8vf2fS6GhbADmpsLRy2QjX5t/wfxJosOYHuAaGGGpHfOWxYvic9o4C+QryqWmY6Ncl
         RvnA==
X-Forwarded-Encrypted: i=1; AHgh+RpTayiQmq1JwbnK2slTMlrLYwB/dGkQWN6D3pF/LaXKHzSbfpRPvtQHpmF/iw7bsR5Ng5aOipsQmCWv@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXmQRJUCFr1Y8UTpXpXCgQEAOxL+mAfnBmSMyAzKM9eorm7jy
	qspsZZDBB1c+OA55uoCq0QkxIJQb676Xue15rfazIZPICOwdXChz22dW
X-Gm-Gg: AR+sD12Ct8jPmLbhXpwh9njYx+UqlZ3yHJJvbCvrkxKv08vrm5EUWSh0Sk59sDIRNK3
	6rICAhp+fRajNFmS40R2OgUB8UEFMfVbarzYHxOKxWFVdnMjHT1lPXZdPTr0ywexWsSBc3LsYTC
	1FO5QS7zOwEnVVcGjgm6Y/S2bjb1WZelA3tDmOxOBPNMEo17MyjJ5ZmouMfo5Q6E04q+4A2I9MM
	nCR4B5uP/EkkSdWfcBIkKJLqxGPa/s0xJ7+XhOQQOVvL2hv67RgxcKRYjcY1GB6J10eRpopPsyg
	U3AyrtSvCrMdgnOkXzLItBMswW6pvxhAiLt9SaGs1w1d9SUhNTis+/2Oyl3zj1/cReZMEhOg3HG
	HUB0a1XeePORa3so8j+1W2zZsm7WI1MZILnkpeCygBam+oXtaH0eKFzkLUIMrAraB111SMc4U5+
	FdJJPR2DajDSeXjbFeJ10Yr+Zw1lyo2tusuGqjagJNWe+t+CyKGnri+pU=
X-Received: by 2002:a05:6000:71a:b0:47f:48cb:ea5b with SMTP id ffacd0b85a97d-47f6233d615mr19569935f8f.43.1784632906622;
        Tue, 21 Jul 2026 04:21:46 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm40232416f8f.5.2026.07.21.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:21:46 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Mark Jackson <mpfj@newflow.co.uk>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] ARM: dts: ti: am335x-guardian: Drop unused isink-en property
Date: Tue, 21 Jul 2026 11:21:25 +0000
Message-ID: <20260721112133.70382-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721112133.70382-1-egbostina@gmail.com>
References: <20260721112133.70382-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'isink-en' property is not documented and not read by any driver,
so remove it from the TPS65217 backlight node.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
index 6ce3a2d029ee..d595e79d6b05 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
@@ -320,9 +320,6 @@ backlight {
 		isel = <1>;  /* 1 - ISET1, 2 ISET2 */
 		fdim = <500>; /* TPS65217_BL_FDIM_500HZ */
 		default-brightness = <50>;
-		/* 1(on) - enable current sink, while initialization */
-		/* 0(off) - disable current sink, while initialization */
-		isink-en = <1>;
 	};
 
 	regulators {
-- 
2.43.0

