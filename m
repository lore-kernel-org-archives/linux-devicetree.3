Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716204;
	b=jI7ij0ZBLuIhmsS5j+CEJ3TReReOlIDYoMRrtUohegEDW2OoFBfaHBeqvUv8P3Uugu3E
	 sBg7Kr5gaWinLGIhWKLE/msJz9eKVwyibMi1/CedpqhUFmKhEXJAijyTscrwX2dsEOE/c
	 Q6vMU1OsPHPRSbxS7aBWqrPDbuDmnpaV79c4d/aA5DAsqbxneKemGFpBF9WZGo5i3jq8C
	 perNyrIjG3T4bQ8dfy6shtKMZa2mNRGFgWH3zbSDb4alAuQOpjfJFgG6w9R9Ge6Un0rtG
	 2R+5iMXDmDHhKyqPiwd2XSK2qNtifKRwPWHin8q5oeGE56gha16d58A0XKBoKfzpEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
	b=qP5pRWPWkN/0Nl+F09pvtyAIRouotBu4L5FLelMIxHzDlDkutGPjGaHX97TB4COY/th1
	 mDtp75IqHtuKvQQEk40s5F+gWGT4bmGqaZF6sHyroOpJ3Haq35AcTtqYGdqqOp1ccsbtD
	 uQ/cZE2XJUy0fnSXlm/R/SwzimzLHFmRzgbhfLh8NA/HqRq4LV+Mc7YkCyGBdFXh2SBst
	 sfHj/u5kVWH0ip1juXm0PaM7NvTaARSiSpvmqbJLZijQZkqZyWSkT6z2zhj7T6llmBokK
	 uAfbm5xr/XFWZ/T679jnzoYtdqszmkgXbI+/xjkLpGBIQVNZCkL8vV/IHLgYkJxSjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EutVzTX3;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9735606A336
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9735606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EutVzTX3
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4588953f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716202; x=1796321002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
        b=EutVzTX3ArqMEdzUKgVA0SrklEJXHUsiIpN1waVURscx28BvUx3z8sAp9ydSH4/bpG
         PewpjvUbCiHYmIP3/gXCHvjYrS0NPN+UV48LwLURrP7HI/SrsONSl4Ct9UfHwdlPKP3l
         oQjCPbepKJCx3RTw2p5JamEVZk3tg9UY8o7MJgaMYrpkyeGFRhIOWcnYxUJxQhbXqPaS
         2meW3DPMROeMTIBy/G4TEDyew9ULHyUK3bw5YaQ5j4j5AVroBTsiPLiWtsG5EUfRmsZ4
         RIj7PmxZyT1wxj5UVP1iq4xGvd12OL2ittQZuLc5Lc5sUdfEYpi5p5RNt3tTKhZu8RCk
         ILtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716202; x=1796321002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
        b=MPjXvlZQE8bY8e3GXCZwt5zsvgzscshkdTsfE2TdZXQD3SODA6xuf3nBrIoqBFBsLw
         m43OxLP/SopnjiKZFEqIJGeWqMbD84uEAMBROJVlq+3mCfXAzQ9o/nK3H2FtLoeI41Kw
         RKEj2/NVlxfGSVCy+b7I93dhUEhf0l2+E8mqnvTNwSwMXLcI9grdmHr/PDQlUbFSItkZ
         Ej+mmoIM5fRcpngcTWkIji10T8E+po3XMYjO6lQbkYHa9uajNHp0hb/t4iIyQWspbY1Z
         /pmWz7v+5IOdMyQ/rdfasNYjO3kLvSFloZto+kWcMX/37csLoW/ym0ztuDfNwUDcuOTu
         U/Gg==
X-Forwarded-Encrypted: i=1; AL+hErFTlPdUyX6uroob7LRKRvrC1ovO8FtwB9BLA8Z+AkkqpNTfcdZJHR54jtL6kwX0ZvkbLNIGV8T8himW@vger.kernel.org
X-Gm-Message-State: APuU4Z+U6t9m/K17Eu9qF0EtQ40iePCz0yKYHwx8irmqiYvtWO6s+Jzv
	ekhcRmFZcxEcXek2Dg2MM36QyQnWzaAe7D5Go0hkWwaoHzEoTRrnPh4=
X-Gm-Gg: AZFdTZeqthsZzu0mOPsyvkCI4NneDuZS36L3CBFGuwcoI6+CuzpPW7oAJMJtaGz53Fg
	PWjB+nKf2YQ13evpcvt6bXlBDtrfRq5JSQ6RS996NdUB9JAd1PQlJwIwIzB4h8ZD++0Wq40gBos
	x/2vfg+avev82tOja+eoRE6uLlykIGre8oFFSgf/PyVB4e5C/KCqPEVHYJtFBYWuxpgz+omAvnk
	DZLzYt1+69brSLx26HOIVh7B9QC/N6tsobBH/FYeaDidhBhQAwyYSYiyXWl5LV7bOL8iPITbBX/
	vnPxrbdAnJ6aMACCM9a7dyhselDwL4ZCYVBx6YLGfZ8d15cwRgb3Da9CkvlrU+lEH1KdE79b+HA
	TElrPZsXdJZ3BXWClDo99KRASpfSQOglslRUhwpQ/ybpH3yWuGrN3KKU36NECs6GFJMb7YcpGpN
	aQDgdjXopB5matyL6xWDvakfSyjctCIZ3FnzGuEnYAOzZVk4oMCEWGZHKXvR/GCY/8lmoumTzTC
	3BpzYbkrxCCy3jA3zxC8aMx4Hi1Qc90RcSzX6ffbZ3ILGibY7sQloqlKsEowS3MaBkxhJej1xC/
	wLfqE++74/YeFxW/gV1zkN13FmRjfq48hdwiathCCwUFqS7hCvQEX1qiMK9xmS52Yyux7L6+x2V
	Q7htPs7q7yC1tQG1ZbCHzUZ+YAAq27EmLliO9/TsrudtQhNePRZHCS0gxUUA=
X-Received: by 2002:a05:600c:37c6:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb888147b7mr437653295e9.14.1795716202272;
        Thu, 26 Nov 2026 10:03:22 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
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
Subject: [PATCH 3/5] gpio: fxl6408: Support optional power supplies and reset GPIO
Date: Thu, 26 Nov 2026 19:03:13 +0100
Message-Id: <20261126180315.98034-4-gianfranco.mariotti94@gmail.com>
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

Enable the optional vcc and vddio power supplies and pulse the optional
reset GPIO (minimum pulse width and recovery time of 150 ns according to
the FXL6408 / PI4IOE5V6408 datasheets) prior to initializing the I2C
regmap and reading the device ID.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 9f80ea1214e03..5132177ab2837 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -7,12 +7,15 @@
  * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  */
 
+#include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/regmap.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define FXL6408_REG_DEVICE_ID		0x01
 #define FXL6408_MF_FAIRCHILD		0b101
@@ -106,9 +109,15 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 	return 0;
 }
 
+static const char * const fxl6408_supplies[] = {
+	"vcc",
+	"vddio",
+};
+
 static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -119,6 +128,21 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(fxl6408_supplies),
+					     fxl6408_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable supplies\n");
+
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+				     "failed to get reset GPIO\n");
+	if (reset_gpio) {
+		fsleep(1);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		fsleep(1);
+	}
+
 	gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
 	if (IS_ERR(gpio_config.regmap))
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
-- 
2.25.1

