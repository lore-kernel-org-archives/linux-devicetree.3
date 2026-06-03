Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C0357702
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495860; cv=none; b=up87N2wszlSaVhYLdclYmSZr16yyIBRrpn7gD69v6Er3hA3grPkjjL6xqev9GQlIowUNyNuBuzYVZZH2JqPajMJ/Ky3gyI5n8Z/AKYptpqbhCugTD+C+Zjq7QV/pJUdzho08Q7QOEVm5944RzncuCP9ZZbjMPeE2FROujJNi18U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495860; c=relaxed/simple;
	bh=hMYVuRl+jG8ob7vB2VBY2LvNiUw2g2lKzo3MZCubhBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AfK+z8k8LiUnDNxZ4RMUvEJPRaCqcYUnTLTR9PHUQ16gqJ2NyxbIDslQUovAhp2bDKHSwyty8TvNOvnySuUXMI37ESVbs+71osbp419KdZROUk/3iWuMiy7PiD1B73x2/ixLiFXukX/0owjKKs7YU0gAP0B5XCHogDuPaCbZev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyYk/DRD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyYk/DRD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef29c5561so3164572f8f.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495855; x=1781100655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxN5ZUEEgebfYMNnIrmq2wOyA0Ft5IwUa9ix8QldOKw=;
        b=NyYk/DRDXD0gmB1JSp8G7Kd8kk1vX9/Vlj5e0OaCzbxFTQSGA6FQEMH8HUFujyMhuO
         aFq9N61PgG0d/LBaIb5LOSDJ1wI9RvES44E80qUZ8L3Z97F4/xzDDX33tnUzG5YABBX+
         UVClu7tSYTdBd4DWcxDLH5IYB3IEuHN/wkxW6LxSzPKHvmuRisjQYIr1w7SUYtrax458
         xz4AETCsA+vYuu+ijQCPtxECpY3j5lacFZGJPBEYhlf9KHkg8zUgpA3wQdN17UPfQQSP
         p6i/aJ5OhH63iMS2hZAKKY95z3+WB4la8wNsl7jG4JNhwlHo42q4StmkdhdUIXJNz4TD
         GYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495855; x=1781100655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pxN5ZUEEgebfYMNnIrmq2wOyA0Ft5IwUa9ix8QldOKw=;
        b=myT3ey1PcjcvP393KfH0Tvz2Expqy8Ly7itTZjNYJqYMaCxVOr2cLEK/uuUdkMiY70
         Q3Q1U1SrirnLQQd9GbUszs8c5Jnq6A4ZWZZhHTzc8tyOuG3gQmQlQNJszRrZQt8jlcap
         5bgx0cKpY6mwpVrJwp6AOaGyfWXyyZQoZNH75/2rGqptlJsXV6h5Zhw7/wNnTtKafziY
         A1Fat+nE+OSHuTa+bnES0rPXGHTMch1D+u8w2Es9ifY+lmnsEm4HuXBqzaCdGV1QG8a7
         CtZ8GSfkALaz3J5Qb5VVmJF7h6sJTf3iarkiYVeBzp0OZ32wz/1MUr8po8TEvRVRQKxq
         rRig==
X-Forwarded-Encrypted: i=1; AFNElJ+Xz0JDV1uAL47ETwogFSsFP6UM5Sw9AYo2Jmg+mwmPWkf++4ZUuL4G/FcQpqjBt6ZkNbD6meFmzSTm@vger.kernel.org
X-Gm-Message-State: AOJu0YxCd3L8WKkU8qx7JVIczZxeh2TyW7RFeWq59LWVIdAV81nJbVdP
	I/xz64F1gSKg+EhsvbygXmW5mghbBdemc1k9fW8TVx3/ppdJTGIpZiSXzXCHpA==
X-Gm-Gg: Acq92OGPGqLiKk9G9GGBr6lKPX/SUuo4uLaDIUgzRvre3Gs1K/PApgDHT1OmmVDU0TM
	L45Gd3Wx5Hhcqq5ORNyGmy/2cmR7FhTTSsqidS0pOSm8oNNOmyBJjohEAo/YkiNtpVNDVPV47JE
	lUUeK78MpaghyMkhEP93Sphfp4EFBFz7Esrwox4XRkQDCR2rUHhsHRXZmwk624gfQL3q6xGRw0h
	nB4KEs1ozSICWOZC2Y6VVWKVLyOBVZgJlDJTXNCkVhuFW4BPkF06DK930nAS6AMhqjnp3oWYdyx
	ahpvQBFVCLICY2i6haisEFikrXLHbxd+QFm0pWFkXtr+NmpVkIZMDfaXNHGKuhddFolvnlISsyu
	LRC0h+rtVq0wUQzo7U4W03UjY/+8HNRAQTK7YYNPBoU7Uy/ycwQBl4UaJ0J6e9596LZiX/te0Ar
	SeHsEvaGAQ6a6/lstpyo6xmW8I6xxapYdOag==
X-Received: by 2002:a05:600c:a142:b0:490:8fd1:72a with SMTP id 5b1f17b1804b1-490b5e8391cmr44116945e9.3.1780495854978;
        Wed, 03 Jun 2026 07:10:54 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:54 -0700 (PDT)
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
Subject: [PATCH v1 2/3] hwmon: (emc1403) Convert to use OF bindings
Date: Wed,  3 Jun 2026 17:10:32 +0300
Message-ID: <20260603141033.111300-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603141033.111300-1-clamor95@gmail.com>
References: <20260603141033.111300-1-clamor95@gmail.com>
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
---
 drivers/hwmon/emc1403.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 964a8cb278f1..ac84200be71a 100644
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
@@ -659,14 +660,16 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
-	const struct i2c_device_id *id = i2c_match_id(emc1403_idtable, client);
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->chip = id->driver_data;
+	data->chip = (enum emc1403_chip)i2c_get_match_data(client);
+	if (!data->chip)
+		return dev_err_probe(&client->dev, -ENODEV, "Unknown device!\n");
+
 	data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
@@ -682,10 +685,21 @@ static const unsigned short emc1403_address_list[] = {
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

