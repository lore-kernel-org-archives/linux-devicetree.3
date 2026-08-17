Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817E547143E
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001099; cv=none; b=R3Cg0IEfbyerKZJZeYabIhqC8P7mdXHoDhagn4nbWGd99fK1RGo3axq2L616zmMpO8ewk6KD2LEUFV94XTfjyNb5XAFIds754oatbqoy8TKvZGtJ4TSp71pjwxJgKOtlHH9/+BMaubssrJXN5ptPkZghO4eAuBTU3MIIal0C5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001099; c=relaxed/simple;
	bh=WbTAqwH1hEHc7w/nmSJFTeDBlIBMy1IZRPJDl8XZxxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fl/7s1EXCeDG+1DMpc0RQapNuhXmjphoPqG/GKvMF3Mp0I0bIpuUe32lvfklEn9Xvq76ys3CpgC4pUAA0zBiwnQaB9ZO+s3NfAWCXa7NffowmgzCRX3/UKrmWC7xZMwarFxTsfcHvfCHayg3Chq4Gh1EQ4uNVBs0JNo8humzKds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYthXJao; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYthXJao"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so2834175e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787001096; x=1787605896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPltEi6/m6MK7qnK+08esVhAO7E1S2IgaHOgnArHxZI=;
        b=oYthXJaoI10XoywU25SywsfQ6Xsi+8CdjqtGLSgA30UhrfH2SUrBcK5cTysNMj0UMb
         mt6FxRoR6zQ9AMTCiB+CFRj4n55XiihSM/NmzaRbaGk3VEzqQjQkJVqrMyXi1drUizqY
         RYjVGsAuBCAW6F1FKBWRgyJX4cxARru1+/X02jGCtnCih4VFNIbdWYR+kb90FWt/GvVa
         gbU95j3X+8JBP+ngBSnnG80YcFIMYtSyx70XitjXCl64q4ONW5DeeVJNOVFl5mgRzMma
         QHt2TgBQkbKo7cjLrXvzBDcg/3SIlUEtCDpJnwD6giJJnhBU9DH7mjHqB6dxUTGdaDHL
         l3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001096; x=1787605896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPltEi6/m6MK7qnK+08esVhAO7E1S2IgaHOgnArHxZI=;
        b=B/GdmPM9Sib8jbsKewdXmQhIN8x00K5HWkhheZ3f+6uT1AsPDs5s1Dzec0Qww+Wv92
         OOJuRzBqq/KLBvfM+6119pGauUi3Vzey4kFyX89ERGII4liiwYJPwatua+J+w2LJqB5V
         DPDDhUgeJylrmKuB1pU5HVXbF+D7eA57XnVlvsPHugmPisbFS/R9qkLSHs07GBmToMZM
         UYgC7weFL7hZrrbZoUl1uVk1UwKDH/R6Pahj5ZuM8UNxlPZxNkyoPwmWqzmpydFO706R
         qA2iktw1dMBN7m1JYuOD6/h9tF9pTkahcUQrN2JhgAyoB0eIUVEZZe2ZdsxAFDlCjq7R
         58Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoziVq4SlHXtknlpw+JrpU4RTLCwNDP7785xIw1TL3KRbYs3yAd4xKZvmf5uNmfSsgaWiGyaZaC6CRf@vger.kernel.org
X-Gm-Message-State: AOJu0YwkC6jUui734kYMdOu0xjl6jsgtC94upvfdDYwrsz10WuJb/fO0
	+0Nf8b7ilcttajOey+KOlXNgKQPMx33szVagxQdOnTIedRuvTubOhg1x
X-Gm-Gg: AR+sD11ACgjimDsR0FTeOAYUjJdK4weoDAaXNP4A7HU8vJtj4ZXpAy9zEajpKEmeRTQ
	M7gOz9uScg8Ty/sHCOA01hAew9egXrJkc44wNCYVgpnH0MvTPmmawHg+qPHAsL9P1z27F72joxe
	8CA2nTmXLt0o7YIAoo5XB5pwSRJnNoRVb+c6jA4/mnfj8nvXXHhn7EczoNzxPeZRZnz3NX/LgH7
	43V35bysZhWcKBfh7PI2XY/J5KM87WpszTDHiCZuZelXhMhUO57xOBqTNqiajeuSXw9u6Ty4I0U
	c1IcwN2Yai3rq+UkFHDQ3g9xVZlcg3ga3UVePtL/8xNJaogqd1cDo9kkDXs8Fwahdss5rQsUEzd
	CPYvsCo/3EoXWIrB03TB1mrwAY/fa/JT4P49nyih0wJkDKMe02e0/puY3pUkYsaTZ+0pgSPntGn
	z8XEjWGQ3/cT/WcDYuXnC3+ehrIoTGE9jJ4SVCjPkiDT0vc6JbezROf6cjGfxyO5itUVbn39f6N
	hKarV5hr0isQH/YZhhhJCw=
X-Received: by 2002:a05:600c:1394:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499a2060a14mr5656095e9.4.1787001095635;
        Mon, 17 Aug 2026 14:11:35 -0700 (PDT)
Received: from fedora ([105.74.73.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm134587625e9.10.2026.08.17.14.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:11:35 -0700 (PDT)
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
Subject: [PATCH v4 3/6] iio: dac: ad5504: remove legacy platform data support
Date: Mon, 17 Aug 2026 17:11:12 -0400
Message-ID: <20260817211118.21833-4-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817211118.21833-1-0rayn.dev@gmail.com>
References: <20260817211118.21833-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504 driver contains fallback logic to use legacy pdata for
configuration. Since modern systems configure hardware exclusively
using device tree or ACPI, and there are no in tree users for it.
It can be safely removed.

Drop the ad5504_platform_data structure, remove the fallback logic
from the probe function, and delete the dedicated
include/linux/iio/dac/ad5504.h header file.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c       | 14 +++-----------
 include/linux/iio/dac/ad5504.h | 15 ---------------
 2 files changed, 3 insertions(+), 26 deletions(-)
 delete mode 100644 include/linux/iio/dac/ad5504.h

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 689147cdaa14..55ce7e49e0e0 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -18,7 +18,6 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
-#include <linux/iio/dac/ad5504.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -275,7 +274,6 @@ static const struct iio_chan_spec ad5504_channels[] = {
 static int ad5504_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
-	const struct ad5504_platform_data *pdata = dev_get_platdata(dev);
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
 	int ret;
@@ -287,16 +285,10 @@ static int ad5504_probe(struct spi_device *spi)
 	st = iio_priv(indio_dev);
 
 	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-	if (ret < 0 && ret != -ENODEV)
+	if (ret < 0)
 		return ret;
-	if (ret == -ENODEV) {
-		if (pdata->vref_mv)
-			st->vref_mv = pdata->vref_mv;
-		else
-			dev_warn(dev, "reference voltage unspecified\n");
-	} else {
-		st->vref_mv = ret / 1000;
-	}
+
+	st->vref_mv = ret / 1000;
 
 	st->spi = spi;
 	indio_dev->name = spi_get_device_id(st->spi)->name;
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

