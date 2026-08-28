Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54063D3CEA
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899142; cv=none; b=hF1AmYf7NZxOe18Hulr8IN/W0fbfY0dfS9ZoVJl5Y+a0a9+7Q1X/BzuSa5h7lrLn32MCNlxYDznxlAXEeQT47nC/0JqzNs/BKXMvhV0+wq7/hwoJPveZocmUsWe9FQ8G9eDCwxxFJTc87e1A39+OREVuPNsGvOj6DejMl3E1OK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899142; c=relaxed/simple;
	bh=kIuk2ofxCh+dUdzkbAX8VlLSbdR9YEZLCsPMWA1qZzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtVSHGEc+mrowc11dh4XESTnpVn3ISa2R3BR8HqIbc4jPL/AIUQxdIcwqmG31PY9I1+iyztRG6DlSVSpI4Ga/BHUCxTOKGDsV61Q16Kt4rwCTk1rA6ufIHah60sj5/cEWONhRUgQtMZi6AvnkWaqmgSqaHHxI/b2yuNCRG4+1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oU/PGske; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU/PGske"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso481471241.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787899138; x=1788503938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWgdfydiuC7rf3YRqBTUUeAY2p6P2oJlqHhrcTc/eMA=;
        b=oU/PGskeFPP8KhKis06W3gbQ9JaAHNKkhB8bNSX7PBSswdxF4zSBye4/lZ5dIJBSIV
         vGuZ3OZBNi7jz+DNuu0YRwrLrCyFtVIJqD1nPEMGH5duK9eG1UupTHHTkLIB9pgCl6EI
         inHMlOw61bHLwA5o4BjwBf64XDuQ0dv9+Sg8vFoVzAoNTXhC3u3FQEn4BsBQXyrYH+Xn
         ZTQna+UPs2B1q0wEc9eFi7eZNuVZWQS1gzJ9eSXcpGIuPkHW+Xy7R2lg0PW/qOw8b/c9
         XizFRTD2dbRA4MTHQxrqIiYB/6Sl0KEuVmEoROtusNX1nhKBgLneBw9JPUdpu8SbZj8m
         PCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899138; x=1788503938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWgdfydiuC7rf3YRqBTUUeAY2p6P2oJlqHhrcTc/eMA=;
        b=HQMf2kldU00v/qXeikqzCL9KVF0BHEOI2ErdpY27qNqQC4Zx21ryO+HkYaLt1714Nl
         h4Du5C+5CXakOu3HQBe4NklWqTMPFKEoNj0xNes11HOy+ctyYAfzKcbqzakrg1EufNpi
         SBrUhXSsCDiRJyZk9grM6I5WFu1MDUK2kCtXWC2pU/D3PF9Gxlgs8DQdqoBB1GZprlWW
         M+lZF5+JoX1BANGIJ0QRj2MmXBHPqt/2I9oFJjOf/+ggKvV/B8PCPbfcmwyuqXWUWNNo
         8U/u3yxLDJC/5VHoIT1xtJNeGbgQVCjRx/ZLWyQ9Ho7u8RKnCcpae85COl6Jat57ojtE
         Q1+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro/DK602MWA90vbSPeboVhV8NfrnqfYbu7tIimXGBOQzeQZJ6741oi2elsXKmpG9a9b0/79z5di+Cp3@vger.kernel.org
X-Gm-Message-State: AFuF++nGlkYIvjiSXw0feGv0ENKxckHnLd8QaWrguGqrqtC04RHWbTEX
	2EcD6416aEhXlA+Rkv9bCZVZJNfboW5Bg7YLKBKhDhJlAuvhLJqPPxXT95BOHQ==
X-Gm-Gg: AR+sD13ZuwsqNpt9ayZ61uXuGhywNundMxZkBT7EWdTKjibwWJoBaUD8DzJjvx/MyFk
	dAuBmxalfn8sEqhnVAlGegB4+B4wsmuKf0TYuob3quffpb187hMUWIQzUtUcj6c2b7LF8n8/Kte
	oy4RYBwx9hqn1iI/YYfhY8pdSeJ7O2hZ56vcH5pnA4mLL2qn0b60U8666vONso9rxldWCl/Olgl
	qmBZKFKTIEzLz0zYBekXQvvGP5TkVKXoqg3myonvY5dprd5ckSEjpxW4o0npdT2UCq6EwvOcVFx
	C9BpG9OVgTGNUVpbxzy50wQzhFzjcG57JghnePpWsOgXRgYGnPgngPh11gpX2dyP5TTbGgwFITm
	R7FHsrQB/UzkhdRwWFMr7rNGVIfeC1wy4rKzDgxIJjhw+/e80AvrKIsGZKsIHv7bBqY+AmYT+iR
	Z246MwluW31enhXAWL+wCw6OOd4gNiEfJsbv0cu3ZDaURgvjy23odpcdMGtw5vE8qV
X-Received: by 2002:a05:6102:149e:b0:785:5a17:739b with SMTP id ada2fe7eead31-785939481a8mr1780174137.0.1787899138581;
        Thu, 27 Aug 2026 23:38:58 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e849d8494sm454195241.1.2026.08.27.23.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:38:58 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 28 Aug 2026 01:38:25 -0500
Subject: [PATCH v4 10/10] iio: adc: ti-ads1262: support common mode
 supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-ads126x-v4-10-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
In-Reply-To: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=kIuk2ofxCh+dUdzkbAX8VlLSbdR9YEZLCsPMWA1qZzM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkTdd5oJopumcNwqnO9zPc702t2xVY/XeTq51qZURJzv
 P3+qzMvOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiadMYGT7bqqrs3aJ1aH6u
 r9u30iXndi5qMWG7xW12/NSHZxlVp+wYGY5yzMxfUbYnZOGh+VtvHMrtkT+x2PrumcJwheX36/f
 diuADAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Enable common mode regulators. The usual configuration is to have our
own 'vbias' regulator connected internally as common mode voltage on the
AINCOM pin.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 4784142f35c9..c7ad1cf1a15d 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -240,6 +240,7 @@ struct ads1262 {
 	u32 rref_ohms[ADS1262_EXT_REF_COUNT][ADS1262_EXT_REF_COUNT];
 	int refp_uV[ADS1262_EXT_REF_COUNT];
 	int refn_uV[ADS1262_EXT_REF_COUNT];
+	int common_mode_uV[ADS1262_INPMUX_AINCOM + 1];
 	IIO_DECLARE_BUFFER_WITH_TS(__be32, scan_buffer,
 				   ADS1262_FW_CHANNEL_COUNT +
 				   ADS1262_MON_CHANNEL_COUNT);
@@ -695,6 +696,13 @@ static int ads1262_read_raw(struct iio_dev *indio_dev,
 						      scale * ADS1262_TEMP_SLOPE_uV_C);
 			iio_val_s64_decompose(offset, val, val2);
 
+			return IIO_VAL_INT_64;
+
+		case IIO_VOLTAGE:
+			offset = mul_u64_u64_div_u64(st->common_mode_uV[chan->channel2],
+						     NANO, scale);
+			iio_val_s64_decompose(offset, val, val2);
+
 			return IIO_VAL_INT_64;
 		default:
 			return -EOPNOTSUPP;
@@ -1133,6 +1141,28 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_parse_common_mode_supplies(struct ads1262 *st)
+{
+	struct device *dev = &st->spi->dev;
+	char name[sizeof("aincom")];
+	int ret;
+
+	for (unsigned int i = 0; i <= ADS1262_INPMUX_AINCOM; i++) {
+		if (i < ADS1262_INPMUX_AINCOM)
+			scnprintf(name, sizeof(name), "ain%u", i);
+		else
+			scnprintf(name, sizeof(name), "aincom");
+
+		ret = devm_regulator_get_enable_read_voltage(dev, name);
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get common mode supply: %s\n", name);
+		st->common_mode_uV[i] = ret != -ENODEV ? ret : 0;
+	}
+
+	return 0;
+}
+
 static int ads1262_vbias_enable(struct regulator_dev *rdev)
 {
 	struct ads1262 *st = rdev_get_drvdata(rdev);
@@ -1902,6 +1932,9 @@ static int ads1262_parse_channels(struct iio_dev *indio_dev)
 		spec->info_mask_separate_available = BIT(IIO_CHAN_INFO_SAMP_FREQ) |
 						     BIT(IIO_CHAN_INFO_SCALE);
 
+		if (!chan->is_resistance && !spec->differential)
+			spec->info_mask_separate |= BIT(IIO_CHAN_INFO_OFFSET);
+
 		i++;
 	}
 
@@ -2058,6 +2091,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = ads1262_parse_common_mode_supplies(st);
+	if (ret)
+		return ret;
+
 	ret = ads1262_populate_tables(indio_dev);
 	if (ret)
 		return ret;

-- 
2.55.0

