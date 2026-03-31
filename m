Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF003ED12A
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948873; cv=none; b=e/Ux3OYDHpHiVLyxMzSzEwDlbsKFG91eoUIqYSYO0UT8VZpCziGo9iMbxx5BpzDi9jiW4rm0uJUmYdAIaUQtX0PWQifHwpKaJaTaBmsoeR0NOd/7IRnIzdCpZw7fZLSWOBo5fs1zGZX9ofL1B/ruwQmgAhaGaKiOyelzoNyswSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948873; c=relaxed/simple;
	bh=PrIEaAlWMqFxw5Jn7WHzl3O2r4YJ5hTpvd+Bgr97Aus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mvs2xrLlwYpiqcotG4KI92BSmo6ff9gPKdYxMHuFRGyuTt8W749zth99uEZmbvYelefpydTvhrZwzbNFWfbB+UlsyQJWzaun2rjGoQq4TH5VBcmw+Pg5Qg2EoVx9/dL66KWQVkRFUzxVpVFwmQ/eDtEF9qPBzRD+4xSJlh68Oqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MgyFIQxb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MgyFIQxb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E06B71A30B5;
	Tue, 31 Mar 2026 09:21:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5D566029D;
	Tue, 31 Mar 2026 09:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF6E5104507D9;
	Tue, 31 Mar 2026 11:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774948869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8/LVdrBvY/FY90R2CAyfW1c+RtotDC8zyPVeOMrbMIM=;
	b=MgyFIQxbx6H80nvzFf1a2EmVAWvayNhK/8yDpeVMlNrC6mFfeW1liLJ6Pi7va0pviidSp4
	BsblAxyGeLs6/2bO/vNMdNvpl72EUfA5rchdxa+PQzO7u6oHOAleK8LO0o20lD7z3bKMra
	RQpm6CP5O4b/LBRkJEcNyYNFcNfB0nssQjq1hCt+WYqNxuGpQdlkE1AbecxEHXPAK5lOlo
	RNHhsAdM8rqX+LSH01AtnqKukZM4Omd1gxPQNYq4/UqTU2QcnTgI6x7b62s9FkHljDIhb0
	MYEE81S21n606fclb6KpyI0YgCb/E+2691clYEgxmEADH2hUZeuDbRHU84c9nw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 31 Mar 2026 11:20:58 +0200
Subject: [PATCH v3 3/3] misc: ti_fpc202: Support special-purpose GPIO lines
 with LED features
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fpc202-leds-v3-3-74b173537d42@bootlin.com>
References: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
In-Reply-To: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felix Gu <ustc.gu@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The FPC202 dual port controller has 20 regular GPIO lines and 8 special
GPIO lines with LED features. Each one of these "LED GPIOs" can output PWM
and blink signals.

Add support for the eight special-purpose GPIO lines to the existing FPC202
driver's GPIO support. Add support for registering led-class devices on
these GPIO lines.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/misc/Kconfig     |   1 +
 drivers/misc/ti_fpc202.c | 339 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 327 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index dcb36e39d7079..00683bf06258f 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -117,6 +117,7 @@ config TI_FPC202
 	tristate "TI FPC202 Dual Port Controller"
 	depends on I2C
 	depends on GPIOLIB
+	depends on LEDS_CLASS
 	select I2C_ATR
 	help
 	  If you say yes here you get support for the Texas Instruments FPC202
diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
index 79a029d79f7a6..2aac83ec4a395 100644
--- a/drivers/misc/ti_fpc202.c
+++ b/drivers/misc/ti_fpc202.c
@@ -7,12 +7,17 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/i2c-atr.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/math.h>
+#include <linux/types.h>
 
 #define FPC202_NUM_PORTS 2
 #define FPC202_ALIASES_PER_PORT 2
@@ -34,18 +39,55 @@
  * ...
  * 19: P1_S1_OUT_B
  *
+ * Ports with optional LED control:
+ *
+ * 20: P0_S0_OUT_C (P0_S0_LED1)
+ * ...
+ * 23: P1_S1_OUT_C (P1_S1_LED1)
+ * 24: P0_S0_OUT_D (P0_S0_LED2
+ * ...
+ * 27: P1_S1_OUT_D (P1_S1_LED2)
+ *
  */
 
-#define FPC202_GPIO_COUNT 20
+#define FPC202_GPIO_COUNT 28
 #define FPC202_GPIO_P0_S0_IN_B  4
 #define FPC202_GPIO_P0_S0_OUT_A 12
+#define FPC202_GPIO_P0_S0_OUT_C 20
+#define FPC202_GPIO_P0_S0_OUT_D 24
 
 #define FPC202_REG_IN_A_INT    0x6
 #define FPC202_REG_IN_C_IN_B   0x7
 #define FPC202_REG_OUT_A_OUT_B 0x8
+#define FPC202_REG_OUT_C_OUT_D 0x9
 
 #define FPC202_REG_OUT_A_OUT_B_VAL 0xa
 
+#define FPC202_LED_COUNT 8
+
+/* There are four LED GPIO mode registers which manage two GPIOs each. */
+#define FPC202_REG_LED_MODE(offset) (0x1a + 0x20 * ((offset) % 4))
+
+/* LED1 GPIOs (*_OUT_C) are configured in bits 1:0, LED2 GPIOs (*_OUT_D) in bits 3:2. */
+#define FPC202_LED_MODE_SHIFT(offset) ((offset) < FPC202_GPIO_P0_S0_OUT_D ? 0 : 2)
+#define FPC202_LED_MODE_MASK(offset) (GENMASK(1, 0) << FPC202_LED_MODE_SHIFT(offset))
+
+/* There is one PWM control register for each GPIO LED */
+#define FPC202_REG_LED_PWM(offset) \
+	(((offset) < FPC202_GPIO_P0_S0_OUT_D ? 0x14 : 0x15) + 0x20 * ((offset) % 4))
+
+/* There are two blink delay registers (on/off time) for each GPIO LED */
+#define FPC202_REG_LED_BLINK_ON(offset) \
+	(((offset) < FPC202_GPIO_P0_S0_OUT_D ? 0x16 : 0x18) + 0x20 * ((offset) % 4))
+#define FPC202_REG_LED_BLINK_OFF(offset) (FPC202_REG_LED_BLINK_ON(offset) + 1)
+
+/* The actual hardware precision is 2.5ms but since the LED API doesn't handle sub-millisecond
+ * timesteps this is rounded up to 5ms
+ */
+#define FPC202_LED_BLINK_PRECISION 5UL
+
+#define FPC202_LED_MAX_BRIGHTNESS 255
+
 #define FPC202_REG_MOD_DEV(port, dev) (0xb4 + ((port) * 4) + (dev))
 #define FPC202_REG_AUX_DEV(port, dev) (0xb6 + ((port) * 4) + (dev))
 
@@ -59,15 +101,34 @@
 /* Even aliases are assigned to device 0 and odd aliases to device 1 */
 #define fpc202_dev_num_from_alias(alias) ((alias) % 2)
 
+enum fpc202_led_mode {
+	FPC202_LED_MODE_OFF = 0,
+	FPC202_LED_MODE_ON = 1,
+	FPC202_LED_MODE_PWM = 2,
+	FPC202_LED_MODE_BLINK = 3,
+};
+
+struct fpc202_led {
+	int offset;
+	struct led_classdev led_cdev;
+	struct fpc202_priv *priv;
+	struct gpio_desc *gpio;
+	enum fpc202_led_mode mode;
+};
+
 struct fpc202_priv {
 	struct i2c_client *client;
 	struct i2c_atr *atr;
 	struct gpio_desc *en_gpio;
 	struct gpio_chip gpio;
+	struct fpc202_led leds[FPC202_LED_COUNT];
 
 	/* Lock REG_MOD/AUX_DEV and addr_caches during attach/detach */
 	struct mutex reg_dev_lock;
 
+	/* Lock LED mode select register during accesses */
+	struct mutex led_mode_lock;
+
 	/* Cached device addresses for both ports and their devices */
 	u8 addr_caches[2][2];
 
@@ -97,6 +158,11 @@ static int fpc202_gpio_get_dir(int offset)
 	return offset < FPC202_GPIO_P0_S0_OUT_A ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
+static int fpc202_gpio_has_led_caps(int offset)
+{
+	return offset >= FPC202_GPIO_P0_S0_OUT_C;
+}
+
 static int fpc202_read(struct fpc202_priv *priv, u8 reg)
 {
 	int val;
@@ -118,6 +184,37 @@ static void fpc202_set_enable(struct fpc202_priv *priv, int enable)
 	gpiod_set_value(priv->en_gpio, enable);
 }
 
+static int fpc202_led_mode_write(struct fpc202_priv *priv,
+				 int offset,
+				 enum fpc202_led_mode mode)
+{
+	u8 val, reg = FPC202_REG_LED_MODE(offset);
+	int ret;
+
+	guard(mutex)(&priv->led_mode_lock);
+
+	ret = fpc202_read(priv, reg);
+	if (ret < 0) {
+		dev_err(&priv->client->dev, "failed to read LED mode %d! err %d\n",
+			offset, ret);
+		return ret;
+	}
+
+	val = (u8)ret & ~FPC202_LED_MODE_MASK(offset);
+	val |= mode << FPC202_LED_MODE_SHIFT(offset);
+
+	return fpc202_write(priv, reg, val);
+}
+
+static int fpc202_led_mode_set(struct fpc202_led *led, enum fpc202_led_mode mode)
+{
+	struct fpc202_priv *priv = led->priv;
+
+	led->mode = mode;
+
+	return fpc202_led_mode_write(priv, led->offset, mode);
+}
+
 static int fpc202_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   int value)
 {
@@ -125,6 +222,16 @@ static int fpc202_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	int ret;
 	u8 val;
 
+	if (fpc202_gpio_has_led_caps(offset)) {
+		ret = fpc202_led_mode_write(priv, offset,
+					    value ? FPC202_LED_MODE_ON : FPC202_LED_MODE_OFF);
+		if (ret < 0)
+			dev_err(&priv->client->dev, "Failed to set GPIO %d LED mode! err %d\n",
+				offset, ret);
+
+		return ret;
+	}
+
 	ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B_VAL);
 	if (ret < 0) {
 		dev_err(&priv->client->dev, "Failed to set GPIO %d value! err %d\n", offset, ret);
@@ -153,9 +260,11 @@ static int fpc202_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	} else if (offset < FPC202_GPIO_P0_S0_OUT_A) {
 		reg = FPC202_REG_IN_C_IN_B;
 		bit = BIT(offset - FPC202_GPIO_P0_S0_IN_B);
-	} else {
+	} else if (!fpc202_gpio_has_led_caps(offset)) {
 		reg = FPC202_REG_OUT_A_OUT_B_VAL;
 		bit = BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+	} else {
+		return -EOPNOTSUPP;
 	}
 
 	ret = fpc202_read(priv, reg);
@@ -177,21 +286,29 @@ static int fpc202_gpio_direction_output(struct gpio_chip *chip, unsigned int off
 					int value)
 {
 	struct fpc202_priv *priv = gpiochip_get_data(chip);
+	u8 reg, val, bit;
 	int ret;
-	u8 val;
 
 	if (fpc202_gpio_get_dir(offset) == GPIO_LINE_DIRECTION_IN)
 		return -EINVAL;
 
 	fpc202_gpio_set(chip, offset, value);
 
-	ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B);
+	if (fpc202_gpio_has_led_caps(offset)) {
+		reg = FPC202_REG_OUT_C_OUT_D;
+		bit = BIT(offset - FPC202_GPIO_P0_S0_OUT_C);
+	} else {
+		reg = FPC202_REG_OUT_A_OUT_B;
+		bit = BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+	}
+
+	ret = fpc202_read(priv, reg);
 	if (ret < 0)
 		return ret;
 
-	val = (u8)ret | BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
+	val = (u8)ret | bit;
 
-	return fpc202_write(priv, FPC202_REG_OUT_A_OUT_B, val);
+	return fpc202_write(priv, reg, val);
 }
 
 /*
@@ -264,6 +381,183 @@ static const struct i2c_atr_ops fpc202_atr_ops = {
 	.detach_addr = fpc202_detach_addr,
 };
 
+static struct fpc202_led *fpc202_cdev_to_led(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct fpc202_led, led_cdev);
+}
+
+static struct fpc202_led *fpc202_led_get(struct fpc202_priv *priv, int offset)
+{
+	return &priv->leds[offset - FPC202_GPIO_P0_S0_OUT_C];
+}
+
+static int fpc202_led_blink_set(struct led_classdev *cdev,
+				unsigned long *delay_on,
+				unsigned long *delay_off)
+{
+	struct fpc202_led *led = fpc202_cdev_to_led(cdev);
+	struct fpc202_priv *priv = led->priv;
+	unsigned long val;
+	int ret;
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		*delay_on = 250;
+		*delay_off = 250;
+	} else {
+		if (*delay_on % FPC202_LED_BLINK_PRECISION)
+			*delay_on = roundup(*delay_on, FPC202_LED_BLINK_PRECISION);
+
+		if (*delay_off % FPC202_LED_BLINK_PRECISION)
+			*delay_off = roundup(*delay_off, FPC202_LED_BLINK_PRECISION);
+	}
+
+	/* Multiply the duration by two, since the actual precision is 2.5ms not 5ms*/
+	val = 2 * (*delay_on / FPC202_LED_BLINK_PRECISION);
+	if (val > 255) {
+		val = 255;
+		*delay_on = (val / 2) * FPC202_LED_BLINK_PRECISION;
+	}
+
+	ret = fpc202_write(priv, FPC202_REG_LED_BLINK_ON(led->offset), val);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Failed to set blink on duration for LED %d, err %d\n",
+			led->offset, ret);
+		return ret;
+	}
+
+	val = 2 * (*delay_off / FPC202_LED_BLINK_PRECISION);
+	if (val > 255) {
+		val = 255;
+		*delay_off = (val / 2) * FPC202_LED_BLINK_PRECISION;
+	}
+
+	ret = fpc202_write(priv, FPC202_REG_LED_BLINK_OFF(led->offset), val);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Failed to set blink off duration for LED %d, err %d\n",
+			led->offset, ret);
+		return ret;
+	}
+
+	return fpc202_led_mode_set(led, FPC202_LED_MODE_BLINK);
+}
+
+static enum led_brightness fpc202_led_brightness_get(struct led_classdev *cdev)
+{
+	struct fpc202_led *led = fpc202_cdev_to_led(cdev);
+
+	if (led->mode == FPC202_LED_MODE_OFF)
+		return LED_OFF;
+
+	return LED_ON;
+}
+
+static int fpc202_led_brightness_set(struct led_classdev *cdev,
+				     enum led_brightness brightness)
+{
+	struct fpc202_led *led = fpc202_cdev_to_led(cdev);
+	struct fpc202_priv *priv = led->priv;
+	int ret;
+
+	if (!brightness)
+		return fpc202_led_mode_set(led, FPC202_LED_MODE_OFF);
+
+	if (led->mode != FPC202_LED_MODE_BLINK) {
+		if (brightness == FPC202_LED_MAX_BRIGHTNESS)
+			return fpc202_led_mode_set(led, FPC202_LED_MODE_ON);
+
+		ret = fpc202_led_mode_set(led, FPC202_LED_MODE_PWM);
+		if (ret) {
+			dev_err(&priv->client->dev, "Failed to set LED %d mode, err %d\n",
+				led->offset, ret);
+			return ret;
+		}
+	}
+
+	return fpc202_write(priv, FPC202_REG_LED_PWM(led->offset), brightness);
+}
+
+static int fpc202_register_led(struct fpc202_priv *priv, int offset,
+			       struct device_node *led_handle)
+{
+	struct fpc202_led *led = fpc202_led_get(priv, offset);
+	struct device *dev = &priv->client->dev;
+	struct led_init_data init_data = { };
+	int ret = 0;
+
+	led->priv = priv;
+	led->offset = offset;
+	led->led_cdev.max_brightness = FPC202_LED_MAX_BRIGHTNESS;
+	led->led_cdev.brightness_set_blocking = fpc202_led_brightness_set;
+	led->led_cdev.brightness_get = fpc202_led_brightness_get;
+	led->led_cdev.blink_set = fpc202_led_blink_set;
+
+	init_data.fwnode = of_fwnode_handle(led_handle);
+	init_data.default_label = NULL;
+	init_data.devicename = NULL;
+	init_data.devname_mandatory = false;
+
+	ret = fpc202_led_mode_set(led, FPC202_LED_MODE_OFF);
+	if (ret) {
+		dev_err(dev, "Failed to set LED %d mode, err %d\n", offset, ret);
+		return ret;
+	}
+
+	ret = devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+	if (ret) {
+		dev_err(dev, "Failed to register LED %d cdev, err %d\n", offset, ret);
+		return ret;
+	}
+
+	/* Claim corresponding GPIO line so that it cannot be interfered with */
+	led->gpio = gpiochip_request_own_desc(&priv->gpio, offset, led->led_cdev.name,
+					      GPIO_ACTIVE_HIGH, GPIOD_ASIS);
+	if (IS_ERR(led->gpio)) {
+		ret = PTR_ERR(led->gpio);
+		dev_err(dev, "Failed to register LED %d cdev, err %d\n", offset, ret);
+	}
+
+	return ret;
+}
+
+static int fpc202_register_leds(struct fpc202_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int offset, ret = 0;
+
+	if (!devres_open_group(dev, fpc202_register_leds, GFP_KERNEL))
+		return -ENOMEM;
+
+	for_each_child_of_node_scoped(dev->of_node, led_handle) {
+		ret = of_property_read_u32(led_handle, "reg", &offset);
+		if (ret) {
+			dev_err(dev, "Failed to read 'reg' property of child node, err %d\n", ret);
+			return ret;
+		}
+
+		if (offset < FPC202_GPIO_P0_S0_OUT_C || offset > FPC202_GPIO_COUNT)
+			continue;
+
+		ret = fpc202_register_led(priv, offset, led_handle);
+		if (ret) {
+			dev_err(dev, "Failed to register LED %d, err %d\n", offset,
+				ret);
+			goto free_own_gpios;
+		}
+	}
+
+	devres_close_group(dev, fpc202_register_leds);
+
+	return 0;
+
+free_own_gpios:
+	for (offset = 0; offset < FPC202_LED_COUNT; offset++)
+		if (priv->leds[offset].gpio)
+			gpiochip_free_own_desc(priv->leds[offset].gpio);
+	return ret;
+}
+
 static int fpc202_probe_port(struct fpc202_priv *priv, struct device_node *i2c_handle, int port_id)
 {
 	u16 aliases[FPC202_ALIASES_PER_PORT] = { };
@@ -302,13 +596,14 @@ static int fpc202_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct fpc202_priv *priv;
-	int ret, port_id;
+	int ret, port_id, led_id;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_init(&priv->reg_dev_lock);
+	mutex_init(&priv->led_mode_lock);
 
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
@@ -346,6 +641,12 @@ static int fpc202_probe(struct i2c_client *client)
 
 	i2c_atr_set_driver_data(priv->atr, priv);
 
+	ret = fpc202_register_leds(priv);
+	if (ret) {
+		dev_err(dev, "Failed to register LEDs, err %d\n", ret);
+		goto delete_atr;
+	}
+
 	bitmap_zero(priv->probed_ports, FPC202_NUM_PORTS);
 
 	for_each_child_of_node_scoped(dev->of_node, i2c_handle) {
@@ -358,11 +659,8 @@ static int fpc202_probe(struct i2c_client *client)
 			goto unregister_chans;
 		}
 
-		if (port_id >= FPC202_NUM_PORTS) {
-			dev_err(dev, "port ID %d is out of range!\n", port_id);
-			ret = -EINVAL;
-			goto unregister_chans;
-		}
+		if (port_id >= FPC202_NUM_PORTS)
+			continue;
 
 		ret = fpc202_probe_port(priv, i2c_handle, port_id);
 		if (ret) {
@@ -377,11 +675,18 @@ static int fpc202_probe(struct i2c_client *client)
 	for_each_set_bit(port_id, priv->probed_ports, FPC202_NUM_PORTS)
 		fpc202_remove_port(priv, port_id);
 
+	for (led_id = 0; led_id < FPC202_LED_COUNT; led_id++)
+		if (priv->leds[led_id].gpio)
+			gpiochip_free_own_desc(priv->leds[led_id].gpio);
+
+	devres_release_group(&client->dev, fpc202_register_leds);
+delete_atr:
 	i2c_atr_delete(priv->atr);
 disable_gpio:
 	fpc202_set_enable(priv, 0);
 	gpiochip_remove(&priv->gpio);
 destroy_mutex:
+	mutex_destroy(&priv->led_mode_lock);
 	mutex_destroy(&priv->reg_dev_lock);
 out:
 	return ret;
@@ -390,11 +695,19 @@ static int fpc202_probe(struct i2c_client *client)
 static void fpc202_remove(struct i2c_client *client)
 {
 	struct fpc202_priv *priv = i2c_get_clientdata(client);
-	int port_id;
+	int port_id, led_id;
 
 	for_each_set_bit(port_id, priv->probed_ports, FPC202_NUM_PORTS)
 		fpc202_remove_port(priv, port_id);
 
+	for (led_id = 0; led_id < FPC202_LED_COUNT; led_id++)
+		if (priv->leds[led_id].gpio)
+			gpiochip_free_own_desc(priv->leds[led_id].gpio);
+
+	/* Release led devices early so that blink handlers don't trigger. */
+	devres_release_group(&client->dev, fpc202_register_leds);
+
+	mutex_destroy(&priv->led_mode_lock);
 	mutex_destroy(&priv->reg_dev_lock);
 
 	i2c_atr_delete(priv->atr);

-- 
2.53.0

