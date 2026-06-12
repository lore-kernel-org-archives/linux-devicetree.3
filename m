Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B13D667D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304431; cv=none; b=riQ46K53N6tWLqtf8Fu1L02tWQ3UKZbfb9QxnrLhAOi747ThuWNd0IbLvY4m+HGtvyD1wnQwFhCDiF+2qUGnBDgaTm9IcGthKRLDLryNY4cIxK2whF2ydKbPWmpPaMc9PAA0XW7z5YNigyX56BILW5zJx7F2ljLTT8izL4/o7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304431; c=relaxed/simple;
	bh=oHvglOPKruBb8v3/CxYpF7DzHgE+dGuZHbuEgkrWZec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGl8+eIzmLENz2AOCsjXau2sHtiEE/WlqXAk/LIU/BO/jeYyKzXaO5u5Dms3EON5rf5BR3hwc8F7wju/pQPlwMIi4n63ZPdU67ECo81qWF0cXPbgkOEd5ZmDm2u+5/V2zurJTEbCCLpjOuCsvl/wY1BTzQK7W9SYF86zUICYT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwPPTQNd; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwPPTQNd"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso622561e0c.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304426; x=1781909226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITfAxfZQwR/2oWmKY203s9He7EuuMhN0Pj6HZ/jvn0=;
        b=CwPPTQNdItyZ1cVtfBz2Y1i39K4u/pd22tEimHd79W8Wnd3uEYcUxYiSDmK9zmyJC3
         5siqBQDK59wIiYn4EMyH7OFqzCjIvj9nLdZLOdAuO8vRt+TxiWPaDnrxI9LQ9RJfZpij
         vTjYXHVcbgbfOpj+T6KAxb9Y811BUoyAUaMu3qOOXQIM2kZAfGMWCx4NFXj0UtuA5ftV
         qrEGf6V9jjIVjfgQZwEB1gro8KwV/EY1zJfetqjUxSBoMqk8JA2WfgZev/ZnIMQCWFDq
         aJImtz1q/q4hoaSq8PILgrZDbpsYi8UELa6y8IpJ10Y+TpRgz5Dpva5YoFTPi6cfSJDg
         BJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304426; x=1781909226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YITfAxfZQwR/2oWmKY203s9He7EuuMhN0Pj6HZ/jvn0=;
        b=GUE8uFWE9Sq4l+Fk44KgQ/0no817QvGIIZLp5VgfIAkbPaZu2tj7gSSBi/yJDkWZ3/
         6UcMmplGY7msOwPY3Ahu/f5BXAxPbe1jPzaQt5Q4DXU9YEUqS0/lKXAOYcnW0zBs3WLx
         txVD4EkEzNilqRTea2a87T4NSEeIEyScQb3Bty1kl2wj+Tm1RlH/yn6F4GcAOmuPtebD
         gIT/rl2DrcYz+2h08H4dEpw0Sy4V0c0zy+PBEGbvrS1pfsFy/zYRfdqxVofvmDNVuLHP
         8jPo+9eiEIid7JQPIRs2gzHBAOAJZlZs6574t1kn64ul0nzWLQy5CWF90e5kBo74gN01
         flvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yzapjiDxOjEGscx7fmeOLxBwY/v3nsYVZXB0IzIIk6kh9pAlv5rDp2hroahHUpG1UcFBEHlbaLKU1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OPApdJaFqBTK6CJjPuDhe/im3c/qC1Xnk0mnW2/rxvP71vrx
	5UheKdbCzry3dCe1wSYM1zoXgDznx+6cz/n0M2kA0Zlgx/UYsDXadQxk
X-Gm-Gg: Acq92OFqX896xLM6fODWEgmJHOHJPkynLvjMiX0EZKipfYwLyngaBtZ+illyyMK1JiO
	CaFVg92uCB3cygmuBsH/QPLjyzVOmenFWOlZv4SHhN4FfWZkPldL4hDy7COUL4tSi9Z5G5spYTQ
	8uxd0CR7LMoAT01Becppb+Dgb9g9hA118U3MXsb9Kq2zeUeEjLprmt5O6cShxC8bhrd+rihCt20
	ec6OUasmBD+qhfWojs4W0py8Nx7Tr3xmtnPFO01N6QO36dIgVpp9AszHbHy0LC0cpF4MDGjjqwo
	rxdLjvM+F0yhjW3AtjUNpDbtmEs3KanSKVdwKwX0cAtuMq8Y15DYJFLpmIxfDW8gTqR45ssY6Fb
	/nJyor61POhDL6R3AI+S1SsVhx2BmfD2WKOqcj7pD/VXIY7VUsAG/Wh0CsaYQ6+fwZiK8urYeJI
	gIJXd0OBg/4SJnClMCxOKJWA==
X-Received: by 2002:a05:6122:169a:b0:5a4:5605:c681 with SMTP id 71dfb90a1353d-5bb6bdadafdmr3420952e0c.0.1781304426357;
        Fri, 12 Jun 2026 15:47:06 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691fd8adsm4244553e0c.13.2026.06.12.15.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:47:06 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 12 Jun 2026 17:46:21 -0500
Subject: [PATCH 3/5] iio: adc: ti-ads1262: Add GPIO controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-ads126x-v1-3-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
In-Reply-To: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=oHvglOPKruBb8v3/CxYpF7DzHgE+dGuZHbuEgkrWZec=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFk6PUmZU5d+C1WMOdvLfHn7XZ+Hh62W9MvdNyuSW9TWH
 RC0Mamjo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACYiksLwT9+I6by7ofbspjNO
 x3O19lVvlo7cKKvg/Xtf+8bq73xSOowMU7xLOl98LvzKduDQe5EI6V1a1oGRe14t2iXZy8vyu7i
 XFQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add support for the GPIO controller capability found in both TI ADS1262
and ADS1263 ADCs.

Eight analog input pins can be programmed as GPIO. This configuration
does not prevent the pins from being used as analog inputs at the same
time, so no considerations were taken in that regard.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 149 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index fd1911cf65ac..6d5f22836ad8 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/lockdep.h>
 #include <linux/math.h>
@@ -314,6 +315,10 @@ static const int ads1262_pga_gain_avail[] = {
 	1, 2, 4, 8, 16, 32
 };
 
+static const char * const ads1262_gpio_names[] = {
+	"AIN3", "AIN4", "AIN5", "AIN6", "AIN7", "AIN8", "AIN9", "AINCOM"
+};
+
 static int ads1262_dev_power_on(struct ads1262 *st)
 {
 	int ret;
@@ -1050,6 +1055,146 @@ static irqreturn_t ads1262_trigger_handler(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_gpiochip_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	struct device *dev = &st->spi->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIOCON_REG,
+				  BIT(offset), BIT(offset));
+}
+
+static void ads1262_gpiochip_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	struct device *dev = &st->spi->dev;
+
+	regmap_update_bits(st->regmap, ADS1262_GPIOCON_REG, BIT(offset), 0);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static int ads1262_gpiochip_get_direction(struct gpio_chip *gc,
+					  unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, ADS1262_GPIODIR_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & BIT(offset);
+}
+
+static int ads1262_gpiochip_direction_input(struct gpio_chip *gc,
+					    unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODIR_REG,
+				  BIT(offset), 1);
+}
+
+static int ads1262_gpiochip_direction_output(struct gpio_chip *gc,
+					     unsigned int offset, int value)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	int ret;
+
+	ret = regmap_update_bits(st->regmap, ADS1262_GPIODIR_REG,
+				 BIT(offset), 0);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG,
+				  BIT(offset), value ? BIT(offset) : 0);
+}
+
+static int ads1262_gpiochip_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, ADS1262_GPIODAT_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & BIT(offset);
+}
+
+static int ads1262_gpiochip_get_multiple(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, ADS1262_GPIODAT_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & *mask;
+}
+
+static int ads1262_gpiochip_set(struct gpio_chip *gc, unsigned int offset,
+				int value)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG,
+				  BIT(offset), value ? BIT(offset) : 0);
+}
+
+static int ads1262_gpiochip_set_multiple(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG, *mask,
+				  *bits);
+}
+
+static int ads1262_gpiochip_setup(struct ads1262 *st, const char *name)
+{
+	struct device *dev = &st->spi->dev;
+	struct gpio_chip *gc;
+
+	if (!device_property_present(dev, "gpio-controller"))
+		return 0;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->owner = THIS_MODULE;
+	gc->label = name;
+	gc->base = -1;
+	gc->ngpio = ARRAY_SIZE(ads1262_gpio_names);
+	gc->parent = dev;
+	gc->can_sleep = true;
+	gc->request = ads1262_gpiochip_request;
+	gc->free = ads1262_gpiochip_free;
+	gc->get_direction = ads1262_gpiochip_get_direction;
+	gc->direction_input = ads1262_gpiochip_direction_input;
+	gc->direction_output = ads1262_gpiochip_direction_output;
+	gc->get = ads1262_gpiochip_get;
+	gc->get_multiple = ads1262_gpiochip_get_multiple;
+	gc->set = ads1262_gpiochip_set;
+	gc->set_multiple = ads1262_gpiochip_set_multiple;
+	gc->names = ads1262_gpio_names;
+
+	return devm_gpiochip_add_data(dev, gc, st);
+}
+
 static int ads1262_parse_channel_data(struct ads1262 *st,
 				      struct ads1262_channel *chan_data,
 				      struct fwnode_handle *node)
@@ -1750,6 +1895,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = ads1262_gpiochip_setup(st, name);
+	if (ret)
+		return ret;
+
 	return devm_iio_device_register(dev, indio_dev);
 }
 

-- 
2.54.0

