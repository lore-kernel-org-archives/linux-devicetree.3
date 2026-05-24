Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2237F746
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779659794; cv=none; b=VxxDAz+cOBa2KrJ2Kp+1VG88CmcnbL1le9JVmUcOpkejNRN+7ajtN86X1JSTAMW/0URqNaXbV/zo7PMuPpllSrrX+qVrU3QYCqBeO6WAQm7ZZEjYL0DQonnyBzYIUz7yIJpAmfWG93kUB4frnSLsPxKJAdSGjfswwYJz0uFkt48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779659794; c=relaxed/simple;
	bh=EldXhoOy/ocJoEbIRKaCNHRHFeAW9if50k40sNRnv8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ra6Kn9Zfjz+wOEwHiXDV+razS1jMbIa8ebQ+N8FA99gHubsMfmnyqqfuJrKNFYhjyq8z0wHZchwyWQFWS5u/eIp5/k9caN4kiqrTF4hPP4Ljw7tGQpVhmGPKehC9CeeiR4F9xNFkDy939L+vdQOjpt1+5TpsSraw8mZsKN1v21w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acaBE8Ma; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acaBE8Ma"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so22294615e9.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779659790; x=1780264590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9w7wtW0oXd/rh6Ow5Q7vpAkedbI875pqYp77tyfe1GY=;
        b=acaBE8MaLlGJtE63qGUcUnQQ3JRV9eoO7lBJGPTyRrekIV5LiIEAkr2f5F/0f9a/2o
         8cKkALbVIUxS2K91AD7mlgcUABNlS1wiApwujk+6pSi3ViV+M9+MFeZZnHw2iEt8N5gY
         wuV7Pwj9TmJPnlQWfazN2A2Gx5YMc2LYc8QOLManLUSzUdKMZWJawkVGrZx2PhPXkHK4
         +i3H0Y7O2ANDLyafiymBZT8s2asio0b5EQ+I4Dmo0vCBG3/Ex+thBsNzkC1ynEuji3G/
         26x6OYAO7956Z6rNrKu47dcl7GTc0gGolMLx/Kf/NcBiN5sUEJxYxacwgwL3Ys0io/9j
         PCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779659790; x=1780264590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9w7wtW0oXd/rh6Ow5Q7vpAkedbI875pqYp77tyfe1GY=;
        b=Wkio54qlXDTs5IlvNNqUtoKOJ8IUI+uellqkIoFStRlWfHuXwR42fsMU3Wu1WYONgq
         Hf27kGn76hB2BakHok9EVWajZUFJwxUwEk+U3EGP6VV6Mss5PwnN7OOF2Ywux9kB9KTS
         fFGg2jHFDVzJ3WeVhbfZpdAqbNSNg+zdbqDiMZlqEed2dfm1Hu4B+fp1oQh9w8P+Ed/S
         Vcv++14QKcGDzs2/zUpy/3F9xHaTNO9DFvq0p7EwZJoNoy3Acr3aJ61bfn3v7M8xAF9R
         Oba9tTSEmXgxo8pUA1/lcAg7614GB0X6oC014zLCzda+P2tiefuEJXYIjG1aW7mTL8oh
         Y/2w==
X-Forwarded-Encrypted: i=1; AFNElJ/FMAvUFwdOhZIbZdtF3Bd7tfkHvtXOpwcVE16Tv3GCkUS8F3j65RrG2SMfb6GKC1RowZfFBH5SrheO@vger.kernel.org
X-Gm-Message-State: AOJu0YzOnQJjL4BYrj5QenjLgXIuv8yDa9+tPrm5W+OO+3kH42FQ00sn
	QzlGOoy1nqp8IfLlqWIz7BYvUOff/l/yu/ZgRGv7XCWBLLI8jkR+unvk
X-Gm-Gg: Acq92OH3we4SVI4LYBnJ/m0af/nJF6ozm2tC5fH3kD1Sg2K7YlbbTQMRW9Bu8tnS09d
	LQq/a3AVTnF0LmPzwDbElVwqk/gbHLIpinJBTObArOslPaMPKG/ngZI3lYgbz8ig/DxsoKgLYL2
	7cCx3jVGWkWoaH0T2WRnXJLfcAXStiGVv/jnKlmByELrDyBnYr+KnCbc/BhUy9nq6raEX1MiwZ1
	CpvTRkhT726PsJB+BlPtpqlHIgCwgBwdq6DT01gH+QUiyheLv8h+JxIB3DkTUVY/Xu8/HS8uX3h
	QBdbB2jwlIx7968ZbK1PJ0qDdGkK99BQrkempJ6u6vVXddXXtAhQHtgIqBr/e9sPBjoGGnBEChu
	fkAwC4JCh+Unf6wFFQnmrqrbE6zy+59/Fd6Pu6QyKzL0JQjzYmKvIeTh3wj1agumIlCDvTqA86e
	swafOKt8Mc69btmlqPbA4kUfdq95yUF+IMYxkP87Qfczr1sZ+xQhKdqR4B1I+3CDbHupxH8E5L0
	ujMEYsf
X-Received: by 2002:a05:600c:3488:b0:490:6869:7d8b with SMTP id 5b1f17b1804b1-49068697e08mr1475135e9.15.1779659790489;
        Sun, 24 May 2026 14:56:30 -0700 (PDT)
Received: from [127.0.1.1] (213-225-2-150.nat.highway.a1.net. [213.225.2.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm300779285e9.7.2026.05.24.14.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 14:56:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 24 May 2026 23:53:57 +0200
Subject: [PATCH v3 3/4] iio: light: veml6031x00: add support for triggered
 buffers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-veml6031x00-v3-3-29165609b2b5@gmail.com>
References: <20260524-veml6031x00-v3-0-29165609b2b5@gmail.com>
In-Reply-To: <20260524-veml6031x00-v3-0-29165609b2b5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779659783; l=5184;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=EldXhoOy/ocJoEbIRKaCNHRHFeAW9if50k40sNRnv8s=;
 b=b8yWldFNyDBKMxjKkKWPD50pzA8fRKIzVQIrFBCvvvSbhKbjQT65892CBfW/sxkFzZp075VQh
 EEuRoNnSAJ3Ar+m7frF8VMPPZLmceu8PesB0oSlH1yN4NKERsKjwLwJ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/Kconfig       |   2 +
 drivers/iio/light/veml6031x00.c | 106 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

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
index 50979d239230..9968d4414dc9 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -14,6 +14,8 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 #include <linux/iio/iio-gts-helper.h>
+#include <linux/iio/triggered_buffer.h>
+#include <linux/iio/trigger_consumer.h>
 
 /* Device registers */
 #define VEML6031X00_REG_CONF0       0x00
@@ -29,6 +31,12 @@
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
@@ -128,6 +136,13 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
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
@@ -138,7 +153,15 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
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
@@ -461,6 +484,82 @@ static const struct iio_info veml6031x00_info = {
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
+	if (*iio->active_scan_mask == (BIT(VEML6031X00_SCAN_ALS) |
+				       BIT(VEML6031X00_SCAN_IR))) {
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
@@ -564,6 +663,13 @@ static int veml6031x00_probe(struct i2c_client *i2c)
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

