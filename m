Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12830D406
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 04:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721914; cv=none; b=fsqn4ONKv+camrgS4HLVRqwAeGEk0vKU+Ku8uJFTpoPU3xLbG6eh+kMkmFngtkj/4V8mgtld0Is7lTJ+1+frL7ru/NCk8+TG5lgYGUpVzGmNyJeYv50JK0i2gzw9YHYGJXawjgYmVEVZyaike8VmXLvAlY7qyOC2p8/JvT18IbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721914; c=relaxed/simple;
	bh=1nFZau3RQUxnCZgOYDCBt3epgx5xe5YIlqUb8E8u0UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBjCYIeh1HrK+L2YTacfsMmrH/BNo8o1duXCGp2RboItNh+d79oOuXbtT92mKwFYvqckxVsX4IpLIjdT8hrALYekdplVwWPW7/MPYT1mTAkchptrGoPswji40fjxAXXZOcWOCh5X1HJbqhuZqvNb+NDWxypdgY4JnBUucD+vWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeuMLo6d; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeuMLo6d"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bf523d7b6afso20174266b.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721912; x=1781326712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlI5mUz8s798lOZfnX8f9JGZtNvnkftPBfqwbzzNVuw=;
        b=MeuMLo6ddRVm4igBW3Yn2OS7xsV+kQTx3p48MhwdrnG77458i4pHAqhN6OK2U1I5c0
         iQPBtpxS/+vZX8/eMqS0fv0LAGGXQVdHzaObof2MDhEnYB4C4gY1zJP2NrqXq4QCuvJ9
         3lyivExzhuIbC58zbI/2pV91uiunbu+avjuZ1oJoa7hrJL5tMSCs8LuMAmmPKu8KPe9a
         ekgkxNrfhoAn6pm/CZ513lgWxyA/RbFh2aBcLMVUxBXYx5O2YSJnYKWkKlL1D3ZnwVqS
         Izd8MJGGAyuGsvOg5RRk3yEiPaXi8TWJBMINw3HQHGzuisu+mwEDGqY/UJQLFtY0L5+Y
         cDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721912; x=1781326712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RlI5mUz8s798lOZfnX8f9JGZtNvnkftPBfqwbzzNVuw=;
        b=Iz9g5fqhviZI++mBdxBnkxZSSxWsBd97txL71IZ/XCvrSkMsdHcFhDzUw5qlW3ajh7
         YMavyWcBA+oMZMDZmXbmmQs0SM0TeTYg3WU7Ssoi4popGjdE+bR5uSHhU6MqMQ1ugltM
         voZVQi5Xjq4COTTvTwfwvOZMHtQXPg1nc47J/nJJRh3pquIC5GJwTma8erm8Adl2ZAnp
         Vg2rcUkrWbsUSpT0dZzOuHExlhH7l5ikvVzhRkpnT/kSiAFbkYjYquD4fxFq9bGfRkCe
         HY6hgjpulG7VnU6W1Iiz4ju/IToL6tyjkTWjlGAhzEVMkVwPov7w/7AOnfveEwQHeQAT
         VNOA==
X-Forwarded-Encrypted: i=1; AFNElJ+pyHvxvVX3KhEbk1RU/Nz6Y2iwUfORv4zxeGwttpqACI8CxnTCt5lHX2qZBI9FAiJQa3AGGlcatA3Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+pFjra/39Nhunn8BSgZRGLnJtORazYXIhRtWxR9Dr19JjRZVF
	GJotjK4o2tZt4lyzileZNuOdukR7CT2Dc9esOwson+KVIn77zB8bYL9H
X-Gm-Gg: Acq92OFJ8B236Gd0LK7qoefTM1/zN6771S2VUxaR3lruWhrw9+nqTHgEXFwJFmZi847
	MjZIu8XFK9AW+fpv41zi6KayUYioykY9f0XGIpi2cZ80wS+j5QuSqe1MSFHg2IokviBjFgWMrRh
	t7hmWdSIEjsb2wn1hxf1x2XBA0jNkZwn/joscoMH7LLdsDR1Ycg6IhUplvLiW1W3/G//ITNNtxF
	2ucdy4pZrIahL6YYBcOSZjRrtkYZeWfKIDDGKXmXTReKieKRsiud9u/Y4bUYni9APyfIPBD02p7
	otY/FZmu9Shqwma3OHALfdVm+I6Euo47MDSsE1BB6x++zvlbV46p7id0OJyBmJilhH72jPEQuBN
	GM53VZdGfFZb93r335KDMuqD21yNK4Ye7WBEnYIK/4sEfj8aeDJcLVaCoMeYbJRpaP5uqxok9Fg
	RY9h3ydkJkE45pF3exAf/sxFg=
X-Received: by 2002:a17:907:c247:b0:bed:6e53:bb16 with SMTP id a640c23a62f3a-bf3743e5c7dmr350247866b.43.1780721911635;
        Fri, 05 Jun 2026 21:58:31 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 09/14] mfd: lm3533: Add support for VIN power supply
Date: Sat,  6 Jun 2026 07:57:33 +0300
Message-ID: <20260606045738.21050-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 5af1d5476d3e..500cec3cceba 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -17,6 +17,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -113,14 +114,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	return ret;
 }
 
-static void lm3533_enable(struct lm3533 *lm3533)
+static int lm3533_enable(struct lm3533 *lm3533)
 {
+	int ret;
+
+	ret = regulator_enable(lm3533->vin_supply);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to enable vin power supply\n");
+		return ret;
+	}
+
 	gpiod_set_value(lm3533->hwen, 1);
+
+	return 0;
 }
 
 static void lm3533_disable(struct lm3533 *lm3533)
 {
 	gpiod_set_value(lm3533->hwen, 0);
+	regulator_disable(lm3533->vin_supply);
 }
 
 enum lm3533_attribute_type {
@@ -332,7 +344,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 		}
 	}
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
@@ -456,6 +470,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
 				     "failed to get HWEN GPIO\n");
 
+	lm3533->vin_supply = devm_regulator_get(lm3533->dev, "vin");
+	if (IS_ERR(lm3533->vin_supply))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->vin_supply),
+				     "failed to get vin-supply\n");
+
 	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
 				 &lm3533->boost_ovp);
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index d3f7b07dbefc..3f9f4c9ef9f3 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -22,6 +22,7 @@
 struct device;
 struct gpio_desc;
 struct regmap;
+struct regulator;
 
 struct lm3533 {
 	struct device *dev;
@@ -29,6 +30,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.53.0

