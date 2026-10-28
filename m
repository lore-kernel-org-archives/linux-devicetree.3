Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203589;
	b=q7v15XyYF2/CrE87NZPDRxg2a800PJUgh7zUK/IKEpXKU4x0kl3VAXBvzSdEp2503o/S
	 vROyQRY359WXqEv6tmoWgCfRBuTYs795AT8/BhtDyOEb8UpE43hUMmDWPqXX4mB8l0Wrj
	 m5ofP3+m389KUQ+T0ZeKCJmtKA4Jsw1Qj8+c1j1nuXBU3E0RkwYi6S7CnhoaHfrz4xGxX
	 HZciPrVKNGeEE+a6Et1LQBYQYhr/6tTgYTisth0lPJ/HD02Ks2heVBOOPIDh4U/p9OOTY
	 Knp89mN2xFLlo84RaQ+WKOWds3DtGBZsR0DJwUnv7+NoP6UL0AJQoFC76GkdvynDERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
	b=ZFn2t0hB2cK5GyHHv3MRzcZ/xya1DyJjb6Bb8kVi15nrq+FqhB/2iyU4Sr1BEmKtQE7q
	 gEE4yxClSghVB1+2Ie5EkhR4fRk3mn1l3XI2PFryMcZIXGFJOncg6cE390HapTTMHqgfg
	 RrDfwRVhDiYIL4HUUhqolSZXnXuZj1NFXHPCsAcN0i2+f9IFCKTIMj8fzuAk54lZiS/x/
	 lfQPbnxC6s8v32Etx3vG0TwDMdIvn3EZs1yaNvltd1QF3rYnZ6ltMzVSCIAMTZZuUuPnb
	 6GFzmruRfHtta4zoakP5HPFeLZDsqLBead8zr4aSZn3bXMpKzSwk7pHF7JXwOQR78eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LHY69A8z;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D31A606B27D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D31A606B27D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LHY69A8z
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10612285e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203587; x=1793808387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
        b=LHY69A8zem1uo86TLqWbdiIDHeomOMMuc1jlaBY5+fJbstzoHGUh7oLXUHKpkGViC5
         4oPwpRAKE8riDfYFeY/2kvk1pmf+AufiCWqnoIfEA0FpA9BasK/hHyAUXUtBFfpOWyHk
         VFzeRplRrXfDckkj9c2qUNAKIFGDDK2pJ0SZ3lezx8NOlB6HMtpgkVFfsg1dkWT6RQNe
         tH/QNlJiv5dkag717/pgo2lMex/BkNL6QTru49B/61ah6ADjMXveFsNGwl83yoAEuF1a
         3FIpnIrrvwzYJf+16JvLakvEnSCQOP3zs5hUngBPv0/7uKT4Soqk76lHcoUx8aIT4J6/
         qr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203587; x=1793808387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
        b=RJDd49YqS/Ym7eyKYgFsXFJ1q5hzoo8tDuf4CKtrussdgTbCS9MfBwsS6wJMqZ9N/t
         wCwAPwd2V1HopSVpYBFBEUeMmf5LcSSdq9kekr6Hp0UjFi1tnUyToejKPLNOdOGn9Zwz
         Td/2cWg7WedPiTtOnPFsdI99k/MsmfWTHR3t1yk3JnFrOx6KjLNZ9tZhTMbl6YyWfjPt
         s38BZVV3Fx4GHfFaDXYqXNB9hOUlwcCnnKa37SUHcBBmDmOeQJiaHzOtO3ptVw50PmLI
         WhTiXE+/CUxSSnVxjxh5GGxQR7ISnKSIX79gBIqCMGPGGbVf7/V5wcFqfqwiSSJwwKeu
         e8pg==
X-Forwarded-Encrypted: i=1; AKwUvBwauX+XF7byOyMrdIDkc5fmKwYPuyp2YJPRitq+ezaXA6XRVrEPAfJdOdb4qu+/+CBLdcyY8D8BWMCq@vger.kernel.org
X-Gm-Message-State: AFq9FYJzkOXuoCCD6UtqS0FN6/fxAVArWdGCNTgo31Z8ujoOzEWwmyaT
	GkQqeRBSK/HBzOKQa3I449jRsoknx/QRAj64vh6i+mxfokHo5mbnru604bDezuKA9lfA4DQxgc2
	3G9022b2rBA==
X-Gm-Gg: AYBFou22kwwQUxfeILPoLSdWTPKJncNeJQtkOh7wjvwkNGP8bhy08EWhy1j18z6fG2+
	opRFwaO0D8w1TDO/2hzurP660BVxCoPOFwWPlu6DpeVkE98BCPx99DhfgUh2t3Asf2VqZltJbe7
	BNJpoA5jUipQruXljpxR5ePuCMvELutj/fXgrZqRTUMPnKSUCDTeiEcP4VoIHr63ZSDa3Rk3arf
	yZyl+DuZQhrbUTvZsQ9ybY+M5T+7SOmwAPobQbn38E5gl3ejfofmwK1h3bKb6EEWXXbCNCh2uAE
	CqVdWepfUDEhziaBctYf7Qa7nNEGvZugDDI7ktL1IBr9UqABaoEiz6Fubx0aTR9D1Uy9elADBq6
	hekgBt7LxvAyLLXuXKhKbTf2aULWVgcSSFt4gFMCpEdtNkunEAsjm105J18hvuRM7rUXnQDSYAD
	CpP3KuPuj8bnlfjP1UTbBraz0RvrNFVlolCbCTpI5miuyvMwLi77s9qZUjsZSk7Zm3tWB3XXRKV
	u8IWyb5UzDJc2mwG4bpcduy7LSBvoIvGsQvs5c4k+/VdzmBIwTTUbOBvzzmg2LRav0JmBTLOqum
	WIbRQSi8+VVcP4H3Qm1Hy/krJtkDmPhV3JvXsm+ORVXc76itC3v5Lb1yjfWPe3T32I9ol0mcM57
	vpVjB5OigFdTJJ9FX5bkFAMkW6A==
X-Received: by 2002:a05:600c:34ca:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4a967202e8emr63277675e9.24.1793203587385;
        Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:04 +0100
Subject: [PATCH v2 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-3-4544429251e2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1216;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=l89+KyhDD7zp4e3bcIBRXS/O0eyS2NPYdXJ3nkvpksE=;
 b=FRIsaf92TWQOagF+GOv8n6t9aT9JwhYIl1hTYOAJmhh5eb4lmXgIOUlXafuwYpqaXP0CZzzW3
 cxWCAzBrZVVAGYkE4JwhQ10VVBHHlU2jeyyfH71jwum/JRrFs++azkm
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 261ebca8863d..fc124f9ecfa1 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0

