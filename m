Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD63E172D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307920; cv=none; b=mJ1EcOOKDufy/XM6XijE7gZnExYc/AQxuY0o4Ww7n4B41ZpytCkt3Iz1XDRRvImgSVPaH5zwzwFDTQPynqlok1AjX6Xy29wQmot9qubXLALtlF5M6flrFZrPdoXAlQ8Uy/1Y8/e/YvRKkoLWHoDQndCXE8Oz4IwowUQLUr8MtRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307920; c=relaxed/simple;
	bh=FQ4fyjXp2OqEnkYHwsfz+TTm/oRpClpjq1D/SX+fetU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHoTgBWbFO47fLQEBlFMkkMEdS38j+i1Gc8Ut+C/CXf/8l5fNGiiytm+o4ihzE3BWq7HQujPJOE/97lQQX35mbT6FdL3mpfDN6kRTM3X/pmFoAgbGlMGx4yoDp/B73D9gmEcCNgHKcNoSVBA2H39/SQ8srfsaKFES/hzONEJzdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APlPsiNj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APlPsiNj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so5367275e9.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307909; x=1787912709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXCIKeHXfMN8TRcCWZhE+maVe8/ByjaTIx/Ywm2GTsw=;
        b=APlPsiNjTWO8PlFp79CkwZjpgFsRF4fCQEGz3+9PxrvmgtTj0nfUToDDz8m4geRAWE
         EjnA/9Y6XoM9R/Nyj5KMCzmoVSRM/NwyAJFz8HkH0WPGuIiclCs5v76QmxymJm6ueS8Y
         jwiKpxQcaxXHbc0JplcwEj0xtFOybYFJwwvj4YYjOpBns/O4P/h3pUmHzy/ZKbm0G5jP
         vJGnVqAT8VmKAP6NzDqyFKASg+ndzhWkyj4qhiqJ23cyYGdqyPBRJB4aN18RL/1SxOvc
         mWfOclH05CJNzhBycfqw2MzMwixoyStvMDuJMJXgOqg6ziz8QRz/xOm1u6Q3CReE1Mgy
         oQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307909; x=1787912709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXCIKeHXfMN8TRcCWZhE+maVe8/ByjaTIx/Ywm2GTsw=;
        b=M35BqI9Ieqq49yQUroy2FgoDV37BCzbo78kl1ipvgiux3JdKgB9zNlTlGmWu1k+jxx
         091pnIrQFVJw9K2PW6sulWpKACo1+FaGdJGZDbPgAA1p10wKntANSoDgjeWzrk3tVs6g
         Bd0laSdQggucgRYSjwKex82QRfXbuYzap31jcL1jzsC/HAQL77OCX129q+fNz6agVC90
         A95eyI2SqZu/wV05UG9/gy4LscN6LlLoRfMmxDzYnE3ZRbacE+vJYOzwJgZY0M5RMGUF
         5wVlGcBoE2qpoaWEnVuGNVtZ7CKHCyl5qHx7jIxvZCn7wNB/C5mF/qZQDitcYDo2hnx1
         dz0w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2IgqJU8SfgQ1J7DgfJEoq7xLaZL4uKQxyXl/GbzdAP9hYV8ZaGBU958I9s/YQo9Awh+lKqmaVJ9cg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6F6M/jodkGFudiyV+FMir8WRVfEPVjKa3s00eHDwuhsFWJja
	N44f8v0OnKI6URwolZ10GEl/ggX2dmGyYrAmsfP6zFRgQwTl5VeGEgpd
X-Gm-Gg: AR+sD13xIMcMK4x1+kOJtZI20BazuVsb3JDuVzsObKX/V0jHWsenF9Cqa0wNrGoIjBR
	KU7nfuyW4vkE+IHjAluRwXtS+YJU+n+Zq/+RxcuB2e3XHOU7xhMlBsC4Y3o91tRua9C3jGMSX8T
	Tl8Hz6agA/aGqfkfmb4vEe6nKSbX6meNlI9fWCZawNWWPqU7Gvc42WyEb1bQRket0IrZNBHsSyl
	MzpSmk6CjsIpzbEbTrPdGcCvA2j8CGOerokWdC1VHq3OyopQUge1moRwQ46dTkNnTbCUKBXlK4g
	8rR+/cRkqjy6oYmtirBpe9+yTSyqSKzUGYrnvdRV66nHCbmjhUo4q76XBQei47LRSE1H8cI8pcf
	IvgPF5Nxp7IWO8a9petbklHKiWPiwq+bA1h/VKkWxHlYCgYbLZlW7biMEg2a1Xe3OK3uh2y5GBQ
	LOrAZfGV1z2p1TPHA5zh6MEj1CklHKFBU1ftBOVU4zTjF2gaEqiK+aB3PblzAPkGg1VQNN2yWW6
	xh9xmO7yGtF1Q==
X-Received: by 2002:a05:600c:37c6:b0:499:858f:2653 with SMTP id 5b1f17b1804b1-499b830d08emr83406875e9.2.1787307908744;
        Fri, 21 Aug 2026 03:25:08 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba5139sm11663155e9.2.2026.08.21.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:08 -0700 (PDT)
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
Subject: [PATCH v5 2/6] iio: dac: ad5504: Align headers with IWYU principle
Date: Fri, 21 Aug 2026 06:24:44 -0400
Message-ID: <20260821102452.37407-3-0rayn.dev@gmail.com>
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

Update the header inclusions to follow the IWYU principle and ensure
they are sorted alphabetically:

- Remove <linux/fs.h>, <linux/slab.h>, and <linux/kernel.h> as they
  are unused. The driver relies on devm_ managed allocations, so slab
  is not required.
- Replace <linux/bitops.h> with <linux/bits.h> as only the BIT() and
  GENMASK() macros are used.
- Add <linux/errno.h> and <linux/types.h> for error codes and data types.
- Add <asm/byteorder.h> for cpu_to_be16().
- Add <linux/array_size.h> for ARRAY_SIZE().
- Add <linux/kstrtox.h> for string to integer conversions.
- Replaced <linux/device.h> with <linux/dev_printk.h>

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index ad1a74678cf2..5c9c66b04154 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -5,22 +5,25 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <linux/bitops.h>
-#include <linux/device.h>
-#include <linux/fs.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
 #include <linux/interrupt.h>
-#include <linux/kernel.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
-#include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 
 #include <linux/iio/dac/ad5504.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
+#include <asm/byteorder.h>
+
 #define AD5504_RES_MASK			GENMASK(11, 0)
 #define AD5504_CMD_READ			BIT(15)
 #define AD5504_CMD_WRITE		0
-- 
2.55.0

