Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A058399342
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336565; cv=none; b=AtNiglPzKJ6P6aAl0i5o/w7kGgLsHsXcBZW5sknHgv7kndfPsXPw7rxmePftFapEfDBObClDm9q5uGslpLJTvVjsOulA9jbeS/MV9ojTtEsfsZctyBYeAz1CgLMemA+X/2PryYjDlHIwk/WNI58FkVNwSyVrsxhmJGFzvSwnbIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336565; c=relaxed/simple;
	bh=bHsamKdNXaMj15lw5nYewmcYz2vhqiWqJ58ZKCBpukk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6FUkhk+9gJoDyGMyBtUUKcTPd61gdiSowGxg+Ykosl6vpYnEDYaS7vKEPF+R++EDPoE3QZb8rR4PmA/olwl3d55iLpgmWwDLhdSqASfsto6svIfDJ3QU5ArVGhHBtA7Fn7vvpR3Z1wdHq89NWqS8TbjaAZiXUw+JLcyY3Ne9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/nJE/AS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/nJE/AS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d75312379so2521806f8f.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336562; x=1778941362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsAbPVJ/lQzgpp89tG6qinhr/xePS1xjYRlJbLcWEiY=;
        b=F/nJE/ASpW9Re5tQUy87kr26Tq0gozG6ug1aC962tijgRq4cXaPcDNDb1PcIQyj6v9
         xZ09yt/oQJNA1u8h5Bz54XCCdJvdSlapfe8Pd0Z/vjsKwTga0s7jVyY1FLLPe4QozSwg
         xqV0wDOcp6u6PwhO6Y5WvY+++jhJqsY1J26fYcaJUsG/2NP35wmxRos/j7nZ4wPG8W1Z
         g9826T4L/SsXRvWUALLEvrMnFVwGyDTLVGTCQh+b1NIpALM3TsxnNDIafK0gP4+gNgmt
         sc7v39FigwcMIoQIPL/XYhKek2D1njxPxTK6jFav7Hb9kExjf8X2kun4oK6nD5Aze+cf
         rxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336562; x=1778941362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsAbPVJ/lQzgpp89tG6qinhr/xePS1xjYRlJbLcWEiY=;
        b=QagAmer1Mxhoo/lzx/r2tgDcyTs5BRtXt7URQ/CGgWzP/se1uFPIXPfxUhI9+qZvPT
         8tsuA2MxbT6KR2NYbKfEr24YvhNcStIZGvjbpxGT2GQ6DSb0ZUd0C8q3q4Nb53JAkfGQ
         tjEFHWHTSfrU9mhKfwwHxrvdsOeN3xHW9c7yOb4V3cDLtCYG8A51UmRgD2LEyZ9LryEp
         io2v3B05Mq72PebrFHsucGRa5XUCcCuV34YUjaZOx7hI74SdSWXA6XmXeQhipGJbfs4P
         qy+XaD4TQUaw5WcfzUaLDvt5oGv+6H4u1p9HIoRizF7ZTEzaQWnYJr6vq8tMARgvPxsV
         /JTg==
X-Forwarded-Encrypted: i=1; AFNElJ9QewhFWSUel9+Jy5VJtCUrKkl+vCHmVEWnavqnldQTyMuhbfc6+y2c6qGT4UlAOptYcT+oO6QB/61c@vger.kernel.org
X-Gm-Message-State: AOJu0YxK++QTmfhWhXfwrYYvmB6bpgC70kJeWaV9jc7zmXagEt+iQwBo
	+Pr+tttxw9MUW290WV6Dnqr1/eL+HkUxgQO/StIM5HeQQDBnTFanvC3D
X-Gm-Gg: Acq92OGcC5GoeMRICktynq0fLW3H5jDuFfck6izS4FGAlgkh2ihTHXOeRTk6bvQnbh9
	w/QBzZgYWCsQTtmohuyiakTciTzlV34iqQHxI08xs/CnObGe4CTjVmVFmKLg5d2UrGsEn6GC/zV
	jwEJBByK++sVNBbWlPdxhQKmMQ+rFtaac/9a8HLfGSbs60Gb4IwYGqU4Sy3WtqThlA2EP0L6Rx/
	h2ojITilL2KqupYeFOPw9/k2BTyLPQ+8DgAVhfQ0OmuP/dXmhGk4etv5pPWh+WpRmT9V35tdtAf
	HPOhHxYlVQNbl7tV77LQHQ4xcyAu5RUW4hGnEYx3qwlISXiXwTx541gkW+Q7D4nNLxmQijNHZVd
	bcOptFjZg8XwYCSn9M0JFybFKhoPAvBCCDy/FBU8YYVH54/5gpZrA+KjVFdLm3f2o5Ztg3gUg1U
	OIC2mxUty4xRCz74mFsTBFad4Dnby6XKRlD61IsvaL3BF+B1NQJcAm6T+WwA==
X-Received: by 2002:adf:fa0c:0:b0:451:b3ca:674f with SMTP id ffacd0b85a97d-452e78b3e99mr13844456f8f.1.1778336561766;
        Sat, 09 May 2026 07:22:41 -0700 (PDT)
Received: from DB-07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm15127763f8f.37.2026.05.09.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:22:41 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 5/5] iio: dac: ad5504: fix scale via output-range-microvolt
Date: Sat,  9 May 2026 15:20:43 +0100
Message-ID: <20260509142047.30302-6-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509142047.30302-1-0rayn.dev@gmail.com>
References: <20260509142047.30302-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504 full-scale range is hardware-determined by the R_SEL pin,
not the VCC supply voltage.

Fix the scaling logic by reading the standard 'output-range-microvolt'
property from the device tree instead of querying the VCC regulator or
relying on legacy platform data (pdata).

As a result of this transition:
- The 'vcc' regulator is now only enabled, not read.
- Legacy pdata support is removed, as it is no longer required for
  fallback voltage calculations.
- Strict array bounds checking is added for the DT property.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 9e95da6e49d6..040f580b8282 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -14,10 +14,12 @@
 #include <linux/kstrtox.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/iio/dac/ad5504.h>
 #include <linux/iio/events.h>
@@ -274,9 +276,9 @@ static const struct iio_chan_spec ad5504_channels[] = {
 static int ad5504_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
-	const struct ad5504_platform_data *pdata = dev_get_platdata(dev);
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
+	u32 range[2];
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
@@ -285,16 +287,19 @@ static int ad5504_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
-	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-	if (ret < 0 && ret != -ENODEV)
+	ret = devm_regulator_get_enable(dev, "vcc");
+	if (ret && ret != -ENODEV)
 		return ret;
-	if (ret == -ENODEV) {
-		if (pdata->vref_mv)
-			st->vref_mv = pdata->vref_mv;
-		else
-			dev_warn(dev, "reference voltage unspecified\n");
-	} else {
-		st->vref_mv = ret / 1000;
+
+	st->vref_mv = 60 * MILLI;
+	ret = device_property_read_u32_array(dev, "output-range-microvolt",
+					     range, ARRAY_SIZE(range));
+	if (!ret) {
+		if (range[0] != 0 || (range[1] != 30 * MICRO && range[1] != 60 * MICRO))
+			return -EINVAL;
+
+		if (range[1] == 30 * MICRO)
+			st->vref_mv = 30 * MILLI;
 	}
 
 	st->spi = spi;
-- 
2.47.3

