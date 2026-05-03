Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728DA3AEF3B
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810259; cv=none; b=RYCZXppwI7iJ2OJC8DOnMrUslZAUqiZChI9SNkLnNdbUdW6vAL9/+9qlpxJ4Z0/qU2+S1/YGGwWe0w7s5OvE0GUrPo/gJ7vBZpB4ZSXb4jt3nwIRTJ6QW4pjaVWcTkeMdyOkeLlJtvrYNc2K+rcq8iEzf0gQYsOWG3OrdAVOGME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810259; c=relaxed/simple;
	bh=fUCNzLF6hh2hm98jxnInINrsJoaAkfZjloF5s1Y/pQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIGvTfx9Xa9hGfw9lWyjZYnx4WeeTs4IhdW1firn22S2IfPKzdFMMi5eqUZSATNJ3uQY+b6ZqQr2TyMplztPpZcP78RPGyqm8Gy+LlwgAfApZYNDR6eBvJAfBNy08Lgg2vZo8D3eWYEXIcU/5B4Hgmfht0SxDCIief9pMM/EyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmjGObDy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmjGObDy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8296d553142so2158987b3a.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810257; x=1778415057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waD4kNs+jxUcqAUe2S1xeZGYlwFNHw9AH2tNe0Qph1s=;
        b=YmjGObDygcaFEDSpIYEkvtsny8r+1trqmgsUGqo6czWsfaHM0oiduZH/OvDXNt7tXd
         +AFvAoye8ckGtXy2JGtl1hIZ/m+gUIwMUtFswLAqHQTMaZjSBkUqfyv41NQ6wMM4ACJ4
         7dY3EYrXcZ8mIszpHfjBs0MMtryQ0Gd7BVrT8dzMLGxvFvqsEHamwAh5yofjtJIdkOrz
         QDG57iQvYUKcIedFBFhj7j8UNdMZzdp1mOLC5z+XtobeEEG0WfvHGU+TYuNv+dwUgvHV
         wIilC6a4IpflQY2zgdMIuqdhLYlPcPbZKHrdBntZ5IICTHkH4lg8Dba7T+DC8aOiLv8C
         RvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810257; x=1778415057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=waD4kNs+jxUcqAUe2S1xeZGYlwFNHw9AH2tNe0Qph1s=;
        b=sHPSF5Cyno9kro+SbeKric3ecky2TUPrwbM1Sbv6hrbHis5A8h2nNWgocl7B6wU6J5
         y898JuOhGh6hSLtr0/aOk6X6udASzpx4jOAm4LjML0TsdTW228lGfNYg+vt/pSBA8B9N
         +3MiDcnlYVbehhF4DKbxhD9kYmBPQty1mMfUf3PgEp2PLFKb+uwaU9kypBczbpRawk+Z
         vuXiIF1ijaWih3SzgfYaH3TebjKha2xSrtbez/inqRy88o2fa3JjIM2VplxAb4ocoAwF
         nEVg8I8EmbkCPnjkLsis0L8g+wojEA9lusSpFRGP7wENboB8dnS1AagXC3ciFCu6n87T
         saXg==
X-Forwarded-Encrypted: i=1; AFNElJ9DxQqyNNKA0J5IFrXTf0q+klZS2UmPqsCHNFs4oKbqFAeoxWQ1Ft7v6DD4vbfl7GaDztimBFo4AoQT@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmK6PLfPaYPbsGcrJJSHhz4Hneba0K3GJtZJQ9vJm7+UUYagV
	E6j3xHgKYi0Sxkr37uDFHfYOEN0hEU9n2CQ5PYUnjFRIzeXag9Y5zreJ
X-Gm-Gg: AeBDieuMYWMyqzmrCqKMoo4cQfHUn38PpNJohxDLnB4yXB4Fxn8TZuiB/2XB6vTqKDb
	eDYqMLJbG7/Bsr1jViLMv0KQVT/NzT3icvZWJEj/tO02x+WcArIyOPzOj/XC/8GMiVpq5pwzK+B
	yaJphCTYR6Ca2p0qe4V7aOSkAOlzlRmhdxLUnzvVLt7MhFy1nL4rkkyl9K/uNPJBm/Wh9FwV86T
	Nj+8bPVZpNo45oJI4iatXp/PofL1xCXBn7b5vUXpGxitmlVoG7E3E+tca18up+3pCtzbRwsWcrq
	LpsIb1K1c0m4uk4onXSC9cTnqZQSvb8XyAioCWiHopEy7QjtTMCJWSFseEaJi3zWQuHoRhCke5V
	8Rz1Tcls0uIQ7B14RWg93WPb0yj19uHUaCOfW/RJ0keO9rexYUILx9Epu0TGOnbU6Z+mG4H798O
	ww2law3KdTdNFXlNAsotEpFGjHnsDZa2uI0g6otFpa1ESaGxFbfNM4+BfueZe1XdvWXYXn1/yqk
	vPrJl5A68zfoHEaAnYCiAU0+N8ZKF5xBmKosY7Ry+2WyvQRtPQ0LzMOP6WmN7ftxBndoA8=
X-Received: by 2002:a05:6a00:1c8f:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-8352ce0d953mr5364067b3a.0.1777810256823;
        Sun, 03 May 2026 05:10:56 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:56 -0700 (PDT)
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
Subject: [PATCH v6 09/11] iio: adc: hx711: localize loop iterators in hx711_read
Date: Sun,  3 May 2026 17:39:38 +0530
Message-ID: <20260503120949.80292-10-piyushpatle228@gmail.com>
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

Tighten the scope of the loop variables in hx711_read() now that
trailing-pulse selection is already handled by the callers.

Also replace the 24-bit loop bound with a named constant while touching
the same code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 drivers/iio/adc/hx711.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index b2de8db285b2..98fb617ea32b 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 
 /* gain to pulse and scale conversion */
+#define HX711_DATA_BITS		24
 #define HX711_GAIN_MAX		3
 #define HX711_RESET_GAIN	128
 
@@ -157,9 +158,9 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 
 static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
-	int i, ret;
 	int value = 0;
 	int val;
+	int ret;
 
 	val = gpiod_get_value(hx711_data->gpiod_dout);
 
@@ -167,7 +168,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 	if (val)
 		return -EIO;
 
-	for (i = 0; i < 24; i++) {
+	for (int i = 0; i < HX711_DATA_BITS; i++) {
 		value <<= 1;
 		ret = hx711_cycle(hx711_data);
 		if (ret)
@@ -176,7 +177,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < trailing_pulses; i++)
+	for (int i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
-- 
2.43.0

