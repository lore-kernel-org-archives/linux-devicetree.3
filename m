Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140DD390C9F
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289636; cv=none; b=Ddb+HS3xNO3SDV3ovvU0ecpPjEIqg+CPZAf2VoZK2XKDSY/spKjS8zaab+OBGeM/ioc8WnOR3F8QLrYTyonpjxS6qHqwXEyBR3npXos2ogy2mWnzWUSLx50HBJmzkosrrSX62V5+FFU6DOI2zYz34+bghjpBunAGnVwAfvPAsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289636; c=relaxed/simple;
	bh=3+cgl2lApzXM57QbowOk6GGJ+xHrzWmluYrLDPam/Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCR7Fgre6vphKU9QNmiOvrJrk72emjfh21nUVdfUnZr6ocFMU3LWia2hh4l0o7N0ir1tI4BDeAEYSl1amMJDPg+JUJOUFDPcRFJTLMAsZOJj5vwV6SWuBRGZW3g+p3TDaVI6P7LvHniussO1L0ocBRnrTsJB534R7ZiPJWkpfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq5QxBpa; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq5QxBpa"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-482e61db882so645028f8f.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289633; x=1789894433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOdml8t4+a2r4TluaWsnQnPMm+X8XLNBiqhXtFxxsck=;
        b=fq5QxBpahrv+jiIYVzyNveZEQBLfAo2e/h8lMGtG8BFn3flSQbTQ4FPTt+qQW3Qep3
         kTxBsXb/WD8kKvA3Axlpmsrh7ueLU/1JuHh70tvKwafSDJzkdchgXiharHlZ8gopxbPb
         ZdiBTCYCEhm52ZX5/45guzUIB4O4VyvPCvMJg8PgvpKjyGXXa2pEnFRW2u87ELPo65F+
         oyJwUEkDO00hHeMrvvE8dsfoBWGc2gay5PuS/3eqyoRKwckwFs1+qnVb/W2RBJu0RfoP
         Mw8//lqS6YfI8EQWByc62MaBmKJQPt9WYlK9heZncGg+6LktLM+MuaaDWiaHOzz2dV1r
         B02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289633; x=1789894433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOdml8t4+a2r4TluaWsnQnPMm+X8XLNBiqhXtFxxsck=;
        b=J21HmGbd/KtgKDXQpz0NdJtOtDnTUuoXR1HdGTIIgUdrX0jldZZupK0uZGJhdoWD4q
         td5goyWHQ+YgFdTsWIA9+bnzEMpIKi5GZ40tP9oGV+t0hPCMi7YMKTrxhZHMlIhNLZBV
         Z9h/2UnYHtNMtByz/JnZExIwZORJCNPQ1aMAqQ7h/A9BVIP2SLljfc2RCGvubXg68xVS
         Q+XFIiCtPSAdmYg3Y2x7m/br5anSGSBdQtXGYjgYDaMOfFDm7BNE5yOG/PMQKwQyqrMA
         0RAcjBek/jCMD2pzUcOrMyYO57OnDb/4ycwtkuf/rV9IwVa+e3S7RHGXmP5fit7yjbZB
         lm/A==
X-Forwarded-Encrypted: i=1; AKwUvBzCaN1RJezTBd8w3NB07ZuWRsi2s0Qqt2EyAjTZAQ8Y6RQk4MOqIRgHERNEVfl9WEh7D+dYtKqK2bRj@vger.kernel.org
X-Gm-Message-State: AFuF++kpg247zwBSZXUXPOS7W0XhbRPD0ZLZg8ITvrXw92h4Q8nf8OKm
	sw4L2k6P2PBJ+i74/6J6dEfgdPnB8wSqMo0z3bz9NtrQ0DbZHDcFG9UH
X-Gm-Gg: AYBFou0CbVuN4jhYmR/4Nv1zW+E3OVuel6tB79Z5IB4IJHbNJG97J8R9v0xKAVXgm4r
	yF2Kmpv4LByUSCLX5426I1aBfnOEPXsapPLOf3Ql/1MVflm3l9vdiUj3veFLPIIDbHfE/94of1c
	CJWCAtTCMO9QwYiLc3vnfUpSm8b+k2+e4w6ynSDFcxkhW/kS4KFa/VzvXyqEa52pMEM4I2XVsYG
	cdN/iF7BIJ4Tyvy4n7WFqAl9fPH24enfe931O+tUCaim57CaR2cR1lWivsFyBmkWFJGUrBQobET
	YxuyAvdltY/z7B0p+OEDSHsl/bK2iWPercIR9eNTJwIPg6P4zrAKx5yximWZFtghurC2yPeSe3J
	4RHX/Tb4yCFjjs2QyKpE+Smtlm8YTrGhmegFr6OS29lhyu3kQypNJPjXJ+hrFXK4AZe3NAiQUaW
	Sl2LMazHTOcbCkYRoJFyP9a9RaVEUR6Cd4sV9ypqmbNoRjzalDkYFT1iVTNA0uF5JIrS51h2GSk
	CjMHfYDnTc+SqQmZnM=
X-Received: by 2002:a05:6000:2084:b0:486:f455:403 with SMTP id ffacd0b85a97d-486f455045emr9034370f8f.57.1789289633058;
        Sun, 13 Sep 2026 01:53:53 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:52 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 1/6] iio: accel: adis16201: add SPI device ID table
Date: Sun, 13 Sep 2026 13:53:02 +0500
Message-ID: <20260913085307.13846-2-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spi_device_id table for ADIS16201. Replace MODULE_ALIAS()
with MODULE_DEVICE_TABLE() which automatically generates the same
module alias.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index ba0f97944..1e76a3560 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,16 +288,23 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct spi_device_id adis16201_ids[] = {
+	{ .name = "adis16201", 0 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(spi, adis16201_ids);
+
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
 	},
 	.probe = adis16201_probe,
+	.id_table = adis16201_ids,
 };
 module_spi_driver(adis16201_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("spi:adis16201");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0

