Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510B35AC03
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495860; cv=none; b=kbP8LHX0GrwvmvpO2thNgVOxvd7N4Yvi8/X5bUuEKXFVUOYQ9ESHCA3xzj+xT++TzplNcgeDIPu0aUxVVNwTXzDdDS9U/3JKEpTvDU++Yw0PB50iqnF8Ml3+I/8npwYdEtPN7e9rJANkbdaPHAirmHkNA8xV4S6L1qhBxXwOGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495860; c=relaxed/simple;
	bh=PXGq2oJHYuR07tw/Kib0nF1l7MnIdzNMgPKwVCmcgYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX+RTOAWOtin8bpyVGuI/DKxWChX/5aK2p5+wmRB2zNVU9otV4tA+sfrxN4kTmx288PbJN9g98ThYbNKdneePPGHp6h509TcTXilcSC1L1uXSwDMDMtnv5sgM6hkHz/LbcYttY378TrXKw7VNc6e97AMYGrjUDbp9gQf0gB0J60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm6J9c/o; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm6J9c/o"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef1198766so483422f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495856; x=1781100656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuOo/Hx++0VnvuJWbrTH7yLIcehi5V7tCIyNywrXIck=;
        b=Xm6J9c/oq79QOkr/PNtuYb7s1JGKCN6BoGsPgZp0s7Obb35s/CABVTgfPv1h0FNQiv
         jV2/vs5c1G0sM7po7jWOh5wmtW6/7UbzJJjIARCR3sgYbMTRUMMM5JlzzAp4CWCNADJi
         KZ1knv6x1N+M2vy0l+QH9JyYhtzFiOrgUeegBQAbumqz37wmH0fGjysH8xhJ0uUuG8v0
         APrQLSsugtZ9K1+MuQBs7xY0oDPQA3gIC+kDbauYw5s4r4WBA1cbz98WdJQLypssUYFm
         4sR3oJwjKvLwuks8hgbwKrfYCEYIu+K75tvbneer+hQtTQyBSt9DiVqDKdvU3LMcktkK
         U/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495856; x=1781100656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuOo/Hx++0VnvuJWbrTH7yLIcehi5V7tCIyNywrXIck=;
        b=d8LSHegCxJebEMbk0+TQ1ujuR0Uh/ZReVSBWM1lNCm9MR2NfjrNXtyYHRWIa3mRxAh
         VBUJ9k7nIgc1HXOOI7E88/RnKW82CPthUqbhGVCatLK2nhiny/Zs3R2gR+kyJmaeea9y
         o6YJOxPFV/wndPhZ2k/f1+m77AXRv2C63luaLPFnaAMuYCVpSmrZcMYK+Xq3YPG2vcOT
         s+jI45luApjqX6xNJhitBlVwA11I2uuwRUVC1FXzEulvB2DJT6DGAevpxm4zLhIDYrFc
         Ux9UTinoHmRWlWNP1kQ/tiX2oDD8xHNrfWXDWsae/FnIWs/BEK7qe5E1YVYrHTY8h0Vs
         93MA==
X-Forwarded-Encrypted: i=1; AFNElJ+QlX8zc6zQxQqRNeFTTfyfVaVK7IVucY8FaLZqpr/A7NER2BoYngT1dpVWXwMVl2p3rG15gAbjdbc4@vger.kernel.org
X-Gm-Message-State: AOJu0YzZN/lhDgxJTN6zUlPDLRHRo1hTS1lIFRr18KKtQdMTP+5k1SHR
	Sn4zxC8qokJ/65jm6qg0Aly5JIqfFteVN7nzfxwGCyw5Nt54pll1/MtG87RjMw==
X-Gm-Gg: Acq92OE7D8ugl52qNgDlLyVlV6osvvVyUZfLYvvfosJNogLQyZXNb9K5BnZPLvWXUe2
	Mt4HIpQFK4ji/jKCaBWy0lGUKtXmw+eWAiJwvXIU20Jf/myjAYvb4cDxx6A5WS48AfUfLyCwoVl
	5wVBgNPZHSMx0MFGAgSNsDKVFKZcDxhINK+mBleBA/BWfUoey0xOoo/nnpkNnbF7arYXCUbk1u2
	NZIeO3FPzXZ9dL/yJsmZu2bXPTG7tq8ncAPNhspdNyB0gV6DZGqwwevTcqVaRemPGU+ohwokxhi
	tQ0/3ANfdh7nGpFMqJtcICUbFmEEdlE7FLyjWOxlpyQ4oMXFqDSX99Gq5M+Sprm8WMuhgJvx89w
	tVG8E6zRoGcknMYdFTpQDKTPA2NbU57SsI6+WR6zKZkyS4BSQeKvWlweTAqXlbusSdknJXJw4NO
	e656sxmbjP1ThRz8nli/EeR/k=
X-Received: by 2002:adf:e0c4:0:b0:446:708e:1e8d with SMTP id ffacd0b85a97d-4602134325fmr3929718f8f.30.1780495856085;
        Wed, 03 Jun 2026 07:10:56 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:55 -0700 (PDT)
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
Subject: [PATCH v1 3/3] hwmon: (emc1403) Add regulator support
Date: Wed,  3 Jun 2026 17:10:33 +0300
Message-ID: <20260603141033.111300-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603141033.111300-1-clamor95@gmail.com>
References: <20260603141033.111300-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VCC power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index ac84200be71a..dfdd3982efb7 100644
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
+	ret = devm_regulator_get_enable(&client->dev, "vcc");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulator\n");
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
-- 
2.53.0

