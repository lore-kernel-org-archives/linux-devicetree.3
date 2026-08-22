Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46D374E73
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389150; cv=none; b=ekmLfn+ey9Fr1OZ5ZwaHdX4aX4jnWzZnZ8nyaiyhkhrBd+u8J4jc4L6LKGi2H0V23vct7/6nFdBv4AgIyPoo9C6MUOOl/m508vphyBxuwzmQESltdpXGMkeAcDxIfJdyyzPGYav5odXIpuP7zR0ad8EnBUMDVPpemii6vzQrF6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389150; c=relaxed/simple;
	bh=qh4p6NiaYYKZWRo5SdC+29bJh1njzkmd5IdAQaiKg10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYrM1kBSITJO+N0MSY2HhJm+xNy8AyPuX2IwJEV9+CPYgiHy8uG/IX8hi3o0sx2fn5vuxm6JmxCKw+6wPl3oAxQsGbJe5wJCZUz6cG9VIhhVTUA6dr9L86vr9xLdqV43Xy8+jMuQxnxtBxrfsuwcXdO1PvWrJg0U/QnO2smc2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcVXS5Ig; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcVXS5Ig"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so1998865e9.1
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389147; x=1787993947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsQREIODkCao/QDK0V814PCMzSICvR9cgatjnm3y9Ns=;
        b=TcVXS5Ig7krocPfP/9ao4ZyODVURPMyq6mDn0ZuHJdZ1Eoat34MD0jlK341uOkA9j4
         HDi9fuGMlZPXG4xNXrBOD9bXLfJ8LsAVM3OpOZ7JFIKWSkNPlbHKr4cjzdN+QmhNXVWD
         F5znCQZXZ798dW19vshgt9Hyf0gBSfGYB7VWGvjSza+7wdCKlOsRY4izrsK4fAifEEp1
         yjR5MIP6LdRNKcRAMcOwL8DRLn2uSliN4T7OCw3cSoJWtJZdjdAJlfajclsFdlFqqxuj
         CCawAFI2JFFSwmjoYis/FUT7vT1oBDvM3hBZC0AnE8Tws1vUp0C9VF9eeOp9BF7zdz9k
         ZObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389147; x=1787993947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsQREIODkCao/QDK0V814PCMzSICvR9cgatjnm3y9Ns=;
        b=qfJvdcLCkGp+1Bi4rvV9hZrc2mEUzsq70GwgjZv/cRb14tml0EN1pUTO7qS7CB+KVf
         n/HEKjZMPU5vD4Ff0rJ6hkObE3rzixdVvt8HKmif3X5u4XrPcw4smrVkbThqW4cQYw/B
         LiXhYtCyrpk9wnvu8z6Dqqg0Jc+ZKwYDs09zPeZj+GhCGqy65qigtDWE4K/BTL3FdYNs
         kVlKhCDWEjrg1HZp+Np5d4rtoaNmuh09MFI6Lsbo9SHegoLh5ax8DZtA5xk2BYRJXgIv
         LZVCNWbCuynilbbnFSFVzDLNjHE9F9IymNqmDKBJAK4fRep68bHAMIfbmUPfmoXGWOoT
         opcg==
X-Forwarded-Encrypted: i=1; AHgh+Rpzo2nUcFrb/ApbsS17MOlMZtcyJzoP6bLB1VdkH7ZHNBD4C9oZAJtclJ1Wa0Xw2Sf/VZIk0f+reDvq@vger.kernel.org
X-Gm-Message-State: AFuF++kcnGkpmLZNc9iOQxBmE9qVSHT0a3RlnPVb+f7plumDZOeYmDTS
	gYQDFOLIxHMxq/CsLfwxj7JdNNrkrJiNLiT2bvTe1dlepyXUvqSSAhrT
X-Gm-Gg: AR+sD10yhhKn8k+dSK3fLwMbuxEVbtIcxi4eLUopJoDKdOcAmqJDx/CDy+VgX9rn1pX
	q2LuztmtHbvpss3zqQDvNwo8WURFDj9MCWcf8P01MsxLZ89Acg2NBeMsH/WTCRF63hzXNqwAZa6
	XmTeyp5VQZYWcYvU02onXfTdyM++XB+VuW6cDuvShXRBZvJN7a65NWdd5lpdz4f7/v9IpiqZYLQ
	EMv9pXBhgHKwLrPrTXs2/gmxLBmuJRxNZ7WxMp1nSZmoknTCu5snz23Kr1Sm0wPrfk30Pl5GfB2
	vhdQRZ20QMEuMMNw1ZtYP8wW7kpbAdH1VyT+7NTZJYGacjJeXhcQxVNAYq1nyVsQ+3Xbmm1Ga/P
	/g4jY2zw9fH6TAxTQYHfB8ldEXF8GYOBK9Wd6Fdb/tV9uAI7bh+rql/tyQp0dZ3LWB5sma1hjpU
	xrQJp4hj9vZge+t8xSE/Wpf1pVdkCA2An5+qUZxdq5TpGdWnm0aYgB7EXEF4k7Y/WXXSlHz6wjt
	p/VNzOzmLs=
X-Received: by 2002:a05:600c:b86:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-499b8301913mr118647255e9.8.1787389147451;
        Sat, 22 Aug 2026 01:59:07 -0700 (PDT)
Received: from fedora ([105.74.72.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c359b9fcsm13596635e9.9.2026.08.22.01.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:59:06 -0700 (PDT)
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
Subject: [PATCH v6 3/6] iio: dac: ad5504: separate ACPI and DT paths
Date: Sat, 22 Aug 2026 04:56:50 -0400
Message-ID: <20260822085850.17527-4-0rayn.dev@gmail.com>
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

