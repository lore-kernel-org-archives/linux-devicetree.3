Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2453749EF
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865153; cv=none; b=PiuGs0zOhTMDSRgulSZ/m2Lp0X8iy3rQ9Sh97vpZP/DykTVXXC5mr8LLLvbgvM/Oxl5msOZdu3rOs/DvzzTOfPU1c3U+HHE4VB74DwgMT77h+E/XAIVfUtiOC3w6s2Dfvn4sjmclAxy9a4l3lA1kO2CCVFz4qrKFCTIYDsTemqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865153; c=relaxed/simple;
	bh=J9wG/Cdl4USpUhFpFKP+Y2sEB08duLUmbk9/DdufrWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fK6Sg6Lba7zAxFupS9IijJPcpxrw3nWiVdzE2YmAqEMLZRK8vAz49LQ4TKyFAWC+fDnvIm4vrP6j1taV+C8+eHLEXLOl2dqSW3wiC/nGLfjb0HMtncdGpQx9OX+SnKajxaeWyr9QeNZTLwibZv5WppmEcLc5s9leA/O8P48nm0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb/DZ/Ge; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb/DZ/Ge"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c08306ae1ccso170258466b.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865148; x=1782469948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRx+fJTG2hf5P891qLhNE1tVHHb4cammpBgE+COZX/Q=;
        b=Hb/DZ/GemoxwhjrP5vxR0ieXRg1tbzDJz1wViX+lXsK9YNqj1beTDyLM9ipcPhW+qG
         0gj7qL0I8hfVqY7zRe1YfT3oipSKsrtPQpTthWQMfewx9anXp2OGmXpNG8ZyD68etUPQ
         10E72Fr7HhoYaWAYWWXSS4N9dK6md0AkRT12Lug3KSpv0WqZQi1MAESYTyYPZz3pRNUN
         J7OJJLgzoegPYMcQ2MfWdQqMCKCQ/HbKZd6Csb2K7dOszvA5hCczmzxjgV/vfEaS3hGP
         ZzL1ULWCLMI0oJ40VslQJLMXXLpS67QnHD5G70nQS5F16RtJ8cfehIkjMQ/BYYON0lhN
         5Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865148; x=1782469948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRx+fJTG2hf5P891qLhNE1tVHHb4cammpBgE+COZX/Q=;
        b=WrhbB3tCwUpiavJc4hOXilVQCch211SEZOTW1yCcrA3eORVOo/XpDyy4ouEC4QQlog
         Fht3XLdfXhUH4hpgjjjaYCSspdenSKWkJWn7eRQYWW+5PIZ0wuLu9cMLNQ5J+t/l78Ne
         VBwWdxEwFBAA1ym+vcsrJs090LkQap5ILZ76byjEB15o4i5YaYvoZhMdxcQ4xbAvh1Gy
         V7Vmpq77jRTlzUJMVP7sWHiq382Okrja+1He7mlTvto1WQohqMuLZCM17UeG56uAzu0K
         0AcvPnPSuuQWBi73i3HTkexZHu8ENiopsfCNe3yKTz1D26Sr4aaDFLMKjCPPHJu8WuYM
         ddzA==
X-Forwarded-Encrypted: i=1; AFNElJ+68PCbO9uQG0N8HXSBlqWc007sQH8qU/blq/S+R9ydMg6SMlt5ILfhvJEBbb/NZ/XpkPWEshIhZk0u@vger.kernel.org
X-Gm-Message-State: AOJu0Yycm7m9t8Pr+Bq8HzNOcmR5NFfgYX+sWoLzzf2AOYXM1qWrle1P
	aADvvHrwbE9di3bSVLHsaFudby1Pnm54KhgWJz035t4kqwTs9jIp7mRy
X-Gm-Gg: AfdE7clTNaImeIi1Kb1XfGbJQj3UQJJv4mjq0ng5jbFEqd34RiQdWhl6vG5TJugw09i
	1k49/8wGzmCKjH+Ulhw1VzNaMVZAgebTiBM2qIo8RgZWGr6IxRvUUIidAziOJiuyXI5GYaEEkRw
	1FRKDb/BTGcqr9A2VDHnu0sHCF3oXiSr6CoicrihnSGB6A6J7sIXnoDAl0t53gRcEsbSZ5dCFXv
	zqopPoOTMM2UT/MTkNJ5F3TFtpSHDEJrdBVS1Y9sI9ufdJQm6ZrEKS5VVB1BMkm3uLnt1uD2cE6
	4gSJ4tjuNzTua69I7Qo19naxZeojdIi3JJEgHOjRWh7h1soY5c1jRxBRq9R1cAZ+EFefbwG8538
	mP0pLDOF1wSYViLp5NKwZbZ4mi05Yepy4Po3Ae+l53pW2IsGX8ZkHKisOJ1CBjKpl20Sb9tjAI0
	VkbkvaeHpbictoDKg+AmfbgyC1Qf904U7vxw==
X-Received: by 2002:a17:907:a0a:b0:bd9:20b:5117 with SMTP id a640c23a62f3a-c097cccb107mr151829666b.41.1781865147946;
        Fri, 19 Jun 2026 03:32:27 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (emc1403) Add regulator support
Date: Fri, 19 Jun 2026 13:31:53 +0300
Message-ID: <20260619103153.216444-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619103153.216444-1-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VDD power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index ef1ccb40ed6c..d14bd90ce424 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -19,6 +19,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/util_macros.h>
 
 #define THERMAL_PID_REG		0xfd
@@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
+	int ret;
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulator\n");
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
-- 
2.53.0

