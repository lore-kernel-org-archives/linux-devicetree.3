Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2AB46EC66
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307925; cv=none; b=bykMgvtVY0SfEkHlGoR+1vQPj2h6O6mb29BC6O6S6oJw0YcNoZavjU7xzEKbcRl8HJKwj8lREERYsDAX6TbU+Hxf9pbfIhh3bHfpHjiBSJwIfM+JevX4B1m78O+4yARl96bpOJEYhinWEu3mOp3fjLOM5Tdq/57dvCKI7kvB458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307925; c=relaxed/simple;
	bh=qh4p6NiaYYKZWRo5SdC+29bJh1njzkmd5IdAQaiKg10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/Oe+2tlMSwwdUtpWGaXJKpVcXAybvSDnzW7TkbWEZp+jPoSp04ZulOWNIGySf5k3S+/OBavo176WK29fzRcisz/dzPFEeginfW7nwJiCeHgu+DQOyG7yAgQWkNxzPn2ynqV4Wu7HPZxYtdin+l96OWBckcRTMtAiYh9to/bZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwmKueW8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwmKueW8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso5257355e9.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307911; x=1787912711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsQREIODkCao/QDK0V814PCMzSICvR9cgatjnm3y9Ns=;
        b=QwmKueW8i3NewAouoHlS1hrLhhNRGwI78Scj5VmDnm1ASoYnMgXDG15HIN2cOIVxCz
         mi59CO1xr9c6JtjXPgftU/f9kbaP8zNNjsp/oIJ+5X5vxniZDKFyNDITl2JivjhUS9wV
         D76OrnMiEOnF8HZP1aI4TiEGSC7Ihapj8JofYEe55D7B2quA0wtAu+ZwlwOAg54ArZqt
         HtDVUJQ8qN7VQIS7AWzxDHt6u0jEBeg/+7IJIgjH55xJeIctl2ugmCtNH1LBydEtkj8e
         80nthjybcL50DdYNH5SdX9uy5zy1xjdW+rXH/cjaX3jxjJnahXMWRVG4L3hVmhNZ7RpW
         vFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307911; x=1787912711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsQREIODkCao/QDK0V814PCMzSICvR9cgatjnm3y9Ns=;
        b=OHQmfpEh1ftpMh9UoTXy4nOSLutUoBQZsQWLQ5oWPq7YAk4szRgaSrRlKMnXwM8qtL
         iRdqzDYotSBnhvvoAt+QjHMPg/rgDhEZ3obGilr8yKlYqusEzpfJTWOKb8p65/4rkywi
         XbNPRh9g7eSlquJv0WcLueDbipbXlCXGIUakiswF0XlaNwtzE0geE3fgpjqvBQt2p1Ga
         1q4ZdAtggCrK/FlqSNoyTM01CuW29V5wwSid+lkFRK6DcPhR40yLcXosf6raWRjX3bru
         ANuXfnjfLLKFOY0boFboJiJMNmvPGVTmKM4RsVjtuiWgzjiOVVHdPRulYx7EKKbeiuH8
         ef2A==
X-Forwarded-Encrypted: i=1; AHgh+RqCeflLNnPdMcmBiYyO/dh8AJatcTuAd2YzfdnYUZX4do+UcEnfnIBnlebUNIKVhV1BpdHoU943RZAh@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUqIhV3a1VrohcPAApAJL5OBgFz9tNDyeL5VJrHWw+apt+3VH
	hlplBP5Vhr8FGBefJZ7oFHxfMlBo4meq0UDWWSdcYX6hLgLcEO8OfERL
X-Gm-Gg: AR+sD12ETeWtMyFBipa7GG4JNKgwr2M4ZyFP9qbV1nkqoENrL96vuOiR0tJTMgaMqun
	fUabXmlqVo/MH9tCz0lgcrCcXGlyLYdZOYTk2LpOMR3BsWpOBNZ1jyzdF8aDAzNCP0UYK/AI0Nn
	a+/BeZuKoWzFaYUFiAzZv2fFnMQMIsYjreqjKJzUiqdV00sxTqq/wzKrcSqssFJmqiPx8KZvWc2
	M9LdQvo/w4LlETWimhEXtqTa1yqBvqsecdl++5AUBIrplHRmfSDxFrE5Zrc+80zMTC+ZG2eGo6j
	rj/MX8AaRLKWlFvfXxn6EZp0oGD2AJw18asBD6fLnQOjAJoXaYu9Vj8CwiRe9O0GPsMfEw/rU8F
	Be/ErproCEQ4OnZy6lV39ImODv2Y7LWCCCxOz2nThwRZuH1ugbm28RaNflBR7nGs5niboBYBYxl
	VZneDq22t/PjvxHhPEEPdEVVJ9KtmCpKawBNF7H5EYEBjf9JLTYZlqRBExOlzWBB5lTyMq+dr0B
	FFHynZfHaQ95A==
X-Received: by 2002:a05:600c:3550:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-499b830156bmr76380145e9.12.1787307911253;
        Fri, 21 Aug 2026 03:25:11 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba5139sm11663155e9.2.2026.08.21.03.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:11 -0700 (PDT)
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
Subject: [PATCH v5 3/6] iio: dac: ad5504: separate ACPI and DT paths
Date: Fri, 21 Aug 2026 06:24:45 -0400
Message-ID: <20260821102452.37407-4-0rayn.dev@gmail.com>
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

The driver relied on a fragile -ENODEV check from the regulator
framework to bypass voltage configuration on ACPI platforms, sharing
the same fallback path as legacy pdata.

Fork probe on is_acpi_device_node() to explicitly handle each path.
On ACPI, skip the regulator and use a fixed 60V default via
AD5504_VREF_ACPI_DEFAULT_mV. The pdata fallback remains for non-ACPI
systems in this commit; it is removed in the next.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 5c9c66b04154..6f70c57c7a82 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/dev_printk.h>
@@ -12,10 +13,12 @@
 #include <linux/interrupt.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/iio/dac/ad5504.h>
 #include <linux/iio/events.h>
@@ -24,6 +27,10 @@
 
 #include <asm/byteorder.h>
 
+/*
+ * In case of ACPI, we use the 60 V as default voltage reference.
+ */
+#define AD5504_VREF_ACPI_DEFAULT_mV	(60 * MILLI)
 #define AD5504_RES_MASK			GENMASK(11, 0)
 #define AD5504_CMD_READ			BIT(15)
 #define AD5504_CMD_WRITE		0
@@ -285,16 +292,20 @@ static int ad5504_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
-	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-	if (ret < 0 && ret != -ENODEV)
-		return ret;
-	if (ret == -ENODEV) {
-		if (pdata->vref_mv)
-			st->vref_mv = pdata->vref_mv;
-		else
-			dev_warn(dev, "reference voltage unspecified\n");
+	if (is_acpi_device_node(dev_fwnode(dev))) {
+		st->vref_mv = AD5504_VREF_ACPI_DEFAULT_mV;
 	} else {
-		st->vref_mv = ret / 1000;
+		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
+		if (ret < 0 && ret != -ENODEV)
+			return ret;
+		if (ret == -ENODEV) {
+			if (pdata->vref_mv)
+				st->vref_mv = pdata->vref_mv;
+			else
+				dev_warn(dev, "reference voltage unspecified\n");
+		} else {
+			st->vref_mv = ret / 1000;
+		}
 	}
 
 	st->spi = spi;
-- 
2.55.0

