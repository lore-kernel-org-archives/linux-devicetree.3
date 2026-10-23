Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778369;
	b=euuB4eMgsQaaDLcZVS0dWTCmxnDCQHKuNj6Rr6ui/1YCT5uBEabqEh4GLuDNxU1InJ74
	 WYgIf7KPv6gpl6TjdvNnw7tqs/nJbx3blAOrepomNfo7Qwadk3jQ3JZRUkEszWcaRCbHK
	 XMPaoOFlsVj4TmGaY8bG405kE6pcv7yGsI2EQboS1AQv7g5VsYo3hRcJU0PPzWC8/vltl
	 FIZpgNA3X2Bfg3Q2nbVkuym+VLHRi9E9Vj+7dMDym1OtjbhKM8AwyVso0uzPPtwg8X85E
	 mxuzYjmm11IqswEIz9wRFE2BGSXZs41nmERatF7IU4dek3qSw7/5HqkbB/u3fR5EsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
	b=cWqTRFlFYhZEhMIwbVI4rzLR9z/lR4asdQcN7yL5B+9H3q97xDGZUtmhRv3YY1/+hEuY
	 +axxGorAOi+dV8jw29K7kBziH7XAZYODFfq+wsEH3DpRhezo1K20Y2jH3BYOIIYS85xYr
	 jbw/hgWIK62K/44ulubXd39zM1hWzDqJdsgZw2h1rnV/u7uyOPPvfzWW14kEkalUkTptt
	 uwoz1ypnFFzXxQIkDWDRkbCrjqqdEFwf78Sbm/0fnGtV1ZWggC1KWXR14kmYVDgthhsE4
	 /hOmug4XF+8nVFoKEZx9EgSar/6B3pG71rjQiYGqF4PMv4Gnn2QtHxh/GXYuGkFJ4SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdotHO0L;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF5606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAF5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdotHO0L
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1458905e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778368; x=1793383168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
        b=TdotHO0LUw1mirdK8D1NBjojrI2VmIEU5egfzcux8YEvAuWfygCij3RiEUjE5TnLr+
         WpXsbdXZSHieqpN7o626WlDMX4LW+UwO1k1r7FK28CQpRKVsGCTkmdhAnsfVn1XawLdH
         VrL7GsQe+wE4DJmKu+yInnG+mXRyisWGjIJx3SDTe6Srbq58prtysyLwOoZjJfXUuBP+
         OE9A5kxovZsuX4jgkwq3urr0da7Xwfneug/sNNpWfc6kfkPcRWjeIVYFVmOiw2XlU3yB
         5uKXlSyKeJIS9LiGRwWSITgeo5jsJQ4ZP+ohwWxLHGN72YiKdOPgI+6WgJjycdoRAgh5
         K6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778368; x=1793383168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
        b=iHus8iwjpKOPSf8rsx8WQasVGJJ6bNsvYx9v5Kwtaqw8X0UiLA60oONPYTMrdvj0OY
         GvFBk2pgzq54Azmo3lEYU92g8+YmLrczzqXH/JjhiVlQyiuc6wALpGIjBT+Tod7EcpCJ
         x8c/ob1tbq2SbkOb1GRVKmPCa9UwjkwN+KwGbqBvlmGln4BKHfbBppgspsLGTEcb2ipm
         CZG/AmUzVf9pXPW6DPY+yCqTnxosFtyrCYQmIb9B9LgazbgKA0Yq+jz6LaJnymuhbBZg
         orxD4E2NWA78CTu4+/Q0qhtPZEdeD46XlfSHfZZn8jpPl00ebPQBgNapIg+fW6wEDEtU
         xtRA==
X-Forwarded-Encrypted: i=1; AKwUvBy4XpxiiAXZMQlyBveWr6zUDGP7bsW8TH2yA5j/+NxAuTIKi1tV0l+pquC9/h8Z1R1RzW46OM6mK9qs@vger.kernel.org
X-Gm-Message-State: AFq9FYIChLXqjB8yLxG1R/G4Z9VNNlqXqQuYzITIg+JssTYinmCy3DKQ
	gn1A+LfflToWN0wQw4qgZFhv78+lm3m2M+yaaKe4GO1pIq4J5xZrpgOP
X-Gm-Gg: AYBFou2tDy6JtsC/omtIXxLO2DNRAIUrED40MLwljNwPDyvRhksPPOien9UD40U34dA
	Mb2I3tTVN9jSmW1/zVml+Wmn6Fhfb3/y3KuB7q0M/Yp/diTyrj51nsga6DpQ0qC7RavmUBTktly
	PX7aTPxkeFnK6zsLfrIETU7SV/fHLEeZF5Z7NF3+ET+fWL/fHmLvqvyeIt+lELpAsUKqhaEtm5h
	QqZTzxkJ8mr89VDgV3LVVVBI+YPl4azH+7s/FxBCZm6wEU5RSbNn5XcROz0w41peNXS0OfEla2S
	glXe4MiWukVvMXdv1IsBwXyam+nntmflfVyEp8g6YA1zRoL4MfiqPnGqfnNn3T0e/ONN9MCfdMY
	m81BwgOqMgR2Dc8qZANkPu0U8Z45Ww1TNjYdKCDj59Lrtnh0D8T2j1NP85ux4Oo72+J+pDG0IgQ
	EqR5pSZc3JbnKZxch4laIICpuStFu4q9opeNfzZsuwOar+qx1pl+NFId7cR8rLq7aQuImbdqYpo
	M2Euvg1/jqeID3ecgB0qXCDh9P9lrwcFWW5Lhwj7c/BJ0ItDQoiEAKY6ECcvX7MWixIyS8tc+YS
	2vfUs06E3RIioyp7kHWAEmXATLibPqqkpbUa0lcnBTCgYPAshyfoa7/RkfkaNUuqYYOKYq9OmYa
	UicKUB2YgV3Hc9bOtQESHvvDuTMWDJww19M3/X2TTH46e
X-Received: by 2002:a05:600c:4e8a:b0:4a1:e7ce:10a4 with SMTP id 5b1f17b1804b1-4a211eebdc3mr52878955e9.29.1792778367523;
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
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
Subject: [PATCH v3 2/8] iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
Date: Fri, 23 Oct 2026 18:59:13 +0100
Message-ID: <20261023175919.160103-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

When ADCSR.ADST is cleared to forcibly stop a conversion, the analog part
of the A/D converter can take up to 2 ADCLK cycles to stop operating.

Wait for the write to ADCSR to complete and allow the analog part to stop
before reconfiguring or restarting the converter.

Fixes: fc3b97dd71ab ("iio: adc: add RZ/T2H / RZ/N2H ADC driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Avoided splitting up the ndelay calculation into multiple lines

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
---
 drivers/iio/adc/rzt2h_adc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a1..131904d97b8c 100644
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
@@ -124,6 +127,15 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
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
+	ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC, adc->adclk_rate));
 }
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
-- 
2.55.0

