Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533940;
	b=eCI0b4WyKWS2K33OClo6+SR57KaXeueLbHhG+EiL2K6luzCW6M/i2DK/LxCadVKbppH+
	 rJ2D7TDwNlY/xzwoYzs8l2oiP46c+eMRuanS63hFR0wHxZ/NzR3z+UqssxhvVtUlPSMPq
	 0z8zZ/66z5/+2ijZrD5vvIVYjtSjKBB6/5TVbMzoJXEoFe5hwNa39IFonFYO3ZxnI1fpY
	 qGFppKP+HbVBt5WrIMkAuQrR/UEE6gtR9leQeLzwQp69T9yDDJQq/1bV3EIXhy3B/wkq1
	 jy5GAIceoDJ6P/znZKodmbysV1laJKvjGXJmmd/pC4eFdHx/PCykrCsGG21W/jHsBPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yZ39aCFixpSTZFGQ4SyE0mi7Ka5uq2M19eCM+WRt9eE=;
	b=OKsKNoAjqqqmasN/4zYbUWhXpMs+gRCx1kaVakiCSACN5vIc/j3kmbr0uTA2/GMAJlZK
	 EfXeDWj0M7KTvL8V6NxKRiJcLrxATzqPZjoy0pCiuynLTOQ3JrE8QGDbzT5dF+r8npNaX
	 lOuNJnNfnu2/5BC4fbaKY4YhQ7sDMOvUJswCi9A7+K2HEXiLeAIQ9XJiCYF+KKbOcceqM
	 SxG/WHwzWcVOUCXR3fcxbDurruwpxExt2wkd9VsK7+VVZhdUq7sCiBxboW2WiCb5ksxoa
	 k4Ie7lUrgF63g+pnaP4BZLWEATLMOLhjq3aSuUnpFQxdThpQH52RhdOi/Rk430uBVIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=iaRstdeD;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EB5606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2EB5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=iaRstdeD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so95973eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533939; x=1793138739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZ39aCFixpSTZFGQ4SyE0mi7Ka5uq2M19eCM+WRt9eE=;
        b=iaRstdeDw2c+2k14O6mSGgoy1U1ILT4SOdXMwA42aeRm85N5MKrtKD6NZ4sm2fAu2u
         6HeQ5qCulrwAfLoOHgYl8EnyMzJBqJccQyXx2SVjn+PvqxstJYTU7iFFK+bZbikLZtDm
         mTZD7mG5ZTKvoHJslGV5JBeDEDBRFns3TcaTTbpQ08UZ83WvgJkv15EGadm5JuBIvSUv
         EBC1axJS7BEp+fiRr+6VnkkEC1d7+Knni+ClqGDkFMOeNdy82pD4NQ78fiuYj0qMvOic
         xBPbNf4vADm6/EMubqwWLH6LDIEAFivUFZICd29i+xC/MV1stAiaz2RlSwJwMUbmVUup
         6Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533939; x=1793138739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZ39aCFixpSTZFGQ4SyE0mi7Ka5uq2M19eCM+WRt9eE=;
        b=KS172XK+af8qIMieuZAZquT+KawYjn7x+CSARpCXYS76GtB4CUkpDUbMmTQ7OpfcUE
         2iwrT76DnSChuUZiECSIosZAmLRmw5M86uOHdrJZAtQFGfyFcQ5Jas00x//qkE9+9T/7
         swvuaqG4kGRYyOkW6P6Pn+H8SOZCAI5w5O6mT7Hgt/YA3qbgJAFT0c6JUvl7MUBiIB3k
         jixakDP5TRmE7hfYVxKs3wa19qGD9oltsq5BOk2Q3lhZALiqCzi/k8EREFhmkPb/Dnt2
         bfBEFA0scQxJ2a66t3igGhCvr2a6xYtGlHLeEi3//XPhin+m2mBHPYK/NSM8FfLUFcRA
         ji3A==
X-Forwarded-Encrypted: i=1; AKwUvBwShHfgKGqC9y2oDe9dSPLRx1oa6YsLkxWQn6btwKblkNIvn9YzT7ZuBsSrm39QI7C08w9svd9jGIdY@vger.kernel.org
X-Gm-Message-State: AFq9FYJGLkZsbaQnhsOFJ9KO7CuXHQa0+kci74f7YWhaCaRuFcdYW5Cy
	+iHoW+FBgHwF+t4rUrMLIdsnZf+nMo62hcnor9VR+3sumlRHA4hplrSQcdAR4fFs4iL+GnnFOUg
	m1nthL4o=
X-Gm-Gg: AYBFou3lvFoHGQSCLpipVPoHz56EiSZjq/9kPG/+m0y4Ecv9SYFD1Nm+9rB29KZqyQu
	4clOphAu0/Qq88iBhRgxlPKZABVcsV5DdWlC02EJI5GYPt7v3VJYLtuF8L4R3Sx0VnzRUtrUaOk
	yMOeBlclpYCdIXYor3BsUU2BF1kqRHVb93GVrwrFWXhFuH9bB8SakMnj22jkxWpa/KBS9KWhmH6
	ArJajkdGedg4DqPYIe1Np51H2JMrv+9D6ks2CdFtEEpiRT0l8zR5ezDHxEGHh2xkMl8UJN8FwPs
	W3WstLd3tRaH9k7R2XrXQOP907/EfqcBzAprwx0ph0vhEor2sWZk8jXo48dKY8BngD/7mD8x2ix
	KnotNPEM+0DFhTCmCdDugvFVfY8/gjmrlFvwGA0d/EXtvDT0y9cjjmMxTgG8BA98QFSz6JN6Oof
	TMtOTINAaQuv5pGbRoyhibFTUDbBLQi8Sug8BNQnmVNCKCy3MR/AbwzA+YFA6jci4vv/nM7qifE
	A==
X-Received: by 2002:a05:7300:72d0:b0:353:5cf0:df09 with SMTP id 5a478bee46e88-3674c93add6mr1023621eec.8.1792533938356;
        Tue, 20 Oct 2026 15:05:38 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:31 -0700
Subject: [PATCH v3 3/4] hwmon: (pmbus_core) Support relative encoding of
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-3-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=8091;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=16feJ0AbL7XUqQo4236hGEk2nT9cJIWj6VzNFzo5YIM=;
 b=83jNrC2tQrjwyFupjxGyVWTTSMvY/E1x2A6tjlRkuMSZpfrj1FeNy3GNdQ3jmUlAVK+0FVAlW
 IBqs8UD7XRxDJngQ+SYDfHdBi4x8awxA8XAGTheCYZGvlM71r/IKbrl
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

From: Lars Petter Mostad <lars.petter.mostad@appear.net>

PMBus 1.3 allows for relative encoding of voltages in certain output
voltage related commands. These commands are encoded relative to
VOUT_COMMAND. Support this when encoding/decoding commands.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
[abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
 relative bit; use signed division and clamp the user value before
 scaling; reject a zero VOUT_COMMAND at probe and from the regulator;
 update the cached VOUT_COMMAND only after a successful write; decode
 the regulator margins with the register they were read from, and in
 relative mode bound the output voltage only by MFR_VOUT_MIN/MAX,
 since VOUT_MARGIN_LOW/HIGH move with VOUT_COMMAND]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/pmbus.c      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 121 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 114 insertions(+), 9 deletions(-)

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
index 5f69c1420b4e..ab91438b0c26 100644
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
@@ -2736,6 +2771,21 @@ static int pmbus_init_coefficients(struct i2c_client *client,
 	return 0;
 }
 
+/* Decode a raw VOUT_COMMAND value to mV */
+static s64 pmbus_vout_command_mv(struct pmbus_data *data, int page,
+				 int vout_command_raw)
+{
+	struct pmbus_sensor s = {
+		.page = page,
+		.reg = PMBUS_VOUT_COMMAND,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = vout_command_raw,
+	};
+
+	return pmbus_reg2data(data, &s);
+}
+
 /*
  * Identify chip parameters.
  * This function is called for all chips.
@@ -2753,6 +2803,10 @@ static int pmbus_identify_common(struct i2c_client *client,
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
@@ -2979,6 +3033,22 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			return ret;
 	}
 
+	for (page = 0; page < info->pages; page++) {
+		if (data->vout_mode_relative[page]) {
+			ret = _pmbus_read_word_data(client, page, 0xff,
+						    PMBUS_VOUT_COMMAND);
+			if (ret < 0)
+				return ret;
+			data->vout_command[page] =
+				pmbus_vout_command_mv(data, page, ret);
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
@@ -3275,12 +3345,22 @@ static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
 	};
 
 	if (data->vout_low[page] < 0) {
-		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MIN))
+		s.reg = PMBUS_MFR_VOUT_MIN;
+		if (pmbus_check_word_register(client, page, s.reg))
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_MFR_VOUT_MIN);
+						       s.reg);
 		if (s.data < 0) {
+			/*
+			 * In relative mode the margin moves with VOUT_COMMAND,
+			 * so it does not bound the output voltage.
+			 */
+			if (data->vout_mode_relative[page]) {
+				data->vout_low[page] = 0;
+				return data->vout_low[page];
+			}
+			s.reg = PMBUS_VOUT_MARGIN_LOW;
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_VOUT_MARGIN_LOW);
+						       s.reg);
 			if (s.data < 0)
 				return s.data;
 		}
@@ -3301,12 +3381,22 @@ static int pmbus_regulator_get_high_margin(struct i2c_client *client, int page)
 	};
 
 	if (data->vout_high[page] < 0) {
-		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MAX))
+		s.reg = PMBUS_MFR_VOUT_MAX;
+		if (pmbus_check_word_register(client, page, s.reg))
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_MFR_VOUT_MAX);
+						       s.reg);
 		if (s.data < 0) {
+			/*
+			 * In relative mode the margin moves with VOUT_COMMAND,
+			 * so it does not bound the output voltage.
+			 */
+			if (data->vout_mode_relative[page]) {
+				data->vout_high[page] = INT_MAX;
+				return data->vout_high[page];
+			}
+			s.reg = PMBUS_VOUT_MARGIN_HIGH;
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_VOUT_MARGIN_HIGH);
+						       s.reg);
 			if (s.data < 0)
 				return s.data;
 		}
@@ -3351,7 +3441,8 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 		.data = -1,
 	};
 	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
-	int low, high;
+	int low, high, ret;
+	s64 vout_mv = 0;
 
 	*selector = 0;
 
@@ -3373,7 +3464,21 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 
 	val = pmbus_data2reg(data, &s, val);
 
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	/* Relative limits are scaled by VOUT_COMMAND, which must stay positive */
+	if (data->vout_mode_relative[s.page]) {
+		vout_mv = pmbus_vout_command_mv(data, s.page, val);
+		if (vout_mv <= 0)
+			return -EINVAL;
+	}
+
+	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	if (ret < 0)
+		return ret;
+
+	if (data->vout_mode_relative[s.page])
+		data->vout_command[s.page] = vout_mv;
+
+	return 0;
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,

-- 
2.54.0

