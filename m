Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE5471410
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001095; cv=none; b=g/ItSdWu8D2Ozgg1mX+A11GJXzULNK7MG51Y6GlOG2cCVSMtBwPnCyI7fyvgRI7LC1XzyD+QB3fADRp38iZuPNalYhVPgjt4ctTOn9Bv0XKKIc5/OP4LDPeQ34MOAml04zgSS5x+lxPS2OLLwyth+nvqJ4C+G+x+MSpQ7sXoyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001095; c=relaxed/simple;
	bh=Z9Qda5xfMXdPM0y7cS1w18J7wtGYePS3JSB15genqNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cddPhDp22DNVprspP5aW5hc9pcng7hTw1jLsyHqD57CXDmN8VZPE18FhX1g2T2LXZmj/dayRQi78vlOTHQWupEDR1GVmJG4SJPEAVHYTrYTOSgQeTkbC80DLU46ZXat5vLqkQrrvcSii4h6OJ22QogBdAqd0I9QB+LOI4mSECcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwdC0oFV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwdC0oFV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so1932455e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787001092; x=1787605892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf18W8QZAz94WDVtYPu89VIwzujNXA0lX7aId/Aud6w=;
        b=XwdC0oFViIjdYnSC2LmEXQm79fiXONJMvKkA42enzl1OCCCvkEKmtAZndk90PpC3sQ
         cYDCDbTX1hKK9McHkvBGWS3TQTnMW2tHxPnJxLDsIrcUgd3kfqK8hdQowOLxo5aJuk7M
         i/F4ZiWT2W/pDCOqL59/FAXbABfydflXEdCqjM4lu9W3Rl1jSB8nldxcdteRH2skSdoC
         w1nWz3x7g3R78hKPGlU5d5yv20TfnLV5nD0m520uwb/WNgvpGyRmZTpKibp951/Zma2n
         rxWpv68dCpCUZ93vmZQ7CNVVvQRbQkDGQFshoYR0d5WVNO+fveLaByixQuyFzgArrsyX
         eg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001092; x=1787605892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf18W8QZAz94WDVtYPu89VIwzujNXA0lX7aId/Aud6w=;
        b=ri+uUD0jbWa2jBGxLkKnQh7HCsDyRswvPVHxaYvPGhubZhWWtTtbcmQdhD0cI0NCAm
         DhiyxS3+T80a6V+sqYgH0Fos3SyPhyQKveOwBmNs2KGKmetXiq7thD0FHKWzVM7FK/3n
         4SivhEX+ulSb7jkBbskKYc2CSH9XwXco2F2yRLJW+RD1+Vi5R4MbPdJ+jADaz9f4WrMM
         TTC9REXoQKW3K2h5upEtBLHUjSf1kMz/pc57vanQfnzcNfCFXJm1QVsQokYD1mVYYL/b
         lCdBwbbyNVy1JRY5SHvqS2hoTmKb2qy8ufonmOnfx5LtrubBx5s75rlHjHRf3PLKnxRi
         fWiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzmtsqO/85p5GVwS0jaF/iBdMn26CllVb7KzDLfV7xiyh+ntqzQEOczTeCF6sQeqMrQc7P9KyqDHH3@vger.kernel.org
X-Gm-Message-State: AOJu0YzkaMfrSdeihuFDho3Qkr0QPDWbM7LKKjiYH7C5yQyklf7/NH3/
	Vdp0wrkJFVequDXNng9nnnhRIXCjU29sKagV6UGwyki00haOzT+JjH4B
X-Gm-Gg: AR+sD10N5B0A3ijFDK0o+y6+Anl/q53ml9weE55om5j5juoxN4ozZ7LpPjIlVlZyLuz
	gVnHzYUqesPyc5WsT8hWZQkxCnTXvoiLyydzhrFavjqovHjK+PU9AKHcC1uNwE46pphJM2wLjO3
	i6nz1eFxV/BjAMFU/kQDOHwGrHM2JT06aCSvg1DCY5yk/xQRp4L4vEO924iu5usqwjxb8yaf5Ah
	NyLKa43AdSAFR/Vk0+V4X9rJr11vaFEvU7LrbdZxk2qUJqDpKHREVt17wpfOU9Q4S6ari32MoRk
	KbqJzMZfD981aJEx11zYLxZ548Ju8XdB2xGrbyFyxh19hUfhcR1sj2fH7ZpZdKd7rNskyXx+Lzx
	LG6JNxE1QwaqcUSMRKjoRapQGXDTIk0YwBUf3SoYfzxehGIYvXX7sVnTuLFvw3+Z7pLmLTow0qu
	8znElo3Zg6om8kBB6tAqKKltJM5GV9kRvW3VixKf58Hv2JGa+NVLL5bv0x73RB4dGKt6Q62kSwE
	kJPdrUjln/yED63X9jdtwc=
X-Received: by 2002:a05:600c:8b77:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499a206a553mr7835055e9.6.1787001092211;
        Mon, 17 Aug 2026 14:11:32 -0700 (PDT)
Received: from fedora ([105.74.73.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm134587625e9.10.2026.08.17.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:11:31 -0700 (PDT)
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
Subject: [PATCH v4 2/6] iio: dac: ad5504: Align headers with IWYU principle
Date: Mon, 17 Aug 2026 17:11:11 -0400
Message-ID: <20260817211118.21833-3-0rayn.dev@gmail.com>
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

Update the header inclusions to follow the IWYU principle and ensure
they are sorted alphabetically:

- Remove <linux/fs.h>, <linux/slab.h>, and <linux/kernel.h> as they
  are unused. The driver relies on devm_ managed allocations, so slab
  is not required.
- Replace <linux/bitops.h> with <linux/bits.h> as only the BIT() and
  GENMASK() macros are used.
- Add <linux/mod_devicetable.h> for struct spi_device_id.
- Add <linux/errno.h> and <linux/types.h> for error codes and data types.
- Add <asm/byteorder.h> for cpu_to_be16().
- Add <linux/array_size.h> for ARRAY_SIZE().
- Add <linux/kstrtox.h> for string to integer conversions.
- Replaced <linux/device.h> with <linux/dev_printk.h>

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index ad1a74678cf2..689147cdaa14 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -5,22 +5,26 @@
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
+#include <linux/mod_devicetable.h>
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

