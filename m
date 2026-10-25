Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936709;
	b=HfiEUpPOTBYKPBBVM3DeOToxbOcejRefJwrkTslxmfctJgdeLnN5IqRD5+z3DLw12PFS
	 ngkmRWVM6sjk0mKQoyyMbGlN8ZbqM5SH0xmohWLw+7/DJaUD14ecGXto9fNya8ItyQoVT
	 ZTCJPR+7QP0OMde8FSOTyypBnBX/S5LviPaNBASnpWtI/PHZOLDSB20cayovKpxcyUUdq
	 leVn0mzGP+/o4LBqS3GXpXZhZidaK39U2Oy6WJuLCIhHaq9lOcmv31cJXfX/ZxH0lVVF5
	 0swBPsQ5wKscIdYcvzCzZ60S7k5xZoIe6hD6ZBIJzu1lFbuoCBgER2prBIYaepFz8/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
	b=Y5mx7dNuqCtv+4PwpOYLJxoMLf5AcKCFR2Hy+rsqT4U5OBpiOoD1Er+nwX47QRpzGEBx
	 WxLAFATFlp/F9RJxMK3d4VFlal4mWQVx/lCXPHQY2GnGzyJXGDlZ/D6HIlJ0fd+pxS00Y
	 gfgXhQH9ePjWq54qXHQykw06/Kg1mz3+VTnKENHzd6M6mPI9+5rlS4bO+Jmwa1DYJ1I2g
	 nog2Rb0VA/aO76MVt8JjnG+/YDffk/2TQYMzOIlPopNquEYtUTGl8hcwoIBIprJ4xA5et
	 Q8dm2rTM0bYi5QpjHbzTFaMMen15OFqz+CqSo9sQodwfVGm13MrTs4bAqWAej7e4f/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5TfxP3r;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C0606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5TfxP3r
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1322726f8f.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936707; x=1793541507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=n5TfxP3reBlEm7ySHf8YpItTveboXcCRmuCtGf8xmaew8QkuZ2UFtwM6fcYztOPx2H
         3NVw6eesIW57y3bKjvWP67ksHUSh3BckdE72GTKJ54r8DpIE+YycTcbO+D/mYKp6Pc+7
         cNeVJvo4kBKTsOniQRbELTEV7j+OwWao0wVv9FuWwnUIgm+/BJp7vnTNaikmc/wRJfsV
         mzDMErTSyGMJEdXZeOHi8RYihmE8RxdIUGU7OMg5rcZhkVAnpIsa1liJsHXcG9YJPo2M
         i/q35LdXCUoKjCRSzsdHtimMxKL3yyEqzRt27jqxCT83j5777OuFb2GnLLeDMQj65b1N
         9tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936707; x=1793541507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=Ut7KKQwwJHqRnKloAvrAXTxCFY0rQ0d2aCe0FWXIaH+UADkVb4KosG8aHzbJnZhc4D
         7PX9wjYPFGCwOvV6INOgHBqMRUorP0bXJAcGYUYDn5icISWTFgg5wsZPXeOx5CUDaj4Q
         ArQ2cgKaTEz8T3YkyoXguRxIGpnizB9BDzU8D6oRs4xUoXsiwkQqJ9/4RnMv3vb1Txfr
         ax1hXpBvM/Lh40sMo7iW9qUAGvpDvr8qXe3R/LVD/uEnLFxG2mcrBqWMPeuA1Pn2nMK5
         591Ap2JBdYQoAEHF00usM1FRlox/lqY75YcBKz94PDyHhnQ7vh7AmPnQPikAprD98jdB
         bqBg==
X-Forwarded-Encrypted: i=1; AKwUvBwf7jU64w7Ht/sIXtg5W7aR6UeZ0kzSSFq8YrK2OmnJd9ULb5Qg4KFtPgiN7Bgz8hjpOQ3uvjOmfdDq@vger.kernel.org
X-Gm-Message-State: AFq9FYIsZar+oZvEgI49vMzEC4wJC/rhVnNkxsaYC54a7Y5PDqwKtjch
	CMZjghTBo5h1HmxTpGT9GS8qh4G3j0NF3jsvETvr9RZNr16rzWAfuzBp
X-Gm-Gg: AYBFou2Tg6QMr57sZP4++z35f9XA/fItw8iLXJlWRoUEje6SSCAgUPl7nV01sMxqRCU
	iMckffqwo/wbIdJmX3/jScdlH2EDU3vAKjeL8f3sp/n9IKqJiT8UY0l5+2d09UtCMjm46EndhMR
	YUb+m0OP6RUSL6sVFVWtqVaJHqbwdyvJajPio6HBtXvChW5y0BerAvZMRJKf5OFEaFyW7pMLF9E
	g1L1wDzpdw/YR9XK5gtdvkGqohc7lSVxk4vIDHMfJsfoTfSoYwA6N05eJRUBcI1MsqY82ZKX/ej
	ihD+aSlVBXgo6rMvkA9vljHIpIkS6eHBoyix5XjLFMIt/+lNQsILKRf/7GNfzyamENhHIS8Btn8
	gZVW937HSC7jEBbNM7EtDmdrr50T60OG6vkGXGHsIXx/SNhc1d4oFeZmYoY+FIGkw1snL97wAF8
	HRYs4f7xdUy+4a5/oPCeu3SQHQvBaOBCCkGQta5hFt3fJ1TuojqgCsPt95i3GVrsd+EsNLTZZIP
	z+fEBGIRDGKPsLzRVYPB1M260ay3j6EDNlmog6JVYqFo+Fgaba8a7/7fpuCq9EXwYbR3dwAUMvJ
	OWmp1yRKj8yOYw==
X-Received: by 2002:a05:6000:2501:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e3eb247a8mr7109194f8f.8.1792936707263;
        Sun, 25 Oct 2026 06:58:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 13:57:45 +0000
Message-ID: <20261025135745.102970-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0

