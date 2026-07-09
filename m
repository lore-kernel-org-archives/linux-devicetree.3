Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EF3B1EC0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572808; cv=none; b=dVhe1pxt3T4DEQif635iNbZqsGMVYukF5F5aZNbG3OwT4/Ce0/V1M24HqzCveodlE2+p7zOUp6AFcBup4PUUlnTAz458eDfGIHRK6rnxNSxuWjrGDoj8iJe/75gSMmTVQNTTR18N4SVLqkjiCHWTYeZu3kjdN4XHdmCc5tKRzmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572808; c=relaxed/simple;
	bh=9ETvrgpcOsds9lmxQAmOQHpch3UKS4v/aQsM3zZkK1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNqT2XIKJSQYrvlLpSF/B9wl58K1IadsNVCAC3F6w4Zs0abRv9NuuSXxVFSVNeeaOUxXDWFyNgK/wB895tHER9+JCjvcsdY6u+XDNOh2K2ULD5BFNlr31ZpRg0HH4djCOLAe6JYUXlUouqpM6Ibp0rwh93YkgHZLhLLUhsgtLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=olnq9z1X; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olnq9z1X"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8482074a000so1210228b3a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572807; x=1784177607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxBAC1X03as+tFyIiqR1eSV5/XvfuyfF0ASJNC6z1U8=;
        b=olnq9z1Xyrx4ynUjlpGRICcF35L7oXLRf1zyGWJvsPnYU8FafcJIGID1vXZuSUEZqt
         6J+zM14e8BdjJCNVpmc7eSw/dNIvEx6xC9zuIpTPqcXZb9dSN0oAvDee/On7CLq6wTE4
         jRdzlQhdTvL7E+AgRFXDQGqxVjLIo2IwpwClWqEhvJofPX0DGYDWAL8DHykAvqlbNBBu
         a0rXspRpV/881tWK7GzcDmLOTx5mxGu5WjIU4EGpGnbqJbOiv4ul2TkMDhurR3INadnS
         EHpngEbFPccLZtbyH7JkG4Xk4+OIr+ijv7OwPG88ZGgltmzACXHCVJ2uWLJiBnQwaiUR
         amAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572807; x=1784177607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxBAC1X03as+tFyIiqR1eSV5/XvfuyfF0ASJNC6z1U8=;
        b=fPiuMykVj3W9TCTAFfrm9XHgx8ZFBsSjLngfSdiKjfjYKHTgiObaKyrGm6UHiwG4Lq
         uXuPCXKwGxJ0pztlY1rHJKicJ/hrlVYoJZ1GFhjUxwWowN/ZORB6JbM2diYihd5rj4w1
         wFwkdC49jgYKojw4X+jpOhgeY8FcW3HWgaR9HLlR+pcGbY5XuUgVJ4eYZusuEAt5KSlG
         5gUJ2qsL4UVwN3b7IDMkiUAyYGbda3PYtXEjq1moK47hzkNZ2U1MKWkNZz3uelXnPLb7
         9vuJjVR+9bt6kFDTN1hBskwXC0qe7S5wKdd2KX/Ihi9TMCsmFu34xDIWBKJcEu3zGzEg
         /5WQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEaWp1asq5UG0eODwOwPLzRkAwiLhXh/JcIk2GW/KFfAnEkOg7BHfMsoCd4j7nL++3RSl6vpr/bA+D@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBtLZyL5qrKzzbD98K3x7l7XWaUTzLBHWpjQ6FQ7wcRch58hW
	ypDZ3d2byQwL+IpkqXSNs2kBaxo45JHLn7+3gQ2XokCYLpXAVovvZHXU
X-Gm-Gg: AfdE7cmguf0gjinOt5tHHgLsW9g71LDVHoKcOjqszTlmrIrh5Q68u4LuHkCy3xWlXfK
	+G7xitK+3aH6BACyp3TPM0keXNq3HyXU5MEh2of7j2uGIOf6YZE/et2KV3ToNkbnU+vvp4PjzV/
	or38yeJD639//u4KXXLrzeLvBs7Nn1Efid0TnjVkbORX7OX3F6WKfH14/DWbCWMYcZV8kel3i+U
	YHA14EgRy9+FR2oC7Iairj8gMvWipwa34s3RTugt3WvYEhPTPPqkjfZQ6ABVz2bS5XZj1Y45A+M
	TBKkHfSmu8O/e6fWGmZtUsgqHzBVOIA24EsU3y8PXXZcRbgb7BKaWxYGS6JGLGLFPqC6Mo1bI4U
	b11R1M+MQhnQSv+PQ3dDDVzm0bR4SSyYG9ZUb+higia/zoj23u96lvm9lYpO4LWKcvTmmzpKO/w
	P7k7sUttWWQ+yliPH8jTRMysY6SCqgFoVBluk/Y87VhBJAXGqBkrewmgEIRXiMNyPzmBPxb4trl
	MnS6lOtrIgEOTI=
X-Received: by 2002:a05:6a20:a107:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c0bc95a3cbmr6838051637.28.1783572806789;
        Wed, 08 Jul 2026 21:53:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:09 -0700
Subject: [PATCH v2 11/11] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-11-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
Cragganmore 6410 board to use software nodes/properties. This allows
removing the crag_leds_table GPIO lookup table.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 03a97a20e38c..b48980920aee 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -319,12 +319,17 @@ static const struct property_entry crag6410_mmgpio_props[] = {
 	{ }
 };
 
+static const struct software_node crag6410_mmgpio_node = {
+	.name		= "basic-mmio-gpio",
+	.properties	= crag6410_mmgpio_props,
+};
+
 static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
 	.res		= crag6410_mmgpio_resource,
 	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.properties	= crag6410_mmgpio_props,
+	.swnode		= &crag6410_mmgpio_node,
 };
 
 static struct platform_device speyside_device = {
@@ -839,61 +844,68 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 	.host_caps		= MMC_CAP_POWER_OFF_CARD,
 };
 
-static const struct gpio_led gpio_leds[] = {
-	{
-		.name = "d13:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d14:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d15:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d16:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d17:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d18:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d19:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d20:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
+static const struct software_node crag6410_leds_node = {
+	.name = "leds-gpio",
 };
 
-static struct gpiod_lookup_table crag_leds_table = {
-	.dev_id = "leds-gpio",
-	.table = {
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
-		{ },
-	},
-};
+#define CRAG6410_LED_NODE(_idx, _name)					\
+static const struct property_entry crag6410_led##_idx##_props[] = {	\
+	PROPERTY_ENTRY_STRING("label", _name),				\
+	PROPERTY_ENTRY_GPIO("gpios", &crag6410_mmgpio_node,		\
+			    _idx, GPIO_ACTIVE_LOW),			\
+	PROPERTY_ENTRY_STRING("default-state", "on"),			\
+	{ }								\
+};									\
+static const struct software_node crag6410_led##_idx##_node = {	\
+	.parent = &crag6410_leds_node,					\
+	.properties = crag6410_led##_idx##_props,			\
+}
 
-static const struct gpio_led_platform_data gpio_leds_pdata = {
-	.leds = gpio_leds,
-	.num_leds = ARRAY_SIZE(gpio_leds),
+CRAG6410_LED_NODE(0, "d13:green:");
+CRAG6410_LED_NODE(1, "d14:green:");
+CRAG6410_LED_NODE(2, "d15:green:");
+CRAG6410_LED_NODE(3, "d16:green:");
+CRAG6410_LED_NODE(4, "d17:green:");
+CRAG6410_LED_NODE(5, "d18:green:");
+CRAG6410_LED_NODE(6, "d19:green:");
+CRAG6410_LED_NODE(7, "d20:green:");
+
+static const struct software_node *crag6410_leds_swnodes[] = {
+	&crag6410_leds_node,
+	&crag6410_led0_node,
+	&crag6410_led1_node,
+	&crag6410_led2_node,
+	&crag6410_led3_node,
+	&crag6410_led4_node,
+	&crag6410_led5_node,
+	&crag6410_led6_node,
+	&crag6410_led7_node,
+	NULL
 };
 
+static void __init crag6410_setup_leds(void)
+{
+	struct platform_device_info leds_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_leds_swnodes);
+	if (err) {
+		pr_err("failed to register leds software nodes: %d\n", err);
+		return;
+	}
+
+	leds_info.fwnode = software_node_fwnode(&crag6410_leds_node);
+
+	pd = platform_device_register_full(&leds_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create leds-gpio device: %d\n", err);
+}
+
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
 static const struct software_node_ref_args crag6410_spi0_gpio_refs[] = {
@@ -972,13 +984,12 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
-	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
 	crag6410_setup_spi0();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
-	gpio_led_register_device(-1, &gpio_leds_pdata);
+	crag6410_setup_leds();
 
 	regulator_has_full_constraints();
 

-- 
2.55.0.795.g602f6c329a-goog

