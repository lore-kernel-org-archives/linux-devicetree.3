Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1D470E82
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001103; cv=none; b=EAgb4y3njvQw1uV2Hz5ZUlQRHb/fQOruubtTNfpF47o6PDBCW1kJnjM9j6pMHH+hurRr4nivZi5vTa+DVL2nnZsAJ129XM0a8g9oNO3QNqYrzBisDwcUh3RtPFovZkV+axjSN2sATviFNSi72vnRfqCK852IqwdkLarOkEeWCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001103; c=relaxed/simple;
	bh=KKCQp/0RMN5WXaLM5bicyktOACB6mRToxqjIMmbfh6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMP4i/RMYP658Qy5A8z/uU5a7Z8Dku8IHGWs9/O30cm9gKN8+GN4p0Zk+23oRf9eXNXJt++2hRCtqx9RXXQj2hOY5zHTQNwSC1guJ9i5TOQFvtaBdOgRGchu6RWQHKzJrs3dpvXN7za0GrjjqJpwJdBXppN+78svgQ68n+yh14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqlD3n6N; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqlD3n6N"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3419125f8f.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787001100; x=1787605900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Igoic2RMUzhWCgHEuYeIt4q8iEPlVBgMNrF843o6/Ho=;
        b=GqlD3n6NktURbIh0eWjeV0EHpFetk0V04QDFVKCT3dGawChO3C4L/Fe5c+O+LKAGba
         wgEDckFFjvdF26tRMmjoedqwkzZGzx9WfSOzGCaKRoB7moXTU1dUD49HSHsqkfyH2AOs
         iqAYFby9bsbWGQbFy9W0UKqBGkgESZBgt/uNC50DnjxfbOcvrSnzUuGrrXLsle5ed2J7
         6W0HiBHJ/vC85hAbHzmIklKj1czv+yjmtm9+UN5Tz29A6KaTfB4Z+7DcfcAWC3OW7gcL
         uzEOgVm20eezVyfS2BCyUwyz/04J+LfcV09qxes9UAI1hWAVt/wyf6hNFcmX6tO8vPBi
         ysjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001100; x=1787605900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Igoic2RMUzhWCgHEuYeIt4q8iEPlVBgMNrF843o6/Ho=;
        b=rhFHMufo7bmvfJgraxlcIBAbjIgkkBzIk9/xuzJM3s4WSVEwIvk5I1kCLDmOKbjJJg
         v+MCIxvwU9DAgXwRv3XcMeT9ciyrBRWk4CvWyquGmTgNt+MJj+2yAtGrn3UnY6PziPGp
         z3yJl6IUQiiOSSmwHQCnMQbhUqxsoM0TMLilJBZNHm0HZZDGceQEnZlwnsQsU3v+qPmn
         PMwmR+7Et5Uly8DZfK8PbWtrlk3DU9Lb3t5VNf+9QOohkdm0rsN76W7RJ0e0M/PReCJx
         0ha5yTJ48sEO7ZkWablsMXNrqaH/sybpWY5m17eTTPV0CQz+fhEkiSw96kaDR32uGwib
         fZ3A==
X-Forwarded-Encrypted: i=1; AHgh+RqlpcVG0dDg1YAYi5j0BH31/sle6QOQ2WikeP83AMJDK6KGFzQ3f2NjBvuLsfCCZpTMUd1Rdf00x66T@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJEQZUrnoVN1Z0g41BStyH79FTxFPLZGV/L76JMcriFbKQQlf
	TUcsA99p4lxCMoEBodZBeuTx+cV4cTmZ9BtMaL7XU+5V5RRM70DICCBv
X-Gm-Gg: AR+sD12IGn4jchGbb22FmOWuE3D7gzRzhtDZ9hw9cebsaK2Y8rsennr+cMA/jXnWL5n
	ZsZ/HraAf9CQU5cHHqUodAtf1wrAXarPrjAJHGzh9KO3TN/Fzy9FS0vSDBte2ZTOvG7zOf7I6lY
	M4wq19Betpahp47R8knyEIISP8V5pWkVfmFIeByc6TE/b6Zp0MIWDTrw/IUP81Urvs45a0FQb9v
	9GIMrZEh7go0pi8blqPaB4Z1g5lTc6MoFMyO/O9zAE95YOS/L8rUKDKikpposl9jbCnUj0Eb2y4
	neOiQBYPmMUl5/Gp/zG1vVV1/M6aWjQDgPk0s6+swbv5Vh1zPdTINmF5G6b8o6IEz54bofXPkT/
	1vxU31bFU98Fs3ewF2/QcOVnc/zYgK62jCj+kajAgjqdPMG79KaqHKIYyMpCGTlLCnj3pzRYIHj
	8hDIFtzvutaH4SDFu4N6i8PTGsAoHG4XX0x8IJxzmpbT/VFMNCpKOW459udySkdGjlnqBqmv9yq
	nNqCnYAvhyp
X-Received: by 2002:a05:600c:19d1:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-499879ae4f4mr412180665e9.15.1787001099817;
        Mon, 17 Aug 2026 14:11:39 -0700 (PDT)
Received: from fedora ([105.74.73.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm134587625e9.10.2026.08.17.14.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:11:39 -0700 (PDT)
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
Subject: [PATCH v4 5/6] iio: dac: ad5504: strictly separate ACPI and DT probe paths
Date: Mon, 17 Aug 2026 17:11:14 -0400
Message-ID: <20260817211118.21833-6-0rayn.dev@gmail.com>
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

Refactor the ad5504_probe() function to explicitly separate the ACPI
and Device Tree execution paths. Previously, the driver relied on a
fragile -ENODEV return value check from the regulator framework to
bypass the voltage check on ACPI platforms.

Following modern IIO subsystem design patterns (such as those found in
adc/ti-ads7950.c), fork the logic using ACPI_COMPANION(). On ACPI
systems, where dedicated voltage regulators are typically omitted from
the firmware description, bypass the regulator subsystem entirely and
initialize the reference voltage to the hardware default 60V scale via
a new macro AD5504_VA_MV_ACPI_DEFAULT.

For Device Tree platforms, treat the VCC regulator as mandatory and
wrap the allocation in dev_err_probe() to cleanly handle potential
deferrals and error propagation.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 87946cdf69e7..546420f9afc0 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -19,6 +19,7 @@
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
@@ -26,6 +27,10 @@
 
 #include <asm/byteorder.h>
 
+/*
+ * In case of ACPI, we use the 60 V as default voltage reference.
+ */
+#define AD5504_VA_MV_ACPI_DEFAULT	(60 * MILLI)
 #define AD5504_RES_MASK			GENMASK(11, 0)
 #define AD5504_CMD_READ			BIT(15)
 #define AD5504_CMD_WRITE		0
@@ -300,11 +305,16 @@ static int ad5504_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
-	if (ret < 0)
-		return ret;
+	if (ACPI_COMPANION(dev)) {
+		st->vref_mv = AD5504_VA_MV_ACPI_DEFAULT;
+	} else {
+		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to get vcc regulator\n");
 
-	st->vref_mv = ret / 1000;
+		st->vref_mv = ret / MILLI;
+	}
 
 	st->spi = spi;
 	indio_dev->name = spi_get_device_id(st->spi)->name;
-- 
2.55.0

