Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B28471CE1
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001107; cv=none; b=qOGK1WS8Zj6WvldNlN9L88ci/Lif7pW1Q9V5nWmk0dwywW9U3QbKdK2CMGUXC+8xd3YGW5If2k2WC8SKukROk0/x/eLTD8joBEbONm5Lt0+xWO3KlUa+NmNM5Gra72gLqYxHc/A1YGzZ1RZRzEW038nEA2fclHWDr8d1g0KwyeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001107; c=relaxed/simple;
	bh=OlM8K7Hln5lV9GkceSzF8HYbv5V1jBHK/YfIivjoDiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPMtFHU2ai9/FLb8TMlS74FX9YlBmYuSqnA6fOxt5DUY/HL64YvB2WPwOosKzzv6WykjRGC7OQk/vS49p32Y6a7cFQ7QuB0JrsDxFFzLq/Dad0rxjKLqDQcBJq+f4+tU9UJoDJ/SnucugV08Kruet4UmWI4lDv5+HEWhz0SwUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvLFtsFs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvLFtsFs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482938466a7so2419645f8f.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787001102; x=1787605902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2T7LsusGMuIJahe1GygV2/c0EF4vZ4QZqRAMwjrmywg=;
        b=rvLFtsFsVtbqFBPjYjmAwlwUzaNqHCWuajptiHXDMwXPi+AYNLVG3p6W8auNJMWwOK
         ddpN/+UdSY/SCRMKtUXwlWjbcouzk23RapAX/WutOONdKnFZNfuzY/zSFznfuSjf3VVo
         OBCBIOBCiXOT1bNZg2oovieghaAv12Nl3IwU/DoMC3KzERyPV3TEaZQ49XhhoMbSIROZ
         P9XgK/Le56ZDgcEis/pk1msmjrsx9Gz33JOAByFZJotLpEvNkh0zQlG5QwLjtZ/QfcXc
         MItH484yPxC2bLOCGxtMNXevYjSKjDc+FWBHWZClJvbb0e/LQPEiLpei/ImVCQFeLK13
         MD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001102; x=1787605902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2T7LsusGMuIJahe1GygV2/c0EF4vZ4QZqRAMwjrmywg=;
        b=VHfHA8+Ope6+4Vpah688+PRav0YAvLxDdDAjPGlERBHgcFCfpLFshSRXHqZ+pz57lz
         C1ZQWK4GT5Bti8sl7EmGNpmeY9SSnnxXCi6rngRr0GPucxMgwIvvoxLv7ZyHE6Ri7CkC
         P07F3/sJKNBpJxp0nsTMeKo6ieHBJ6nrU57OSkVSTbZ+4BLQCkUwHe4TmLH1kTSVaPf6
         0Yt7wmNFg8I6/AooGn3GNFyB+DOxMngkuh+qTRVmsfkfdwLrWZUwA0iJXj8QkLyXqEwi
         NvzOBYngxzuqh82YEF2xkQde6EKzfBY5ifP24ZStpZa2BS9X5duKtdvVJPn0VLrfiNRL
         wEhg==
X-Forwarded-Encrypted: i=1; AHgh+RrCXDksLLaiczokedI3HTb+zYNbKqwDe3Fl/HeKr3H+/fei3aGO+iyc7WPPnDhQ3xNc4QWBm1rnNgcD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4BD9u6UvhXfO0jG8w3U/OOgZnl/t1tz2pzODoYD5uKAuRkge
	w/aQ3uuQWrfipmxHwZoqKv+ihLyEadduyK5eq/VEVq7kAIBlpTU2bg+H
X-Gm-Gg: AR+sD10uUWS+ZeBvRLYZFhS+M8Xa6QHERZlJoQUn53o9ZpdjdNpmNh1kU30E0shAp4G
	3g2TLb+uTvsOB7N5zt+QYADwc6S3sOt8qnzC08dwi6JwdoK7cQ29pmQY9sPm0SHIPrWHNok9bom
	37U8WoVH1koyoOzaHD6XO+JZWNVL3dQRIv1OUuoRz12JKL7ByQwEf6wB2BoDOByA7n2uCxJexXr
	dpS+Mig69d2D/uN7Gp5/5BekzFrN+iBNYd5XngVPJRXBsXH0mTLXD9rYbU5UiNdK1+97i/qcDuq
	3N9omKjcAu5xfSPqOtjG5vhu7Z5LjyMAgLdb4/hmWM5FGplFkVn1BhfYj+aEszYtFsaQPBMFleQ
	OUBkDumk2yzJiaFd3liOjUmeEJit5vnq3R0u4BSbyJa1DOS5cRpoYv4aFaUAXJ8WnAJIjwSvIWX
	J5opnWX8samy92YUwYnrRUp6Frcqp+IxMHoc+hKq+X8C71uiW/QGK9UZciFYQr1tR5BSqFQ1CGs
	5EXwPmBaUgWj66nBGtAiqs=
X-Received: by 2002:a05:600c:5494:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499879a52aamr446795855e9.14.1787001101858;
        Mon, 17 Aug 2026 14:11:41 -0700 (PDT)
Received: from fedora ([105.74.73.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm134587625e9.10.2026.08.17.14.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:11:41 -0700 (PDT)
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
Subject: [PATCH v4 6/6] iio: dac: ad5504: support scale via output-range-microvolt property
Date: Mon, 17 Aug 2026 17:11:15 -0400
Message-ID: <20260817211118.21833-7-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817211118.21833-1-0rayn.dev@gmail.com>
References: <20260817211118.21833-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504/AD5501 output range (0-30V or 0-60V) is determined by the
hardware R_SEL pin and is required to compute IIO_CHAN_INFO_SCALE
correctly. Previously the driver derived this solely from the vcc
regulator's configured voltage, which conflated the supply voltage
with the DAC's actual output range and offered no way to express the
range explicitly in firmware.

Add support for the standard 'output-range-microvolt' device property,
validating that it specifies one of the two supported ranges (0-30V
or 0-60V) and using it to set st->vref_mv directly. When this property
is present, the vcc regulator is only enabled (not read) via
devm_regulator_get_enable(), since the regulator's actual voltage is
no longer the source of truth for the output range.

For backward compatibility with older device trees that predate this
property, fall back to reading the vcc regulator's configured voltage
via devm_regulator_get_enable_read_voltage() when
'output-range-microvolt' is absent.

Use device_property_present() to explicitly distinguish "property
absent" from "property present but malformed", rather than relying on
the -EINVAL return from device_property_read_u32_array() as an
absence sentinel. That return code is ambiguous: it is also returned
when the property exists but the parsed array size does not match the
expected length, which would have silently and incorrectly routed a
malformed property through the legacy regulator-voltage fallback
instead of surfacing a clear validation error.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 546420f9afc0..25c0744545f0 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -15,6 +15,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
@@ -293,6 +294,7 @@ static int ad5504_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
+	u32 range[2];
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
@@ -308,12 +310,30 @@ static int ad5504_probe(struct spi_device *spi)
 	if (ACPI_COMPANION(dev)) {
 		st->vref_mv = AD5504_VA_MV_ACPI_DEFAULT;
 	} else {
-		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-		if (ret < 0)
-			return dev_err_probe(dev, ret,
-					     "Failed to get vcc regulator\n");
-
-		st->vref_mv = ret / MILLI;
+		if (device_property_present(dev, "output-range-microvolt")) {
+			ret = device_property_read_u32_array(dev, "output-range-microvolt",
+							     range, ARRAY_SIZE(range));
+			if (ret)
+				return dev_err_probe(dev, ret,
+							"Error parsing output-range-microvolt\n");
+
+			if (range[0] != 0 || (range[1] != 30 * MICRO && range[1] != 60 * MICRO))
+				return dev_err_probe(dev, -EINVAL,
+					"Invalid output-range-microvolt\n");
+
+			st->vref_mv = range[1] / MILLI;
+
+			ret = devm_regulator_get_enable(dev, "vcc");
+			if (ret < 0)
+				return dev_err_probe(dev, ret, "Failed to enable vcc regulator\n");
+		} else {
+			/* Backward compat: old DTs without output-range-microvolt */
+			ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
+			if (ret < 0)
+				return dev_err_probe(dev, ret, "Failed to get vcc regulator\n");
+
+			st->vref_mv = ret / MILLI;
+		}
 	}
 
 	st->spi = spi;
-- 
2.55.0

