Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482226;
	b=vzXZQVPzuVklgDHxs3KueIuaN0zWSgbQKUDyIFRB6henz5NIP44sdd2e4sfrE4/Fqy8n
	 iUDe+dzXrDpz+x7CvxwJeqFtMWiGjtwKj91BS6nSSc4K3udmnvBG41uqUEGfqYecDr16Q
	 NAaG3fCOFWe+FEnNVRzez6CzcCuwlV3HoFFlarMytV5Y/MoHi3qtoIXqFHXDXsEHokcA4
	 IjLgmzz/OuncSBI1FeJoUiolGU7w8X8G7vGWiJBEU8dtBlion17ICiki06ZD3FYDU43Zt
	 vvvYjyxmCQrCeTdSfM45xdtFredSlWljc0a2hYuyS6j/fqWQh0qoM8DhJMrJUn1ufCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HQDZoYR9ptVERXu1PnS05h35SZuDJhq07Gs0Wdldq6c=;
	b=LBNopKb3/1xKbAvPpMplApGd/wP9jzQt59B1Uxz0vrG79JhSmC+58WW83ZJ4GBpNzR86
	 y//1ux0wE+6NcVl7Uv3NtTQ/p1M8dIQH03BxbTHQIUwl0ohugYflK0qde59i4BKTrYmkg
	 7BNF5oPzfsYc9yRua8jam+Fp7/OP9Z+y1cH3K3cQRS7NZLzI8G/zDn8Q6B8Xq93hrIVnK
	 ZbjcM6x/RZYAbMx3h/iNDYRj6kmCgFfseQAeictVGk++cdAd75BJM0rR7ik0bf2z0sAY0
	 MCaRSj1tIPlvr8x6Q6g0ewrPpgmpKqvCun41HH7YEABQWyqm/TdQ4FtkAaSRyTvixLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=A9LVEW1a;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF3606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDAF3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=A9LVEW1a
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-188406bb948so336214c88.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482225; x=1793087025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQDZoYR9ptVERXu1PnS05h35SZuDJhq07Gs0Wdldq6c=;
        b=A9LVEW1ahtVd4rK3jojo17a0NmbS8vil5bTZjaRBex8TDP2tkLxOpc4SwR6PcHYfus
         6K9i/2N7Y+1lebMWDZOGdgvSeL0wVwYExFg616y8v6YcY9cF8aIBt2AmqhSgAQMLSBuG
         qbEztE2WpqYmDyhBPqzYHlTa8uuC+cL3nwqpjMtXst9sNTPAa/R++xy+cN5cYBQbN4p1
         b3qW6xj/XiKm1K4sFv7wIAtd76bJV6pG3//Xu5dnC7ziLGMGdR+XLOd+tqM8i1FH4ms/
         OluqgofgWizx5kmVi8wR37IM9qiF2ewcYGzevg2a7PUssU0hzxIc5cCoSM9gRSEeaC7o
         nv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482225; x=1793087025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQDZoYR9ptVERXu1PnS05h35SZuDJhq07Gs0Wdldq6c=;
        b=vOES6n7+q/VZfz/0RgDslwx1yw7a8wcZ1F8q2M3JWV48dLy55HMxnZ6n7czX3WBmYW
         xZofec+g29oTmeRyxV++OXNoGQfKP/1bgkVD6jcZf/epJWwY2xq7d7Ll5qvAIoB7YYQK
         w/wmsH1fn0fAezbhzka5XspFmF84ioYulvazciV51GQCdIEksG+Rq4D0gtpLwwkEa+hk
         WHJcKtRa3i6S4Twe1BzXrR/7NH3iq/lw8LrIXlY35INEGHiQyMz+kxwN96d873Epu66F
         hxXneF0C6jBj6/jY9vrTSC3K49FboQiXDHd3nlvAv30lShlngGdC8Dob1wNrRttzzDqi
         XuwA==
X-Forwarded-Encrypted: i=1; AKwUvBwgON/f5UwVagEnZo1hbbMp/qIJ2Nwi0SNtvF8bD8CI//u+osdh1I1EIXcr2wuoyAPdhByQadSUdQrO@vger.kernel.org
X-Gm-Message-State: AFq9FYJLdfFpWnuqzAuZXs9GCT6dRAzGHJxZVd4o0I+8Mrr4I2ag8OFl
	5QqO4zriYQ3ieMdH/LzFHVo9pWkFBA5mfJemTl7kmlF4SQL5ZeNPEB9ZS2zqTRd4aYQcEcEZ4IH
	YJcdtkz8=
X-Gm-Gg: AYBFou15zg/o144aoIABg7alW83oC8uNmMewnAr/vU03HmgLu2etrlNMlv8h9jf1vtt
	pxEbuhbPU1YczT9h7EuLzFu04lqDWNjOdxJ6l49fHUBuBY6FnuPLOT6W4QOyvuszAia0l86DM0G
	P++PgkzHwVUNioFk+n595ClkF549DGzfY4cd0y3W4nGWDjniJ+eQ/XDUqjqMY4YvLrL46FoVugy
	MAZOifs77haMugciSNNaIpepNPYkrzoBH5C48yc0gytxqbZR5Ni5D80go0qJEfcrnAAKZBZ+Ro5
	SHKlgCKWlVRInzeO0IIeaLq8XDKz9Bmzn597e3Jq6/Nwoq/dTQYxN/0R/cezLd8QcMbQlF1UrNy
	wfO8yDBSwhSbY9Trq2w3YTDPSuQwSMaAqcp2qKtbvt0EGp+gL0ADgBF78YfRbqMM0n5gHcGU82p
	D1asTgFLW7bnRwDRVOH7MjH8JflUqLTx3IOcrYIEkvT0ztTmqcpmIlXEDWyQ4sYnxAMvnKczcZO
	BAQwUjkBn+kJa78eIi4PWdkAQxozHMaFkFHveoAD/93yYsObi0ZXB8dsiU=
X-Received: by 2002:a05:701b:251b:b0:14d:4c0f:48a8 with SMTP id a92af1059eb24-1851285dcf6mr14519220c88.26.1792482224766;
        Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:39 -0700
Subject: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=6374;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=+xhcznn3qa15squjGIpyfc1hdH0JXJOfXnxt7pxS8iI=;
 b=FbBAQbhKE6Iiw+pE3qdYad2NmqjdwfYB4AlJ1JxaQ5pvqFo1rK8RsGIpur4XUpOnm/pVWfqV5
 D9cRackDFxcDZs76lCCcsEAV7q6Xzoil4Jjf4hRYgoK6DnOS5SfXjvJ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

From: Lars Petter Mostad <lars.petter.mostad@appear.net>

PMBus 1.3 allows for relative encoding of voltages in certain output
voltage related commands. These commands are encoded relative to
VOUT_COMMAND. Support this when encoding/decoding commands.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
[abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
 relative bit; use signed division and clamp the user value before
 scaling; reject a zero VOUT_COMMAND at probe; update the cached
 VOUT_COMMAND only after a successful write]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/pmbus.c      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 103 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 91 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7a7eac90d62e..dff1ef9c27f9 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
 
 		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
 		if (vout_mode >= 0 && vout_mode != 0xff) {
-			switch (vout_mode >> 5) {
+			switch ((vout_mode & 0x60) >> 5) {
 			case 0:
 				break;
 			case 1:
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5f69c1420b4e..47dff264d28b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -101,6 +101,9 @@ struct pmbus_data {
 
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
+	bool vout_mode_relative[PMBUS_PAGES];
+				/* VOUT limits relative to VOUT_COMMAND */
+	int vout_command[PMBUS_PAGES];	/* VOUT_COMMAND in mV, relative mode */
 
 	const struct pmbus_driver_info *info;
 
@@ -803,6 +806,26 @@ static void pmbus_update_sensor_data(struct i2c_client *client, struct pmbus_sen
 						     sensor->phase, sensor->reg);
 }
 
+static bool pmbus_sensor_is_vout_relative(struct pmbus_data *data,
+					  struct pmbus_sensor *sensor)
+{
+	if (sensor->class != PSC_VOLTAGE_OUT ||
+	    !data->vout_mode_relative[sensor->page])
+		return false;
+
+	switch (sensor->reg) {
+	case PMBUS_VOUT_MARGIN_HIGH:
+	case PMBUS_VOUT_MARGIN_LOW:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * Convert ieee754 sensor values to milli- or micro-units
  * depending on sensor type.
@@ -1005,6 +1028,12 @@ static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 		val = pmbus_reg2data_linear(data, sensor);
 		break;
 	}
+
+	/* In relative mode, val is a permillage of VOUT_COMMAND */
+	if (pmbus_sensor_is_vout_relative(data, sensor))
+		val = DIV_S64_ROUND_CLOSEST(val * data->vout_command[sensor->page],
+					    1000);
+
 	return val;
 }
 
@@ -1209,6 +1238,12 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	if (!sensor->convert)
 		return val;
 
+	if (pmbus_sensor_is_vout_relative(data, sensor)) {
+		val = clamp_val(val, -INT_MAX, INT_MAX);
+		val = DIV_S64_ROUND_CLOSEST(val * 1000,
+					    data->vout_command[sensor->page]);
+	}
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		regval = pmbus_data2reg_direct(data, sensor, val);
@@ -2736,6 +2771,20 @@ static int pmbus_init_coefficients(struct i2c_client *client,
 	return 0;
 }
 
+static void pmbus_init_vout_relative(struct pmbus_data *data, int page,
+				     int vout_command_raw)
+{
+	struct pmbus_sensor s = {
+		.page = page,
+		.reg = PMBUS_VOUT_COMMAND,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = vout_command_raw,
+	};
+
+	data->vout_command[page] = pmbus_reg2data(data, &s);
+}
+
 /*
  * Identify chip parameters.
  * This function is called for all chips.
@@ -2753,6 +2802,10 @@ static int pmbus_identify_common(struct i2c_client *client,
 		 * Not all chips support the VOUT_MODE command,
 		 * so a failure to read it is not an error.
 		 */
+		if (vout_mode & 0x80) {
+			data->vout_mode_relative[page] = true;
+			vout_mode &= 0x7f;
+		}
 		switch (vout_mode >> 5) {
 		case 0:	/* linear mode      */
 			if (data->info->format[PSC_VOLTAGE_OUT] != linear)
@@ -2979,6 +3032,21 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			return ret;
 	}
 
+	for (page = 0; page < info->pages; page++) {
+		if (data->vout_mode_relative[page]) {
+			ret = _pmbus_read_word_data(client, page, 0xff,
+						    PMBUS_VOUT_COMMAND);
+			if (ret < 0)
+				return ret;
+			pmbus_init_vout_relative(data, page, ret);
+			if (data->vout_command[page] <= 0) {
+				dev_err(dev, "Invalid VOUT_COMMAND 0x%04x for relative VOUT mode\n",
+					ret);
+				return -ENODEV;
+			}
+		}
+	}
+
 	if (client->flags & I2C_CLIENT_PEC) {
 		/*
 		 * If I2C_CLIENT_PEC is set here, both the I2C adapter and the
@@ -3351,29 +3419,38 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 		.data = -1,
 	};
 	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
-	int low, high;
+	int low, high, ret;
 
 	*selector = 0;
 
 	guard(pmbus_lock)(client);
 
-	low = pmbus_regulator_get_low_margin(client, s.page);
-	if (low < 0)
-		return low;
+	if (!data->vout_mode_relative[s.page]) {
+		low = pmbus_regulator_get_low_margin(client, s.page);
+		if (low < 0)
+			return low;
 
-	high = pmbus_regulator_get_high_margin(client, s.page);
-	if (high < 0)
-		return high;
+		high = pmbus_regulator_get_high_margin(client, s.page);
+		if (high < 0)
+			return high;
 
-	/* Make sure we are within margins */
-	if (low > val)
-		val = low;
-	if (high < val)
-		val = high;
+		/* Make sure we are within margins */
+		if (low > val)
+			val = low;
+		if (high < val)
+			val = high;
+	}
 
 	val = pmbus_data2reg(data, &s, val);
 
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	if (ret < 0)
+		return ret;
+
+	if (data->vout_mode_relative[s.page])
+		pmbus_init_vout_relative(data, s.page, val);
+
+	return 0;
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,

-- 
2.54.0

