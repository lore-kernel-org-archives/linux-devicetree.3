Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883650;
	b=eG7yJ4mRwebF6T+zfxyswzWOzqWs3aAiMdYl2BeuTx+bWNHb+/hcF0zRyTEGOPdiw0fQ
	 RukfSd4ABafO6uKCzv52w1zntNNA+lZgmOGzm7RgNfnugXGxaKj6dAJt02bdN6ZTITznA
	 5e5JMCkl6LXOKl3Msfd/0EJYTZGv4YwM+SPsxDD55UwgaqantXMehmTEOpcsAr+CQrGjl
	 2GD5RGtwaVu60AuNmQAERfGDWarehEqgmVIobNVlVKoIsZ1+ZpwxfgcM3+shDFg7ScUIh
	 E4dVrYWpc7qN+pwlJRKsmFtXGynFj+CV7LD/C2AU62h3HOOLr2z3BmZ6It7HSvHw2Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s5r8P5PPgMGv0XEFAPf7N90jgdkZIp6hKa1+XNqtBTI=;
	b=o8miKiHLHn+DHJqLI8wR2Cldkax0Pu/4al6/IiTEy97oFREgR1r0ZERQQtWTXG3id0IB
	 arSzafb1q1BecTfxVFQpIjdLeJRJN6qBnJzjGTcDDIJnRm/Av5mfHx2r0N1Hax7raT17x
	 N8I3CgU4sc7qB6qhp+TDy96V1WcKx7OdJI6HaZchEKxphZRe/8yjvDedjOaKC5aeJs/GU
	 i5dgJOBWUyvUmRzG0YYHhQuzoIenUcK56XtzStXPI8FFDlJrxrTg3/WXTiuOatzIBxibY
	 q0TJZ3iKRziu0GB90KWdg0klyPONdXyExGDb14HQfEQQftAaIGyWufA4itplKwIYXvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C6TFmIlo;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90689606A320
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90689606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C6TFmIlo
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7bec5112765so1434225137.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 16:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883648; x=1793488448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5r8P5PPgMGv0XEFAPf7N90jgdkZIp6hKa1+XNqtBTI=;
        b=C6TFmIlo4tzFwlOqjZlJ7PU2N1JOTqfZcINSpdz07QbbiJqKQYb9F+ClwbQIfbdcka
         EZF5TFJYPQwhAhxBN2pIakxIhyXxUAlaUIzOKon4nrHq4b1aNQc5NyBZHLokXg8e2AeZ
         KSWKdXDlv0ss8ugexmWbJkGcCJkzoHZnjE8NH/pIITcLxnj5EqV2fyTMjBPIJFOl9NK0
         2QMFHJX9oILbGanxGBHPj6D3T5NRq00P9lOznVv8vm05hfkk54cvIr2XB3czrt7KqSs5
         RDLEV0AU3bl1czE7ZvNBjB0hv24bYMDwT487S4XaEW5JR8ikfs7VDMO5oX1RiL1R6vp1
         lHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883648; x=1793488448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5r8P5PPgMGv0XEFAPf7N90jgdkZIp6hKa1+XNqtBTI=;
        b=V4sSgtARnk/7dbxGZbMI1GM9kCczx4kB6YBumA/sfI0XtuhnvYwuwP0GrqcqB8VMj7
         zRpn3AqZIDuAqSjtRptHiz2bRxGt5ndz/n1k6iX0NFd/yhCDpHq0s/VP6OjGAnF8sFKC
         W5w4rAE53dAmFssV/FdpS1s58WPCjy9oAf2faAPghjCfBKCa/AbEdx+YTlQmuG3wNo+f
         OI3L7yFSAh8ES3/KQiIOPrw0e+eUAsk+Xfq229LQd0tI0HMCjyLSwlelJyb7ze2yQJKv
         xym7vDFNlbE1vxotHEvfve+os7YIn+tdMkQaMq1nkGVZVtizl8aovb4ER0rc8xNeH1ye
         svBg==
X-Forwarded-Encrypted: i=1; AKwUvBxZtuPmFuWvZhYDsKCVKXQwglOMiKC06kJp7TlDVpeetLp5GkbH/z59zmoStqwJ6xQWdTxgwVKRVS7Z@vger.kernel.org
X-Gm-Message-State: AFq9FYKDa9trd4eEmqV2HxYmEvs/S1mt9TjJcq19Mc0gIlXoPTg5MzGg
	EKWBQwYlxNi14hGfKVzr/YxDkhBY3WAqISzPNzcHBeJdFExjRUdHDdK3qzI1ET0Z
X-Gm-Gg: AYBFou1sAgA76W1DqH7YVlQr7BCiq3qsx7yW43HMLQheouLvEyBZ0tuLBn4yAAZlegd
	FY9PhEA6p0Ua2tU574FCWb43oDWJgQuldhOrL2XxjLti7HBYlAj40fSoAGs/2hNdWq6BjPyU1u/
	UKC1bQ085VAGRhMvk2Kq6pl8vhsQsV4EPFzREWh0KhsiHm0v59sbH7R40fQgMwsWiQZuOkfWPu1
	5EcYJMbeIYkAXU4/q3TaWoMSQT3Un6skXZVSV1CicQoL0pvxSY7r82hTBdv4jijMUq5V+TvTP7Z
	dKaKnavXcojEXaX8AJw2UegQofHN2cvwdGGBgwCmGcGDQrimTOtyQHPV8MDMmtw+XuBKjhejeFQ
	qM8f4eNdnGHMqnwuYdrIzyqDJnlJS67QTwnhbM+yxNLqyDMiEEjw9w7NK9M6lx0cw9fdYMd5GzZ
	6s72ZjiJr3TaJnoY9I9vEXzNrc/xtogzhtX6/SxtvS/W8Llw1L07mfIRvBUjvywoClRqdX0GC6g
	aI6ZJ4cN/Wv+pvqH8y9zK1qIs0l4psm7mNtjjEJriiJnqAtYB378erZe/bqHPfZH436nfx0GwbH
	E5cn
X-Received: by 2002:a05:6102:5245:b0:7cc:3eb0:6ef4 with SMTP id ada2fe7eead31-7ce5cdfb267mr1031775137.29.1792883648516;
        Sat, 24 Oct 2026 16:14:08 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:14:07 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] iio: adc: ti-ads1298: fix scale, ID check, regmap and Kconfig
Date: Sat, 24 Oct 2026 20:13:32 -0300
Message-ID: <20261024231335.280955-4-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024231335.280955-1-stephanbrrs8@gmail.com>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com>
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

Fix four smaller issues:

- The scale divides the reference, in whole millivolts, by the gain
  before it is reported. With the internal 4 V reference, it is 0.099 %
  low at gain 6, 0.101 % at gain 12 and 0.025 % at gain 3. Report
  VREF / (gain * 2^23) as an IIO_VAL_FRACTIONAL; sysfs still shows it
  with nine decimals, now without the error.

- Only the channel codes 0, 1 and 2 of the ID register are defined; an
  ID of 0x93, for example, gives 10 channels. The IIO core then reads
  past ads1298_channels, and the RDATA transfer writes past rx_buffer.
  Refuse the reserved codes as an unknown ID.

- The driver uses regmap but does not select REGMAP, and fails to build
  where nothing else selects it, such as tinyconfig with SPI, IIO and
  TI_ADS1298 on x86_64.

- Bit 0 of CONFIG3 is a read-only status bit and the GPIO register
  reads the pins, but both are cached, so a read through debugfs returns
  a stale value; debugfs can also write ID, LOFF_STATP and LOFF_STATN.
  Mark CONFIG3 and GPIO volatile, and the other three not writeable.

The ID check was found by review and reproduced on an emulated device
only, where KASAN reports the read past ads1298_channels.

Fixes: 00ef7708fa60 ("iio: adc: ti-ads1298: Add driver")
Signed-off-by: Stephan Costa Barros <stephanbrrs8@gmail.com>
---
 drivers/iio/adc/Kconfig      |  1 +
 drivers/iio/adc/ti-ads1298.c | 29 ++++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f32f678f7..a29ed8f45 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1924,6 +1924,7 @@ config TI_ADS1298
 	depends on SPI
 	select IIO_BUFFER
 	select IIO_KFIFO_BUF
+	select REGMAP
 	help
 	  If you say yes here you get support for Texas Instruments ADS1298
 	  medical ADC chips
diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index f5965b994..b390c13ae 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -75,6 +75,7 @@
 
 #define ADS1298_REG_LOFF_STATP	0x12
 #define ADS1298_REG_LOFF_STATN	0x13
+#define ADS1298_REG_GPIO	0x14
 #define ADS1298_REG_CONFIG4	0x17
 #define ADS1298_MASK_CONFIG4_SINGLE_SHOT	BIT(3)
 
@@ -373,11 +374,10 @@ static int ads1298_get_scale(struct ads1298_private *priv,
 		return -EINVAL;
 
 	gain = ads1298_pga_settings[pga_idx];
-	*val /= gain; /* Full scale is VREF / gain */
+	/* Full scale is VREF / gain, signed, hence the -1 */
+	*val2 = gain << (ADS1298_BITS_PER_SAMPLE - 1);
 
-	*val2 = ADS1298_BITS_PER_SAMPLE - 1; /* Signed, hence the -1 */
-
-	return IIO_VAL_FRACTIONAL_LOG2;
+	return IIO_VAL_FRACTIONAL;
 }
 
 static int ads1298_read_raw(struct iio_dev *indio_dev,
@@ -680,8 +680,11 @@ static void ads1298_quiesce(void *data)
 	ads1298_wait_rdata_idle(priv);
 }
 
+/* CONFIG3 holds the read-only RLD_STAT; GPIO reads the pins */
 static const struct regmap_range ads1298_regmap_volatile_range[] = {
+	regmap_reg_range(ADS1298_REG_CONFIG3, ADS1298_REG_CONFIG3),
 	regmap_reg_range(ADS1298_REG_LOFF_STATP, ADS1298_REG_LOFF_STATN),
+	regmap_reg_range(ADS1298_REG_GPIO, ADS1298_REG_GPIO),
 };
 
 static const struct regmap_access_table ads1298_regmap_volatile = {
@@ -689,12 +692,23 @@ static const struct regmap_access_table ads1298_regmap_volatile = {
 	.n_yes_ranges = ARRAY_SIZE(ads1298_regmap_volatile_range),
 };
 
+static const struct regmap_range ads1298_regmap_read_only_range[] = {
+	regmap_reg_range(ADS1298_REG_ID, ADS1298_REG_ID),
+	regmap_reg_range(ADS1298_REG_LOFF_STATP, ADS1298_REG_LOFF_STATN),
+};
+
+static const struct regmap_access_table ads1298_regmap_writeable = {
+	.no_ranges = ads1298_regmap_read_only_range,
+	.n_no_ranges = ARRAY_SIZE(ads1298_regmap_read_only_range),
+};
+
 static const struct regmap_config ads1298_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.reg_read = ads1298_reg_read,
 	.reg_write = ads1298_reg_write,
 	.max_register = ADS1298_REG_WCT2,
+	.wr_table = &ads1298_regmap_writeable,
 	.volatile_table = &ads1298_regmap_volatile,
 	.cache_type = REGCACHE_MAPLE,
 };
@@ -704,6 +718,7 @@ static int ads1298_init(struct iio_dev *indio_dev)
 	struct ads1298_private *priv = iio_priv(indio_dev);
 	struct device *dev = &priv->spi->dev;
 	const char *suffix;
+	unsigned int nu_ch;
 	unsigned int val;
 	int ret;
 
@@ -717,7 +732,11 @@ static int ads1298_init(struct iio_dev *indio_dev)
 		return ret;
 
 	/* Fill in name and channel count based on what the chip told us */
-	indio_dev->num_channels = 4 + 2 * (val & ADS1298_MASK_ID_CHANNELS);
+	nu_ch = FIELD_GET(ADS1298_MASK_ID_CHANNELS, val);
+	/* 0, 1 and 2 are 4, 6 and 8 channels; the other codes are reserved */
+	if (nu_ch > 2)
+		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", val);
+	indio_dev->num_channels = 4 + 2 * nu_ch;
 	switch (val & ADS1298_MASK_ID_FAMILY) {
 	case ADS1298_ID_FAMILY_ADS129X:
 		suffix = "";
-- 
2.43.0

