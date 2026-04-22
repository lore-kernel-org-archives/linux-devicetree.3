Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B283D4109
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860766; cv=none; b=BPXNpNeYV0yh5b/Xf+DzSifdpDULDCHikon8xVVTgsjtB7J6e1RAv+r3d4r1tyRAPZrSP7ND9jMZCqij7cc9MIAC6YVgJZ5/l+Ebzn5zbL+MbDSsTi3Ar9JYWoJlGXt+rRHJAVsEl3RTg8yjVkw32GdhOsfXb05hsQyRMFxs0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860766; c=relaxed/simple;
	bh=2fDvceWZH0uVoiXI+idreB4J3EIIZl8vYZyKQA+B/1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jruVJmr1T4wvesv9FfnLiIzguLqJ2dvXZWQ2YAG0Lke0uu5WBSBdpLUbRajIHZEVN7Nl7V8D0QxHP6nKUU+xSx5OA+rVs17K+3mLXnfgfXlG2iQkfmb8j31u8c+ZjBCRDPCb/ZuvzOBh6CGRn53cUdKTYwjCTybn4WW1jpJx6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Gcevt+vn; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Gcevt+vn"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c79662668bbso2021709a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776860764; x=1777465564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnhWm4BJIe1qz1PKqfhPExcXSRC6Iyeb59/CaItSdTg=;
        b=Gcevt+vnCwkoH9Cp4Ma5hiP4UPTuV2DSgqQryJYQDBAA7vabbqh2PfL4+qn1mr0iOw
         8BgOqBRskeDwaQbCyOHcr1+ZSIfLT93cfrGH4sW8v7jK3Olhg/gbxMxW6YRdg3IYM+tg
         TdVLl0CbRoL0I4cACIWGeOHhtL+kKKfJUlUHLEYpPstPBkkCi370iBzCjccVlwZ2sjFG
         KS62mdEUUGglkP7skKs1DQEjlGszooj9QBYCEXlYskS+xKl3Ab7/x3H950Y4O0SfRpyy
         wDn5HEFZRaUXU77DwWPQQ1yAUxIYXdJ87ivTEztvPrrnt+w6aJVIv4/te3Q2GPRUYjZ1
         EkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860764; x=1777465564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qnhWm4BJIe1qz1PKqfhPExcXSRC6Iyeb59/CaItSdTg=;
        b=OuM4aM+iWSeUfVJVrWIBA1lIoCKR640harr2JYrgUlhvJvhwDCAXWa0JCudG/EWNeW
         3JHErH9okQ4v2YGI851vwoZZ7eO9N9c0wtqHk9pPXlSyy6Kv7FIV7CZzkUPluxAUh4Tb
         JVdJJYwGupar0IZHEZAPBnjdeb03D8gkUQkBNrvGvvSD+iTws2o3NHvyMczbSgpFjH/2
         ywi7yLhzQggCARqdhujec0x+7EcWXMDGuGKkXVPrPOXJq70vXdBpWDYrRDucjgkdAHuR
         Ip2DYcLSwwyplVohYtF2eFpMrrtYC8FxBnAS9MAJ9ge5hpHHGRousegSpPd5BAXeNGXm
         i/vw==
X-Gm-Message-State: AOJu0YzF3HPGNJqIPeMjCW3sbMz8XaEjUx1iBXYbbDUsCMj89FRW3amA
	xPlFIfcEUNfIzKs6J8SyOg6ZdJmp3eulDsOZhP2oJhFQczGNhRIkzeFlibV8UVUXKLg=
X-Gm-Gg: AeBDiesoWkKOZO1gN6mktnjCERaAypDgYDsXOxeVX+k0IV1j5lrSpqf5NXA5udjRonF
	/h9I8BTJTnBFX2I16wshgcLP+Y3YBuK1LPssFpsnRVe8iLFknvMgn0vF9N7RAJdkgqvE4q30NRj
	Sgcpiw5VGRUWn+2XrKHZ5E4gaEWad7TDa5WAKnAnpWO7lR35caCzmkh0QWHyX5xZAb6uhC6/kAR
	fnDkaA/3TFYZRfREDKZLNcC9FVRW9AZ6LtAw/Yeo3TvDg4pIi//m6QbDsutyabeDYQ1sPHQqcTn
	3XvF8M8c+MaEDIFCCjvrlq3uIwg0keTfhWOxhQniXmnXjpkHjzf/98OOYwlzn8rb82M7VC36982
	knaSf9k6NSf5ROhK++oG5pOAICZbKj6Pma0R1RE38J67GyrcIyaq2IRC21kGOCfuHAYNUY7ojpN
	OOs62oO1s3m/9VMSwuAuOoB/cuJIDEHiz98Km6xMWY8pI+CRHEvLRhMHj/GtjrXSvR2+aMC8qpu
	Q==
X-Received: by 2002:a05:6a20:6a1a:b0:398:962e:83d7 with SMTP id adf61e73a8af0-3a08d8a93d0mr25402176637.43.1776860764029;
        Wed, 22 Apr 2026 05:26:04 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm17218079b3a.4.2026.04.22.05.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:26:03 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:25:50 +0000
Subject: [PATCH v5 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-2-b8fb87262868@inventec.com>
References: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
In-Reply-To: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776860756; l=8330;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=CLMn8jlvGzD+hXMNiwD6qUJpGNbcZMKkkvxVny1Uuqo=;
 b=CBDrJCZHUxJqEqwmce+t09qs4CjtM7udBHdZLeWLDl0Jy3flVZzRrRP0fsL3oARr374KCnfzl
 /vWhaUL4gGuDEG8gumzLON6Tp+Op2rL5tivPCMP65IDaZBRYeC3q8D5
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

From: Jack Cheng <cheng.jackhy@inventec.com>

The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q50SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 105 +++++++++++++++++++++++++++------------
 1 file changed, 72 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index d5d60a9af8c5..0fd7dc37e328 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -22,7 +22,9 @@
 #define PMBUS_FLASH_KEY_WRITE		0xEC
 
 enum chips {
-	q54sj108a2
+	q50sn12072,
+	q54sj108a2,
+	q54sn120a1
 };
 
 enum {
@@ -55,10 +57,24 @@ struct q54sj108a2_data {
 #define to_psu(x, y) container_of((x), struct q54sj108a2_data, debugfs_entries[(y)])
 
 static struct pmbus_driver_info q54sj108a2_info[] = {
-	[q54sj108a2] = {
+	[q50sn12072] = {
 		.pages = 1,
+		/* Source : Delta Q50SN12072 */
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
 
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
+	},
+	[q54sj108a2] = {
+		.pages = 1,
 		/* Source : Delta Q54SJ108A2 */
+		.format[PSC_VOLTAGE_OUT] = linear,
 		.format[PSC_TEMPERATURE] = linear,
 		.format[PSC_VOLTAGE_IN] = linear,
 		.format[PSC_CURRENT_OUT] = linear,
@@ -69,6 +85,20 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_STATUS_INPUT,
 	},
+	[q54sn120a1] = {
+		.pages = 1,
+		/* Source : Delta Q54SN120A1 */
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
+	},
 };
 
 static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
@@ -270,7 +300,9 @@ static const struct file_operations q54sj108a2_fops = {
 };
 
 static const struct i2c_device_id q54sj108a2_id[] = {
+	{ "q50sn12072", q50sn12072 },
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sn120a1 },
 	{ },
 };
 
@@ -280,6 +312,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -292,14 +325,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	if (client->dev.of_node)
-		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
-	else
-		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
-
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 	if (ret < 0) {
-		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
+		dev_err(dev, "Failed to read Manufacturer ID\n");
 		return ret;
 	}
 	if (ret != 6 || strncmp(buf, "DELTA", 5)) {
@@ -308,19 +336,25 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	/*
-	 * The chips support reading PMBUS_MFR_MODEL.
-	 */
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
-	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
-		buf[ret] = '\0';
+	buf[ret] = '\0';
+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0]) {
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}
+	chip_id = mid->driver_data;
+
+	if (strcmp(client->name, mid->name) != 0)
+		dev_notice(dev, "Device mismatch: Configured %s, detected %s\n",
+			   client->name, mid->name);
 
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
 	if (ret < 0) {
@@ -341,6 +375,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	if (!psu)
 		return 0;
 
+	psu->chip = chip_id;
 	psu->client = client;
 
 	debugfs = pmbus_get_debugfs_dir(client);
@@ -359,9 +394,6 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("write_protect", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_WRITEPROTECT],
 			    &q54sj108a2_fops);
-	debugfs_create_file("store_default", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
-			    &q54sj108a2_fops);
 	debugfs_create_file("vo_ov_response", 0644, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_VOOV_RESPONSE],
 			    &q54sj108a2_fops);
@@ -383,27 +415,34 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	debugfs_create_file("mfr_location", 0444, q54sj108a2_dir,
 			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_MFR_LOCATION],
 			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
-			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
-			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
-			    &q54sj108a2_fops);
-	debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
-			    &q54sj108a2_fops);
-	debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
-			    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
-			    &q54sj108a2_fops);
+	if (psu->chip == q54sj108a2) {
+		debugfs_create_file("store_default", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_STOREDEFAULT],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_erase", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_ERASE],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_read_offset", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ_OFFSET],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_read", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_READ],
+				    &q54sj108a2_fops);
+		debugfs_create_file("blackbox_set_offset", 0200, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_BLACKBOX_SET_OFFSET],
+				    &q54sj108a2_fops);
+		debugfs_create_file("flash_key", 0444, q54sj108a2_dir,
+				    &psu->debugfs_entries[Q54SJ108A2_DEBUGFS_FLASH_KEY],
+				    &q54sj108a2_fops);
+	}
 
 	return 0;
 }
 
 static const struct of_device_id q54sj108a2_of_match[] = {
-	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q50sn12072" },
+	{ .compatible = "delta,q54sj108a2" },
+	{ .compatible = "delta,q54sn120a1" },
 	{ },
 };
 
@@ -421,6 +460,6 @@ static struct i2c_driver q54sj108a2_driver = {
 module_i2c_driver(q54sj108a2_driver);
 
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
-MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
+MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 and compatibles");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

