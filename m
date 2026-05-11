Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388947279F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521505; cv=none; b=Npm8CmmYncchXLlRg2hSn0tB3EqYDMgTsF+yFZATzJ+n8rqCzBkOFVttVFIz0v2RV+07d9yU1j8QltB4Av0YcBJwNqoBZdDDsJBfj/ZqAqWCW8lA2Z9BfpcPIO87CjKB8eDfBb8w8RudtDpQ51yz9TBG+nmwc1ByW0CmpBNxgtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521505; c=relaxed/simple;
	bh=aTUwaw1cZjKNO7pd1qP0S4T7HG4+2wRyJbUWydgN08M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKbBT3R8RkXIX9jhialW1XC4v9lcN12xE3l3qUr8xwbPWOfqXdRR7MS9CRNO/4Efj21uScFjQ83Xui+6eiHvj510RtJmweEaFMoW4b+TVZY0MLLnE+239e01Fk07Nl4XAJqLmKf9BXdpyKxTt8NqLISerzVzL4gitKz5PuZx1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iugoT4zO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iugoT4zO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c801912c903so2053494a12.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521503; x=1779126303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4zRyyXIwuf/G23ISEa4BernDl6SyQJXsQmJd0MnDOM=;
        b=iugoT4zOwhqoOslTvEWq6jSQPZdUlKnjUWLn9zojPyzSJM2BNwOEP0W2MTmzeGayzr
         qPt32qxJLKwU/pal7vstzTQBbnnPcDGqne8n9L83xHWl+535q+Xedj99DQdApNHTCB1/
         127+JD+ottbZmY+NvNYbjBM3y4XMkXZMOT4L7doO0ea8+NI/DjNYCFQ7PIpabgifRHpb
         GyzS66UbupAcBu5OuK/AKiR+yHOf0DEXk7L6ARN0IkC46iaO93LX0GbJM3Cn3w3cf43v
         zHkCEF6QUW/72hm4irBWn+zGU7hYZTH4W2WU/s3bwusC15cG4dWTfYvYOsO/ytMHjlr1
         BSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521503; x=1779126303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4zRyyXIwuf/G23ISEa4BernDl6SyQJXsQmJd0MnDOM=;
        b=nNllleN2L0g7X0vtQ3wuvzfX0muEmd9uk/9QDSVK43bn7vqLFZ0GQCzG6nm2L2Pg0Z
         skjM1/LtO8yffNfd0+BLjprrSihbXMchwd9J6BkxeMGigHQkPFiq4LO+cxept6kQjpa0
         ClH0sTZ1OX8cMn0/v0PbbX9/H4URfoz1P0wd1J2PGPH0imd3LeR/v7SNwvauP6xksT7S
         JsX6+gaTftiqSTy7UtBKzZXjZdLB2Iv513vjj0XotYmBSzSGj5Y7Tioxm1eGG5JH/G0K
         tsJtZSMV5k7/ZdxNG6vrrTX5FFk2EIFRkMmYfDpW4yZAJu/fNKN6WCKs1GShByF+ZkM0
         LHaA==
X-Forwarded-Encrypted: i=1; AFNElJ/rcHvHD8rVVqPebUambjoMSuJ3LzezFQIeta3S7dFCHqmhKyxdCne10giMoNTLK/dl++vRGaMvoTTq@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyklTwDWLqqXNwW5gWzO/MvXJG1o5fD55LOOvfXIAVRGXQRrG
	8ibDtM6oc1YKnvWqM8Z1I03GGPFv+TB2knLo07g9ZWrzALP2IxUrcCGCpawNUw==
X-Gm-Gg: Acq92OFv6dGI5zCJdZlJa13P0OV9Pv0ej6ISXPupnQixqIiyX5RI5B5NSO1Pce6QtM4
	pagJCXCYv7CK178RMLEmyCfiIxqtJ9x8bj/9NIk8vTeGauVLBrntCVQKSMaSUZHW4C+Ch3g/iBr
	J1pp/drTSwo8BarE6VarTvPAM8sLuIhH3wPOFHBKxfW2FobnnQteGgTMqQSd7ShLpQ2o2IWlsmy
	hjxrK44IzDfiwIKf4OjXatC1kQ3KBypc8+v1wryMhBaqrFB+w76bB63q+euXPmWYa+FAbfDlE4h
	hBAcjh1zZa1/o+XRuUj7cIPo2UAIj0j9SBSAePSIZLzGReH9Nr7mfU45/mVOhHkx37ZQ5lKKP3A
	rCuF1Q5C+jpg8vVJdeOKYIEO3cMelO0u8XeC3bUca9UnNq9Q4c/Rd7JTygAIL9a+TaqzpvmSPjX
	D4Qxp6eO4hPnBOPzFdL50BAP75ocQtdXa5gKXarAMLgY6Lqalag8/NG5bez3baoXbVR/DCDYq58
	ZsjKv9GU2TxdQCHqUaMWFQO0Coud18DO8rBlWlh+EnrPMYqv/98josT4gtVKg+N4egwJv4=
X-Received: by 2002:a17:902:c946:b0:2ba:d97b:4baa with SMTP id d9443c01a7336-2bc7aa202dbmr97909805ad.20.1778521503394;
        Mon, 11 May 2026 10:45:03 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:45:02 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 07/11] iio: adc: hx711: pass trailing pulse count into hx711_read
Date: Mon, 11 May 2026 23:13:32 +0530
Message-ID: <20260511174342.123820-8-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the trailing-pulse selection out of hx711_read() and into its
callers.

This is a preparatory change so later variant-specific code can pass the
per-channel pulse count without adding a separate read path.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 10ccc69f209b..30e1ce321747 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -155,7 +155,7 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 	return gpiod_get_value(hx711_data->gpiod_dout);
 }
 
-static int hx711_read(struct hx711_data *hx711_data)
+static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
 	int i, ret;
 	int value = 0;
@@ -174,7 +174,7 @@ static int hx711_read(struct hx711_data *hx711_data)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < hx711_get_gain_to_pulse(hx711_data->gain_set); i++)
+	for (i = 0; i < trailing_pulses; i++)
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
+	int trailing_pulses;
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

