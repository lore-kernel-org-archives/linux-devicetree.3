Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01147358369
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865152; cv=none; b=LoriMA62WK5qRclLBs9YXEH8DY0459SPM/9DG7qvxol8pwbw3g0o2Hh27iZn7bJkoRG7HGX8Eft/GhUCAX8yE49dnS0JyslgXE58JVxnm2SmycP12TCIzNN+Vudxi+yWaQ5OJWj4pplS7KasT/a6Oo51VDgj48dOS74slXwlOYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865152; c=relaxed/simple;
	bh=pcxqUZlO8MGRv0FW3547QBQLTAB5icx7KAfxmt0SUl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHA4tZfzC3/CQxUiccGhOyu7Ex5vUveFGSouIBP1LWQ8C0IGR0YYr2pkrJDsF1RB+SmCHwMNq6xnzQHxdrzYOL3IBeq742hY+EqpXUpoV56be/sMKRR7e+Vu3u2Nr5RHr3QaS+5nVsfqjDB/abglkcrDagjWBpYNyzYQtAA17C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF/oGjvw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF/oGjvw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bed2195323cso282183966b.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865147; x=1782469947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyMuryT9zl7hjdm/ImZMOfZ3EaE5vQGx8t9LjYjY8FQ=;
        b=EF/oGjvwn4vyFlEwpJkTvPC8gYH9wi/wC2IMlzyQQQN7nnRtRXtVq/qfpUZlLMb2WO
         CIIuJ6SWzVvrfuRA+GZOH6LHYOWZBK3zoVu8YtgIYxfRNPoC9MMXuC9ll7NTaaQKaZGn
         WsBupX3NIYWUyGDIuTO33UVZv4hEw/mW9JFo4PwoTBw488DmqAw9VVpl8aj+nCU48Fnc
         xcG3XD2BWfJi0CcVfMJpyUU8Y3mZsThoSkVRKs/7Xg9G2LgIwxKuTUtSqQm0zEqmU7wi
         5SQ0dS/GlbHcukJDYrpUfPT4AXVEShaF9LQ9N+ri+awy5KWRYCNc7e1U2URG5Oiyvc6W
         UsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865147; x=1782469947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyMuryT9zl7hjdm/ImZMOfZ3EaE5vQGx8t9LjYjY8FQ=;
        b=lR88HoGYD5DpFuD9WcEIF47PUWSQWiee5KfviW17nQ8sXJ+FVHwPHMKNhLa7VChwSD
         v06itAc0JzVG1jm3q3GZmyogOhwadwCsVbIVojUIb4YJl6zGtZJlCgiiI4ig1CzRihTu
         F1XYErc0+jRj2tRInK5Vap+b/utDTYZ9aW/yVHiyVPZcOdWrzbL1DB/BWoS7nLCnO6Ww
         +KOeu4YD/mGLHumd/J6AkNJgiLgVKjICJRxWCEOBl5DzCINaatwfe3BgbazZCAEgu5tB
         Qf5ZSQDLpap6l94WfzqZX8AcgsOiV6wvSoARO9mY+DlUSqCIyoTqyOgi0oCer2U0Grht
         Np5w==
X-Forwarded-Encrypted: i=1; AFNElJ+ti1P3pjxWarVELXFCJM5AGtH+LtKqWv/eNBLxtAp72WQUKv2svZF34yVv9OVWiRy4RuhB2cbYoU4X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9FrzKf9EsjkKI1TeBIJAsqBcbo3izmyPh0iUHFBbhArb3btH6
	0iEtWvsRfWfSs1814yAWB6Rv+ZdxeKvZb1GNqmH9yjCmm1X9TWjLk6N7
X-Gm-Gg: AfdE7cl7tlvqfPDiWA5wjQEnmKaTo95eA6E9mg9XDWScNI5ATB/v6iuvCZPdiMzWaAI
	89cAInVcwyBLbWc7wAd0Mq6Y+f243IIZhlcR95bGbQWm5QwJKbTqWfwsVUAvFr1y7NPLYSyHQyP
	lOBjxv67zAGMqxb/4ipwbxEsj3UacSP6jO0SdtDqNqiIlvosoJNV6R++096ylyrWqHhf2+Yo+1M
	cu0TJwLiQZg6WGjTVqhfnOTfHha0KmDSrC6QWLH9/wRS7hCSJP9JqkxXhAqG6Is+nCNEblS5dI4
	1JzsH2L6+CSZ7tAu7bdEbYGaI4NZX0GM2qsPrdQGSOBv1Hwg0vS2J/gd/PHkib1VlbIi6lfxWi/
	C8CWeKPDTQxp1Xb6FKTvfQp3rHxl3VrXJmFCQVv3ATAR7rAq9G92/lZDUBRzuX0viAjzbBHgySj
	ffZhndB5JfgWkaz2IvtV/JfwNFTmoYxBHR5A==
X-Received: by 2002:a17:907:3ea6:b0:bfe:ed06:565e with SMTP id a640c23a62f3a-c0b75a8f179mr98003366b.51.1781865146848;
        Fri, 19 Jun 2026 03:32:26 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:26 -0700 (PDT)
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
Subject: [PATCH v2 2/3] hwmon: (emc1403) Convert to use OF bindings
Date: Fri, 19 Jun 2026 13:31:52 +0300
Message-ID: <20260619103153.216444-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619103153.216444-1-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
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
 drivers/hwmon/emc1403.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index 964a8cb278f1..ef1ccb40ed6c 100644
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

