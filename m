Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E527603C
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284658; cv=none; b=DpkzHYV95L0frfje5ooyfC4D566RCnJQv/JEIoZdR6t+av75qy3A7XlzXu3dwu3wLLca9CBKiLWpxjHONtdGVCWBhzObytnXBmgnt21g5wICH0IZrYLhhL9SdlYnHFBXVoXTUQLZAVVoiGsIzJRptHOrmFg3hduNob06HUdIHpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284658; c=relaxed/simple;
	bh=TZ9Eue8DFtaGA9w2JAdQeWItg1bP/LcCHgtVSaqBLuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKwAxg4J4PLSVFDlZxz3hd5GMHdi1uKYGBjGBlNzhW0EY+UAtFpUXUlxX6qjUJqjWnXmdowHl6A19izN05IiCVApOMyeGaH8HOTmpfILchA4FFxuSrweQO9Rd7u662A1TlVzCQCClrvEFzPYWTTOVOw2mwc48tbbimDkw2G4N/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgZh5i4C; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgZh5i4C"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cf636dac8so4183575b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284657; x=1777889457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwygt4arcj06fgeRgeONzkm42+D0jSpsT8L72zAuvOY=;
        b=pgZh5i4CU1iG1mzRYftLj4faa80UuYpeu/87RBdO3kD+41vDcdn0rYeRozanbOIbGg
         wJBorDsVsHNCdfUOfj/Fd4ywBSYfcp5m/dzyEIgYwpEm/dVQ6Qkr9T0mqHJ3Gmm63Rvy
         q6bOWt0rR44DKRLeZuokHGWngVw0xgQUaQ8qNuwzXcYePFHdx5yasXGlAxbKprWvwsHB
         xAuRG4dUNjUTZgT6BGI/jwr+THDJFedQDOZ6j/kdrBKkAA0bGefY9AS570+sfmXeUDao
         29b8idY1MxuEKdbkQWcXjyk0TBrwmgt7aefIlBSZ32hTp7XZsjI6oJ8HnT/wD0udbyXH
         CbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284657; x=1777889457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bwygt4arcj06fgeRgeONzkm42+D0jSpsT8L72zAuvOY=;
        b=C5nZjHMjbNgVxoRU82t8lmUfas+k9qv+OSMjepvOrfdnA5yTFrzm+TqwvBsISS/gZi
         JmLXPLY0jD8xQyeDLL1yKV2jhY3QANWqXmZeNvRYW7irfZ/SAjmypHBS/w0/VRO0kSC5
         LDAMYmfkt8Ui0IMOzEc2QlKcYHSOFh30MUbhHz34+QmjTGIJOaZpHRepz4V326lli2my
         qLvAZ8n4N1ws0d7DC8znW2Qkar4Qde99NPd/zcMoen6EGWGiiUbpkTrCFd3QMCRHYQ5r
         R+/JnfRy1EIGnT3ym5/XfL9IqvlqyeuuOXrctc1T00R8EpoW61UhMdGNHrLaH79LI6Vt
         jYAA==
X-Forwarded-Encrypted: i=1; AFNElJ90raDVoH4iZJKJoWPmukHwSTndUvI0TqIdDmYVTM6h0mWzMMIMQV2kLKLTrUqODjI0gqSOw8cb0iKF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyczb16gDZGJa1uXwSTLliAk+R/L0A+LpNYP+BKolRsFh8GK/K4
	AopiEqiiyO+mgNLRt5DtaVkSDJIy4QPmNuuXOhKvBl8R5DCW4ut2BJ8Y
X-Gm-Gg: AeBDiev9tzAVnB3TAs0bAGNjHXiSF2vp2UaG6psbObMpUlbIu2RXwtEkL/fS7ckGVuh
	G3odV//UCuk+NpCSCiA7ozKAcBQ1xN6mVDFfUMZC15mX008tcQlIPz3oVpYgq6bnv8XyARgVsXo
	rC/yGG/MohwZIxAbPDP2/LoPlKp1wnJg+Go5Ox6iETO6g73rKjAR1HdlPlZ8WTqfoqEmeRIeNJ7
	JT/B040HFtvdXcF8faOYM2ox+3vML6tHD5jnKumgg6JdGOtyAghtIcdIFQho0YP2w7fWphBV0ey
	zlVj2iWT3v6uG6mUvEy5SQV2HYGNxbk9MPCIraLCeNoOCrIC6XdzHtKmyyPQrOKOwByWJ0Jq2/G
	UBe4AJu2v16OqP1zfx1cL/lwXoHLUJGnU5fYEQ8aibtag7O/6dOYU9ySfoVzaQkRuu33gr+GmSY
	CvwnKeExKvqORhltKtsXVA6TMKC7iFlU2ZgKFHvJ1HAg9EbsLAKMXG5URATs8ZLEi8iIuuQyHiD
	AKXEvGZweyfeYRdcqk+jTOKzXh3C4i0TxLExbOhN+BiyeV3mw==
X-Received: by 2002:a05:6a00:2d81:b0:82f:24e:6a48 with SMTP id d2e1a72fcca58-82f8c83059dmr45501815b3a.5.1777284656648;
        Mon, 27 Apr 2026 03:10:56 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:10:56 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] iio: adc: hx711: pass trailing pulse count into hx711_read()
Date: Mon, 27 Apr 2026 15:39:36 +0530
Message-ID: <20260427100950.33936-6-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427100950.33936-1-piyushpatle228@gmail.com>
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the trailing-pulse computation out of hx711_read() and into the
callers. hx711_read() now takes an explicit 'trailing_pulses' parameter
so the HX710B support patch can pass the per-channel count stored in
chan->address without adding a separate code path in hx711_read().

Use scoped loop variables (for (int i = ...) / for (unsigned int i = ...))
to tighten the scope of the loop counters.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v4:
- New patch. Split out from the v3 refactor patch as requested by
  Andy Shevchenko.
---
 drivers/iio/adc/hx711.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 2a6e9645f54d..8e77978f062b 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -155,9 +155,9 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 	return gpiod_get_value(hx711_data->gpiod_dout);
 }
 
-static int hx711_read(struct hx711_data *hx711_data)
+static int hx711_read(struct hx711_data *hx711_data, unsigned int trailing_pulses)
 {
-	int i, ret;
+	int ret;
 	int value = 0;
 	int val = gpiod_get_value(hx711_data->gpiod_dout);
 
@@ -165,7 +165,7 @@ static int hx711_read(struct hx711_data *hx711_data)
 	if (val)
 		return -EIO;
 
-	for (i = 0; i < 24; i++) {
+	for (int i = 0; i < 24; i++) {
 		value <<= 1;
 		ret = hx711_cycle(hx711_data);
 		if (ret)
@@ -174,7 +174,7 @@ static int hx711_read(struct hx711_data *hx711_data)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < hx711_get_gain_to_pulse(hx711_data->gain_set); i++)
+	for (unsigned int i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
@@ -237,7 +237,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 		if (hx711_data->gain_set == 32) {
 			hx711_data->gain_set = hx711_data->gain_chan_a;
 
-			ret = hx711_read(hx711_data);
+			ret = hx711_read(hx711_data,
+					 hx711_get_gain_to_pulse(hx711_data->gain_set));
 			if (ret < 0)
 				return ret;
 
@@ -249,7 +250,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 		if (hx711_data->gain_set != 32) {
 			hx711_data->gain_set = 32;
 
-			ret = hx711_read(hx711_data);
+			ret = hx711_read(hx711_data,
+					 hx711_get_gain_to_pulse(hx711_data->gain_set));
 			if (ret < 0)
 				return ret;
 
@@ -264,8 +266,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 
 static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 {
+	unsigned int trailing_pulses;
 	int ret;
-	int val;
 
 	/*
 	 * hx711_reset() must be called from here
@@ -280,9 +282,8 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 	if (ret < 0)
 		return ret;
 
-	val = hx711_read(hx711_data);
-
-	return val;
+	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
+	return hx711_read(hx711_data, trailing_pulses);
 }
 
 static int hx711_read_raw(struct iio_dev *indio_dev,
@@ -349,7 +350,8 @@ static int hx711_write_raw(struct iio_dev *indio_dev,
 			if (gain != 32)
 				hx711_data->gain_chan_a = gain;
 
-			ret = hx711_read(hx711_data);
+			ret = hx711_read(hx711_data,
+					 hx711_get_gain_to_pulse(hx711_data->gain_set));
 			if (ret < 0) {
 				mutex_unlock(&hx711_data->lock);
 				return ret;
-- 
2.43.0

