Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26BB525A6D
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685783; cv=none; b=pD0VSRu9ITihYkGMkz4ub7F7zuCKWzaB4U8BMIznr1LbsQd8mPwqN0UPhz3+6e+lwFb05dlJPsRZERj5+yMwfIFL9hvMl89/Ev7zUZGnMmpYlgjGaYQywpnyHAb0uPxtSEQ9NuBBtHtzE6M6OjOX6ofpveIGpS3gL2aFVZeFk3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685783; c=relaxed/simple;
	bh=wddaOCHt1User2EKSIHrJqu11Cwft39/jyIoFbIFb/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O41JYgIKPjD/brwYAIp7Q6Rf4L3hvh/wsQXP+Da9aKY/xaRofmUWy2ZVgQCXQn1+h91kAoxRtMBbk1E0uelJTB0jcH2N1PEy8IJvTdccwgqvrnb92zF1ODqf9DZ9ai80I9BK6+Vu3VjIjIDB/z4jWSyzy6ovIB7yqHy0UycO1zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK+JxIdr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK+JxIdr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so18160875e9.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685778; x=1791290578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07bePpgedx8t7xEiy03MlooYZIPXYLGbtGJ15Yyblag=;
        b=OK+JxIdrcnn+Pa7bC5sGggzmkZ/PcqDKxaYzgJ9QeQkpYbFK4e8aCF5y8X66HD/tbk
         3cLxoKtxwZiWr3jCJj5DP8ND9daBSV9cveVHKxhR8YFh+ijx5hXoJ7eYTpNzsML46v+p
         ZnpOi1oyG2+G4//5P5XElArzGcGkG0l0/C1iVBlTSWt0oMoKHts1QUHnbw+gFwfZLNel
         0aFhUgN7xlkrOZphJzLhqykHMWGaEQLuhcj3aU0Fb9rCCqf5tyPOqOvZoQki7VxPD3Zp
         sIbYqY8kl6f0ny8H4wUBughKP7RH8tz5U81S5huFZw6lFPeP9zoccZrju7szGbHXOP/q
         GYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685778; x=1791290578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07bePpgedx8t7xEiy03MlooYZIPXYLGbtGJ15Yyblag=;
        b=p+9GNj8Xm7YndHorOfspZLqXPv0okLvGdwotZwKJgZV5FDBCxiVHYLzkXXqcuf0cbf
         PU0u1jMJ4+EJJ2CyDxCfpkvcp6+gxn7Ull+UsOLwjFb03VqxAZRWmnmwL/XLjiahmpgp
         xhPEgxPGhThPRfLyuASqpGfQd7jm8J8nVnXqVCxOWS+zfyVjKq3TQ1GJAwNqmEp+dy4x
         K93s3DuKfKxRH2vXZZdUO7LEPjijAfaL6sJUX0Z61zuZ3Yzcy+cxokiAgU6xHaXYJgH+
         oJM1RFE7NeRkeKAM3XagVFtxhGfAlr9JaRRNRljlj91+HoB6aGsRujyiXGUQ437Gor6s
         4h2A==
X-Forwarded-Encrypted: i=1; AKwUvByHj1CMyuHzUalV/BDqSHzd8AEYExOCkxIw0tjMZUkedW30zMUuHjX7L0Upq6osqPDElOH3E64eNiev@vger.kernel.org
X-Gm-Message-State: AFuF++mNVgqmTdM4bp6XxP0nZf7RbR66rjl+jUU9hEaQGPfCwvyFfkrB
	8IBH1b5pbLJXGI6pZ+gcGIvOFfBZuFFmJCG5LcnucL8hfLBWGnPXt7ye
X-Gm-Gg: AYBFou0cOBwDZBX0jLIlLH2LKK8rzcCmd3wPXqEy8gUzTA+LCQSgDso4eI3y4lKm6wt
	puChp4X2VaoD72KjmootDOva9VLsx7mGSdH1viHcY3rMdcHk+4vjatuz6FhtBmCp2yyTT1xywKw
	H6a6WLZj9KbXhUuxPjRpzcrvWdKIZfjxI52fyzKopFXfsbjXW74pUTvnFjlWrX6KzwhhvWMV0vY
	84GcEVuS8iQxnuutdZ/pOr+eQ0blwsyauLcyK+PExA8dXx9g+xKPGIa0XhtF4t+oztoCh3QPRCu
	0pcX1oCUWFVmvwTkgdVoJe/eGRc+D9yCWjV4aljxywJOtOzNcvCQnpe7953jOsNN9yhl9WAG00y
	LdcN7n0rYySsqiumoQaTmF+mqa+Ovmu8iuf+nF53htFUOzzrYIU7aRV6/C5kay8dRrjSBC/+G4/
	N1egdNhgvkgNXaJ6femT0uDDD0DjuNehyKIcHq8ohBRDNU1PmWxYk00S61b2do5/mEEJOpCGNnp
	kVQFUjSYKUvxkO0xdOjFkegamJI3HShkHehaKL/bWRN26+bUTYLMYEe4NRk/5WtmyIEE4lWbx0i
	CB1Ox2XfNUTUh/zbyg==
X-Received: by 2002:a05:600c:46cb:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49fe7b52f06mr287934665e9.2.1790685777933;
        Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Tue, 29 Sep 2026 13:42:47 +0100
Message-ID: <20260929124248.237032-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 26028856b175..953736b5475a 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -59,6 +59,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_MV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -529,10 +531,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
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
+		*val = RZT2H_ADC_VREF_MV;
+		*val2 = scan_type->realbits;
+
 		return IIO_VAL_FRACTIONAL_LOG2;
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
-- 
2.55.0

