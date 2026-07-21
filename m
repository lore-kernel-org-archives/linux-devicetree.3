Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E33B47CD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627995; cv=none; b=K/vsT1BBtuN7PBEH8+78AUTLZ/SqLiGni+gPFmKxWgHgJlIsORbQcFJujmmGO+p/MbdBAlI3oOZuJWiydPTzPLOM6wlsTpfWH1g16UdY2t1fbYp2L1H6NY7b2SyEh/ap9DtUlgRfga+aHQ0uqreOl+pdUj8n9ZKcqwTspvVSh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627995; c=relaxed/simple;
	bh=uMbFgZLCRFrESlapa+JInn2glqohSQZ25RTJ1QwtfR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdedEvHe0j15M2vIpS8VcxTa9/1LHS6I487AwvwY6zuu9EfaGlFJwSrJP1FaCyyneryzZjK58HoedwmxPsEnkHQXiU4cj4D1UPtpiDtq7LM4SHUl0xTjomHTdsPfAYDSn36iYisBqZTzgHsEyPv60rnYG49fmMY9KI6cshTOYNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN5WZiLe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN5WZiLe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955484387cso16483945e9.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627991; x=1785232791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaCVTtIsxHrLK92jf9IpnJwSHawfy+ZzA+YycHEjzEQ=;
        b=MN5WZiLe9nwOuoa2BgL+HXM8/Vl8zON3ascy2+c+F1yOrUqWXoGtJe5O12bVGSEu7Q
         MowvGB9jtaWNcg4UKqkNJX+Sc9cK1asx/TWHGJSt1aXyE2ObjqudxVALjXy42ndxzybM
         EMZ8G7C4pBkZb6PpFPkyR4PecnW+dLHOG/AgiyNxG8NEVwkm1AePhzfnFnLsI/FIwzRO
         YRNQZsevufREfs98Dsb+qws/piBKw+LquFE0UkZCN31xSOlzFq+5PRLdxAMIIUe6ny7g
         eOlUSLhmWnOJgJjPGqrZH/9vCU63Zxll+0rJkVYmfgtY7UFGw/V2umbx3xVtj0c04y4B
         cJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627991; x=1785232791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaCVTtIsxHrLK92jf9IpnJwSHawfy+ZzA+YycHEjzEQ=;
        b=SpcgajfQs6wtfhxVtXtLVXT80q7xFbGLXQSgcUeXYxVe2NiDazjDf8BxEateLRP0PZ
         u8zQWD7aJ1/7Xo8B8VnomQ3yH5dN4n1l4/O7FC9moL2/C/SPIR9olNAqUQpUJJzoAFzK
         sen+nQ7F9r+h89MoTc4Q4hGiHvXGv1MFRILwa9UlG2Z0QPMICfUj5H3UZA3gsv1QzHzF
         UGbjwxAAE3gHzQV4dYczkCptdqYQyHrlBgtQ1MEJJKXifr4IUdAAUNM00+3CtA8AGXTD
         UuM8adUqDbCOUShzXnmIfaXMRQ1DtSXju07qk6nRm2z7PPtWNpXc1zc6qEziXbR6a9bL
         CbRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPB9DMfEl1m0u5lIeOyzffcVRF5jsAAgeNWxEXN3/io1pP1lZQebYbEp8DGaJKFDAKWso6kW3rTo6r@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/VSYYkqksxAC1EN1+if1qO76h4SbR6wpciDfjAvQBFrREAC9
	gEZZtOiwdY3+Pl69NxCd6ehPLFvHvw5FXLqiNrOoLLTq5CCiVLoJs/hm
X-Gm-Gg: AfdE7cnGaU+pDFNQExbwtHvDHn6xqBtL9+UJuD9knc5Lq7NbqtQgJdqyzYt+Qc3phTs
	K1YA/7IhbT98xvqvKSVF8ESWr588mq7Q0EV6slSMHRUdDygkuyV+zacxr9pylSxsv3wWk4oFqX6
	8oITXXmGGbGV4meYYxiOEOSAUFrRwNvTwCOBGzPvGwmVTZ9MnmQXkHTNyH0ZvEywcAedNKY664i
	h748hp0uVmPqCuizWODinwHg3mwqTAThiXD1R1kpL4Gb/SymioBbJjDIuZpUt3W9epA1beKcp2N
	boLZRXS/Nu9EBd+UQ2adam4jLJ7vkwwX20SI6I06RKympPJFmxRzs0gHCakThu8rJLAMmNfCjfX
	0679zar63p3XHnCz5qku6bw3WikWXUP7Sz8wQu1uu+oiDTFDbwQ/elfXvLDJtrTh0ocEcnFnA+E
	9N+RR/Kg5yTdKQ7GvK7xjNcjZirJ28hTWZJQ==
X-Received: by 2002:a05:600c:5882:b0:495:441a:39d2 with SMTP id 5b1f17b1804b1-4954a402f2amr149790865e9.21.1784627990818;
        Tue, 21 Jul 2026 02:59:50 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm35228691f8f.4.2026.07.21.02.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:59:50 -0700 (PDT)
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
Subject: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
Date: Tue, 21 Jul 2026 12:59:34 +0300
Message-ID: <20260721095935.439174-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095935.439174-1-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Schwöbel <jonasschwoebel@yahoo.de>

Add OF match compatible table to be able to use this driver with Device
Trees.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc1403.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index cd753b38709f2..b7ab6069ec7b1 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -16,6 +16,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
@@ -659,14 +660,14 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
-	const struct i2c_device_id *id = i2c_match_id(emc1403_idtable, client);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->chip = id->driver_data;
+	data->chip = (uintptr_t)i2c_get_match_data(client);
+
 	data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
@@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[] = {
 	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
 };
 
+static const struct of_device_id emc1403_of_match[] = {
+	{ .compatible = "smsc,emc1402", .data = (void *)emc1402 },
+	{ .compatible = "smsc,emc1403", .data = (void *)emc1403 },
+	{ .compatible = "smsc,emc1404", .data = (void *)emc1404 },
+	{ .compatible = "smsc,emc1428", .data = (void *)emc1428 },
+	{ }
+
+};
+MODULE_DEVICE_TABLE(of, emc1403_of_match);
+
 static struct i2c_driver sensor_emc1403 = {
 	.class = I2C_CLASS_HWMON,
 	.driver = {
 		.name = "emc1403",
+		.of_match_table = emc1403_of_match,
 	},
 	.detect = emc1403_detect,
 	.probe = emc1403_probe,
-- 
2.53.0

