Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E883B47E1
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284631; cv=none; b=p3/R1MpF1FBi441yJeOTtnB/E/C3/h2LuTvw8iAS8JH804suiiDgfq2CWA061ZK2pSzGtckgNu9y6vTv3u0Od+Z7I17odJwPME5DVntmPCk/sKtqamewnyNChYrzvRTc9psNFWf8z3tiE7Uy45xUmEaWgEs0k1UW6xYNQ3v/h8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284631; c=relaxed/simple;
	bh=pbq+haMBXJjpodXoD7EdAGSmOaszrbzilDvwBg0HaV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeEMixNo7pB+fp5+qKr5d7nJIEMYQHRZ1UWOTgWyRfd7HOMDVtWykpyoIclX67lt49RTuwmNPqVm8LYxMu1ZBuy6KiEjdlp/bypJdpVCIFpuYLsEmpywSvuIj+gteJ7iOj6gmX2CucBNHu5bXnBUS9fVEt/qGMNkD6rKqBoh0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/UeYZcz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/UeYZcz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8318293f02bso1513104b3a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284630; x=1777889430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPviO7yWOPeiGXaSIG7x52NERDN2fjLGfup6ZZml7C0=;
        b=i/UeYZczC6CFOHZgeJTctRZholWCQ0f3V5KYAIHlJK/TEwN0UP38QCTGu76ceENp9+
         XU53pMayqN+C8PtOccz3JrZ4XPjKgTISsjmUgZcx2zdjPp7ujAh0tLz2mWhd64g3oOlp
         wT68GzcdqpwWPATf5/lmrCwDhJkmNIo3pIIzw5W9aj2JBDYIjBPwvUN6MHdbrjOobGew
         7fkin2ALcIaGQ5hpKb1Z39RrqUh98P8Wy3EdQwIj96svr1u6ZBAp7cp71HSfBE8xFwRw
         HatsFSLoLPEJeoLc7w3SkIgvxHg68zLWgYDm/gbttEQ7aHPWQDbDYgco3hl6SgxZliFE
         PCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284630; x=1777889430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPviO7yWOPeiGXaSIG7x52NERDN2fjLGfup6ZZml7C0=;
        b=hWhcv/FsU3MwI7yKKZQnXAylB+V5fuL8jJKXwm9YOB0943aBVX0C6q7A5EMr+lLxoD
         KQE9UueCrC8Py126RGcDMa+XdGS3TEdKO0r4/6VDOtGvcIW0KUQEvXDWbL6XDr75J9FE
         mVG3t7gB1F8hMTMUsrNbG6NeFBT4333SkuB4THlEWaVxhaJKAY8R2c7XteBeypppszqA
         EVMVByDPHjDN4/Yk8akD2MiI3dWRoWkRss63d/m6IoVp+E4pXMIclAJnBvmtqSoT3dX9
         UD+erUXFKyd9M4+LSaiAni6jh54da8HR1WeJmwuh6Sjr/Hk5HYY/JGFRFW7/CPNK2UdI
         n/Hw==
X-Forwarded-Encrypted: i=1; AFNElJ+ul2y9V020z+/Rm1o3oRDPqkeQvw02aAMOHS3qwaXy8gYf7lvmjoLOvBp+inx/UxpGqwfhLwM1H/Nw@vger.kernel.org
X-Gm-Message-State: AOJu0YzXk41SUwuLsjzgR/MsbEZtO7CAV80YnJ/WdtQI/3okcgd1fEa8
	cN0MVs1pdcFCtEQnapQEIcUXfXamwOovYAGyFCQU4I9ecNMCw8OMuO5J
X-Gm-Gg: AeBDietnKP2wM6VblDKQgwtFlsh5btAoduUSU3DaYyVtdioBmhnWHy3dqeNWtQmCFzl
	L32rNJi3p8M39G+pL/GhXB6UFjpxH0Br7zQ0r1Es4XYxJlsSgZyDhXz+qnBCNA9gp6SGftD/VNa
	6eaY6W3TybWYlcnXE8Qv+w3MveY04B/8gJx8FeaBPeH7npuvZSoG39CwZddTYNEDac8KDYK4GJR
	/SO0rN8WGB2vkw+wqmOm4UXqQEUpfkpHLckuuIlFWTju2STzZ8SP2BjSC8Q5FwpBvAv6ZqFMZeM
	JbmLTbEBKunbMoyEyEv2As30j4G86CGJwln+9o+T8mJmT7s+flLiDZJiNzywBbSGTGwOFCI2623
	8iCHMZipZrK3lpMsfT4wwE29TX02fz57Po5zJ2ggZbx+BEL4nAGVB1UiQNVDQsbdZSE/yXhCie1
	GRuOuqBk7bXctfYP5QfMR8cXNsRFceoIBbVPNjQmUR73E03s0FxeiwuybwMrueDD0Ou7+4O5ZX0
	KT0PHLhEgl+kuadn4WK2cAboqigTT4hN38SUBrj0KYRDcu+z440741//sc4
X-Received: by 2002:a05:6a00:3e1c:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-82f8b55a221mr35827753b3a.21.1777284629796;
        Mon, 27 Apr 2026 03:10:29 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:10:28 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] iio: adc: hx711: update Kconfig, module description and file header
Date: Mon, 27 Apr 2026 15:39:34 +0530
Message-ID: <20260427100950.33936-4-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427100950.33936-1-piyushpatle228@gmail.com>
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the Kconfig entry to "AVIA HX711 and compatible ADCs" and list
supported chips one per line to make it easy to extend when new variants
are added. Change the module description and file header to match.

Add direct includes for linux/array_size.h and linux/types.h rather than
relying on transitive includes pulled in by other headers.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v4:
- New patch. Split out from the v3 refactor patch as requested by
  Andy Shevchenko so that text/description changes are separate from
  code refactoring.
- Add direct linux/array_size.h and linux/types.h includes.
---
 drivers/iio/adc/Kconfig | 7 ++++---
 drivers/iio/adc/hx711.c | 6 ++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 60038ae8dfc4..f18692aea795 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -784,13 +784,14 @@ config HI8435
 	  called hi8435.
 
 config HX711
-	tristate "AVIA HX711 ADC for weight cells"
+	tristate "AVIA HX711 and compatible ADCs"
 	depends on GPIOLIB
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  If you say yes here you get support for AVIA HX711 ADC which is used
-	  for weigh cells
+	  If you say Y here you get support for the following AVIA ADCs:
+	    - HX711
+	  which are used for bridge sensors such as weigh cells.
 
 	  This driver uses two GPIOs, one acts as the clock and controls the
 	  channel selection and gain, the other one is used for the measurement
diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 0776a23bf59b..32362771cfc8 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -1,12 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HX711: analog to digital converter for weight sensor module
+ * HX711 and compatible ADCs driver for weight sensor modules
  *
  * Copyright (c) 2016 Andreas Klinger <ak@it-klinger.de>
  */
+#include <linux/array_size.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/types.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -573,7 +575,7 @@ static struct platform_driver hx711_driver = {
 module_platform_driver(hx711_driver);
 
 MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
-MODULE_DESCRIPTION("HX711 bitbanging driver - ADC for weight cells");
+MODULE_DESCRIPTION("HX711 and compatible bitbanging ADC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:hx711-gpio");
 
-- 
2.43.0

