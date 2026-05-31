Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8DF33D4E1
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 19:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780257524; cv=none; b=JSJM09ZuJgixxRSy5dJ4ewoeFjPJwmOSbsGmQJ2XEPu5Mrj0S9xkf9sr/yy/B6Jrk/9gM/gAEiI8wjGgyiaE8B7r2G3/zUYkjlW3Mee0jIflTrJ6Z/zrdJ1WBtEVCOvLuijOCzXp0kdWoUWsQCqGd1AqVhXdC0hEy2ZlmErOhAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780257524; c=relaxed/simple;
	bh=3rMinnWkSWj8Yetpk6Terpb21cTv9q5faLaxxlD4tao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPQg9Tpc05Ge/6sEo+6LIF9M9AfrsPhcKLVk+W4xoJ8zjmyEj8vLwnOWaitXEAhyfxOvNPDI84rJFzA7HhyklB6Mrn4RS6twp8KWSZn53RAh65USy+LZmg0TYaW87scODL5R4VZJrle9divY0/XYlJc94v2HHpiXQWP9L8Dgmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyyqinfU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyyqinfU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a7629380so6487405e9.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 12:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780257519; x=1780862319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RLJzSgogYFN8Zeh81kPrNPCUIj/QxMt/6mfJHqzi8Y=;
        b=PyyqinfU39OkDyLazwJCGI09ckLTvqPn4g69DpwHeMdchaxre2Bur9q8t/Zoojsivc
         UQVApTuKKRKHI8bGjli2lCdsGGYXr8TH5kRWopdtk2jYz/qxHVQBJ9LT0jgrr+36b9Xw
         aItcAmAeyKau2bWqrk5FUSRrzDk18Ud8/XHhIEZSzEk/ez+q0G7FgPFlA7YwiDCyZkGs
         +AVwTTz58MumBz6qA3vx+xbniUDCScNhIYMtwwo6EnkJOnBT4EE9Ge+EaiF9ooBGC72j
         FCgnMaEAX1eMEdckuizo6cuCWpK/7Sf7BaGukUuYkkDHru6WjGEzgdeZS8U26mPS6Dbq
         46GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780257519; x=1780862319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RLJzSgogYFN8Zeh81kPrNPCUIj/QxMt/6mfJHqzi8Y=;
        b=glTn4ABmHwW3o5zX3yDXIFmnNzDxlj6RD3iD+64mjc2MFTeezQWrhK9z7lsQzJhRVY
         b1oHKFK/ME0BqmDZBjJOJox2eaCPuUZQbp7RP+tkTpZ2eYdNJRan5ubOsfb+pjeB/JdM
         PBWT/IW5Lf1cU3k9DH4Y7LuqBL23zJADOrVOjkAwP1pukh3Cp/n9WccJIbD7WibCs5sM
         F6+3oiVb4VgJfusADCeetZGjq5NDcoOzg9q3D+BwS9fFQ/PvP7w5xFJ1HeXaugAXrz+I
         HYv8IpO+/AwfS9vEOuKRYtIOW7WX/h5wJAa9gc0xljQ1096qxu4mHUvIQrrh0bs71MyS
         L8DQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H6wa1GCb71aQCTxTEFAQ7axu05mHKjssD9dd6+xKmP5xozLmBW8PGD4McAfDkiwDMUk2Cqsw/ZEWD@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyyaAjz2RiVsmESEGfZ1RKmY+69gGd1yvIPumm8HnPAB/wRUk
	bWgpr3lc19t9I85BfT8HxU7OLe5qmSWlEvsm/gPu8GJNqvS9jsdFy6H7
X-Gm-Gg: Acq92OH8QDC+beNLqkb/xVwKfoUn473Ti9mrDQx6xQBxpkfjkGVE8bpXMRJ24SHeLhJ
	9mbfFa0vZ4t9XZwFdfeCcwEvwJMrYAIAjKicK8HwgDr4RJLpx4IY+OJwFVgUZV6+JCL5zrD11vc
	Y+EBMs2d7vchG4sOZceApk0lDz13x91kk4U9PNFYM1SmmEuaZZSy1PaBB7ro0etHHbkPBfsMCqb
	/iKJ+V1uj2X1Ze2XunNoRD31xN02yGilfB5rovfQPCcQlx5CAaZyp8l8Rmte5PtJ1VtLiqBLt24
	0DKdcqkO6Ox1cYwZy+toyv3YgtfqKzp0JyQyTP5sKUsb6p+IdYLmlFPG98RP5Mnfnv2dUjdARBp
	orIelGa3MLqDqB97QpzG8O7hETcD1S/y4p40Qf9U0Rb+OIBDyz0wAbQntjp49Kj9MxhuVknAKlR
	DNmwdC3bO5fTY5whTUYCMJwctLLzIOS0AfsT2RCTBOqg209px94w==
X-Received: by 2002:a05:600c:a01:b0:490:46df:a87a with SMTP id 5b1f17b1804b1-490a2a847edmr152590355e9.1.1780257519146;
        Sun, 31 May 2026 12:58:39 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:152:df59:bc17:a305:8902:fb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d7002e8sm220323775e9.15.2026.05.31.12.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 12:58:38 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 31 May 2026 21:58:23 +0200
Subject: [PATCH v4 3/4] iio: light: veml6031x00: add support for triggered
 buffers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-veml6031x00-v4-3-e64f7fdce38d@gmail.com>
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
In-Reply-To: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780257511; l=5898;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=3rMinnWkSWj8Yetpk6Terpb21cTv9q5faLaxxlD4tao=;
 b=bgW5mAvM2uIi2Bcq0yv6vNGjRV1wg7bZm4RdzeK0rUdBHdL+FdE9xtXhDxSomsKi3t86TktKd
 LGzVW3WekG4A/VF4LqSyBfVgkJp5ArRIOUAPKr5C1wgUboW6s9BvkOZ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/Kconfig       |   2 +
 drivers/iio/light/veml6031x00.c | 114 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
index 99a6ed80c7db..ff71de8454bd 100644
--- a/drivers/iio/light/Kconfig
+++ b/drivers/iio/light/Kconfig
@@ -717,6 +717,8 @@ config VEML6031X00
 	tristate "VEML6031X00 ambient light sensor series"
 	select REGMAP_I2C
 	select IIO_GTS_HELPER
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
 	depends on I2C
 	help
 	  Say Y here if you want to build a driver for the Vishay VEML6031X00
diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index 6f9a7bad44d4..facb1b8e4241 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -16,6 +16,8 @@
 #include <linux/units.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-gts-helper.h>
+#include <linux/iio/triggered_buffer.h>
+#include <linux/iio/trigger_consumer.h>
 
 /* Device registers */
 #define VEML6031X00_REG_CONF0       0x00
@@ -31,6 +33,12 @@
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
@@ -136,6 +144,13 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_INT_TIME),
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME),
 		.info_mask_separate_available = BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = VEML6031X00_SCAN_ALS,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
 	},
 	{
 		.type = IIO_INTENSITY,
@@ -146,7 +161,15 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_INT_TIME),
 		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME),
+		.scan_index = VEML6031X00_SCAN_IR,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
 	},
+	IIO_CHAN_SOFT_TIMESTAMP(VEML6031X00_SCAN_TIMESTAMP),
 };
 
 static const struct regmap_range veml6031x00_readable_ranges[] = {
@@ -378,6 +401,10 @@ static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_type type,
 		return -EINVAL;
 	}
 
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(data->dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
@@ -438,6 +465,10 @@ static int veml6031x00_write_raw(struct iio_dev *iio,
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
@@ -469,6 +500,82 @@ static const struct iio_info veml6031x00_info = {
 	.write_raw_get_fmt = veml6031x00_write_raw_get_fmt,
 };
 
+static int veml6031x00_buffer_preenable(struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	int ret, it_usec;
+
+	ret = pm_runtime_resume_and_get(data->dev);
+	if (ret)
+		return ret;
+
+	ret = veml6031x00_get_it(data, &it_usec);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(data->dev);
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
+	pm_runtime_put_autosuspend(data->dev);
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
+	int ch, ret, i = 0;
+	struct {
+		__le16 chans[2];
+		aligned_s64 timestamp;
+	} scan = { };
+
+	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
+	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
+		ret = regmap_bulk_read(data->regmap,
+				       VEML6031X00_REG_ALS_L,
+				       &scan.chans, sizeof(scan.chans));
+		if (ret)
+			goto done;
+	} else {
+		iio_for_each_active_channel(iio, ch) {
+			ret = regmap_bulk_read(data->regmap,
+					       iio->channels[ch].address,
+					       &scan.chans[i++],
+					       sizeof(*scan.chans));
+			if (ret)
+				goto done;
+		}
+	}
+
+	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), pf->timestamp);
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
@@ -576,6 +683,13 @@ static int veml6031x00_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
+	ret = devm_iio_triggered_buffer_setup(dev, iio, NULL,
+					      veml6031x00_trig_handler,
+					      &veml6031x00_buffer_setup_ops);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register triggered buffer\n");
+
 	pm_runtime_put_autosuspend(dev);
 
 	ret = devm_iio_device_register(dev, iio);

-- 
2.43.0

