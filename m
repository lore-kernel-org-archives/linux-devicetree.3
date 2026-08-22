Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E0A384CD4
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389152; cv=none; b=lwDTFqr4RnZAU9mPBgef+vae+MGFxmifMyg8HbVtu3evM03FDTjXZc066HBVYKKZGxwHmChmxpRBtqGZKRpOKP81RrRf6uZ5fZ8KWLvPzeMQb+/2aNIrz9u9ALySd/WXss+6cwcCDgbOanAFuFuhOyl+XmLTHEOAybv7I4hd/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389152; c=relaxed/simple;
	bh=HCZVOF8T9m7E1Gm3Iq+tZImcQ0gw7AQRtwevkDBWDd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TcTiqBbxTUTEVt+dA555hBxuEp82sMtAPxDV5LxLarPCMis2cZ2FI2dALxJ0y3VSpPmkM16VKDdk7xxTzFZBA12JvzgZN/SXvF4Z3zd1EHOfpDyASA4JdZWbeF7CzTCeLCIezmv9t2B/YCWXgZI30q0mqMLyaiOfYU4LTPenHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpVO4Ppa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpVO4Ppa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49978908b35so11933895e9.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389149; x=1787993949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dWiifvCNQ6/1XjQKOnLCIy+9xjui2vS7wMw6DuKzck=;
        b=CpVO4PpaADFUYZb9BdHz57T/9zlRaUoBDVipDhuy6607AqDegFbjE2NxH1KkdF6vsp
         XTqryFL1Y2rf5ejiYpe7rGDux2wRu3sbivQIvcHbCKo5e4nynSHQuoAhZXHg95svE2iC
         wKvS800DqoqInTYMk++f2TiHcEnJ+G3740Nu4BPxwpyMgbD2r115CLHOhSqJ0FNxgpyY
         6/rxlXw7Jgk/yca09cs0QzaowYOzy4YdMledBbN/HAb3Vhebv5y//AmQMZwzFQrzJKsq
         LFFuLr1P8je950f7gDTc6ypMo0f82hGCuvI1CPw+arnzuqqZnlai63OLHNKIR4jaZW38
         gGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389149; x=1787993949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dWiifvCNQ6/1XjQKOnLCIy+9xjui2vS7wMw6DuKzck=;
        b=XU8YlBiCIWy2jhqtAQg1Lgr7gQ1mYYBe1a1w6akZzflEK+eFtM1FSEJsihRWyT1g+g
         +W50xGw50pXcQ8yCc7C1SwuzbRjeEO+sh/RnRNx0KWJyD86uvXy9LuC4UMQlXP3mWZcv
         gIEoPx36S0yTVtFVchvAH7dD9Cg1j3pexduJXA0lLqQz3zJvAfyO1gnreq6JoN+abufE
         8OcRFdNwP86lT+CqKPg/8PvC25+Z7um4x4PzNercqCnMQSpwxPmdW6Jw6hPzRkdaZXeT
         FMyGIWngf433NItfNQCOpvkYLDzGvltmaciJjWiQIni4704g4P4ST1RRgLCD7TOOShAD
         TEWw==
X-Forwarded-Encrypted: i=1; AHgh+RrxiCCinRFmt7Jhkoxl3y0mJEie1QKe9mTIQXmNQRl1M25nA1TzUDJ/Xf6He+agHvIyb8z6VWBhQdkr@vger.kernel.org
X-Gm-Message-State: AFuF++k5zM9ht6p6EOQSyHX+SJLfxyJOsQthxd7rugMmZNbWK4yndp2q
	uXlllmT+qgNXY+Utegk1o0ost9dLjDvkMtZzegw3OTdmOHEZBTeSMxkJ
X-Gm-Gg: AR+sD122v2BxmbwlJJ6eKFwICq3nB/mVafoNNONOwVSIc5PHEd7BKXCv4wrwyJNz95D
	OCAWpF7KjQu46Hh3dQ4spT1qdJiMWlN8aS9rF3Xz0h+HhQ95WI+IeLjV1qin9uev4fTXp/n6tau
	8frg6SxLhWltKMOZbanOi89Bjv7D8ydIWK9UmVyryPbL6MhXKtQk4/jHBtSfHuUF8TL+60mAhZ+
	sHl4/8HZvZYhUzAMzwJ6YGYydRZnmheSJvAdIg0pnjsaXN7sUF/DpvqSUSTw3ltu1W3KgzGGbEg
	EEyiCB4pR8HaWW/lFIcDsjVy/sJE7buEfUdJUZkmaoQf7KR7VVUg22IbSA45dJ9FnZ0DVYd+tJd
	6cjOESu55Fjad0EGwaENpyqIPct+VvyIiPxCGCx1hhZilCG0pVY1WSzqt1Qef7JT7DqQ9a+v4ve
	DyEDp3yM/LTj2uHQIJKQ0K+fu0gzrdO2iT+cpiVCrKhtf1/2pI2W7FGN7P+wWtpMipp1vK3fLyx
	wlil/V2Kxg=
X-Received: by 2002:a05:600c:4e4e:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499b830d697mr175513185e9.2.1787389149299;
        Sat, 22 Aug 2026 01:59:09 -0700 (PDT)
Received: from fedora ([105.74.72.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c359b9fcsm13596635e9.9.2026.08.22.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:59:09 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: Michael.Hennerich@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v6 4/6] iio: dac: ad5504: remove legacy platform data support
Date: Sat, 22 Aug 2026 04:56:51 -0400
Message-ID: <20260822085850.17527-5-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822085850.17527-1-0rayn.dev@gmail.com>
References: <20260822085850.17527-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504 driver has no in-tree users of its legacy platform data
support. Now that ACPI has its own explicit path, non-ACPI systems can
safely treat the vcc regulator as mandatory.

Drop the ad5504_platform_data structure, remove the fallback logic
from probe, and delete include/linux/iio/dac/ad5504.h.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c       | 17 +++++------------
 include/linux/iio/dac/ad5504.h | 15 ---------------
 2 files changed, 5 insertions(+), 27 deletions(-)
 delete mode 100644 include/linux/iio/dac/ad5504.h

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 6f70c57c7a82..799726eafdf2 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -20,7 +20,6 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
-#include <linux/iio/dac/ad5504.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -281,7 +280,6 @@ static const struct iio_chan_spec ad5504_channels[] = {
 static int ad5504_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
-	const struct ad5504_platform_data *pdata = dev_get_platdata(dev);
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
 	int ret;
@@ -296,16 +294,11 @@ static int ad5504_probe(struct spi_device *spi)
 		st->vref_mv = AD5504_VREF_ACPI_DEFAULT_mV;
 	} else {
 		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-		if (ret < 0 && ret != -ENODEV)
-			return ret;
-		if (ret == -ENODEV) {
-			if (pdata->vref_mv)
-				st->vref_mv = pdata->vref_mv;
-			else
-				dev_warn(dev, "reference voltage unspecified\n");
-		} else {
-			st->vref_mv = ret / 1000;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to get vcc regulator\n");
+
+		st->vref_mv = ret / 1000;
 	}
 
 	st->spi = spi;
diff --git a/include/linux/iio/dac/ad5504.h b/include/linux/iio/dac/ad5504.h
deleted file mode 100644
index 9f23c90486ee..000000000000
--- a/include/linux/iio/dac/ad5504.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * AD5504 SPI DAC driver
- *
- * Copyright 2011 Analog Devices Inc.
- */
-
-#ifndef SPI_AD5504_H_
-#define SPI_AD5504_H_
-
-struct ad5504_platform_data {
-	u16				vref_mv;
-};
-
-#endif /* SPI_AD5504_H_ */
-- 
2.55.0

