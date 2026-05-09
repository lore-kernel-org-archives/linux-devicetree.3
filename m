Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4EE395D8E
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336560; cv=none; b=Z8ash+99A9cQ/7+Pc5Rx1V7L6bgnm2h1b/1paqVhshHmEXqkug+zw8cGxx1bU/gzUFV8Cb6d0JnD2idNh9fa4wumwtw9IZQgerNahEma9EpqSnqCLkvJZkCrafAP8k1VsOFgFh0b9pwYS3ajNaYZc/2CI3gWyAUQnfflc0oojZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336560; c=relaxed/simple;
	bh=E2/2xrDLF01RqPtbbjfr1THrdhR5njO+Hn8BI2MmETM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RspvdJYAReBajZ5/qebzfR/H5IxMUkfhxztBUIFdXf8ftfvoCToLlAxPYAFxChvZ2DkCl+q7/UtMp6qiGOCFGBu+IfCDBy/nLSQi9fMVjidBMrV1PySdikrxfczPDn30nrX03/SAUnd+40QaOFLX+ffQsq1lh6dwz3U99BoqeU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BftjpNvt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BftjpNvt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48909558b3aso32141215e9.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336557; x=1778941357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIWO8QWny+6F2s+uW0e9ZWzfRgApaENsGndfZ/2xHlI=;
        b=BftjpNvtV+xYxdx0znm9Q/Omfk66ETiEmge/rNURZi83pOnQjEPjmoYp5amHk8JpDi
         ZdyLfkY5UKie1qxLCDaJ+qfF8qMGO6K7zP7uC+gJm32hccO11922AyzBiwcUgMyYA4Wq
         H+ucHXuPlwr0Wwob6vOIas9MmrQb0lQlc4FBILnwOlivN2BwG/IC4plFjcJkXvCgi89F
         07OHXXH5eMuqfLUzFcharQWrIJ8ar31DiU3jaBZ/kYFZWck7lb48oTCqpnglToWVhxyC
         oNB1SKDz9ynn3MOtp2zBvUYp75XtKHji1Z1SiI/F3QhTZLTRem6fc4Tsy5ghVNELuoXX
         NkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336557; x=1778941357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xIWO8QWny+6F2s+uW0e9ZWzfRgApaENsGndfZ/2xHlI=;
        b=fEImigBoLWW2cZqs/M9Jhbd6XzHVAQGYmVf/0/evefiwiUYdsU1g9vtZJKk8fcEYrM
         0TNyf0G69iQWkPns7nge4QKZ3KDTc43DsvcnyUdh8ryaBpPhIvUl47gj9CcxlUheF3c8
         +bGk/9mLRDXi6TxC1eh/G7JTK38l+QxUtAVhy/5phCx0Nx/9Q9Rky55XLey8lySnN5zC
         XsmHNBCk6aYfxZp2HoxpdpYz2KfYPwnQIANri5nZXIzaYAlBTXnZgGDjXpKKtO3gXbDI
         jdL/Px54bWnvjYyqAacKO3DsGn2DEcr86pHi7ePYGp6nkgjf1B8JaAO1pkAGC2PDMvfX
         CIrg==
X-Forwarded-Encrypted: i=1; AFNElJ++/ruMsWalgduAN1tgoa4Ge5z6jWn2YOwtHTGQqPdzonQ7X9UFIs9BCrKteFo36U8/dcO5PJlIfvnx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrjh95cspEd7R2LhC0Mt26MykQy0sU8wW6P010E82DxTvhFzTm
	AeZ2IqyWgRKa+dTp6k5m6SfjR9KdeEdR+6Bwf121STZOQALsaTbJYobr
X-Gm-Gg: Acq92OFE5TwAeHETMD9aDM3stQlKikYfEEEU9EoFYyWr+hESS5qxOHqrN08Fd27yTxs
	ZT9+l/dupWwPafMx1fdcrzOrK0DKU0sWHt/XV88qkeCPPlUfdpjfMeCWaPPiWQ/gWmRqelOuS5s
	4YFgLTwY61zSq/89qWNDPagkoX4RsfBQIKT0fdf0O8qjnzU4NFduJteJk9/euoGzc/TerwI/MdC
	ds2DWNXWvJuJG2p7qIPONbYeZfNVCxCDKBx/F9vRGayKCr4hLlBjbpo8xWCNwhvwFl5YRwGFrik
	2TlVT4E+9SQ8EfY4Df3Bn0fBsd61hUEq4YZtitIzgPAZ18CVN7pbnoaYV2OlcsUkUQdsgFpFtnl
	UajdZ6RzfbycqVpHVBWYGMG1WbpIONc87nZM/3dP4qOxf/nFBBZc+dxKG74hx8oD0juWVdirHgY
	j2MyogJAt7nq6n4rUMx9Nk9CiV+3f62oJDBW1DApJmfSVgF5s2mQBgFqQWXQ==
X-Received: by 2002:a05:600c:c094:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48e51dd89ffmr199033075e9.0.1778336557435;
        Sat, 09 May 2026 07:22:37 -0700 (PDT)
Received: from DB-07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm15127763f8f.37.2026.05.09.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:22:37 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 2/5] iio: dac: ad5504: sort headers alphabetically
Date: Sat,  9 May 2026 15:20:40 +0100
Message-ID: <20260509142047.30302-3-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509142047.30302-1-0rayn.dev@gmail.com>
References: <20260509142047.30302-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rearrange the include headers in alphabetical order to follow the
standard kernel coding style. This is a preparatory cleanup with
no functional changes.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 355bcb6a8ba0..03ce37e2c616 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -5,21 +5,21 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/fs.h>
+#include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/spi/spi.h>
 #include <linux/sysfs.h>
-#include <linux/regulator/consumer.h>
-#include <linux/module.h>
-#include <linux/bitops.h>
 
+#include <linux/iio/dac/ad5504.h>
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
-#include <linux/iio/dac/ad5504.h>
 
 #define AD5504_RES_MASK			GENMASK(11, 0)
 #define AD5504_CMD_READ			BIT(15)
-- 
2.47.3

