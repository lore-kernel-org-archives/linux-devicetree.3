Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442ED3644D5
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060758; cv=none; b=Afv0mCdTMY8L5+jn9xhe9I/F3MEjYcrysneeYzNYBxcOaWzbbbsIVy4g1itjlfHv2wAskf8I2yeZS3AKENYW/4XwXd4Pj7S3derh7xj6OllWrV3aaGNRAO2XJFb4GeNW1Q1yMW1keT5Og+Hna1ZOnrG/AjQGR3uJoUwA63lnsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060758; c=relaxed/simple;
	bh=/qWO8KI3tIBC0cjksLyab/irCOuK5UlJOac1HvRs0AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gl8zTtvYzudTYNTN1b1UljXv+sAN1JUgcRWWSf7Ox7IXrOqbpQdvGSM2Q5voua593zlFZHNNTHoq3DVvbtI2iCZnMs1XAoIPPbgrS80Lswt+CtOZSIWeiRfR5sCnjs+X+DyA72sdZeqqna43dUWafDWywtV1fq22492yaPuiq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=ATBneXj3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="ATBneXj3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35691a231a7so4340862a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060749; x=1775665549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmuFDt4ssXwo5Kn+8E+MCnCyQLezwxIlCE02tQ8Pv3k=;
        b=ATBneXj3E3SGVicK5Q1/mXuKr3nxxMbcAUDFKV3l2XAw09+MfkQ08kdCr6S0XkWPN1
         YJMyWq/P73TKvyq7o0qfwKkr7bQbF0FfpfJpU7u/jC7Wa5yXrQPSnNq3xsXMdRkuyYPj
         xR2b+zDfkbFlhtZPf0sPTVS5oL/PWAWTX6rOWkNJ8ZgTtWiEy90IJz/SZczCV6whgWbV
         CNeO/3ZbyZKzUQzbvxrSbxl0JgbAoVxMEeh8AKYbylSvR8pUDa4+JSuR2gohK2aF7wLn
         D050nUCLjJjz+ufi+uGXYKdUn9AJ/FNjlrXFxcbgRQwtTGdxcjJj69+iSWT16Io+GnGC
         WUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060749; x=1775665549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SmuFDt4ssXwo5Kn+8E+MCnCyQLezwxIlCE02tQ8Pv3k=;
        b=Aq4eMReAs+MeBXvtfQSGJH/PbaNpr0rFBSIKZuOitB6CkGKOIOgr0dREAUclbkWrAl
         XwSmo3Bu2tdFLiQ9pzaLv5UDLoWRKzY86qJ1w5z7t2shzIrwWdrwFm/MHfL7MaRPucC/
         HzgUrkRERf3jVcgWs6/9XpPC9Reu7fzsrRM4MyYe3FMvnMqtbAw2UHZtc29S+n5NpCut
         NupOuaDR0zmuMt9gE1Y4tWz59VUHZ/ctHuEWLOrbysru0bp9sgi9HkY62/zzxKN9Npsn
         sQsHco1dWzRtDYQ3aYdWVOHiPpOBStmrADx9xRUxX5Zbu12VXm9abWvqXd6TMUKChu3P
         P0ag==
X-Forwarded-Encrypted: i=1; AJvYcCX1VaRP9vT5Ydxoj//8HeAGqWD0siubaf1WuuFR7pn+a47HhOEa9HAKCu/rurFYXvXp4OVrLvQMxMln@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjvO4Fzd853xoJF0NsfBuaNuOc8HIiRfaNR1Q9MZ03yb+Mx7X
	ccORX4HfhV4MzGoOyG9ewlfb3xnn4IpKNgsZH8n2M0UKiNXp04oH5otLhjDNekZnwR8M
X-Gm-Gg: ATEYQzz33Zzn02ffVoRHUaf6bQOvg9N/fwE8IEzUwzUS59Y/gasb48XVx8CN4mxMQdo
	D0nNtqywf1qksgBcUzD0eS4LNMHOy5Er8JRty58ZUsCkVUTQet2DYOrI2pk80GRXk2ulfo8d0sk
	06YxrK0Y4VEk3cMzy8vkjT9gpGfNOhjwekoITHkA1l6OZS5mM9szDCqPOAuhC/QWg07Dcz+sBqL
	F2R935tV6WrPCCQfU1vhVVnXxk3D/NXG/qv/fD0hdpQjYcpFiy/2SKLyBerBhLEqQLshRP02upC
	48TlIQE625m+tHLSLcM2qodNHeoOI6XanNyrWuSE3vs8lWE0iHfcbgYtuAOjBqyUzaU2ex3OqF/
	4d7uVvbB96ufR5qjpyKCeRRk7GPHoOi2IWNCKLa9I+rHpfBn3hOkHejWM0xKPFQPSnYwhWZSj0E
	141N9ooT4kwmX3jMoKrh/kLcFCZLYOIWiM9LSMTeZ3qMHSbe4gKATTaurIiIBSPGfEs1RoY71UZ
	6I/pgwJNOP8UL63gAJizRB3ID8yco/o6muZxKwXFw==
X-Received: by 2002:a17:90b:3f44:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35dc6f0128amr3633041a91.20.1775060749484;
        Wed, 01 Apr 2026 09:25:49 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:48 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 3/3] iio: accel: move adis16203 out of staging
Date: Wed,  1 Apr 2026 16:24:57 +0000
Message-ID: <20260401162458.88110-4-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adis16203 driver uses standard IIO channel interfaces, devm
managed APIs, and has no remaining code quality issues. Move it
from drivers/staging/iio/accel/ to drivers/iio/accel/ and remove
the now-empty staging accel directory.

Signed-off-by: Sheng Kun Chang <nothingchang@mirrorstack.ai>
---
 drivers/iio/accel/Kconfig                   | 12 ++++++++++++
 drivers/iio/accel/Makefile                  |  1 +
 drivers/{staging => }/iio/accel/adis16203.c |  0
 drivers/staging/iio/Kconfig                 |  1 -
 drivers/staging/iio/Makefile                |  1 -
 drivers/staging/iio/accel/Kconfig           | 19 -------------------
 drivers/staging/iio/accel/Makefile          |  6 ------
 7 files changed, 13 insertions(+), 27 deletions(-)
 rename drivers/{staging => }/iio/accel/adis16203.c (100%)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile

diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
index 3d3f8d867..2d8abec49 100644
--- a/drivers/iio/accel/Kconfig
+++ b/drivers/iio/accel/Kconfig
@@ -18,6 +18,18 @@ config ADIS16201
 	  To compile this driver as a module, say M here: the module will
 	  be called adis16201.
 
+config ADIS16203
+	tristate "Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer"
+	depends on SPI
+	select IIO_ADIS_LIB
+	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
+	help
+	  Say Y here to build support for Analog Devices adis16203 Programmable
+	  360 Degrees Inclinometer.
+
+	  To compile this driver as a module, say M here: the module will
+	  be called adis16203.
+
 config ADIS16209
 	tristate "Analog Devices ADIS16209 Dual-Axis Digital Inclinometer and Accelerometer"
 	depends on SPI
diff --git a/drivers/iio/accel/Makefile b/drivers/iio/accel/Makefile
index fa440a859..eaf8ce443 100644
--- a/drivers/iio/accel/Makefile
+++ b/drivers/iio/accel/Makefile
@@ -5,6 +5,7 @@
 
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_ADIS16201) += adis16201.o
+obj-$(CONFIG_ADIS16203) += adis16203.o
 obj-$(CONFIG_ADIS16209) += adis16209.o
 obj-$(CONFIG_ADXL313) += adxl313_core.o
 obj-$(CONFIG_ADXL313_I2C) += adxl313_i2c.o
diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/iio/accel/adis16203.c
similarity index 100%
rename from drivers/staging/iio/accel/adis16203.c
rename to drivers/iio/accel/adis16203.c
diff --git a/drivers/staging/iio/Kconfig b/drivers/staging/iio/Kconfig
index a60631c1f..bf6addf29 100644
--- a/drivers/staging/iio/Kconfig
+++ b/drivers/staging/iio/Kconfig
@@ -5,7 +5,6 @@
 menu "IIO staging drivers"
 	depends on IIO
 
-source "drivers/staging/iio/accel/Kconfig"
 source "drivers/staging/iio/adc/Kconfig"
 source "drivers/staging/iio/addac/Kconfig"
 source "drivers/staging/iio/frequency/Kconfig"
diff --git a/drivers/staging/iio/Makefile b/drivers/staging/iio/Makefile
index 628583535..739e4cbf9 100644
--- a/drivers/staging/iio/Makefile
+++ b/drivers/staging/iio/Makefile
@@ -3,7 +3,6 @@
 # Makefile for the industrial I/O core.
 #
 
-obj-y += accel/
 obj-y += adc/
 obj-y += addac/
 obj-y += frequency/
diff --git a/drivers/staging/iio/accel/Kconfig b/drivers/staging/iio/accel/Kconfig
deleted file mode 100644
index cee51f64b..000000000
--- a/drivers/staging/iio/accel/Kconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Accelerometer drivers
-#
-menu "Accelerometers"
-
-config ADIS16203
-	tristate "Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer"
-	depends on SPI
-	select IIO_ADIS_LIB
-	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
-	help
-	  Say Y here to build support for Analog Devices adis16203 Programmable
-	  360 Degrees Inclinometer.
-
-	  To compile this driver as a module, say M here: the module will be
-	  called adis16203.
-
-endmenu
diff --git a/drivers/staging/iio/accel/Makefile b/drivers/staging/iio/accel/Makefile
deleted file mode 100644
index acac7bc9b..000000000
--- a/drivers/staging/iio/accel/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for industrial I/O accelerometer drivers
-#
-
-obj-$(CONFIG_ADIS16203) += adis16203.o
-- 
2.43.0

