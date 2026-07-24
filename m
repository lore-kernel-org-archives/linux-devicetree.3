Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAF63A6B99
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884604; cv=none; b=pn9r+mE3BI3iNyWnqWTo+qjlMyhw8bJ05bmDQOuKSBpEN7cKIVrFbAnh6mJP4Nc0rPeVGOPq9P46S4HTryd0ed3o3BuW8b14dDPphEyOADVT4NBC/jeaAGvaMIn5kz4uWX3OpxdF4h6lduiFabVhvNvRyf1xRymDoe1KRpiSc9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884604; c=relaxed/simple;
	bh=BP5isHWJVSgsQc7eHb27miIKkXny1ILGVxUFS9gjsgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/0sMUg+dtyHQ/xaV4R9pWmTxxfjeVVamuqylXiHpeT7Ho2kt9i6spzcK8wZZito/aMrIdHt3HJyNOlIy+lR/zZLKguRKWidMfzLfxWhJzy/8XkXDFhPbTSPbXQK9HAv88BqQWb12Ow44FI+9yoqPfsLX54+URMf89JKgOE/iWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckfVSnnc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckfVSnnc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfd2e4e83cso347785ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884598; x=1785489398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjB+Pa1McUr4XyZZTJgTh82TNmXCDaoM/UdBX+H7SC8=;
        b=ckfVSnncK78p/IeyTdUn9UhFQMvZDSmQMRSAWFoucAUxBe2jYn5+40QL3DixOc1gb2
         UupU4EMf+wpQ+4wOBCn2/YCdyvHAIQJJGDOgF1pu16pCbYhbIQHIbHdvkoMhES6F2H3N
         +fRTsYYu4MdcgenaOKIp06yEv0OUvxmcftsiVvR0oN4u2vtSu0sOF6OhCRfIM6NVPBiT
         uJ7Cmt5oZr8fwzMBJfeXHO1kZgfUTlVq74jFPK/tc6Z5r5qoh4M67rjIefYmBamTyUEo
         ZqdLobe/p6b3yCCSJqWQOmGxphRzX0wGfRI5vPfW8x7kVHt8Vb0+b8ULp0fPw0en6Z1j
         rG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884598; x=1785489398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjB+Pa1McUr4XyZZTJgTh82TNmXCDaoM/UdBX+H7SC8=;
        b=PQb9rROcmN0DG9fh2b6Ljgn6fq+xtnHkIKGzQYI8DzsEiWqMXSabZAvuiDDwYfDf92
         TYkDytTvKPYtp3C68y97IYp+64TbSl++KPgoeP3IbN6b/HhTJjIV2fWM+Rl1H2W1PsTK
         00/dyeRxaciruTvGWqG7JOgD8MKFayuRqENODqojuGrewaIwdTQXb+0P0PybvagNv+OK
         nYupRQGBpJWJEfDUMTUxBKGgx8nkdSP+GhYN1DmgkC3v6V6QIIdI0hex+aodUUqlGMWr
         9igU37kbGIeW+cotgcs6P/kKJih/9XMAZ7ut3dYkJRCS5+kfIaY+J4AJiuMHyRYSH/wj
         xZxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWzg9bndLn/25Upb00b/Kz8S/AUvtkGxmk+dBo5mQhCiOHp6tlDDBPsjDRZSMTzAefSBOfz6VRogJZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqJKf/Sy12YN75TqZIaHstk2293mt3mdI8WAPx7ZSqetFj2MP
	iu185Cr3qQWPP9FNTqNqn8eGVZBTr/OQMRWE3CJB8i5mVNG9uzQBcpSY
X-Gm-Gg: AR+sD10WPpMOwl9mQnGPpSF9zQ9RsCTinI4AW844apBE4jieEHMgFGb5Fwq5/1bwgrF
	b/meQJybK1KYufOXQg8lOFkgcG/2p12aLKW/tzWkVib55phK0EzuFliDi2k2PixSRPR1wmzFmha
	eAVRx7qKv7KtcFkqukfCil1IQ06/LK6mueWvKSkOL+BGKJCuKUgWfPHjxyHPFzxFEGFUrZAzJfJ
	8ch22kF83k4QaiF932bpTT0i2M0rgMGmjJE6/HQyZauTpwOp8ATbHAgxOj4pYfM5qdA7n+eftv3
	gK7+se6pAAldLb93QHu7pL50ZM7BEDwLdvHDoPO5eby5lfUxvEzSpheYesY6Q595d4bf3ZlFN4T
	EtOVoNKvZXug6SXoJk80LunqCxQpctDqfLF7Ji5OFZD6FuwZVGpsjdRF+aDn0Tz3rNsQH6GLIzj
	CHgQeQL8Pc552gg2Q=
X-Received: by 2002:a17:903:1b4c:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2cfbc786e8emr26645295ad.0.1784884597950;
        Fri, 24 Jul 2026 02:16:37 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5420:f772:24a9:f23f:ed43:a5ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df097e0sm29005610eec.17.2026.07.24.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:16:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 24 Jul 2026 14:45:52 +0530
Subject: [PATCH 1/3] ARM: dts: ti: am57xx-idk-common: Remove unused
 ext-clk-src property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ti-omap-rtc-v1-1-ffef78853cd6@gmail.com>
References: <20260724-ti-omap-rtc-v1-0-ffef78853cd6@gmail.com>
In-Reply-To: <20260724-ti-omap-rtc-v1-0-ffef78853cd6@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884567; l=818;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BP5isHWJVSgsQc7eHb27miIKkXny1ILGVxUFS9gjsgw=;
 b=Arb/QliFJxM9kFp5UEcBYDyYbtPAeByB6h0+Q0mOkm4zPN0HBl3kOfB75858CY6vRmSGtm4HH
 MnGoAvMiTBTC6D0+JKrsHhb9T3VCOWeCrgg/sO/xnuo+FbPJsRdeJFu
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The 'ext-clk-src' property is a legacy, undocumented boolean property
that is entirely unhandled by the rtc-omap driver. The driver instead
determines the clock source natively by checking the presence of the
"ext-clk" clock via devm_clk_get().

Remove this unnecessary property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
index 43e3623f079c..ef4bd554e92b 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
@@ -445,7 +445,6 @@ &uart3 {
 
 &rtc {
 	status = "okay";
-	ext-clk-src;
 };
 
 &mac_sw {

-- 
2.55.0

