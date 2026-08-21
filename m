Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E343C7C2
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307932; cv=none; b=KbLjZ8v48MmEVfBilJVRBx665PpsGiN38obZGPRYXG+vTHE5J4cbLX1M24o3x336lOX8Zq6oJ+v4DYAngrdmzBztuZzV3y3PEoa5zRBMwkPwEkOO1NHK3mmGQtUL4yqvy2ZiAL/iZTX0M7OMUexuppFRvIzBjn7JnnfcBJ2XVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307932; c=relaxed/simple;
	bh=gPhH4u7kFmeg8EHT11wFoZiSLcRlZ7le7pXzWEpGGPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUulLds245qr0/OVGCzI2FXsrdChp4fpUP4EuTGNq/DDaVB8royFpFK5Ks6dZo85rJB8tyzlyri8w9/G2yyMD1HvCMw0DqlBdkEk6+WJCDMOk0Pqhhb1CI5ls+wsxM/3MZ68EMHADf8rtVIf/l9y12SIxt7q0c805y38/G6t8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y15U8pZ0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y15U8pZ0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so5383945e9.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307918; x=1787912718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyIuAekOpVPDTOROhunhzyK0Yq3w+Qc14AFzLwRnzrE=;
        b=Y15U8pZ0GuPE7RdZiKMbS9/7LyVYhr+S3npWht5VFFl6bD+u1Ef3YGqZMp33R76Kfp
         6briDVENEIpPeJnHVCIjyCJpD5xF24aoytgFRDu3EETAWKUT44udJQ2S/JePyGCp2gZj
         VUFdTLWXl+KB3mPOMqQzqJuLhQSeuP5/So10tId1YXQO9ZJ0yz4aeQA3+xeWaiVm3yT3
         RWNCrwNL6YuLILRer5k8b6HcpnVajVmW6euhUA/8GH3CxJ3BCKThqBwogJqWD+OWNtsm
         zg2xM1hvmi1cwiXEn+e+o3IJQGe1WlTgEhlOdKhcuNpc1/CDqTSUyHXtuLYUwfLWYdXu
         Ogww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307918; x=1787912718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wyIuAekOpVPDTOROhunhzyK0Yq3w+Qc14AFzLwRnzrE=;
        b=IX/BeL+Z72yaduXocibHJ2kdotuOFR0tVoXG8Ffxvh5q7/1c88ZLYfpCLCHtgP8BWU
         RHd9dPRHxawTgueU3/rSieXyuZDb5ID2QE8l77Jy02Yub+Wiknfp08oXPPhS2UL14+AI
         FJc/NJaWfUtrOPSf6wM8bqBayXQE1zSQKpyNmMUt/rWK3m1uA8DhmvvMfZH7S+UaJhrD
         dW8vNPV+612EDPfRehx8MwbBuWpqD+Yj+IEbUa+PtZ9OHpsIjE2mHtvi57NUBnNawpUD
         Mcu4IwiyLja8TE2/nM2dVXZJ2IacQUvyYcV7R5SwUHGhhw0TwFvrpxgc46XHsPA/9RFT
         5WAA==
X-Forwarded-Encrypted: i=1; AHgh+RruDdADaMKuF2QrhtOMHCOmPycgRpEbPTO+5MGRj8qpJoKDAQNT0cqlTfCqdKTpi0xlxch999AdAlp/@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYw+eNEJ0L+GK27+M1yUfOEjjSPKe4ih9OpJ6p092SCmlPFUl
	XlU/b3tbNeKW5jXcogKvbGpFCPA4R1PMnw+uPI/WIEDw+tUMa1eMIm4K
X-Gm-Gg: AR+sD12bUv+KwQsSJ2f6l6BhcJsbGHTpuBRb8iKisRIrLNlTvHHu/hJLYH/6un7628H
	NaWERmlaVy/QC7qDyN8pVx975y3aQiPvRmK8fh7es59Nm1OXFwKMVzYGKtTtdTD6BlSHQ/wq7TL
	Kje0kU8BoZ+kQr4mklPVuwnTr2LX877UZJFb/BW7dfOZt6Mt2CgZSyfhN2nZmCGf+jPggk8b6t2
	avMgyZ8uQh+7FSHdeW6pXVwnV+wR/RlzndAmfGF/gQgBD5juaatoTJeWgekLjuXXENOCn+jvSOR
	BBNbWqQYMVqCodivs0QvthbB0UysIA7Ekx4SGrJZJRJvmrbTEfw+kpu0VTkFgIXXS3bGPr4PD6r
	SPpygpyw0mW8NN3XZMZ0rTK6LgHjgtvIIAKW6DjLLz+z1v7b+iW3veWFShyzZftGbhaLtcI9fqH
	cfllMUN/iWIc60LXMhn062fK5aQ74a7ApsaQsqg5UiTjmveWC7IVY96olqZHSh/THOncmo6ayc5
	DtB0bUEiB4TBw==
X-Received: by 2002:a05:600c:c494:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499b82f4d3bmr68893055e9.3.1787307918131;
        Fri, 21 Aug 2026 03:25:18 -0700 (PDT)
Received: from fedora ([105.74.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba5139sm11663155e9.2.2026.08.21.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:17 -0700 (PDT)
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
Subject: [PATCH v5 6/6] iio: dac: ad5504: support scale via output-range-microvolt property
Date: Fri, 21 Aug 2026 06:24:48 -0400
Message-ID: <20260821102452.37407-7-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821102452.37407-1-0rayn.dev@gmail.com>
References: <20260821102452.37407-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5504 output range is set by the R_SEL pin, not the VCC supply.
Add support for 'output-range-microvolt' to set vref_mv directly from
firmware. Use device_property_present() to distinguish absent from
malformed property rather than relying on the ambiguous -EINVAL from
device_property_read_u32_array(). Fall back to the vcc regulator
voltage for old DTs that predate this property.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 489d2e03e9f6..19ece5a2af58 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -300,6 +300,7 @@ static int ad5504_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
+	u32 range[2];
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
@@ -315,12 +316,30 @@ static int ad5504_probe(struct spi_device *spi)
 	if (is_acpi_device_node(dev_fwnode(dev))) {
 		st->vref_mv = AD5504_VREF_ACPI_DEFAULT_mV;
 	} else {
-		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-		if (ret < 0)
-			return dev_err_probe(dev, ret,
-					     "Failed to get vcc regulator\n");
-
-		st->vref_mv = ret / 1000;
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
+			st->vref_mv = range[1] / (MICRO / MILLI);
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
+			st->vref_mv = ret / (MICRO / MILLI);
+		}
 	}
 
 	st->spi = spi;
-- 
2.55.0

