Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110618;
	b=H2yEFmK/hjGVa+MxQXpbOMG2lY2tHPMDPryvell5fXhUCZa1jW4mkP/ruSP7HrRsXczZ
	 scV7vXIhEAt0x0ni1+UkE7C13pNCb+QkZysYBLFxPxv58iApQj+coM1rTkI9ChLpZkjbu
	 N8+MX7h6JPYDQS3i27Fh6d9dIZnsAUbjv4jP7sufgoxhkmqX0f9Rx61ZS45h7EkPj4Ioj
	 kwF5a+Iqon0sdChFZ/QiZIJdsfQRySSgagNFHvTrwQRAZih25ILlAAcRLJmgbnudEksmY
	 gM/+LvEac8dyBO87d2d8uqPJGBB7l3wuzKqc6vPiGsUDIGZb4RbB8xJptBSpcTgMdWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ja+tJtt08CNms0IjCLf8fGgfbTlBnpRmZ+lJgs2TUvY=;
	b=lGrv5HTFbRAUrJN3WAb99DQ2sx2MkBL1MJp/V5YWDldTrzU9UNlyKsBQC5lNnDQXVsHi
	 9ckY6s0lIIPuOoDtVJqEE1oDmmc76BVIydTbfLsAJUOB/p0KBvfQI4G32ewffwP7Nj1mc
	 1aX+sTaNLrhUcwGf0mU8M8nGG1oMzx7f8Ji8v5nZXmtMB/easdFjCiCWIUtynMmMmRWDY
	 UHUDM11C+OkgHxHoaAAjNFWrDcgFoYQlghByF432KCEoH/lSlrqGqSBD1hSZJrlAIWJDB
	 JrxoLHNGhMx4BWyRiJrn15x187jnoulBoxs2SkW9OyjVKjuqVUQg6zqW8kkkmQ+S1Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="YdbF8G8/";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8068460A5BEB
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8068460A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YdbF8G8/
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a9be758734so731046f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110616; x=1795715416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ja+tJtt08CNms0IjCLf8fGgfbTlBnpRmZ+lJgs2TUvY=;
        b=YdbF8G8/wbUoHoj9RMHBPKBgoX4+nCYH42YCuBKLvM49uroaTx59O9QZ44o3L/xpoO
         CbHlVTmRwpKBAaXsQwIaUQe2DcG5OkbHhq9e2tCC1t0cH2KjJ/elF/Bq6seGZk0g0K6I
         AYj373RVIONzKW4OQ6eW2DyyeI68aVvIABRiIVOc29dZVUNWuH/YtZlyhSMZZczSmoDg
         s2RDgWaoDnKO5X3vK424V2OLXutQbeVnnj1Faf0jTq5YMFbPqZlsVIdq2Sawx/HPi2w8
         0XryEpIKTDg+8xzuVsJskNVNWrhGkm+PPnWIeZvoLUqmYb6VXNz3rfkZd8WMx/MLOVCD
         RhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110616; x=1795715416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ja+tJtt08CNms0IjCLf8fGgfbTlBnpRmZ+lJgs2TUvY=;
        b=u91pw3dq+14enInleNvufmON2Rl+0HbRGQs39KShBzVwMRgbWDfziZWrfVdiQE+AuY
         hj8zP8irItAFc0zQPrzbuQvVh0NntcRGkxjjOG1c9GIh5tcwnLCBqinovm6d4S4usGz9
         OzUKsNIln43VCJzQy2uFfMJ/ah9eKyP4ex9q1Q5vv8rE1W0e8EQ02ObTWYbPPUUI+OoE
         SIH42D4TSsbsPQpIO3GIr9DXNYF/B7hYS+p5Hyd5y9tvGjpMFRDVMuxJLLPW2se08AsQ
         mqqnuqTIN72H1OGL0c50pYJ2cLpA3NbVufEm3X3PycPKRXh4tqHsx65Oqq2DHZavrq/B
         1N1Q==
X-Forwarded-Encrypted: i=1; AL+hErE1J0Byw201iGucht1f+HkjRHM+7WAIe82+XVKtX8fa0hw38p2kTBixfI9CTtLzC1y7UotQXbduwVut@vger.kernel.org
X-Gm-Message-State: APuU4Z9loegBj6WGB3hVTSUqEB0YvLUr8Na1/Yf3HjOufYLGd+LFsIAh
	3cluz0f7TBRZioMhahd+0dTAQ5LJl3d0p9svOfw42V6+rj+tPccepr7v+HU+3brIwPE=
X-Gm-Gg: AZFdTZfQVE78N2kiHEjLD3qLOCsiMwPA+BB41qbLr+Hl2RbaUDO2TfZtYklhht9I+td
	sVQLKoJu5bGpr9wxq6N/+YSaiAV9TwmTKMOF0CzOen1I119F7C5GuUZgYgR8Nrv8WeSwOzTB7ps
	3psF+QGsG6G2qMUmlosPYJkf0K9n7a8ZjXqXbYYNtx9LH/7eaD1a0oPmoPLJAjuJKZSBV8+ohYi
	wrEIXgsRrZkwoDz5gWiS5AubQqoaBzsxWx+oGNDa4PBME8q0LDD3ajw5FKCeeWrEi8WZO0vX1VA
	dZhHkhFq/Hea2gJvdkAYhz45MZ9wcFb4yz8gs0ZeWut/wKTe6CzhNF2eFodz4l3tD1lsRzXNzpT
	IU09qCJABZJPl9zDGBj1MKtGALRKqKmzjYAwAjC6qb358eKfk18WGCCbPZo1HdOipFAOkXTvjB6
	NGZuuxu2UBtUZDOCniD1sHh6wX9/fdS4laKLq66Jsd9ev+56zHDdehLZ1bcBiBYbJNhumwzQqT0
	+aMt2nED3JQlRhrNEWeJNJ1Ky8mWHM0tcPWdjr0hsellZpByPJueSji81GsxRc+LmOAmIrpLJt4
	t9S6oJsmJ3XtKkQdNizR7CjmtgXmyDNP5OvgRFa39FMwnMUSOlpQhPj5g+ggQ//vuswFschWMl+
	1SO2enVNmlazQaF0mfz3pVJ+aL4nUUeBd3m7u678Fz1hmnh1QckbxB0PFdEXLbZ4UlPoy/7JSEl
	4IAg==
X-Received: by 2002:a05:6000:491b:b0:490:9fe2:6a2d with SMTP id ffacd0b85a97d-4abb0a710c2mr228627f8f.26.1795110615829;
        Thu, 19 Nov 2026 09:50:15 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm1049301f8f.1.2026.11.19.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:15 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 09/10] wifi: cw1200: add XR819 SDIO support
Date: Thu, 19 Nov 2026 18:50:01 +0100
Message-ID: <20261119175002.458988-10-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match SDIO ID 0020:2281 and use the XR819 download path. Reset the
card on probe: disabling the function leaves the host interface in
queue mode, and a second firmware download fails without the reset.

Use the board MAC address and GPIO interrupt when provided. Otherwise
use the SDIO interrupt.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/Kconfig       |   6 +-
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 123 +++++++++++++++----
 include/linux/mmc/sdio_ids.h                 |   1 +
 3 files changed, 107 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/Kconfig b/drivers/net/wireless/st/cw1200/Kconfig
index 03575e9894bb..8c2f759d8bd8 100644
--- a/drivers/net/wireless/st/cw1200/Kconfig
+++ b/drivers/net/wireless/st/cw1200/Kconfig
@@ -3,7 +3,8 @@ config CW1200
 	tristate "CW1200 WLAN support"
 	depends on MAC80211 && CFG80211
 	help
-	  This is a driver for the ST-E CW1100 & CW1200 WLAN chipsets.
+	  This is a driver for the ST-E CW1100, CW1200 and XRadio XR819
+	  WLAN chipsets.
 	  This option just enables the driver core, see below for
 	  specific bus support.
 
@@ -13,7 +14,8 @@ config CW1200_WLAN_SDIO
 	tristate "Support SDIO platforms"
 	depends on CW1200 && MMC
 	help
-	  Enable support for the CW1200 connected via an SDIO bus.
+	  Enable support for CW1200-family devices connected via an SDIO bus,
+	  including the XRadio XR819.
 	  By default this driver only supports the Sagrad SG901-1091/1098 EVK
 	  and similar designs that utilize a hardware reset circuit. To
 	  support different CW1200 SDIO designs you will need to override
diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 4f4bd668ebd2..330a4d0946bc 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -18,6 +18,9 @@
 #include <linux/mmc/card.h>
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/sdio_ids.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_net.h>
 #include <net/mac80211.h>
 
 #include "cw1200.h"
@@ -50,14 +53,28 @@ struct hwbus_priv {
 	struct sdio_func	*func;
 	struct cw1200_common	*core;
 	const struct cw1200_platform_data_sdio *pdata;
+	struct cw1200_platform_data_sdio pdata_storage;
+	u8 macaddr[ETH_ALEN];
+	bool is_xr819;
 };
 
 static const struct sdio_device_id cw1200_sdio_ids[] = {
 	{ SDIO_DEVICE(SDIO_VENDOR_ID_STE, SDIO_DEVICE_ID_STE_CW1200) },
+	{ SDIO_DEVICE(SDIO_VENDOR_ID_STE, SDIO_DEVICE_ID_STE_XR819) },
 	{ /* end: all zeroes */			},
 };
 MODULE_DEVICE_TABLE(sdio, cw1200_sdio_ids);
 
+static const struct of_device_id cw1200_sdio_of_match[] = {
+	{ .compatible = "xradio,xr819" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cw1200_sdio_of_match);
+
+MODULE_FIRMWARE("xr819/boot_xr819.bin");
+MODULE_FIRMWARE("xr819/fw_xr819.bin");
+MODULE_FIRMWARE("xr819/sdd_xr819.bin");
+
 /* hwbus_ops implemetation */
 
 static int cw1200_sdio_memcpy_fromio(struct hwbus_priv *self,
@@ -142,6 +159,7 @@ static irqreturn_t cw1200_gpio_irq(int irq, void *dev_id)
 
 static int cw1200_request_irq(struct hwbus_priv *self)
 {
+	unsigned long trigger = irq_get_trigger_type(self->pdata->irq);
 	int ret;
 	int err;
 	u8 ien;
@@ -160,10 +178,10 @@ static int cw1200_request_irq(struct hwbus_priv *self)
 		goto restore_ien;
 
 	/* Request the IRQ */
-	ret =  request_threaded_irq(self->pdata->irq, cw1200_gpio_hardirq,
-				    cw1200_gpio_irq,
-				    IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-				    "cw1200_wlan_irq", self);
+	ret = request_threaded_irq(self->pdata->irq, cw1200_gpio_hardirq,
+				   cw1200_gpio_irq, IRQF_ONESHOT |
+				   (trigger ?: IRQF_TRIGGER_HIGH),
+				   "cw1200_wlan_irq", self);
 	if (!ret)
 		return 0;
 
@@ -303,11 +321,28 @@ static const struct hwbus_ops cw1200_sdio_hwbus_ops = {
 	.power_mgmt		= cw1200_sdio_pm,
 };
 
+static int cw1200_sdio_core_probe(struct hwbus_priv *self,
+				  struct sdio_func *func)
+{
+	if (self->is_xr819)
+		return cw1200_core_probe_xr819(&cw1200_sdio_hwbus_ops, self,
+						&func->dev, &self->core,
+						self->pdata->ref_clk,
+						self->pdata->macaddr,
+						self->pdata->sdd_file);
+
+	return cw1200_core_probe(&cw1200_sdio_hwbus_ops, self, &func->dev,
+				 &self->core, self->pdata->ref_clk,
+				 self->pdata->macaddr, self->pdata->sdd_file,
+				 self->pdata->have_5ghz);
+}
+
 /* Probe Function to be called by SDIO stack when device is discovered */
 static int cw1200_sdio_probe(struct sdio_func *func,
 			     const struct sdio_device_id *id)
 {
 	struct hwbus_priv *self;
+	int irq;
 	int status;
 
 	pr_info("cw1200_wlan_sdio: Probe called\n");
@@ -324,30 +359,75 @@ static int cw1200_sdio_probe(struct sdio_func *func,
 
 	func->card->quirks |= MMC_QUIRK_LENIENT_FN0;
 
-	self->pdata = global_plat_data; /* FIXME */
+	self->pdata_storage = *global_plat_data;
+	self->pdata = &self->pdata_storage;
+	self->is_xr819 = id->device == SDIO_DEVICE_ID_STE_XR819;
+	if (self->is_xr819) {
+		func->card->quirks |= MMC_QUIRK_BROKEN_BYTE_MODE_512;
+		self->pdata_storage.ref_clk = 24000;
+		self->pdata_storage.have_5ghz = false;
+		self->pdata_storage.sdd_file = "xr819/sdd_xr819.bin";
+
+		if (of_property_present(func->dev.of_node, "interrupts") ||
+		    of_property_present(func->dev.of_node, "interrupts-extended")) {
+			irq = of_irq_get(func->dev.of_node, 0);
+			if (irq <= 0) {
+				status = dev_err_probe(&func->dev, irq ?: -EINVAL,
+						       "cannot map GPIO interrupt\n");
+				goto free_self;
+			}
+			self->pdata_storage.irq = irq;
+		}
+
+		status = of_get_mac_address(func->dev.of_node, self->macaddr);
+		if (status == -EPROBE_DEFER)
+			goto free_self;
+		if (!status)
+			self->pdata_storage.macaddr = self->macaddr;
+	}
 	self->func = func;
+	if (self->is_xr819) {
+		/* Disabling the function leaves the HIF in queue mode. Reset
+		 * the single-function XR819 before starting another download.
+		 */
+		sdio_claim_host(func);
+		status = mmc_hw_reset(func->card);
+		sdio_release_host(func);
+		if (status)
+			goto free_self;
+	}
 	sdio_set_drvdata(func, self);
 	sdio_claim_host(func);
-	sdio_enable_func(func);
+	status = sdio_enable_func(func);
 	sdio_release_host(func);
+	if (status)
+		goto clear_drvdata;
 
-	status = cw1200_sdio_irq_subscribe(self);
-
-	status = cw1200_core_probe(&cw1200_sdio_hwbus_ops,
-				   self, &func->dev, &self->core,
-				   self->pdata->ref_clk,
-				   self->pdata->macaddr,
-				   self->pdata->sdd_file,
-				   self->pdata->have_5ghz);
-	if (status) {
-		cw1200_sdio_irq_unsubscribe(self);
+	if (self->is_xr819) {
 		sdio_claim_host(func);
-		sdio_disable_func(func);
+		status = sdio_set_block_size(func, SDIO_BLOCK_SIZE);
 		sdio_release_host(func);
-		sdio_set_drvdata(func, NULL);
-		kfree(self);
+		if (status)
+			goto disable_func;
 	}
 
+	status = cw1200_sdio_irq_subscribe(self);
+	if (status)
+		goto disable_func;
+
+	status = cw1200_sdio_core_probe(self, func);
+	if (!status)
+		return 0;
+
+	cw1200_sdio_irq_unsubscribe(self);
+disable_func:
+	sdio_claim_host(func);
+	sdio_disable_func(func);
+	sdio_release_host(func);
+clear_drvdata:
+	sdio_set_drvdata(func, NULL);
+free_self:
+	kfree(self);
 	return status;
 }
 
@@ -408,11 +488,12 @@ static struct sdio_driver sdio_driver = {
 	.id_table	= cw1200_sdio_ids,
 	.probe		= cw1200_sdio_probe,
 	.remove		= cw1200_sdio_disconnect,
-#ifdef CONFIG_PM
 	.drv = {
+#ifdef CONFIG_PM
 		.pm = &cw1200_pm_ops,
-	}
 #endif
+		.of_match_table = cw1200_sdio_of_match,
+	},
 };
 
 /* Init Module function -> Called by insmod */
diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index dfffda3d8002..35789be747a5 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -27,6 +27,7 @@
 
 #define SDIO_VENDOR_ID_STE			0x0020
 #define SDIO_DEVICE_ID_STE_CW1200		0x2280
+#define SDIO_DEVICE_ID_STE_XR819		0x2281
 
 #define SDIO_VENDOR_ID_INTEL			0x0089
 #define SDIO_DEVICE_ID_INTEL_IWMC3200WIMAX	0x1402
-- 
2.56.0

