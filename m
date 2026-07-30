Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9CD3F9A04;
	Thu, 30 Jul 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409181; cv=none; b=YFtsEH1w7xAxE96b2nZ3WfD3kGKyknpENgqCeGV6eBA3Wj5C2ClukJDpdpQ07iQXGsc1l/Ofzc9In1SI/A/4BlgNQnR3ARK63PYFv2lbB7WklMiA5DA+0YaoAb7REQjJNMy0oMWcWbbI1q0Cesbo2geiNrJMnsOjM00/Ewio1pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409181; c=relaxed/simple;
	bh=aVib4fCsqkeVRrhMu/mBdWJ18ZieZz56/QaSzsVYf2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kjw4GQXPGh0D5e49Dyac3U03awv1n3rgms3wog5Xe54Gyznq8MAytkXJKl19DGgvZjGlAyVlP89on8iWnn/OHiwf7ISY/80SomU9DIom8WVks8HuK0Nk7Oi70DA91vrOVrHgab5cwrgaNMpIppExEPFjDQiTG4bE9PxqsfE/0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qe6Oww33; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PnIN00T4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qe6Oww33";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PnIN00T4"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785409177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=044J0gO073tQYAkg1IXcRIuu+lt77FVy0tkJLEoUrq0=;
	b=qe6Oww33iUM3fHdRlIBDV5D+PI/ZMKNhJS0VPM6RJwaVcWc/I8BuWuNjRt6DDJHSMoWI9k
	zyUmhxisXMhMXysF32UwDhaDyOCPzUVYmkQCmbi7QUGxTkF1ov9F+QhkK1LJV129mXhR2W
	ogrzKxtd32a5T5slUoa4mrZGo28LveT/t7YgONCxGx0aRZgfOuxxNSrDh8fd+CDaC0YLZU
	tObzSk5injP1KoD+/tPn2Z7w89uJifI1sV/KjvtIg/mg4JGLKxiyFB7J75LrVvLazhp9wY
	8JVCUV39/4dOZIkHDXDiJ/zChIoJYLlzjnOOhN+DzQOq3fE+IzF/WfPBLf58zQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785409177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=044J0gO073tQYAkg1IXcRIuu+lt77FVy0tkJLEoUrq0=;
	b=PnIN00T4uQuLyS92yK1yOxituZFaTuSZlC/fgvnnETBxW2tNvdbzMV+VPc4nqzVjXsGv/V
	NGLBPJE6AbXk8ZDw==
Date: Thu, 30 Jul 2026 12:59:30 +0200
Subject: [PATCH RESEND v3 1/4] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rpi-tryboot-v3-1-849c001d67f8@linutronix.de>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
In-Reply-To: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785409176; l=4656;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=aVib4fCsqkeVRrhMu/mBdWJ18ZieZz56/QaSzsVYf2M=;
 b=yZlx5rYSvlh7puLnFI/lyE7VMFHWX9a3FhxBISth4KJTrZXFQCRE9R/lXG4tXEYmt41ldjFsF
 1r3G3Hyyh9yBzQMXR+lJ/e86EBExSRTn8fFhLh1hq6pl57/fKi2nMWq
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The enum was once ordered by tag values. The later added tags were added
in a different order. Reorder the tags again.

No functional change intended.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..66cc5a426c3c 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -72,26 +72,26 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_EDID_BLOCK =                         0x00030020,
 	RPI_FIRMWARE_GET_CUSTOMER_OTP =                       0x00030021,
 	RPI_FIRMWARE_GET_DOMAIN_STATE =                       0x00030030,
+	RPI_FIRMWARE_GET_GPIO_STATE =                         0x00030041,
+	RPI_FIRMWARE_GET_GPIO_CONFIG =                        0x00030043,
+	RPI_FIRMWARE_GET_PERIPH_REG =                         0x00030045,
 	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
 	RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
+	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
+	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
+	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
 	RPI_FIRMWARE_SET_TURBO =                              0x00038009,
 	RPI_FIRMWARE_SET_CUSTOMER_OTP =                       0x00038021,
 	RPI_FIRMWARE_SET_DOMAIN_STATE =                       0x00038030,
-	RPI_FIRMWARE_GET_GPIO_STATE =                         0x00030041,
 	RPI_FIRMWARE_SET_GPIO_STATE =                         0x00038041,
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
-	RPI_FIRMWARE_GET_GPIO_CONFIG =                        0x00030043,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
-	RPI_FIRMWARE_GET_PERIPH_REG =                         0x00030045,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
-	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
-	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
-	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
-	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,
@@ -107,7 +107,6 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_GET_PALETTE =                0x0004000b,
 	RPI_FIRMWARE_FRAMEBUFFER_GET_TOUCHBUF =               0x0004000f,
 	RPI_FIRMWARE_FRAMEBUFFER_GET_GPIOVIRTBUF =            0x00040010,
-	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT = 0x00044003,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =  0x00044004,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_DEPTH =                 0x00044005,
@@ -117,6 +116,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_OVERSCAN =              0x0004400a,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_PALETTE =               0x0004400b,
 	RPI_FIRMWARE_FRAMEBUFFER_TEST_VSYNC =                 0x0004400e,
+	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT =  0x00048003,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT =   0x00048004,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_DEPTH =                  0x00048005,
@@ -125,10 +125,10 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_OFFSET =         0x00048009,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_OVERSCAN =               0x0004800a,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_PALETTE =                0x0004800b,
-	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
-	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_VSYNC =                  0x0004800e,
 	RPI_FIRMWARE_FRAMEBUFFER_SET_BACKLIGHT =              0x0004800f,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
 
 	RPI_FIRMWARE_VCHIQ_INIT =                             0x00048010,
 

-- 
2.47.3

