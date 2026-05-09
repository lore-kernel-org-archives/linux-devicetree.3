Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B64396562
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336563; cv=none; b=K+jCiJH4JyKSL/GFNUtnCT8DQ92YpF8N1amEAZs2MwBAZJpx2irtF/WzbnQFZJZbmuipwzeVnXzN8zQAvi/T9PQShke1JxoNPwZhiW+m89cgibBGIj3vUnGXoqwIicIqT5nehCPon8ZW6AJkdPv0HsiUtC7yRb1tUxQh3UQCO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336563; c=relaxed/simple;
	bh=5041B97lUMY1NweE62U8zsBcR/adbKbv4T2M7YYYW6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UN2MH3bSxZ8A3z5rENrtqYlVCkgGLf1PKjovKpWJ58RefoGZf8Qqbfw+I25FyZPiPYXiovn9zWKB4F8SgpG9EKJLRwUwOU74aQnXNrv9TpEoH7RS5QqXN4d3J28LLxjgMhI3NmQfw0eciJiGlwkLxh8kCo3xhPUUs1m8J0hiv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6vVYxRI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6vVYxRI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44509921fbcso1454727f8f.3
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336560; x=1778941360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4zpzlxVkYdL6pM1JU7oOah1Khvqrfh/u/pFhf5YJ9o=;
        b=T6vVYxRIPZONQzb82XboHZmB0XDa36OnTXbvUwmK1D9eKBKXMdEOrGV41vm9WDVhoz
         uhk8JG0cvaoamXgv86KzvoI++oklP79HHD110rNUCmMwy2BmfjyHP112rEyZIp2y9EA1
         9VVcm/jX3JiAr8ljkBPMRTKi59X9xEaNQnp5Sl7h6DSIbf0jQT46P6nzdlVDTFxggPFe
         qvp88lZOkL7zziin3eZ+Pr55muh2AdDzMp4v6CNbZ0GkzOfZGSWzw34L5EXxjfrLGxiY
         ah3vTPNXT5Mvy+X0zvm21MkWz5FsOnnZG20m3D4kROn6Pp/XVzTV+Ejn5GE0SDtQNHlg
         TwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336560; x=1778941360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4zpzlxVkYdL6pM1JU7oOah1Khvqrfh/u/pFhf5YJ9o=;
        b=Urw9ludJzAHh3DwB+OZKQ6VaaS5phMnOnogx3FFwHgtllO2SP/jIjj9+TYxo6QKVFa
         mebBWKh5UNwUQ2UQgCRJDvSGFsuwyLykyIuIDWrl8+kGcV/9jDgsTU0L7Xx0qfHkuie4
         DcaYmI5jA8v2eUml/q4irB4smniAeeodEFaJcfwtT9XsGuIItwgZVoqAr1I9a710Xdlx
         95E4YBrK3Iz9tVVGBzpJEzYlfcB6bs+rqB4/LSxIfztM0+NMUjryR7vvBP0bsUUFHBnW
         mOEHnMM3rjOXDxC5KLUHnTFti4WCXsv9Ph2G/HvVf8gZR+oag6mMJTfJo7I7VbtP3rve
         6Lfg==
X-Forwarded-Encrypted: i=1; AFNElJ+iU6t2Gz34i9zkyBCN+JfaC+ilikXMcxEnfL4Y4dMB3WmaHLyTwKRgJInltW3yzHcNtyMovoaecWv8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+eIXAWk+njovragAEIFckbDwHS3x7bG34CNGWSqJ2bNvwIVpD
	r2F6pfjSpOQ60pPoHTeRIym2Hrq+X2bJf6MKLI4IE//XqT0tF7mP6oyC0yKWdjEoRpU=
X-Gm-Gg: Acq92OENA49/IxHQElGPuAWOo9j+v54+k+nfJGvrI1gUBxnT5H/FJJmWVArsmI4XzEX
	nfkHJ/UzFTYtqksuHnjhwUrJE/E1aVbZNTB8wG/1bOU0LzE4cezCDoacBIO/GROyMPLBo77aDMm
	Ha6+ISwQo461+HgkH5ZokPtq6mmnsxeBuuYUEwe4GvrG45JLhUkm1MY+JZphOrjr5b8ChsVA+2x
	oSbBwCy2JVs31ZGqlDpWlGKFGwPv0LUOtiwmQtrKpIE04/SzvnXfjZZWaARxYoCOxitQhArAbRE
	I4c2Tz7fG8vOaKFuvkycf9BnK6bKAxJa9iN7dVTBGcANxDyC4aEoE38ffdhv9kHphB7xvUdfNfg
	zvFnba6FK5tSyGB4O8myCIRfr8vjWUBsrgvsOjvWuWYm23bBts+fVdrsCZIo20LGj2C4zh0eR0q
	l72ij7roVW9nxkhdoDqKBQkVHKHsjt74vy0Oe8i8gxkhbbv+7RfoaSgy4IXw==
X-Received: by 2002:a05:6000:2386:b0:43d:1cec:4767 with SMTP id ffacd0b85a97d-4515d9a02c4mr28221085f8f.36.1778336560387;
        Sat, 09 May 2026 07:22:40 -0700 (PDT)
Received: from DB-07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm15127763f8f.37.2026.05.09.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:22:40 -0700 (PDT)
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
Subject: [PATCH v3 4/5] iio: dac: ad5504: introduce local dev pointer
Date: Sat,  9 May 2026 15:20:42 +0100
Message-ID: <20260509142047.30302-5-0rayn.dev@gmail.com>
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

Replace &spi->dev with a local dev pointer to shorten lines, fix
alignment, and improve overall readability in the probe function.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 57e6eeed26ef..9e95da6e49d6 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -273,25 +273,26 @@ static const struct iio_chan_spec ad5504_channels[] = {
 
 static int ad5504_probe(struct spi_device *spi)
 {
-	const struct ad5504_platform_data *pdata = dev_get_platdata(&spi->dev);
+	struct device *dev = &spi->dev;
+	const struct ad5504_platform_data *pdata = dev_get_platdata(dev);
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	st = iio_priv(indio_dev);
 
-	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vcc");
+	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
 	if (ret < 0 && ret != -ENODEV)
 		return ret;
 	if (ret == -ENODEV) {
 		if (pdata->vref_mv)
 			st->vref_mv = pdata->vref_mv;
 		else
-			dev_warn(&spi->dev, "reference voltage unspecified\n");
+			dev_warn(dev, "reference voltage unspecified\n");
 	} else {
 		st->vref_mv = ret / 1000;
 	}
@@ -307,17 +308,17 @@ static int ad5504_probe(struct spi_device *spi)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	if (spi->irq) {
-		ret = devm_request_threaded_irq(&spi->dev, spi->irq,
-					   NULL,
-					   &ad5504_event_handler,
-					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					   spi_get_device_id(st->spi)->name,
-					   indio_dev);
+		ret = devm_request_threaded_irq(dev, spi->irq,
+						NULL,
+						&ad5504_event_handler,
+						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						spi_get_device_id(st->spi)->name,
+						indio_dev);
 		if (ret)
 			return ret;
 	}
 
-	return devm_iio_device_register(&spi->dev, indio_dev);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static const struct spi_device_id ad5504_id[] = {
-- 
2.47.3

