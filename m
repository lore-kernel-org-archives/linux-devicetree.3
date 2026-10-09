Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455214F7CDE
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571302; cv=none; b=hzOpAUk7J4CevSG9OmKND85WKerPZkyFVly+pJvTXJGjUHMY6PGO3vUmHhcmIf+B56YSEfD2ck971yEpu3Q4547LwJE6Fu+yXKEu6IXHFMNuDqXDWKe028tSRQxJNaUd/imNrTjcQJ+wk3ROFdHrhS3lBkZf6A9AhThvOscJwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571302; c=relaxed/simple;
	bh=X7VpOgMu1Y5jKPx40+Ypu2wTVKETwc5U/eJ7C7lnxyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/n7BIMci5IvGKpQyLhs95Cit3RGbF5KYSwis6RvrryTAYoeAQaE9PLm19H/edpt8vxBR2eB3RNKglTE4aTQLApMov04cnAabmk1fCWBExYjxtHD0hpc8TXkIzW4YPIJbglRePkFAC9DMFRQ2s92njap17V8csoMaK+6xfZpNN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjFH+ozE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjFH+ozE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so1143155e9.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571291; x=1792176091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxWSpxCZJ1iKjLEhOrBy/GRrfeHUzPGW6dWhrGGOwL0=;
        b=ZjFH+ozE8HftfFTOn6YzzaTRqB9Yv9xLyCDpLdfy3xHfkZlTjbIa7IRro8v6ec7Xzt
         lnl4lL7LDWbloSAoKZgurN5zUawYdxj9eQEMGnEOlXQEQk8VnnLPlFZi+NzkRO2ro3CB
         lhoUqG2iYDMMT6MG+K8FpEZDYYI7dV+tm2RFStPrpzuPLtUtJfVXMWIwVrvwaguAoD7N
         wnB/pInjV6Y2intMMvC5vHaJ5cJgz/BS+pBVR1hgVpICPjAFR/ny4V9sxo4+G3v3sMOq
         eS46rGcMYL8E863RqLJdTg08aKd6GuDWo/pN1jtkhZNkqg4ialrJOHw4Mmg1QV4z2qwi
         unbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571291; x=1792176091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxWSpxCZJ1iKjLEhOrBy/GRrfeHUzPGW6dWhrGGOwL0=;
        b=igmudlc8ruiphQoIIUaUyl7F6Iegu7hGsRp0bTcyaqrthbf8FHr6PJ9i6Qr4nqKvQI
         hce7J8zwfuA0qXsBdBHB9y9kniADT3+++0nm9Ob3SWMI6SduwIHHPB71C9q2tDJJyTIX
         YXUSNY/JxIhPxlNE1zIUxWJFlmmYDRcsmDY2ukrIz+0S48ACCi114JXsBe4E79H5Xvno
         9B0YC9BUPsD2eXZsVl+PW/RFPSwN3qKGP694VkEKyryQbIe2DKYltlAIWFBhcR5N4DPC
         2oa19xpPVsnWrKmakJVWPLexfOtAh/6nEAh5FKFZjXfLKWPN/XN2ddyxp/g1qF6nreOg
         qsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0WRMKbI7QWv/RWMaHq1oyO46Q+8Ju97zr+JDmY0WEwEukUY/whJD0YZq6NXwTU46HRzRCTsAx8EOv@vger.kernel.org
X-Gm-Message-State: AFuF++loqoDkW1ou/JWZJw/lDhykEc3IrVcSGHXcc30UJ/Tw5klRoHvN
	Tj1cXWKiOn7YItDafRYuH9QQUdrXLJ+wVZTECno3TmnmFpJyDF+oEIeZ
X-Gm-Gg: AYBFou0Daub6gWClHxuDjav2PdjxroGQmjHUdmM2k3BDK5LorQBaxq+KIe1oghVf4Lj
	mVAxrsxDyC7sn++L8jfOPU9/Ki6jInehOQQ6VPnridsfdoWvOQ4/iHCxetCkYf7Z7aIy0S5rNF3
	L+M3yUzSkyUIJ1E92GBYUbURIsID37X3vHPgfEd9PNrThITEzVpSPfWgGcVxg08LjnaGZ6E+rgi
	//apjyKOy2KCETrkOPt97ydditMfcWfXyS1bngjmwg5TaqGPl4VtBkKXgZ9zYGzBxzj/tTM5vJw
	4zOC+OW4NfnFr+LJ17r5UhQaDX5abDEclvzDASp1PCwBDXSIpe1vseSkVDNnqJb9dEfMayP7c2P
	D7rROHftmdOZMJbWiF+pVDJoQlQ/acDow4Zdb1WBiHJk/hm9oPxk2A5ihwFnIkupN+MGggzdrLA
	fdeJLtasFL+RQiR1Oyx40fJIhTdLtT7kavEB5SUtBkK98djA8dN3/rDKMpJlAEHNaEQLh8vo5j7
	eQfAf7jzikarKzw/10YooxafFQ8k0ZyqoIbbk9hteVAxPaPms+UzsJe6F+hMAa2lttIn3EZvyBK
	uHVOYcUo7RvGx+LCZg==
X-Received: by 2002:a05:600c:19cf:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a18e4a988dmr50455645e9.13.1791571291106;
        Fri, 09 Oct 2026 11:41:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/8] iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
Date: Fri,  9 Oct 2026 19:41:16 +0100
Message-ID: <20261009184122.1378797-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

When ADCSR.ADST is cleared to forcibly stop a conversion, the analog part
of the A/D converter can take up to 2 ADCLK cycles to stop operating.

Wait for the write to ADCSR to complete and allow the analog part to stop
before reconfiguring or restarting the converter.

Fixes: fc3b97dd71ab ("iio: adc: add RZ/T2H / RZ/N2H ADC driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
---
 drivers/iio/adc/rzt2h_adc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a1..a46726b054b3 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -15,10 +15,12 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kthread.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
 #define RZT2H_ADCSR_ADIE_MASK		BIT(12)
@@ -58,6 +60,7 @@
 #define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
 					 RZT2H_ADC_MAX_CHANNELS * \
 					 RZT2H_ADC_CHANNEL_BYTES)
+#define RZT2H_ADC_STOP_CYCLES		2
 
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
@@ -124,6 +127,16 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 	reg &= ~(RZT2H_ADCSR_ADIE_MASK | RZT2H_ADCSR_ADST_MASK);
 
 	writew(reg, adc->base + RZT2H_ADCSR_REG);
+
+	/*
+	 * When a conversion is forcibly stopped, the analog part of the A/D
+	 * converter takes up to 2 ADCLK cycles to stop operating. Read back
+	 * ADCSR to make sure the write has reached the hardware before
+	 * starting the delay.
+	 */
+	readw(adc->base + RZT2H_ADCSR_REG);
+	ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
+			    adc->adclk_rate));
 }
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
-- 
2.55.0

