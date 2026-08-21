Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03353DB63F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307925; cv=none; b=hDvVw30p+8YQXh07+sP6/hu2f5Ke3rdOztFrRXbsw5L269ReRZfn1eotdprNrZbw6ZC0k83iQaZgeaAGHezD4RrX4c9O7G+dEeb1ZWm4FsPuTRriP7ezVL8fVS7uRLrCN6SMJLoOx7anQV+522v+ARwJ9ezHzoiFE5TR20DZyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307925; c=relaxed/simple;
	bh=HCZVOF8T9m7E1Gm3Iq+tZImcQ0gw7AQRtwevkDBWDd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LO3ASXgEvQgj47ZhesZhOSr6fV8eOm3ry56mcVzmfP/QTPDflAicfjQ2Mv90FfmocNcYAKq5TAtUvqRycj5cTHZ1B5zDzfjNyDXb5VdipoWrxoXHkYL/o3iel9q4RFvS54cWWSVhhuVcV1ZSUoK4lJi6jMFPBgtEKSk1LM8nlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtHLc+OU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtHLc+OU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso7056075e9.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307914; x=1787912714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dWiifvCNQ6/1XjQKOnLCIy+9xjui2vS7wMw6DuKzck=;
        b=UtHLc+OUTF+fZmq9XpVSv2JuxfjYbpBPEgeWJhlyrnxWStFtw0RR+ZCpA+GwngTb5j
         lT/ulqbApiN2yudQX2EsW/5g9yOW6QK1VhorQJi4j3aYd44AiFQfdYv46GIE4YK7aFgT
         iuWEv6j300X2pEaW7K58Mou/xuNd+iakhuya3tEHGSrbRonvKwnytpQxfMyk5hnB2Zyp
         RQIunIkVYcUHB98LO5f3nJq6GRPeFeL7wJf9mn5cOmJFNboiGO/mkMN+e+30isV3dvzS
         ryrL55bHwmG9eGswDMvXFVSMwR77pUtVSeycpKuPyQAPYv8FPvKdcEhYQpEPJJgW77xc
         etTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307914; x=1787912714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dWiifvCNQ6/1XjQKOnLCIy+9xjui2vS7wMw6DuKzck=;
        b=iR9u93aYbKKnVMBxnI2wa40ajiravRWv5n0lC2sAXeCT3n+QqtMDDkZLywL1fEPLaY
         5Hj7u+3HRoYNy5uV1t1A0qTVJ+1qeq700uPRXFxCLV1jaZDWaq1iivWKrJi+ZGSmfrt+
         3nRu0Jfw+ZTUZqLtGcMLWgiMhZhUwqj0fG6fWJXHhY8AnYLg5zjWLwqkS6k466e63st5
         jSuseyRB7vD9bNZu4pmHFnPNzjqOM/P15g/pm64j6hH405aB1spTSGz+CZ4H2Xgio8nF
         kn3WNjWtvkGaHjgd8AZAQCh12tbu3ql3KPR7NAokQz34VzFwqhKTWODUXHbLvkOk1feS
         N2kA==
X-Forwarded-Encrypted: i=1; AHgh+Rq97NGQm4keh8BOgQSyhVDltbt7Ce0SJeWzbLFEiZ3L0Umdy/ejxIvG1he0zBGqCziL5N8/S+ECzrkS@vger.kernel.org
X-Gm-Message-State: AOJu0YwGU3dvPhCIT3vw4dyG6dHeeHpBFWAjv6Vwccv6548vEa2Wak6f
	52SBna2fdjGV78kbIN5ziVhZxmZCRxXZYkFNKQQUcQsb08sQFBJgcNV7
X-Gm-Gg: AR+sD13bgQ3VRpENv50XiiN5Edl3N45UaT6dYt1VkENcAV0E/qKtYMRAt/PPdC2xF2B
	ljknkmgrMQO+JKS1iWkx8D4alNfz5R0YXJA6QS1T8Th1kWyFP2iPLjmgD3daKTHjHPEy6vTuNPd
	aT+FJu5+F4p1qIS849z3BQtheyUemKy3u2AAx1PP6mjKcYyHm7vUssbCUEBHuy50hJ+zmb8Z/D+
	IhfjyGsA4dlS6P2+Bjhm5e4B+C+EXoIDWhYhU4KyGK0BLXOXjUuZMy52egOjWG39gA6tzZBQoR4
	VUr6vm3k2c2FOn/5IFFveOP03R5mNDUAIHpKAsYIH6Luo9qwL9udZHRf35LRkOJPefPljF4aykK
	5lU8MFs0hpVJrYc3l8WhWTJW2zP1ZvEy04lLXbrAt9jSOij+BGA4YcKDW/o9bnCu3ezaq0/Kv9q
	YHKeeGB5Gf0SWj5BRUtH5yZ6qEM711GWp+2Nbznwa29buzelFKZVdv8ZHElI5QotdjpK9alj2zA
	DWLWQc2xGUBJw==
X-Received: by 2002:a05:600c:3b08:b0:499:b402:6c0 with SMTP id 5b1f17b1804b1-499b830d671mr64331415e9.3.1787307913677;
        Fri, 21 Aug 2026 03:25:13 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba5139sm11663155e9.2.2026.08.21.03.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:13 -0700 (PDT)
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
Subject: [PATCH v5 4/6] iio: dac: ad5504: remove legacy platform data support
Date: Fri, 21 Aug 2026 06:24:46 -0400
Message-ID: <20260821102452.37407-5-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821102452.37407-1-0rayn.dev@gmail.com>
References: <20260821102452.37407-1-0rayn.dev@gmail.com>
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

