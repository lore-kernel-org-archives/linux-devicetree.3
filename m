Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BE3939C8
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389150; cv=none; b=TbURFRJX4JcqkapKWBGEFGFWze8ySrFeysGcXYyVCI+uIDI3haYFdmVCg1RJgqTlKxzipsYmix4r/s6lo/joFvRz9rUYOQHNmyqx67aW0GFEIIPeR21m/yHVo14BTNQu9oyW5sezbkE1Hi4RvJYk6b2Dosn6Z15htNLIc9JWHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389150; c=relaxed/simple;
	bh=FQ4fyjXp2OqEnkYHwsfz+TTm/oRpClpjq1D/SX+fetU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fr8tbc5hG91FsvaCMJt+ZVeoyJKI7wiYC/f7pUZqsVWqoxbThonn4/ctDD0FEOYx6EQQWWJ4A8EPEFHjNfjCCa5kbYWGypkhaPX3dFBYPyUYK2EBKCHbCbzZiDco4wyEenXrOtiOvnb+n6LvaNTecoE6Y4qI40HbRsGcvV9IVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTZ29IQy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTZ29IQy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954dff6536so14270675e9.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389145; x=1787993945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXCIKeHXfMN8TRcCWZhE+maVe8/ByjaTIx/Ywm2GTsw=;
        b=qTZ29IQyr6WAfQFmLVuB30Z/tcSUD7tVXaK7wntNOvG6urwOXQpqzu56OYxdJ8fT3T
         ZENgOfjon76VE3iWgBQpnevOkUHRiJb5VpqpFvgLlFIgZBvjL7ifrj8x5nEWDhaYgTYW
         5uc3EocqbrSV/8BVkRXOK19qx0OjiZequFGrHv8qSyMm+eepD2hAsW/ObThzu7uJhElX
         tUs7u9pD0YdKbqqHRs3RaLyytUrsSs2o2llzZAlTtKn+EwXdt62Qx4nuIj4A3fU27UEg
         sbQzr2WG+443fExtiLF5XfIbV3MZZNdBR36wcWUgX5PQrYi8N5DGW5Lj6qpVQbVPsBMG
         yjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389145; x=1787993945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXCIKeHXfMN8TRcCWZhE+maVe8/ByjaTIx/Ywm2GTsw=;
        b=eUACXJ2DUg5LTuVS19KFTx0RYGkNV4vpRN5B6ajg0aKTL9a8TqulUiHYPLAS84+JUF
         I43X5QdiLwh1QWFE9AAG8K2sTG/I90Cozfmak6e6MZyOuHgQa9qCkNJxV3GK17W1nIUP
         z+Owh5BR5GqxbliFwPNRsMaZEWuHgjBV6sG7n14sRNpyD8uhqg/VA0yArghqf28G8X00
         zad4eqhXZbjuWzF851Z6DhoqUaJUkAm5SbVp0jrQhEdaKiV4wPDiT9TbT/8hJiaY6+TG
         XTt+K70fMKqUKpCtdMNkZz2Mbbs92b4W8nFQfiA9hwxHKUJf5ZHizYrmAgtNnWeuTivj
         kNSQ==
X-Forwarded-Encrypted: i=1; AHgh+RovkMy6MLPRvgXgk/ME1uLkJ/puDpsFsF8/01+nG1+Dxv2OdmxhjIByfcKBFuehrOMNMxZvV4vZ8wWM@vger.kernel.org
X-Gm-Message-State: AFuF++kvUvxw5JoRxV19YedkJwuwH1+35JQ8VgfRipvGe66fzDBarj5J
	UkkG4wsqms9Y8yaXiiX6ihU30GCbtk++9+KMEAdCKkCVp9xq44djDnD0
X-Gm-Gg: AR+sD13lPsYBpVJ/6s1UQvlvL+o8eWtpfmQqWop/Ft3y8slzFi6aaT16kViOcJA6xQG
	4AnYukqzeLp8Q+AK/mWaLQJ+NAzjEIgvoz2CCRq48FPSETrQeO8vYVAG10Aa4KD2V3j5a3iE4Lu
	3qOeiMvrSDOdDbZSUxVbfrUHtLNNgGYRsa7we+YgswDTuzsSZDMu5JPZxjIJ13VKJ7tFc6HFjRJ
	0scD8IrJosr5C01bQNF6+bbpO5zhdh2XD0gpKsxcXxHKr+fI2fwjckxsNwbwQ8CCUanzThMYtrJ
	I3cPcHJljnjVIrs9PzulQWouVcKo8gK7D8pfydHKAsXIopYYtkiKwt4D91KvXpr8vRErqLytCO+
	MJSpifAK/gLkroD27uOajCpZQCgcFz7tM0TgckHNwxPDhFb4/55uOYX3kkbx+pAm4r0TzvT0OYJ
	kzPNwfxGv1GqqFvuEzrOD/o0vIVyXH6Xw7f9Z0RWVto3jBy6wW50pzJKTPgxctRgN+22oxe64YX
	bfZ0rHjJk8=
X-Received: by 2002:a05:600c:530f:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499b82f3d1dmr168825025e9.1.1787389144645;
        Sat, 22 Aug 2026 01:59:04 -0700 (PDT)
Received: from fedora ([105.74.72.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c359b9fcsm13596635e9.9.2026.08.22.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:59:04 -0700 (PDT)
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
Subject: [PATCH v6 2/6] iio: dac: ad5504: Align headers with IWYU principle
Date: Sat, 22 Aug 2026 04:56:49 -0400
Message-ID: <20260822085850.17527-3-0rayn.dev@gmail.com>
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

