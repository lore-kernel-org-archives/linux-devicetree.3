Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716205;
	b=JtQiQv5p8m6Vy1RAG/7CtNI9hVQ7bRUpMyuDQSMJTM5KEsaKjptCLA1KICJk0Bvu8j9x
	 KRAcBOgHN+i20635hM4Jb/+8cUPXJZymL455xItbHRySXLHRKv0+og8iD5iVVAdih4JK1
	 yhwGZb5gb/HwCM5OHoGDpoOTlt29KqFn97cNji8HsuZt3A+4uwBnPb1FsEFdhqpnhLbrW
	 yMXYwkTDn6jJEtcnyBhtS98PVh1Qi9RaIwr52Ckt80TeBP2KIUJSJgZNT1c+pUFYTNmqQ
	 WzPN0jGzSxpovsC0d4IrUqXV2hU1NgPMmDNsNH3hIxDBAXXuRSTqZ0wQzcQcm5zU+mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
	b=zh3CQk5DeRCh+HMfjsuzQ8+n+Ez9bMEbcTpyLjVy6z5JlHE7F6k7N3YKeysntDGaXIln
	 AmnZt0LENvPND//9uxRd27F3YQViUgbNUE7sCMKY1Y3VkndYMobiZnJG+04uOwQiNVxBd
	 0iiiolRpCOvyFyLN2tR6JnSjZIFopXlQJ7UgKjAiKyz3YYUD3qg1Yfn5iD4zQu70Cuy9q
	 668k5uwaMjMAFtbtNIa5hgC3OxPxdrm6uHkMmSLo7kZtFuIzncgJRYNuaVUavg0ahNBOP
	 3HmogaZbn0PFLOk032nSmG4ls5hCdf4lduJind4QzBErjg6W4MXkY8H6GtFUoHY7e3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGbETmZr;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D8606A68D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1D8606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGbETmZr
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3876659f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716203; x=1796321003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
        b=jGbETmZrNFtM3pjEYK+LBOFQJe1WmjF008+9gjsGBzCLSb0JE/OYF+KYRWj1XcMROt
         3POEgILHWdzhVjbHNhZLx+2qTXqB6AdFRMTAgLf6IeIsndzkbmliAz2Ox1OcRtJrcIrd
         xk1rzlUiATS/MXYMRgvXBjzmkhPLYZNV28tifShqgYNcFNYHp2Z2UMK+mtxYNURFtZAY
         wd4+KGbt38dvG9wPr3nfLvdc5H6OW1KTUq2AvktbP6deXZPTpjh/zMv0ZrJrQEA0Knlk
         n0ksfpVkIm4x+C+dmpiQVbycwSe11RMfq13C0DtflN+aQjMu9N849pnEo8d8/U+jU38d
         01Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716203; x=1796321003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
        b=BVwrHGVrLccJLJGpBz3BEPVK6+k4T+CsNPJ7DfOdtWOZrCVUaIrlGGGvEy7SGfZLwg
         p4EATlhVujGegVb+FkqOpvcmcAWetkp80kYp1AIknN5DU8glk/e+wCa5QROLDVh1YtmP
         r2RntuSMHxe5zejYLVc5Dh70KjJw8Fj/rf3bvLMq8b+QmPwUGk0MQ8n6DBUmoXkA7huQ
         9Ihmy9BbVDMCLDhS6K1QRiuRFtX01Lp1DN4q4Q3QFMEnmWZLsXUaiioV973MfbTLT4bI
         w1MWcdD4rlIuC1aAzFIRUiWOB1N0Fo/5cmyN6Rco2Xl9FiO6gR+IoucFdnpHB9WAcbm4
         hwqw==
X-Forwarded-Encrypted: i=1; AL+hErG9HQydjCGBoxBSN6PxJ6So+HHJp8f6D0Qs/lRt5xgraRW75OHYuS487ODiGWJDWZoaykh0UjxUvavI@vger.kernel.org
X-Gm-Message-State: APuU4Z/di+3v4zZz13Uqs/oZin3otEdwTvN2387oJchznKhyfMJedQvM
	PPocHt40jc8TqDp2439s9Ym7cZFCHmySjbxkvqR4wPA0Ig8LAqtjMVQ=
X-Gm-Gg: AZFdTZf+/uAiFJjrw5jmN0r9BGIJOBFcuY8pwCGmRt9FswAImYGM3MJm9indfbOwjEI
	kRLueRtE9PHqMKTsHOJ23ry2X+gjW1KHlJdpMfNxyv48m2Ot+nEC2088ISJbyc/1Lt5Ii5yFWlx
	zCthl8Rg0GaM6tGI0cfkwfc7Cmgo70zXQzVvPJcMDbsSpz67Yq5m4LkS6/1aqiHPHZ8G7+tm/em
	XBdchxEliFHDhiLHq8mGl737nNyszKmcFyzSH7pduiYD3v0+F3v9Zzq7zivD0ltL5CbxZqWBsz1
	ayk8wrJ+z8CWQYvKLR5yL+UPK9Zq3ulrFWi2F/lryf/RC2QexWCd+Rc5no0T0TLCFfwOc6Y3kRN
	ZrdRlztb/WTlGZ5bB+2z3UjuUN+DqmZ11r8CMhxKXEEoQBB0fBq2d2hckBlXDd7PfuyvNGFysUs
	MVnT1qyye+8lJ8fAZW0D0wlvuS0jhsiv8Tp2TTsOqkThKpitd2izOQfH3ZGXReP6h/Q2Ui+zT3Z
	Z6mM+6QAn2FfS1BFT3COGW94JfOxPkeLAuB6d5+sWpzhgVYOGibUgBBMrGShoJya886sLbgA7UQ
	3qE5IOiNr4gxxVin2r1+HNT1fkP/miaeA04gN8lZfbCV0uTWn52/p35bEbOcljhk+EsaJAzdpnn
	GML6Ht7NnDyDmb84EuH6bDxoYnip+XoIc+1GBKxOsjWdwV3zOu0v41+Smg89KtOxxk32Fvo7P8N
	dSGCCD
X-Received: by 2002:adf:e008:0:20b0:48f:bba5:732e with SMTP id ffacd0b85a97d-4abb560e1c7mr30064709f8f.57.1795716203246;
        Thu, 26 Nov 2026 10:03:23 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:22 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 4/5] gpio: fxl6408: Add pull-up and pull-down bias configuration
Date: Thu, 26 Nov 2026 19:03:14 +0100
Message-Id: <20261126180315.98034-5-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

The FXL6408 and PI4IOE5V6408 GPIO expanders provide per-pin programmable
pull-up / pull-down resistor selection (register 0x0d) and enable
control (register 0x0b).

Expose both registers in the regmap access tables and wire up the
gpio-regmap .set_config callback to support PIN_CONFIG_BIAS_DISABLE,
PIN_CONFIG_BIAS_PULL_UP, and PIN_CONFIG_BIAS_PULL_DOWN.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 5132177ab2837..ae9003fc513a1 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -7,6 +7,7 @@
  * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
@@ -14,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -33,6 +35,12 @@
 /* Bits here make the output High-Z, instead of the OUTPUT value. */
 #define FXL6408_REG_OUTPUT_HIGH_Z	0x07
 
+/* Bits here enable either pull-up or pull-down according to FXL6408_REG_PULL_UP. */
+#define FXL6408_REG_PULL_ENABLE		0x0b
+
+/* Bits set here (when PULL_ENABLE is set) select pull-up instead of pull-down. */
+#define FXL6408_REG_PULL_UP		0x0d
+
 /* Returns the current status (1 = HIGH) of the input pins. */
 #define FXL6408_REG_INPUT_STATUS	0x0f
 
@@ -51,6 +59,8 @@ static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
+	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
 };
 
@@ -59,6 +69,8 @@ static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
+	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 };
 
 static const struct regmap_range volatile_range[] = {
@@ -96,6 +108,38 @@ static const struct regmap_config regmap = {
 	.num_reg_defaults_raw = FXL6408_REG_INT_STS + 1,
 };
 
+static int fxl6408_gpio_set_config(struct gpio_regmap *gpio,
+				   struct gpio_chip *chip,
+				   unsigned int offset, unsigned long config)
+{
+	struct regmap *regmap = gpio_regmap_get_drvdata(gpio);
+	unsigned int mask = BIT(offset);
+	unsigned int enable = 0, pullup = 0;
+	int ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enable = mask;
+		pullup = mask;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		enable = mask;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	if (enable) {
+		ret = regmap_update_bits(regmap, FXL6408_REG_PULL_UP, mask, pullup);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(regmap, FXL6408_REG_PULL_ENABLE, mask, enable);
+}
+
 static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 {
 	int val, ret;
@@ -126,6 +170,7 @@ static int fxl6408_probe(struct i2c_client *client)
 		.reg_set_base = GPIO_REGMAP_ADDR(FXL6408_REG_OUTPUT),
 		.reg_dir_out_base = GPIO_REGMAP_ADDR(FXL6408_REG_IO_DIR),
 		.ngpio_per_reg = FXL6408_NGPIO,
+		.set_config = fxl6408_gpio_set_config,
 	};
 
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(fxl6408_supplies),
@@ -148,6 +193,8 @@ static int fxl6408_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
 				     "failed to allocate register map\n");
 
+	gpio_config.drvdata = gpio_config.regmap;
+
 	ret = fxl6408_identify(dev, gpio_config.regmap);
 	if (ret)
 		return ret;
-- 
2.25.1

