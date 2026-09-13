Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273A37F333
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301931; cv=none; b=g2cbeC4b/6UDg3DiL2d9oNwdu/HmDrZK3JmDUcyyfT/cjwd7NR0CCMxEl+aHZ0XGqK2kmljb1KPQBv2prF4nyccKZSrSSs25UytMMLb2F2RiZBz5jilE4wuxwCXpwdPWQev4+u1FCDvbMJH1BBDpa+4psz6RuO10c9z2uxDhClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301931; c=relaxed/simple;
	bh=QCLyoNALvtQOVUWWgKT4N38ewa9Qau0InNlSI5vyyo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfJOKCiDjG3hZs1eC54swoN5e32fKiy0lwdzBDzNLFXxtKOQNlgEn6tvqNGUpYb/HeCbQ4Au7wfWpWXxZVRidE9ke0X4SBtN2jtYTQ4p7JE7c3ZR/IfKss4I0VHx5pYY2lHwzCHM9yo8ZOEH2hq4X2XgFxW1tucaAo+sQltbzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL/dBO5Q; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL/dBO5Q"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so490124f8f.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789301925; x=1789906725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRwhjp/IBhSw3Lk79MEayOHDigt6p4gE2z38qX/b6Cc=;
        b=gL/dBO5QhFjOa3iJ4TD4swRUrY123xITh2Vdq1CVWnPW2+s5bRk0++34sjqmvquQWv
         bOgJEv548ayXdGMI0zkFrA3kfrlNnTKAhPGxqwau2GjQafO/W+H4VbRxTWbS6dxT2+vh
         SQkGtdHd1IDU1avSw8in6ODP3rFoq9AAJ7lKtp+NlzVmD8wegbJa4CFVAdbiczdH5lce
         oxP5F7WDN0MMLRq27BqmYM5jbdiCp0bpKH1eMST+lPsW+08G4EIQaNxZggYkyVLu2nFU
         8vHkvD2vh2w0CMKTIbikPvjRSm8v0T71EzUaVpWYStfO8vbGM42uywULVMM3PB16sCiq
         LvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301925; x=1789906725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRwhjp/IBhSw3Lk79MEayOHDigt6p4gE2z38qX/b6Cc=;
        b=c1BU9Cd38iSdyyqj/6CLfAwvj7cIWw0bCFCfyQyHe7Nz4bB9BmHaGYM/Rc4YCX35pD
         ZxItjYu0sJt+LOaf1NiJXuZpRJl9Bd4voOcmqgNhsZLwghpR8TCit1p87i/SMQslF515
         x86PUmITiiXTP5obGasBqydXw99h4bHFSQZtHSEmeJCEMfh24onwUOL0KrRcH7xDyCDm
         ft2XcHtpTzkEPmIxD2enitSHhN1A4fxMbKZ1VUV/QBU8DFBsvH5mE9+Z8rvsfMh1s1tN
         E8NzLaBWhBPAzrqBR85iykJyX39jaRsb4+wQ6ce/HkXDFiBzxH9x43jodrsrENKoAG/G
         R3YQ==
X-Forwarded-Encrypted: i=1; AKwUvByKjLTMKVnBRbsgzfpHHsLwdlFOqN/qcNJTIocFhW595ZDF/I8DYyViFAfXu8r+8jmW+jZpKJqH6D0E@vger.kernel.org
X-Gm-Message-State: AFuF++nOWOPcXBNnsgq5M3xXelDSVc2/KAoBFFWIp/NTDP9QsUb5IlPR
	c7bmVgBlxtP2Y+Vmnu8hGeUBKknz5WZGdLBre0Xoq9JuMyfuuA8ooa7y
X-Gm-Gg: AYBFou1qDnAXzzRMn1HVnWd9QGqdjZk9uExe0GIaAofqKbGoMbScsg3gA1uPxDX7pYs
	SOWSiDSYM34Q+x7xNVNGXL9o83kueJAHGC2WgOZESj6zmx9eR1qw2A2Qw9NSIoKU4GPt/wU6MXv
	nMrTC7W/1YFemmaKyAiXoipPK3PYDbvbmsaTE3tdJaWHUyr3gQEHA7ftFQRKTPRA320FxJID0Va
	e7tki7LwpDiJ9uUITN5tBxnFsFepLxRgK/4kXmQVceOK/XjTPE3UDF6wg0iYlYF/npHh25ilSIN
	TyXIrSemvWiRsNCIDx61auHgLBgXUmSmqPo24qo6XDn+XgTKfxGjbOX9hg1iCmDG7WLFTKWkljv
	EDEbvdnJp50IeeScRgR8tAaEYa6tBhR5qS5oRD1Ly4awLrjF7FsaattlGijGS5qlo7RkNvEsLuI
	XhnhTnMDgz4LQa/I1wUJ8XWzgGTVs03YSR0+wOHTUySY5V//5NqZ+baPaKrDxuu9xeAkozLD2dv
	4YagCeSmN+YDPyi
X-Received: by 2002:a05:6000:2002:b0:485:8c17:9767 with SMTP id ffacd0b85a97d-486f6c4422amr6325362f8f.41.1789301925247;
        Sun, 13 Sep 2026 05:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:107:bfd1:de2c:7b4b:8652:b761])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm20241141f8f.2.2026.09.13.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:18:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 13 Sep 2026 14:18:23 +0200
Subject: [PATCH v10 3/4] iio: light: veml6031x00: add support for triggered
 buffers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-veml6031x00-v10-3-adbc26c30d3d@gmail.com>
References: <20260913-veml6031x00-v10-0-adbc26c30d3d@gmail.com>
In-Reply-To: <20260913-veml6031x00-v10-0-adbc26c30d3d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789301917; l=6221;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=QCLyoNALvtQOVUWWgKT4N38ewa9Qau0InNlSI5vyyo0=;
 b=KMLgyMiPoTQImRHlyyE/dFejTNZlWFvulvMM7tHAMB+2CE6KaE6Ap9onDgLdmzHxTpyGZ7sLp
 WDMkN5nHVS6B8tlBXlOSxDuiQ9UfFukoD8p5oRPixeHKLdqQQlccVlE
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/Kconfig       |   2 +
 drivers/iio/light/veml6031x00.c | 113 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
index 02291abeff60..462fff1ddef2 100644
--- a/drivers/iio/light/Kconfig
+++ b/drivers/iio/light/Kconfig
@@ -745,6 +745,8 @@ config VEML6031X00
 	tristate "VEML6031X00 ambient light sensor series"
 	select REGMAP_I2C
 	select IIO_GTS_HELPER
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
 	depends on I2C
 	help
 	  Say Y here if you want to build a driver for the Vishay VEML6031X00
diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f3772577a05d..3d5a27a0baae 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -25,6 +26,8 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-gts-helper.h>
+#include <linux/iio/triggered_buffer.h>
+#include <linux/iio/trigger_consumer.h>
 
 /* Device registers */
 #define VEML6031X00_REG_CONF0       0x00
@@ -42,6 +45,12 @@
 
 #define VEML6031X00_GAIN_SEL(pd_div4, gain) (((pd_div4) << 2) | (gain))
 
+enum veml6031x00_scan {
+	VEML6031X00_SCAN_ALS,
+	VEML6031X00_SCAN_IR,
+	VEML6031X00_SCAN_TIMESTAMP,
+};
+
 struct veml6031x00_rf {
 	struct regmap_field *gain;
 	struct regmap_field *it;
@@ -135,6 +144,13 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.info_mask_separate_available = BIT(IIO_CHAN_INFO_INT_TIME) |
 						BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = VEML6031X00_SCAN_ALS,
+		.scan_type = {
+			.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
 	},
 	{
 		.type = IIO_INTENSITY,
@@ -142,7 +158,15 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 		.modified = 1,
 		.channel2 = IIO_MOD_LIGHT_IR,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.scan_index = VEML6031X00_SCAN_IR,
+		.scan_type = {
+			.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
 	},
+	IIO_CHAN_SOFT_TIMESTAMP(VEML6031X00_SCAN_TIMESTAMP),
 };
 
 static const struct regmap_range veml6031x00_readable_ranges[] = {
@@ -390,6 +414,10 @@ static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_type type,
 		return -EINVAL;
 	}
 
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	guard(mutex)(&data->scale_lock);
 
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(regmap_get_device(data->regmap), pm);
@@ -453,6 +481,10 @@ static int veml6031x00_write_raw(struct iio_dev *iio,
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
@@ -484,6 +516,80 @@ static const struct iio_info veml6031x00_info = {
 	.write_raw_get_fmt = veml6031x00_write_raw_get_fmt,
 };
 
+static int veml6031x00_buffer_preenable(struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	struct device *dev = regmap_get_device(data->regmap);
+	int ret, it_usec;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = veml6031x00_get_it(data, &it_usec);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(dev);
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
+	struct regmap *map = data->regmap;
+	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) = { };
+	unsigned int i;
+	int ch, ret;
+
+	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
+	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
+		ret = regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
+				       scan, 2 * sizeof(*scan));
+		if (ret)
+			goto done;
+	} else {
+		i = 0;
+		iio_for_each_active_channel(iio, ch) {
+			ret = regmap_bulk_read(map, iio->channels[ch].address,
+					       &scan[i++], sizeof(*scan));
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
 	struct regmap *map = data->regmap;
@@ -573,6 +679,13 @@ static int veml6031x00_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init IIO GTS\n");
 
+	ret = devm_iio_triggered_buffer_setup(dev, iio,
+					      iio_pollfunc_store_time,
+					      veml6031x00_trig_handler,
+					      &veml6031x00_buffer_setup_ops);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register triggered buffer\n");
+
 	ret = devm_iio_device_register(dev, iio);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register IIO device\n");

-- 
2.43.0

