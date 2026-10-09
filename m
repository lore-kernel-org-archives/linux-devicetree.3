Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E951B164
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571308; cv=none; b=gJnWJmGw1/uu06186FJuZRsj7UVqmrpUo8AL9AhmWhwhXKFscjXty9e3ao01IkRQtQk4Qv+Pl+8zlKyQAeLOGLWRiLSTPD9mMt07VCmJI3/x2deUN6ghHQ9UlszADQtND/JdNsX6f90PU2lrRvY1xl1Q4qRf3qD0Hm6/DrT3Amk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571308; c=relaxed/simple;
	bh=zWXMbUVBcviqxThu0500QfWeDzEk9IakSPzJWVquazU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYhQoQR4g9/0MvegKXrL+e1P6TjmmG9CYKhoPaAxIG7t/SD1ifZ3Fv7grPlI/L5AJL3Y0Lk7o7XWpP55Zt64ZegU1iuo3PKr3o/gT/MEUs+bxvw2Wuoc2rgEhch62yJlhLubxtormE04qFchGr9647ilxHUpzrtc+ZMd92X4KCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFwiRwzk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFwiRwzk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a166199820so973575e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571295; x=1792176095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc2TG1DWHDcQDJr8eEX9rjGsX23Y6ernBWy7IME0Who=;
        b=sFwiRwzkHn/tGbf+4cq9c/jWSzQlNOdB+X7Or4RtzvGWX8R/gBwyasJFF7ZRiyfwGS
         1hlStSKxYNP2AnwKR/+wTo4B6+LgAfwXydegopnCgz2LvNUz0ON+71Mzg2K5A0gO2bfu
         tfKDyq8Wh+R/SSndaZSAFBUQEUZnA6xuB4wWZJDGAv14m5Mu3h9YKza3pIpL5XvLR16s
         uHZl6zYeHRTfimFHQV6wQf7XRvGFAB2VKhpheGsEnbzv3MC73+qqdIUWKYvjmn21AK9D
         twgQsveHitrllGmodd/NHHJtYVwFpFmIo8GTyyo5Nq3AymVVQHczVACu4O5D5xyfIDOn
         VQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571295; x=1792176095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fc2TG1DWHDcQDJr8eEX9rjGsX23Y6ernBWy7IME0Who=;
        b=T88okpiuG1kgAfg1whpEBFSIGXc5SEaxnf5WKx+xWkxWpFrGHrTkElYXf3aEh0qYqG
         hJBxdHk4jPhGMjjUQssHYQpCatfkI/V9HurvijmmXnSMZIOYZoBG6VSqvvCrWUY2u2Ii
         eDlK+ezdUAjllJafAEy+rbmSblX6O0nEUAUTTsofC/0oyguW4EaHAi7c0P43QBKSWO6y
         u+vYyx/8iS/Y/4BesuiwPk5BJPJVtmo+cKathPsJaCP/6WF4+ILJsvoeIqRJIhQSP7gl
         CC7SNXqa+vvITxoEAdxf+0olQEeRDfudCk4830J9rMfBiChow2SmLEPK/N712vebh73B
         PvVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfSz80ss834GAsKSGNwEa0wgMU6Fyx/8TLr0fBPlTKJ90ZiJD2lD3xvMu+zd28TU+OioFrxXINDdXP@vger.kernel.org
X-Gm-Message-State: AFuF++nki7fptaRo86xuD3iaOG33Ob47ENMNkEQRXeIoY8z4+05bT9du
	oWTGYN025U/PZQlpmi0KNEYHRxtOGSeq78owij5Ss7WQPjbHgY+aRGeV
X-Gm-Gg: AYBFou3i3xf+pWi/0P4YbnhINykpV2wAp1zMss6CHvpCwF1iVhlr7HVK7h7gE7gGwsx
	V2hu5FIXd0QfrPoa8fA2GI5fOIkXUkLui6ymxJmgm0sVQy+ib7+Jw/vwcydkCYzmxmVlhbbRT8T
	Ns8uYA6ReTs+VxI1wBrk8k26+vntQ6pJMEtilmbNZJ78tWjmpVypyddFkD9C0d7Em51opFPwo4c
	yo1fiDOjqR3/BsdRqXV+p5+dhvLDl2K/YxD5dBacsIeTMt8Wzr1/q0JE4XXcrCaWi7Iimi40hxa
	wDYihuW8E09QmXC2J9aPKI0lYchNsYM7t3UqyubCHOkGabihS54c60T5eiXxPRStUPy9FdDi81Z
	ux3CUgBtgX4tDdOWSSBlKRJ3NdRNv4D2zDxLnncWb3SD8gis1Tb0VPOd59hUPZtSRtAGy0CME3q
	EPWFinFr1gYWaSFaDk3DTa0YZOOqEHyWNisqQifBmcqXlvXiCzV5BiiTe6i9gpwznqbIDQk7Joa
	aD1XJFusFqP0b8T89NIZiwPi5dE8Tt1Ml5L4Pg7WnA5ovqDRAA0HbLUZxi2fxpTGqUJTiuHXB/r
	rMamI/GSk1tqNk0oJw==
X-Received: by 2002:a05:600c:3c89:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a18e49105cmr44372635e9.7.1791571294838;
        Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
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
Subject: [PATCH v2 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Fri,  9 Oct 2026 19:41:21 +0100
Message-ID: <20261009184122.1378797-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for RZ/V2H(P) support, where the ADC supports both
12-bit and 8-bit conversion resolutions.

Use the current IIO scan type to determine the ADC resolution when
reporting the scale instead of assuming a fixed 12-bit resolution.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
---
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 041566f3059d..0703c2025e3f 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -60,6 +60,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_mV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -533,10 +535,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
 		return rzt2h_adc_read_single(adc, chan->channel, val);
 	}
-	case IIO_CHAN_INFO_SCALE:
-		*val = 1800;
-		*val2 = 12;
+	case IIO_CHAN_INFO_SCALE: {
+		const struct iio_scan_type *scan_type;
+
+		scan_type = iio_get_current_scan_type(indio_dev, chan);
+		if (IS_ERR(scan_type))
+			return PTR_ERR(scan_type);
+
+		*val = RZT2H_ADC_VREF_mV;
+		*val2 = scan_type->realbits;
+
 		return IIO_VAL_FRACTIONAL_LOG2;
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
-- 
2.55.0

