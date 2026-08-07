Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E932570D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110751; cv=none; b=JzltPcBY65EL4BMUSaLNAtSUP5uICG4BL1Ji6CnOdAbcLc1AxPytrj7RapZYvoyxyQkyn5+41k+r9D16OltzcDPyWPLKLd2qk7k0Iq+KDToEPB4HMrIqA2X5tpp9aXjIgnEPT6OsDv2Jhz4eIEVbtbbcsEmNp6zOt9HzlEluav4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110751; c=relaxed/simple;
	bh=nGPW/Xf9IcxxowoH00WX/4TQBZQa0xEMX/JkrGRyPu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1wJYiAYb02/krYIpKiTuAzsBt/aK8MhzjaJjwEBDXsJq2Kn9Gs1I8H9Pcrge8y92176/mYuH0ZdjoaafoGzyY9mwjZo0+G+aFlBqGWPOmklRoZ0+3cDM5JzFRuYE/X46sRqYtBq4DCAEIOlMM7cTaSY56oD3oBYSzL5P8ChKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrUAB6SC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrUAB6SC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fde295992so1776604f8f.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786110737; x=1786715537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5hTRZ9L+NP9Zln6CIY1plhBe3Xn8XeTKDItuo0Wyks=;
        b=KrUAB6SCp/olbYXylJQ6Q8YgsFN0Iznll6U1YjDFEU5mutB7/++iG5VrIdiwxXbECM
         ddYA8UY/LpA6POPHPn8XiRJWo76G8cdeIWF2cmdJ+00wPJ/cr35oiTCZCB0VxbjAiPgX
         IXuB9T/ecuDNL7vkL+XGjrWnzj/TuQPcNru7qp9wP5N3+fUnrsoEcRm5UyKW2sxEo4M9
         T1w4rOSYxvwFTVLXn0Tg2c645Laa59+HHp73akqEYaxt6lGFXk6hHLSOqYBQLEs0qx+j
         w8hZBOCP4UMnbioNObuu8N+6rY94KIfK7W/MQjzF1eNu8RsLcd5JhHAyJeIjKW4ln8EB
         lpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786110737; x=1786715537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5hTRZ9L+NP9Zln6CIY1plhBe3Xn8XeTKDItuo0Wyks=;
        b=jRzLsEQWyvizsoXPkocPRie5GHxMrw47FAc/XyBTU4e7lKdXP0BCkZZmP3/5VV26DN
         qJ4MBdrRn8nuvD2/FNGEFHXR8dSX9zyl22x58D+wGqytK1N2x/ewQpUbCrK93+jI8Hs/
         RyCEFtgMM/tud9YKhri13v5gF6xggoaXoiYem7Y3wX9bH3UmQccv3tMgrmWmR2AOnXKJ
         cSGhOhkczSzs0pixaVJHVWy1EfjAn6mL5xf02PfVo5DHD4wj2X7lQAVszdXQynWJJnds
         FgEtylrBXc0hDL8upVmHomuCfZIxGpjIduZlpjQKoPile9k7LMd17jA9VYToL+7w9p5x
         5r5g==
X-Forwarded-Encrypted: i=1; AHgh+RoAfXhV6j//djwBHGwYjgIowxI97KiT+w0E+pHYjOrVuVP4ybi6nvxVtQO3RvHjATZyFOjhMAVhdALA@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxlMz2X6dV1jFDTYiUWJ5G53P6Z2eR76OMXNGXuYcxmBM1Zpe
	SNpke79H+LJMlZbwEfyoPt5JptcSDPGOtoDSWXHG3H0+lEzlwVTM/S7ZPTj85g==
X-Gm-Gg: AR+sD13Z29YiqGcdMFQlpHGa5JF/bxNvkkt3xn12I+XqeiPAgv0LZRgZcF6u0HOaVo4
	G3qTuMc0+0cl8p6lZIOcYaRs7I0adIVopjR33g0xo3/CZJtny/s+6dzTznxsUyshOOTYvxONM1D
	BGmHmL2ojK6796rRSrNIA0M5r9gqFKvNzmekNxuBB9gmjXLQRUx/IsHwySDV+KekKMmFp+x1lyb
	oFVt/w0kahx5cID/rRlTccroFD2Svg6nxFH4t1Atb1qeuiC37BOyGk7GCIjBzHsF77+1WJbZ7aX
	AySgJ8QQkolFeg+Qdv0AEcG7vwzJjKvxJIH0ViACXMAoX2cxaaXzzFwaKMXCXA6EuE4TiGBgYIp
	0hf7ZtWTijqzOMRgElZjthzJnE+QdrKphcmlRG7RehA6CNbc5sUMEwPXWGVApsGIL64EXQSTNd0
	zIhykOI/WywxDsTZX8jIaV+c9GQk0q5dba6+GbjCi0gPFwVXaS8Tyl07HQiqBErTSSP1lM/v0xq
	S830VpMyaJreGFWvCx7xOql/Udi
X-Received: by 2002:a05:6000:40dc:b0:47f:e7f7:370f with SMTP id ffacd0b85a97d-47ff4e5a82cmr22168039f8f.10.1786110737330;
        Fri, 07 Aug 2026 06:52:17 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:13c:7c2e:7f0a:5759:2e0d:bf8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm6581333f8f.23.2026.08.07.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:52:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 07 Aug 2026 15:51:54 +0200
Subject: [PATCH v5 3/4] iio: light: veml6031x00: add support for triggered
 buffers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-veml6031x00-v5-3-e60876fb3640@gmail.com>
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
In-Reply-To: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786110728; l=5240;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=nGPW/Xf9IcxxowoH00WX/4TQBZQa0xEMX/JkrGRyPu8=;
 b=ATbRd/h9NPsNfjL3VrLhq0JJwgOZbXPSgtOCDwxJSx+2YkakmbfIReoT9LajtrJhcEOcDQ/l9
 WG+miWYxcZTA39BHuOeeWTUwDTemdvAww3Xl3Iniv3LhSnajhvLyR51
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/Kconfig       |   2 +
 drivers/iio/light/veml6031x00.c | 100 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
index 985b776e71d6..397b3e0d4408 100644
--- a/drivers/iio/light/Kconfig
+++ b/drivers/iio/light/Kconfig
@@ -742,6 +742,8 @@ config VEML6031X00
 	tristate "VEML6031X00 ambient light sensor series"
 	select REGMAP_I2C
 	select IIO_GTS_HELPER
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
 	depends on I2C
 	help
 	  Say Y here if you want to build a driver for the Vishay VEML6031X00
diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index 30cccda51ca0..0cccd40d729e 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -22,6 +23,8 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-gts-helper.h>
+#include <linux/iio/triggered_buffer.h>
+#include <linux/iio/trigger_consumer.h>
 
 /* Device registers */
 #define VEML6031X00_REG_CONF0       0x00
@@ -37,6 +40,12 @@
 #define VEML6031X00_CONF0_SD        BIT(0)
 #define VEML6031X00_CONF1_IR_SD     BIT(7)
 
+enum veml6031x00_scan {
+	VEML6031X00_SCAN_ALS,
+	VEML6031X00_SCAN_IR,
+	VEML6031X00_SCAN_TIMESTAMP,
+};
+
 struct veml6031x00_rf {
 	struct regmap_field *gain;
 	struct regmap_field *it;
@@ -392,6 +401,10 @@ static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_type type,
 
 	guard(mutex)(&data->scale_lock);
 
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(regmap_get_device(data->regmap), pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
@@ -453,6 +466,10 @@ static int veml6031x00_write_raw(struct iio_dev *iio,
 				 struct iio_chan_spec const *chan,
 				 int val, int val2, long mask)
 {
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	switch (mask) {
 	case IIO_CHAN_INFO_INT_TIME:
 		return veml6031x00_set_it(iio, val, val2);
@@ -484,6 +501,81 @@ static const struct iio_info veml6031x00_info = {
 	.write_raw_get_fmt = veml6031x00_write_raw_get_fmt,
 };
 
+static int veml6031x00_buffer_preenable(struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret, it_usec;
+
+	ret = pm_runtime_resume_and_get(regmap_get_device(data->regmap));
+	if (ret)
+		return ret;
+
+	ret = veml6031x00_get_it(data, &it_usec);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+		return ret;
+	}
+
+	/*
+	 * Wait one integration period + 10% margin so the first triggered
+	 * read does not race with the sensor completing its first conversion
+	 * after power-on.
+	 */
+	fsleep(it_usec + (it_usec / 10));
+
+	return 0;
+}
+
+static int veml6031x00_buffer_postdisable(struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+
+	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+
+	return 0;
+}
+
+static const struct iio_buffer_setup_ops veml6031x00_buffer_setup_ops = {
+	.preenable = veml6031x00_buffer_preenable,
+	.postdisable = veml6031x00_buffer_postdisable,
+};
+
+static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *iio = pf->indio_dev;
+	struct veml6031x00_data *data = iio_priv(iio);
+	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2);
+	unsigned int i = 0;
+	int ch, ret;
+
+	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
+	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
+		ret = regmap_bulk_read(data->regmap,
+				       VEML6031X00_REG_ALS_L,
+				       scan,
+				       2 * sizeof(*scan));
+		if (ret)
+			goto done;
+	} else {
+		iio_for_each_active_channel(iio, ch) {
+			ret = regmap_bulk_read(data->regmap,
+					       iio->channels[ch].address,
+					       &scan[i++],
+					       sizeof(*scan));
+			if (ret)
+				goto done;
+		}
+	}
+
+	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
+
+done:
+	iio_trigger_notify_done(iio->trig);
+
+	return IRQ_HANDLED;
+}
+
 static int veml6031x00_validate_part_id(struct veml6031x00_data *data)
 {
 	int part_id, ret;
@@ -588,6 +680,14 @@ static int veml6031x00_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
+	ret = devm_iio_triggered_buffer_setup(regmap_get_device(data->regmap), iio,
+					      iio_pollfunc_store_time,
+					      veml6031x00_trig_handler,
+					      &veml6031x00_buffer_setup_ops);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to register triggered buffer\n");
+
 	pm_runtime_put_autosuspend(&i2c->dev);
 
 	ret = devm_iio_device_register(&i2c->dev, iio);

-- 
2.43.0

