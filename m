Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597F3A0E88
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141788; cv=none; b=tBBw/rYp9MUK5t1CKy/PjSwKc4hYjXeystPpKJBYZLbV8ti4b6ctTCx5KR0p88wwPVE9BLCwVqXoTrQDpgE1Lr7pm7ae90aszD8UPJLhiQ1CnuwM9oRYIasg8wxWvlLYIpFLR+jcPAIOOE0CQm9HJjum9CQLSJWFp1N5qlVh2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141788; c=relaxed/simple;
	bh=LSkPnfPS7dcFx2Ts93fh7yYVwcsinXFO6Unbb7I42hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H33qI9xEcFp7vlH7d7a1bD+skzEKCFEU33eBnB5AAGGZKiwB0r0OMXmWIEnKIPLR4PaB1SZj1P1fYTjK39AkpDhYClBzRnjmoyU/w5KlZA6ojU510ooDYTBFl6JbLziCt7zmHyCrihjDYM2uUig1GKdZ9PD2GWyrtC48YoauosA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjTnV4E1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjTnV4E1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so1221173b3a.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141786; x=1779746586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y4Byz56kRE8Cxdx3gujtJfcSGY+V3XNAqSrgerlsus=;
        b=cjTnV4E1FN94UzbG+w/64LLNGLfXWozksBIEsF5e0eHzwVpuCPSHm1qSndQcoS7SJX
         m4PBiwqcj+N2b7A1HjzUYNKJvIZDfo6ZENg930fLAZ5OqMOZ4mqC88YkDQyOSnFo5JSg
         J9rwW431ZqwJ2cKTxA4EUoy8QCnvw4K+XDuGNLsk3h17Lfx2RFmxn3RDPmjuqZusPhYM
         r8bEo+bM1WW25pm0sht0hKGCADBwaL6Qg71XRi2x4aTjjpQphdcGU8cOCpIKEc4OKFs2
         10/2GOSDYX/Qm+FAmBylg+WKgVn9FgTMxBzPAx8XRCticFfPgThkxEUQr5/XUEx6Td6I
         5wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141786; x=1779746586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Y4Byz56kRE8Cxdx3gujtJfcSGY+V3XNAqSrgerlsus=;
        b=Ag1AjUFa72qCS2m7Tu7Nb2b9FfKWm15nRje3NrwClYVAqsD3fzQUbCY086q82GO9i4
         a1dPPCT9qO0k4CWtfv7mi3C7wTBTgyAnhbj8U20JClTR6EtXLrgiQ7rfBDZO/aqU5rd8
         301hDUzTQdojaxCLcEeMB8qRsGawVyVS0QhC5ZLfm3abqZ89lvll9PrxnsA0fmbUomGk
         5ZSImuqwpOvHbwK27kiN5vbKm4iLB0Bxq+uQCD7KefkLhXYAlNdOlheI+cQG2z/dGqlI
         fHD7s/sVnd+hcyfnvOjQHCNNkxQr04hvDSaI4NtwL8mTxaSy3nk2jmrNq1y+rj3b2ZS1
         2c7A==
X-Forwarded-Encrypted: i=1; AFNElJ+lwyzK4sgoAl1JGz/azhOGyFwgUycw5Z6BR7noCJ6B6DR++7yFLnYXpcljQMz+ax558f+n2ElKZo3g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8QPWvdazFg+OOfBEe0I5Cp/ldfZOxXQ2dNx6QYWMQH2I3RRx
	6maz5l8QLe8IDUh32oiF6gbulk8DndZpk6myYPMF9zlRH3CV3a7yuPt0ltFGuw==
X-Gm-Gg: Acq92OF9NqR51cxSS97NscaA1sYj9PnCqgG3zwG+mVyI0JLrOMePb5JCfKqYHPn3Ri3
	sv0wGBXqxUvBb+xU8lT/ZfTwsFcj6tLO7xSnyPIrx668awn/lioQvbXQIgaq0TME4lvc9HUWgWz
	RQ76C8yCm/qyGREjjN52oBVkkFB7SD1P8P88cIH4x1l9wnyUiFkHi89DpWEfFouY4mYz7dRL4uf
	dRczb9OfYKpp5dXCq9sRdjQs4Gdw2Y4y8ILqxbrg5X4RONk88dGJjVhggU16E2scM1iORsA+436
	3rcrsOSst2nIHqyWG472XPE6DM0zVs8CqAv0EKl2B+yPxNbkDre0EAJ2/6j+v/oju/MSda/XWTU
	Vq9FEVBEUU1o6Wf5BoQuZvHmUk31eb6C4UCUbCDer7DyTp6HWUSLSx4BE5r9+euzHG21Fok7HyX
	CfY12QWsFB7cb/fYaRdP1XWf3CR61EmF18w48mXKFujZnT181iXB2b7MjloPL2IbpGsDTwwwU9+
	s/Jue4o1QZwfdFcedhwg4jdLF1JMu5CJK0Q9xhZkQFrQEIRPoGfxoSqCMAFXQo0iaNbWBY=
X-Received: by 2002:a05:6a00:124f:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-83f18d5bf1fmr16153852b3a.3.1779141786230;
        Mon, 18 May 2026 15:03:06 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:03:05 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 07/11] iio: adc: hx711: pass trailing pulse count into hx711_read
Date: Tue, 19 May 2026 03:32:23 +0530
Message-ID: <20260518220228.63322-8-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518220228.63322-1-piyushpatle228@gmail.com>
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
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
No change from v8.
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

