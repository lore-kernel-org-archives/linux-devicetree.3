Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5098A3955F3
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389157; cv=none; b=dbzXPFffMSN/Fkr8kXrzIcPWmDrEhaKQH+K5TXrNR5ovdCEJd/3qWH+jtN7GqxdfM1UxFs40/rggLhpPm4DC4tGYUICYRAxs3sQOXoBZY87tifWtn7VMLwCD3NFx28ru/hQhDfbJtpj1RXaVKOis09kgphidnHqWsoBEqBPd9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389157; c=relaxed/simple;
	bh=GrjWD/fHDSl39omfPPPA6fY82p2QrwPspwwKONWixLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e94wGwMxJqlT7H2AZPieFYf6au0NnQxi2ZW+2f45opn3GPBrRJeu5mDIv5JwOcUftgmQu3ogjQZE3pyse8fq+nBKNWhF9rI/+EP9xfyviZ6Ec6L8xfb9tC5NjNjDVwfnVc1krseOAMu4wYqxBvVS9xpOfP8TGtH7GU4IrDPhsW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kD7CUfgc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kD7CUfgc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998e0916faso11641545e9.2
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389152; x=1787993952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luQR8xYtWNjcIKjnua7+NMXDIf2qqWk1d+lbBj05x0Q=;
        b=kD7CUfgcAdxfIqWoJWbLxfAn9h+Q4Z7UCv9VgUO2mfgDSasF7IQQ8/QqUzi2oDE5kU
         jMd2V5hkODd6P3fGom8qC8SUqfpViayyzMOc9XSn9tjdQWIuWjGAQ2pUN/H0hj0NsbLU
         VQgFsQZ65Ae1LJr6qGTAucb/Eu23GWpDW5x7ejrSH/1cvQdbXTvhOS2aduC/9ZUCZEOb
         TQyzHdhtC531HxwK7aXoqXhCUbsAarQtSZE22cyTFYssbrKSfzSmNDH/gxuEsGvpPBEC
         iNGIW353j2jCCJ6VqpI0ZKSn7iPZSe28V+R184ZyvxzM5+TlbY+ISgjl9M7xPrVTzjbh
         twzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389152; x=1787993952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luQR8xYtWNjcIKjnua7+NMXDIf2qqWk1d+lbBj05x0Q=;
        b=BWRQGRlg++hLq6s0yUhbFYDg6BVgebO9WADXfyDQaBHg7W6fZQr825zEnuxOaBYwht
         o5GvR++hADHp9JdFyDlZU5x5b0q9HxV9RUmFJ/fC1rkJv0EDGpWJRY9JNnUD0iDHrdLS
         H1QLe39OIzJH8BXRGof66lURAYwancmxqVy7xD+PbkT8FM+/5cYfqlNGCKCkSYSD+pL6
         73n4CeJTCROgKcm0JXa6WWc93FvaaYdZOAQTapwlRh4SuntJhAeerGMaA4eVUuXWeR5g
         iq42wH972+kdRGv/GuJEUJJ4ny059XkfSUVxgIQXLzxVDkKqQ1MsKasopEoOeitdhc4C
         xhfg==
X-Forwarded-Encrypted: i=1; AHgh+RqwMws3DCH9WqOHWqQx5zqy9K2B+T7/YF30SgwGNUUiPEyZccXBuaN35goD0KQMjaxGF8q+obgaHvKo@vger.kernel.org
X-Gm-Message-State: AFuF++nWzLXXrlSJghsvEsZW/kt9k9ZaPKds73LKn1cMtiUyAcxrhjaB
	FHN73FOJq0q7RwBbNB+J3oy8EIlfOXUhpY7GOSccg7DQRaliJE0CH4NUCXwJoA==
X-Gm-Gg: AR+sD11RYY4mgKaZSJr1xjr+g7Ah2sb+MFv2R6/JSLAqCZs4+E3NeCXQXEEgRfaKBLJ
	QBJN0U6MCISKKVYRgkJYf94AHesPY09rYAPJnKFzVpPTICCk74KNIEqJYdDyIhRDnh6/UOyoteV
	k/ab3U0dlRDbn2XOz8MqQPNciu0O96A6epBkU4WSCevnuXr7kEj0gW+FW/ektVfrhLUp+OOTzsD
	BG7374yF/826nBaycJn5tMFn9vsLWxOf6cDZh//FPdGniy3tzfBTmM8fA4G9K+eKsLx8OYWdYmW
	aMeVlOkZc6F/Tqh7igXzpOWnb7mTX3B78PWS+JeSlWQBohJK3ycGx+mqL70wRR9brLe+/OBxVaI
	Gw3CYHD+80M9tlMQg6Q78vJPssMKBrkmPFk7wS7ER3O/tna+Nad9KJ//vueAa+xpMUoGSEMozL2
	OKXz/FL7Na+84Vzk1OqTpq7YqrY0AZGtmn/0HLSpZtgFv7lTMbcLTmcuZVAW3BUce6tVC/6tkZL
	twBd96lw/A=
X-Received: by 2002:a05:600c:83ce:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-499c19adad0mr42586245e9.2.1787389152523;
        Sat, 22 Aug 2026 01:59:12 -0700 (PDT)
Received: from fedora ([105.74.72.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c359b9fcsm13596635e9.9.2026.08.22.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:59:11 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: Michael.Hennerich@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v6 5/6] iio: dac: ad5504: introduce local lock to protect state and spi transfers
Date: Sat, 22 Aug 2026 04:56:52 -0400
Message-ID: <20260822085850.17527-6-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822085850.17527-1-0rayn.dev@gmail.com>
References: <20260822085850.17527-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver lacks locking, exposing concurrent access to the shared DMA
SPI buffers, the non-atomic CTRL+NOOP write sequence in powerdown, and
the pwr_down_mask/pwr_down_mode state variables.

Introduce a mutex via devm_mutex_init() and guard(mutex) at the IIO
callbacks to serialize access. In read_raw() and write_raw(), scope the
lock to IIO_CHAN_INFO_RAW only since IIO_CHAN_INFO_SCALE reads vref_mv
which is immutable after probe.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 799726eafdf2..74679feea385 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -8,11 +8,13 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/dev_printk.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -55,10 +57,12 @@
  * @pwr_down_mask:	power down mask
  * @pwr_down_mode:	current power down mode
  * @data:		transfer buffer
+ * @lock:		lock to protect state and spi transfers
  */
 struct ad5504_state {
 	struct spi_device		*spi;
 	struct regulator		*reg;
+	struct mutex			lock;
 	unsigned short			vref_mv;
 	unsigned			pwr_down_mask;
 	unsigned			pwr_down_mode;
@@ -109,7 +113,9 @@ static int ad5504_read_raw(struct iio_dev *indio_dev,
 	int ret;
 
 	switch (m) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
+		guard(mutex)(&st->lock);
+
 		ret = ad5504_spi_read(st, chan->address);
 		if (ret < 0)
 			return ret;
@@ -117,6 +123,7 @@ static int ad5504_read_raw(struct iio_dev *indio_dev,
 		*val = ret;
 
 		return IIO_VAL_INT;
+	}
 	case IIO_CHAN_INFO_SCALE:
 		*val = st->vref_mv;
 		*val2 = chan->scan_type.realbits;
@@ -134,11 +141,14 @@ static int ad5504_write_raw(struct iio_dev *indio_dev,
 	struct ad5504_state *st = iio_priv(indio_dev);
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
+		guard(mutex)(&st->lock);
+
 		if (val >= (1 << chan->scan_type.realbits) || val < 0)
 			return -EINVAL;
 
 		return ad5504_spi_write(st, chan->address, val);
+	}
 	default:
 		return -EINVAL;
 	}
@@ -154,6 +164,8 @@ static int ad5504_get_powerdown_mode(struct iio_dev *indio_dev,
 {
 	struct ad5504_state *st = iio_priv(indio_dev);
 
+	guard(mutex)(&st->lock);
+
 	return st->pwr_down_mode;
 }
 
@@ -162,6 +174,8 @@ static int ad5504_set_powerdown_mode(struct iio_dev *indio_dev,
 {
 	struct ad5504_state *st = iio_priv(indio_dev);
 
+	guard(mutex)(&st->lock);
+
 	st->pwr_down_mode = mode;
 
 	return 0;
@@ -179,6 +193,8 @@ static ssize_t ad5504_read_dac_powerdown(struct iio_dev *indio_dev,
 {
 	struct ad5504_state *st = iio_priv(indio_dev);
 
+	guard(mutex)(&st->lock);
+
 	return sysfs_emit(buf, "%d\n",
 			  !(st->pwr_down_mask & (1 << chan->channel)));
 }
@@ -195,6 +211,8 @@ static ssize_t ad5504_write_dac_powerdown(struct iio_dev *indio_dev,
 	if (ret)
 		return ret;
 
+	guard(mutex)(&st->lock);
+
 	if (pwr_down)
 		st->pwr_down_mask &= ~(1 << chan->channel);
 	else
@@ -290,6 +308,10 @@ static int ad5504_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		return ret;
+
 	if (is_acpi_device_node(dev_fwnode(dev))) {
 		st->vref_mv = AD5504_VREF_ACPI_DEFAULT_mV;
 	} else {
-- 
2.55.0

