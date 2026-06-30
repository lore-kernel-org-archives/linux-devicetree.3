Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279247276A;
	Tue, 30 Jun 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853175; cv=none; b=EPMqDkJfQx/xomseexnSjtTnZ1mEFWETezrlAZFJ2WAZN4TpGDHYi7OEj7XaBZ+LgKdoTIWKyPyFTHVkCHCXpwfH3wN72+Ox5+557WIgJ3I5ahR8pYKTsq0NyuNpm3nNW4seMAkaddPtFxdLuBzvnUAVveEfKtnXQi8CWnDmZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853175; c=relaxed/simple;
	bh=iaFFiQgDyZXk/kFJjoOfbFOp6pdD6qRfHorKmvQSCWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMuoBG6h/y6S488Ks79H+DePZF5ab0Ka+Kv3qp8M9rHY+5ms3tCdaUfaEhKSHHRIuyaQd9Yxhz431d1G3IRFu+kglECEOy5aAbXE6WBgV9yAM/hVm0A3cQPaF3qOZ5cMWmF+/FnaZGbdPVovCuUYMidR+3867KSOn71MgDgsQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ipxeAVrA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3TrrTAHI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ipxeAVrA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3TrrTAHI"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782853173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ICUhVACWcAi7SV3OEbzXCcGtHLfpJhmb40HFvBXcQE=;
	b=ipxeAVrAJN/pP/I8oeHva7ovURB4wYuu/qoKIpGwFHdT7oHOF3Oqy+f9ep2sEdD+uMcSjM
	0SYJiEu4SmK6DIqDZ95X9GCFdnKMhQAN95GAVjKIO2xz7j9je+5FYogdLQed+zzDgwggaF
	iRsjhRMpUF7CDCgGNHqxl8PCjyM3kChdT2prOCwo3slDhbeXRcEnSHTjDkXnlEkqJXx7ya
	bqeN80h/4OM6+8U4xF16ZZykMM6rXJYdxm37301/Dafd/NjBWxRISZpDvOxugeIwv4IGop
	qdDrYZlV6BEES8JzjQFLgZZTWpbO9fcNd1dLNCT4Jv5jN8vJ8po+zPL6fZsXbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782853173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ICUhVACWcAi7SV3OEbzXCcGtHLfpJhmb40HFvBXcQE=;
	b=3TrrTAHIaBraCZFRazQ6jjCkzHhS9RvVVxT/YAmhNnFjsyA8ngKUoBaSfzxRBJ3sypHu1+
	kmuJmnpz2vfZ99CQ==
Date: Tue, 30 Jun 2026 22:59:29 +0200
Subject: [PATCH v2 3/4] firmware: raspberrypi: Add reboot mode support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-rpi-tryboot-v2-3-f68d2dc6aa27@linutronix.de>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
In-Reply-To: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853171; l=4007;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=iaFFiQgDyZXk/kFJjoOfbFOp6pdD6qRfHorKmvQSCWQ=;
 b=lly/lpwL+DVNzjetkbQZYotaEof93cz6r0M84FXhobkPmrCP7NLNeVxJLuwPmSNQfe3EkLwTa
 HM2aqLW9h0oD+UUqdLGcAvt9/a1S6stXOG06UQ/t0UClxPRODh274bz
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This can be used to create a A/B update schema.

To enable this on the next boot the RPI_FIRMWARE_SET_REBOOT_FLAGS
message must be send to the firmware.

Add support for this by registering a reboot mode driver.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/Kconfig                   |  1 +
 drivers/firmware/raspberrypi.c             | 23 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d84838..04bc8263e0017 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -115,6 +115,7 @@ config ISCSI_IBFT
 config RASPBERRYPI_FIRMWARE
 	tristate "Raspberry Pi Firmware Driver"
 	depends on BCM2835_MBOX
+	select REBOOT_MODE
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e73..bba8d14604002 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
@@ -29,6 +30,7 @@ struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
 	struct completion c;
+	struct reboot_mode_driver reboot_mode;
 	u32 enabled;
 
 	struct kref consumers;
@@ -273,10 +275,25 @@ static void devm_rpi_firmware_put(void *data)
 	rpi_firmware_put(fw);
 }
 
+static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *reboot,
+					  unsigned int magic)
+{
+	struct rpi_firmware *fw = container_of(reboot, struct rpi_firmware,
+					       reboot_mode);
+	int ret = 0;
+
+	if (magic)
+		ret = rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
+					    &magic, sizeof(magic));
+
+	return ret;
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *fw;
+	int ret;
 
 	/*
 	 * Memory will be freed by rpi_firmware_delete() once all users have
@@ -306,6 +323,12 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
 
+	fw->reboot_mode.dev = dev;
+	fw->reboot_mode.write = rpi_firmware_reboot_mode_write;
+	ret = devm_reboot_mode_register(dev, &fw->reboot_mode);
+	if (ret)
+		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
+
 	return 0;
 }
 
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 66cc5a426c3c5..f905bff0fb3ea 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -81,6 +81,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
@@ -92,6 +93,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
+	RPI_FIRMWARE_SET_REBOOT_FLAGS =                       0x00038064,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,

-- 
2.47.3

