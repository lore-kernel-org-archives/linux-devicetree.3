Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4713AEF46
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810246; cv=none; b=rd8aelqtI4CCS6lgExC7CPQ2oVvqO2w5NvWmRsDQhtDpVGYVojcY4LbzvNOGobd6cE9dT2Pv6plS1Q+y/zalXYEqY3DtY04LzfgLEbG/tzgBVWj1LhXj3DT11yyqJnfmK18whaUgWlHLHWOhJuWfy7t6jm7WtSpF8BIgUQJj8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810246; c=relaxed/simple;
	bh=5i023lPUKhimKsYF9M78AvT6vY5pZfCNtFZKwv6bJVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGprr3l02pNbRLG1XTs8WgEcq0qdef1yBEEbpCtcXfEw7buuacicsAP7NCFTsj6wdiMH4zvJSXHG+sgvS4eFrYOvpDjVZGIdMvxXOKgLeQISiWGvwAqFdiLM5NEe8P7JATGZ7dEaOnF3svBYhRRK8E/s5tTbqdVhICwt8SeS1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBNxEyo+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBNxEyo+"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8354461da74so166801b3a.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810244; x=1778415044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eXI08ZZvBOZRhVvTrMA+ciVmwUlugzbu9mfoWqF/18=;
        b=XBNxEyo+3IHLC+MKHKhJx65Tltwsdi3YiabT1lR3GqPBfGV7Zq88BrTtGTEXKO6hnF
         IvohGbUnuWApjrAlJdC6sDi9n/O+JDZO30yRdfw773EXHSjzu67T1hkZgbvWg2Ksh2kH
         cJfBljznW6WZwkDYR6OPCriZut8VDfnodrSzf+0CXUdiz7Opo9x1NFpB4q5/OMx1mk7Q
         IEm2NxvwkwHINnFQSayhDB73W9+lMj3nqw/WuLt5Fw7T1Z8oLWeImwuC/oI93C9ggsWb
         34URMaz3VlJ53aeA9I+rBq93lr4QvHrSUe+P8l36N3YJlilVMv5eteV0QmsCILEmEEkY
         7H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810244; x=1778415044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/eXI08ZZvBOZRhVvTrMA+ciVmwUlugzbu9mfoWqF/18=;
        b=jwrvGKVpkpbx5CJf2n1Wt1quTar+x0VJspP93Vodu9m5E67lXg2/vzeTcpc72BAL+e
         w1xeogF4u6CJDOmXzC0iH2/xkx6BSgWaudg3syhC2z5nLycCCcVeRn9YS+DDO21GQi9w
         9PKyvt6Q3dtz7HSHC93lA8xa4AGFkSJWUU9RTKyEZyX6dI2upDOynR6pV11XO0M3BJCd
         uZnu1t1Bc2ZUg31PJjm+ibqqIQgpFyHwuzM+BEvTEZyVrAJWDhepJazgeHrr04J4byr9
         Ml9Hqxxs7ic/ji2UOx3oBnnJb3IMgU6qfpgUmsHVpJKQBd0f7GXpJMvt9cHRZQFl4uZM
         VoJg==
X-Forwarded-Encrypted: i=1; AFNElJ9eaBUPGNsIgviQrRxe0YXZ+w5Q4uL4FZsWttPdUFECXqHpeAAC4oGCnPYFntrvWtVbYgW7gh+3K5E7@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDLs4lYSifkXJVhx/4nRnvGv5iqhWtgSMhdGEAC7JEw5akz8p
	yHn/DMRRRtfypSTEskv+/ztwYKpVPOWyfkSKpeAvWo2jEekhwG01U9V2
X-Gm-Gg: AeBDiesadRcGM6LkP69aXgLdrFZSBbeVApHAmiNtFrdmMiFkB2/OKpiUzYq3gaqrG0J
	y0deq1AlwQ6uLYEpeWg4t+/6CHqSJN0mYlw1n2/tmUGWLi2xHVt9YjJKYWVshz9k6NnXV5mm4ri
	bMUh+AUI4yDK4H6y4mq9DdXAXVlTd74+pZ0Hu9nSb+bipf3M+btKcjTJzWQqZ8wQ3icSMy0cxFf
	8YeVf7waPaO+ktRDn41a55iXPHd0TL05FmbzqUY3i/h2ST3Y+D2iuXt11pIxw068JMlO+AdKAuX
	W+ETF2bNXHyTb7xNYJW3qDKJdgoUWEruuQ9G7FGZxkNfIy38RmhsynXnHXORsWKWlV4yj5O0qDq
	GzzlL8mTc5t44foLIEyoj47b6lDjSrpGz3sLJibTgBuPOSfE14R7yGbUOO6gWwDzsXwPa4Q/+xA
	G+PWOu+QU0mIwuds56gpgbhp2NApVN99k3Lmyt6elpWMVjpS7mFYmkGu4fBHgvHzrbqiKcHbqr5
	mEk9wDTnQL1dE+7QkiUbbvMN12cTUfNE8aIneqh5kM/NgeyMBSUzAU+ME5cxgl4iueWAmuGp5XW
	qBDhZg==
X-Received: by 2002:a05:6a00:2d8b:b0:82f:776f:a78d with SMTP id d2e1a72fcca58-8352d1a68admr5782544b3a.19.1777810244142;
        Sun, 03 May 2026 05:10:44 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:43 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/11] iio: adc: hx711: pass trailing pulse count into hx711_read
Date: Sun,  3 May 2026 17:39:36 +0530
Message-ID: <20260503120949.80292-8-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
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
---
 drivers/iio/adc/hx711.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 534b73fcaab8..637114635867 100644
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

