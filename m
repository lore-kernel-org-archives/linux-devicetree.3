Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A403936B046
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782624999; cv=none; b=NSpnSe+c/CUUup8XVcqqzBGqkRVUXDiLBhm/BWq75NYtZdR1ikUJrNyGfSCA+Xo0ez+1xYjsYt8Hu0yhzQSFakeYBgM15iLTmaDQIXa26IrsOFC6cWkBuX1f/8c7sIuk6lrWOJziCcI5VpRbo56MKFPtzLG/cFb0YSbN9LsVRFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782624999; c=relaxed/simple;
	bh=wB1Of1Emb/yY9dOSMsbzG5YZygdOZKgZHPMDGP/bhpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMZ2JXrDgYvia/YvzJ/sfkVLkLLMhMA89Dtp6fgKpMjBQ1IIHbw09i+3R2A8i3J2TYSGI3CqjhRCrl2VPv3DQHNXAPsKFrcdUQ77uJkKYGnNdCyqpHhh+GzUHxM4BHtTIn5tr6Ccdmttpafxj/RgjWeVN90EV+FUxJTwCwagV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAHftbmy; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAHftbmy"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59ccf81e74bso818714e0c.3
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782624997; x=1783229797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axL2qrGYMhZJMMxO+yIGsEundWIHk6gC+BcdBLADAz8=;
        b=gAHftbmyDRve3PYH5TrkgC0C2YeVdDkw7f03s9FeGvlN3zednVLHnxFf6G93QSlzfQ
         Hyxb4I9RgscrQM4H6vzkls8uqcBMjUbXmhMJZzsji3mMAMnU+Q2WGgajaYqF9d2dbcpO
         BqP+u4IZnCXyP5lo36qGGfaD50OL6yGy0gcx3+5l2rIRy2BoelbBfmM6YYaslu6is2r8
         C+aDZXhQE7qkI2zi7vmNp+7Dw6t0rqDle8MVa0t7JAtWYGjaDyU0GATh3WMYDQ/NwPyY
         Ae5mvREk3PRBLZ1L0BaUW2KDb0kz9PTj3KeUSumWSeKNnVDlqwOkQvc8tHX9vXlnhJwN
         ovfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782624997; x=1783229797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=axL2qrGYMhZJMMxO+yIGsEundWIHk6gC+BcdBLADAz8=;
        b=qet5EB1HGMAYYg/DzFVG4UuTjVFfZZI8d+32AzKS8WEYki6l/eSzksZcUu9uzswc4t
         hvzRoJy7klSvv7LyAG7ggk2kMrtSB/9nIIEed64QJ4yo4FyHTTEZ6WkTIZWZWZVZfDRr
         5BVfRs9vPDi9p3Q3K0H8Rs0DnVE6QoXrMBIRWOCI4l22BOGl8eUbSf7ManTnB6N16OJV
         P/TRK+o/vriVjP/UpW+iSAoDEZx70ebWdafkLAP7FoFUp9NQrm2CR7N3WNfloxLlG1e/
         14s5cy/9lwmryR72eL1BPEPHYyH4pbefr6GgmM3rBrFQBkVUNz/XuzLBtWPNJ8Mgqac6
         2uSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM/o2CIVnaS2AK2nly9a6d+KZO4IL6BnpRmRIf6U/3yjv3CaP9XIFqar1ZqTcxFOqlD8WJS48dzjCX@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2Emzf69UTWKhLpLANUmZFO5aYiOUZJXRq/7DwrrvstpKLXnv
	/HP5g/c70wSKO4gfOXVqjuaoFmdxXxv/0EEdK6xNRxIyU19bbyl3Xn04
X-Gm-Gg: AfdE7cndDgKO8bCDUNI/Givs7NCowLTMVG5++sQsmBBKni4tzC+INuyf/hq4jCBlqje
	yE284y/DcJGWzrGh2C3fZtYCnn13MlZh9Dzsi4cHVauhHte4KJX+mY513i15D3YmMtGpsUBE3Ij
	yeCPxJ9NOgdwMl/mAQVIZcWqOJhIyi/1kgiC9H752Ojz5nKkNmTHNQxEN6zXR+7OZppLda61SLp
	Xw5N13Rcc88/tkb0M0b/m7OoJy3IAq3Sw715kbpJXuNrfKNTGz33+1N0uYi8APT0sgGfyWH5CuT
	BMil5Nf+UR3naXr5AaxYHT4TVwfWPa4VmsKfRICRAFcSuhUO3ydLq7QxbB7i2CjcOKMsYFTHECl
	JiEz9VSforAv/6PMCqai+NsZkKmSp0ee49JQZ3RyNWHNe5Ze0IsBIz3wBk2YBY5TAODExigI0z5
	EMmwPAziMlAae57SZK
X-Received: by 2002:a05:6122:490a:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5bd69c242e7mr5142476e0c.1.1782624996508;
        Sat, 27 Jun 2026 22:36:36 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda2dd64c3sm229003e0c.1.2026.06.27.22.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:36:36 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 28 Jun 2026 00:36:06 -0500
Subject: [PATCH v2 5/7] iio: adc: ti-ads1262: Add conversion delay support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-ads126x-v2-5-4b1b231325ba@gmail.com>
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
In-Reply-To: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4445; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=wB1Of1Emb/yY9dOSMsbzG5YZygdOZKgZHPMDGP/bhpU=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkOm278yc1c6fU9dP4EnjeTWPRcrsncCLe9/PbgPYapO
 qm6ytumdZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEPh1i+B+6LOhYX0f1Wmnl
 44c1uW1VNP691cr9kuLBUhf29rhioRzD/wD9lTGTt+3y2n9adtrEBgvuHukzoszfRCcvzmhgbxf
 sYQQA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Expose the programmable conversion start delay as a per-channel
IIO_CHAN_INFO_CONVDELAY attribute.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 63 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 8921eaae537f6b0a..4ae22c1b0b4b7d79 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -141,6 +141,21 @@
 #define ADS1262_MAX_CHANNEL_COUNT		16
 #define ADS1262_XFER_BUFFER_SZ			11
 
+enum {
+	ADS1262_DELAY_NO_DELAY,
+	ADS1262_DELAY_8700_NS,
+	ADS1262_DELAY_17_US,
+	ADS1262_DELAY_35_US,
+	ADS1262_DELAY_69_US,
+	ADS1262_DELAY_139_US,
+	ADS1262_DELAY_278_US,
+	ADS1262_DELAY_555_US,
+	ADS1262_DELAY_1100_US,
+	ADS1262_DELAY_2200_US,
+	ADS1262_DELAY_4400_US,
+	ADS1262_DELAY_8800_US,
+};
+
 enum {
 	ADS1262_RUNMODE_CONTINUOUS,
 	ADS1262_RUNMODE_PULSE,
@@ -225,6 +240,7 @@ struct ads1262_chip_info {
 
 struct ads1262_channel {
 	u8 input[2];
+	u8 delay;
 	u8 filter;
 	u8 gain;
 	u8 data_rate;
@@ -281,6 +297,21 @@ static const int ads1262_data_rate_avail[][2] = {
 	[ADS1262_DR_38400_SPS]	= { 38400,	0 },
 };
 
+static const int ads1262_conv_delay_avail[][2] = {
+	[ADS1262_DELAY_NO_DELAY]	= { 0, 0 },
+	[ADS1262_DELAY_8700_NS]		= { 0, 8700 },
+	[ADS1262_DELAY_17_US]		= { 0, 17000 },
+	[ADS1262_DELAY_35_US]		= { 0, 35000 },
+	[ADS1262_DELAY_69_US]		= { 0, 69000 },
+	[ADS1262_DELAY_139_US]		= { 0, 139000 },
+	[ADS1262_DELAY_278_US]		= { 0, 278000 },
+	[ADS1262_DELAY_555_US]		= { 0, 555000 },
+	[ADS1262_DELAY_1100_US]		= { 0, 1100000 },
+	[ADS1262_DELAY_2200_US]		= { 0, 2200000 },
+	[ADS1262_DELAY_4400_US]		= { 0, 4400000 },
+	[ADS1262_DELAY_8800_US]		= { 0, 8800000 },
+};
+
 static const int ads1262_pga_gain_avail[] = {
 	1, 2, 4, 8, 16, 32
 };
@@ -473,7 +504,8 @@ static int ads1262_channel_enable(struct ads1262 *st,
 
 	/* Avoid using guard() here to mitigate AB/BA deadlock warning */
 	mutex_lock(&st->chan_lock);
-	mode0 = FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
+	mode0 = FIELD_PREP(ADS1262_MODE0_DELAY_MASK, chan->delay) |
+		FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
 		FIELD_PREP(ADS1262_MODE0_IDAC_CHOP_MASK, chan->idac_chop) |
 		FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal);
 	mode1 = FIELD_PREP(ADS1262_MODE1_FILTER_MASK, chan->filter);
@@ -491,6 +523,7 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	mutex_unlock(&st->chan_lock);
 
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE0_REG,
+				 ADS1262_MODE0_DELAY_MASK |
 				 ADS1262_MODE0_INPUT_CHOP_MASK |
 				 ADS1262_MODE0_IDAC_CHOP_MASK |
 				 ADS1262_MODE0_REFREV_MASK, mode0);
@@ -625,6 +658,15 @@ static int ads1262_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT_PLUS_MICRO;
 	}
 
+	case IIO_CHAN_INFO_CONVDELAY: {
+		guard(mutex)(&st->chan_lock);
+
+		*val = ads1262_conv_delay_avail[chan_data->delay][0];
+		*val2 = ads1262_conv_delay_avail[chan_data->delay][1];
+
+		return IIO_VAL_INT_PLUS_NANO;
+	}
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -647,6 +689,12 @@ static int ads1262_read_avail(struct iio_dev *indio_dev,
 		*length = ARRAY_SIZE(ads1262_pga_gain_avail);
 		return IIO_AVAIL_LIST;
 
+	case IIO_CHAN_INFO_CONVDELAY:
+		*type = IIO_VAL_INT_PLUS_NANO;
+		*vals = (const int *)ads1262_conv_delay_avail;
+		*length = ARRAY_SIZE(ads1262_conv_delay_avail) * 2;
+		return IIO_AVAIL_LIST;
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -685,6 +733,17 @@ static int ads1262_write_raw(struct iio_dev *indio_dev,
 		break;
 	}
 
+	case IIO_CHAN_INFO_CONVDELAY: {
+		i = ads1262_find_two(ads1262_conv_delay_avail, val, val2);
+		if (i < 0)
+			return i;
+
+		guard(mutex)(&st->chan_lock);
+		chan_data->delay = i;
+
+		break;
+	}
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -807,8 +866,10 @@ static int ads1262_alloc_channels(struct ads1262 *st,
 			.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 					      BIT(IIO_CHAN_INFO_SCALE) |
 					      BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
+					      BIT(IIO_CHAN_INFO_CONVDELAY) |
 					      BIT(IIO_CHAN_INFO_SAMP_FREQ),
 			.info_mask_shared_by_type_available =
+				BIT(IIO_CHAN_INFO_CONVDELAY) |
 				BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),
 			.indexed = true,

-- 
2.54.0

