Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB67526AA0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685785; cv=none; b=mkVW7khmmA5b/iDk/WAWEO7TXnSfZ9lxcASr7124JdkJF1RQJH0+h6zJslahHPZ5vxpUJU9KwuP5ws3uavneyCwxkGBX1taru2o+qhX8lku280o4zXHAHkV9rWmxI8OInSh/AabnTvAzqwQ8EdF9mO3LVB9Q/VksLNpQxrO5H7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685785; c=relaxed/simple;
	bh=gxd4NjTwiQfLfFXIDJZLSDsIqAyE9ZX6azzI4bFOI74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1DOdIg1JUN5M+Zr6CN0/3zO/NTDDM8Vx4l2Q4JhsR5IldwCsIeGPiXhMN+rPMfW+lWM3b78NcWbm+r4J1xPm+VoDSw/9ahxLIkfnwbEbhfF2JtNunOZjpR7oMNudxMQUIUuvPII0dQE3Cp0cZztq54jIRjIaRbVb3zS/rttLQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsOjdkpR; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsOjdkpR"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so4019277f8f.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685777; x=1791290577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msmGm5WStFQvq0wjc81cWcABYp/qlsGC5Rsr/nQSxYA=;
        b=DsOjdkpRCzNBQ1vNDwRRXcQu20EaWQ08KoBlJkx1NIUCY0Ewkv/ceRvrKEs4R+wPg+
         oeWkW6XmkhjC6R3nZTZMqIvw8jlMVbZsLTa1V8Rz795sJ8Myqfi4prE2GZxEgz5RzwpO
         RkOZwQtkUWXSipiU3eVJrHT99xOCU/zAneDKPycNYhGYy3pMonQcoAxzsXiWHMbFcOwG
         1trzUAI5V0eWu0Kdx3qgMCQQjN2taUIYZ70saMDVwNZsc8wTkrQYR430P+Q68E/EkwJR
         Zzh3+be6+0lXHf/33XCNt7x2B57dbPGWayifBX3mCrP9j8CTBpVoWTJVC7i6N22KLKh7
         OiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685777; x=1791290577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msmGm5WStFQvq0wjc81cWcABYp/qlsGC5Rsr/nQSxYA=;
        b=Xdb6rtErSMuNqwKUjSytbWe2Lr6VMSHn9OcQIt9bGfzP5HfvWEIdQSamvcfVUQ9r9N
         XmcvDJKKee1RKmQ+7A2MS3UED1Tyv8+9K3ex3bvFpTN18gbmvgOo13dfqPf45+JEUAvU
         h42gQI9+bfT2GWGIc+oWaxxTe06CAh7u+Om37sacIs5Y+ORM6HEJJbPIQvs8apwcYDyy
         dEbvgGgx6n+0xVY3osj3VlAt2hBqyFv2B5D2DHg21SugFnamU6m587TMD8bpDcywKanj
         iHpkHfmlQyVmbBz79ugZXnHqQELXhlyTmXF7wSiH+3/SZQfI4OSrTGFKMKAymMy7rwnC
         cddQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHTqWLCOljcH+YWNgp0wBSO8ci7qPgXwU3BmJyKcIRWMHGOTmq8hhjv/cfiRP3ZWyR1HTPkXxkzR95@vger.kernel.org
X-Gm-Message-State: AFq9FYKHBuD26eHhcGowZvIQ6/n9knjnex5INPBJPpFnA572cMkqBT+N
	IufMTcSu0ZySwUGrXiDmmoY50PwKHFQ0IaVPgSfKX+avmG10PkG2kULA
X-Gm-Gg: AYBFou3QR9+j3GJdZiOd8Js/JST2CqWTkfmMnvJ1IjkxC+LP22W2GiqGE1+965M//q0
	S+ddoUZANTbKfAKn98RB5io7KIlEaJlcKiC4zx0ihxjrYiMnBPU95i/iHpx6U3AXaLyZ4MB5V8o
	6TMQ5vwsq1up5euPuwgca/a1P4MzN3lgRAmVJE/L/t5/CPjWR2MwO4KoQIqFxZrKU+KXF3Damdt
	SRLLMvCCiM/9zSQhtRMuK/zQ/Q0IgGsh7vIYd5fVKH42AfBdZ9weAQeV35CIhDqkZ2NtV4rNye4
	Y1WSSYAKBC24KOCdHXxEBOT+KAncbw9ID0TGgR7j7P/qmWYu/xm8H9ZN1L9ylSILDn597owgbfH
	nmggehvlQXKGcsJx5kBw4JV7IJWXiNf9AgqFDFkrzwKeTLkoyGT3vMGuFzup8JqkBx1Vn7330VR
	8pRjNMf18IlepobtYRIY8wzySmoo4dWDLg7aDz1l7XoV1dc9OIn0zsl5PKA+6nqo13sdvHE7Eh7
	9NWMuAJccMnYpp4jsmEwnsKLZYl9kJSwsGiZiePNrb/2krFYaYg5E7A7Y70+umuE4CTfG2nKpj5
	7tb9MGq2oBcEAhNCPw==
X-Received: by 2002:a5d:5849:0:b0:487:6f2:1a45 with SMTP id ffacd0b85a97d-4887172593amr28549256f8f.18.1790685777142;
        Tue, 29 Sep 2026 05:42:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:56 -0700 (PDT)
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
Subject: [PATCH 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Tue, 29 Sep 2026 13:42:46 +0100
Message-ID: <20260929124248.237032-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index cf34895928f1..26028856b175 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -67,6 +67,7 @@ struct rzt2h_adc;
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
 	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
+	const struct iio_info *info;
 	unsigned int num_channels;
 	u8 features;
 };
@@ -760,7 +761,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -775,6 +776,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0

