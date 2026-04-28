Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4833B95FD
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390605; cv=none; b=WDLAu4jl9jHvFbEPh1ZBt/h6XIetzJJhtESoptjdB3100NSNhNnI7P40sAhJideez6ddQSABWkuNV/38blW6QaU9zjwrTtrnO3tXuMbfIrOSmT+/CnnmggI4q7fxo46bSnhpiC71YjY/2JNlSRpeqTVNATHFFY7aR9uvFXZGJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390605; c=relaxed/simple;
	bh=Fi8+HlKnN1h+N9DJycInvz7TYXjUPCLz5vbSQaQ2Gmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5szkChq+kHRdNj3GgimtAzkokUXIpVHJPNdxvLThtGBdeqw5fBCrIfNI9hPl3eTdrCKxl4C/iByEhR7cG0LPjHUv7DUJT8+83CpFDqvXJM2YHTRyc3ALPZeRFbljzcPkC10eirxCzYQylz/p0ciyX80mGsl/YKaxkQ6Fa3LyOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNSPpX7Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNSPpX7Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so106386815e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390600; x=1777995400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX7h5kXQ2ZfXYWkWgx4GofzlTaZv8NlPbhuLaaOQgic=;
        b=lNSPpX7Zyj8nzuSKgQQJ9wEvj+wMqxuiW42LYs60PoqosAzsv1IhW3xWn64hwaK1qS
         u6ddZuqdQK4KXnlSIs2Fqjp8FO3VgqlDH6dyiQ7Y2bu7Y4+ioRxhkf45pXSCx74RWfsc
         fXP5TiS2TOiB8kURyRnRCK9jJ5UCzvbe5STue9o843m9ZiQwr3d8I6iYj5BZZImA0zVH
         X2pZsNvAV1oGmyNwoDicN9RNRQeCJKAm4puebhJInIXZeUeuiUlN47hA2MQtjjade2fO
         7t3jhY+SEIbtl69ZzIgs4S+87VyIvy+1GUbKQ922OA0cSVOlxff1xZkqZRR1y89WmW3J
         t7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390600; x=1777995400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PX7h5kXQ2ZfXYWkWgx4GofzlTaZv8NlPbhuLaaOQgic=;
        b=WwJvZPwct35AByh7kxrMvL1/6+mAfIGvVkuJSZzlKDmeqd6ONcmbVmzhxKM/GiyVWb
         0m8UftSo5sNarikRcrBwjhJdOhrKpWdkiytiKnBQyTvUAdZW+kZfaKbmoX8b2xAHVzFX
         1GM+ELH46LYOtxMPFnocnd+da4fKBxOfLdFgAlGb2VPgYXJPm1Hr8BVodyUKk5ew5yrm
         WFULcOl5BFY1yVv50Zcm2pbnITLFH8syQLMeC2EtKQmfmIEBTeb9cDRTLjiA1r6Djmr0
         do0D/k73XrRPDpXiEy/yLXPUKkgQ4xvtDUFC+Hfe+fhvmAV+Bc5VV9s3QdkG4b16/i8S
         /h/w==
X-Forwarded-Encrypted: i=1; AFNElJ/UfNYSg9z+dxKx5ORRRJsuPEbAwDhhdeTvZZ4X1r4cKUbTH84i5CilPi61UUVotCvdEE7MHfcFF5mF@vger.kernel.org
X-Gm-Message-State: AOJu0YwNbawtSqZB4ztnOt9UFtTLFpNKcZnY+jvOGoMbTe+78l6dRUSY
	hlQA5YlfUPpgNapUSBhTYxcIwfqL8gZXjztV1mrcOqfph0myByW6ngU/
X-Gm-Gg: AeBDietaqEmrtwWUYmmRX4e7ZNmXWs9qAWN1osti1XTKWf3QR1enlZyUauH2gC3Hvtz
	Qmv/35WSMy/gMz+H8PJ2DwVqzD95w5CwVUbTFTBlPd+3ebYmkNalz78eLQRGQ/g8ONWSNBHN6s0
	17sLBE+lodFIDAYLoIL0nbeXGzeuFZJCSiPFxLk1nYCnN6+rDLjElnlz8TstSBm8phuA1moU8pE
	J46Tcg0DXcS1StWI+nQ2mRfDe6VcMzzJnW5JPQgcb2rVUjObvfzM/k2uoRFXu1/NGKgON5hNxfw
	FjIR10wzNam63p+cYbWgilKx26aDr+F7ezvNmPI6maFGNWpr+NWFn67E2JpOknwIR2U5dDlbnki
	TH5l+lHTuv8CcVrGK5nmEnmNbsRjzWwASnehEUv9Ur5DO/NOPKHSmzZ7FvYjCK9mQM92jQsW9pn
	cZ5m4cc1gkFQ9WL/zB7FubKAQ=
X-Received: by 2002:a05:600c:3f16:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-48a77b1da5emr64465875e9.14.1777390600138;
        Tue, 28 Apr 2026 08:36:40 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration per-board
Date: Tue, 28 Apr 2026 18:36:10 +0300
Message-ID: <20260428153611.142816-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MFD have rigid subdevice structure which does not allow flexible dynamic
subdevice linking. Address this by diverging CPCAP subdevice composition
to take into account board specific configuration.

Create a common default subdevice composition, rename existing subdevice
composition into cpcap_mapphone_mfd_devices since it targets mainly
Mapphone board.

Removed st,6556002 as it is no longer applicable to all cases and
duplicates motorola,cpcap, which is used as the default composition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index d8243b956f87..516d1e33affa 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/sysfs.h>
 
@@ -24,10 +25,16 @@
 #define CPCAP_REGISTER_SIZE	4
 #define CPCAP_REGISTER_BITS	16
 
+struct cpcap_chip_data {
+	const struct mfd_cell *mfd_devices;
+	unsigned int num_devices;
+};
+
 struct cpcap_ddata {
 	struct spi_device *spi;
 	struct regmap_irq *irqs;
 	struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
+	const struct cpcap_chip_data *cdata;
 	const struct regmap_config *regmap_conf;
 	struct regmap *regmap;
 };
@@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
 	return 0;
 }
 
-static const struct of_device_id cpcap_of_match[] = {
-	{ .compatible = "motorola,cpcap", },
-	{ .compatible = "st,6556002", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, cpcap_of_match);
-
-static const struct spi_device_id cpcap_spi_ids[] = {
-	{ .name = "cpcap", },
-	{ .name = "6556002", },
-	{},
-};
-MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
-
 static const struct regmap_config cpcap_regmap_config = {
 	.reg_bits = 16,
 	.reg_stride = 4,
@@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume);
 
-static const struct mfd_cell cpcap_mfd_devices[] = {
+static const struct mfd_cell cpcap_default_mfd_devices[] = {
+	{
+		.name          = "cpcap_adc",
+		.of_compatible = "motorola,cpcap-adc",
+	}, {
+		.name          = "cpcap_battery",
+		.of_compatible = "motorola,cpcap-battery",
+	}, {
+		.name          = "cpcap-regulator",
+		.of_compatible = "motorola,cpcap-regulator",
+	}, {
+		.name          = "cpcap-rtc",
+		.of_compatible = "motorola,cpcap-rtc",
+	}, {
+		.name          = "cpcap-pwrbutton",
+		.of_compatible = "motorola,cpcap-pwrbutton",
+	}, {
+		.name          = "cpcap-usb-phy",
+		.of_compatible = "motorola,cpcap-usb-phy",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 0,
+		.of_compatible = "motorola,cpcap-led-red",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 1,
+		.of_compatible = "motorola,cpcap-led-green",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 2,
+		.of_compatible = "motorola,cpcap-led-blue",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 3,
+		.of_compatible = "motorola,cpcap-led-adl",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 4,
+		.of_compatible = "motorola,cpcap-led-cp",
+	}, {
+		.name          = "cpcap-codec",
+	},
+};
+
+static const struct cpcap_chip_data cpcap_default_data = {
+	.mfd_devices = cpcap_default_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_default_mfd_devices),
+};
+
+static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
 	{
 		.name          = "cpcap_adc",
 		.of_compatible = "motorola,mapphone-cpcap-adc",
@@ -285,7 +327,12 @@ static const struct mfd_cell cpcap_mfd_devices[] = {
 		.of_compatible = "motorola,cpcap-led-cp",
 	}, {
 		.name          = "cpcap-codec",
-	}
+	},
+};
+
+static const struct cpcap_chip_data cpcap_mapphone_data = {
+	.mfd_devices = cpcap_mapphone_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
 };
 
 static int cpcap_probe(struct spi_device *spi)
@@ -297,6 +344,10 @@ static int cpcap_probe(struct spi_device *spi)
 	if (!cpcap)
 		return -ENOMEM;
 
+	cpcap->cdata = device_get_match_data(&spi->dev);
+	if (!cpcap->cdata)
+		return -ENODEV;
+
 	cpcap->spi = spi;
 	spi_set_drvdata(spi, cpcap);
 
@@ -331,10 +382,24 @@ static int cpcap_probe(struct spi_device *spi)
 	spi->dev.coherent_dma_mask = 0;
 	spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
 
-	return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
-				    ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
+	return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_devices,
+				    cpcap->cdata->num_devices, NULL, 0, NULL);
 }
 
+static const struct of_device_id cpcap_of_match[] = {
+	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
+	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cpcap_of_match);
+
+static const struct spi_device_id cpcap_spi_ids[] = {
+	{ .name = "cpcap", .driver_data = (kernel_ulong_t)&cpcap_default_data },
+	{ .name = "mapphone-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mapphone_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
+
 static struct spi_driver cpcap_driver = {
 	.driver = {
 		.name = "cpcap-core",
-- 
2.51.0

