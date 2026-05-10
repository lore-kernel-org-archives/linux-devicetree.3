Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D82253EE
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442760; cv=none; b=XIf7JKRN9oTv9HtqkcP90E3nLIu2I6bSngSTuXLbHUiM6rhwl//TcgRCOhGbfaUlLWllV9sW4wSDbqv8nu/GI3BR8r3xw/wYzmxPaxnos3Q4jy1BzCQO+NFtNLjJBzevy8rBm+dRtmwNbq62N+JLFGN/SWfqB/mOilpgdGxcn/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442760; c=relaxed/simple;
	bh=szr91X0aX1oiL+z0YDbJm/jeuKLCyV7ri0mqBGA+Vhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rr9Y81m/HZjMsUvFZzqWzyDi4/u9IaQBWkfvgRLeVp3jOuSuP8XEFFxwVMg/G/sEcetPJfR2zWZ0ZimODbHeGnGb8yvxA6iPOiwpW9tarlPIphZHcGqiEDh+xYAHXA+i5zTTTDANRgAURnxYvmcdnxcHIUUYFM3c3if5BOrQ/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMPq664W; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMPq664W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso35492495ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442759; x=1779047559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGdRP8DOxTfqMmP41Ln6pwyIdScELpEFLbXpkvVWa9M=;
        b=TMPq664WKsVO/G/14s8GWChSpnzzOKbMOHOu37CRGeB7md9y426b4SAymPhqS0Ef1T
         kGoCbD/AnCvAyD3K10C1emkoVphf8QKUuqhAPL8noMKx4MXGUrpBI8xNRtEtPr8TvWf1
         9FmqU4PkkP84CLmfhP+dL1sBnRovY4zQGyvyUj12SkT7h7HxYZE9zGVwL+iFe9E0EnHT
         E9fQle75+h4axZ9pHZrbusIHCa7rTuRHz2V5EFhJyojgTEQJPsQW9QqIXE5pTnH7Hwlq
         oo56xmPno7gIdo8HJVe8emx5rVQ9M4PALDODN+RaBxIsqMVqa8ohnTuYmKctWg355SiZ
         zr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442759; x=1779047559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGdRP8DOxTfqMmP41Ln6pwyIdScELpEFLbXpkvVWa9M=;
        b=s0+O0AhQgSpzx9J50pwcWoj1xBucve8ziYnJPwOL+0SechWaPANwT7inYj7tr2gESt
         Mb/LJIbW2NX2UnNmIMMC7TSiWgkTJ9bZu8ZVox2oO1uX6VJzFy1pM7CSlaWvkxyywgQl
         9CJQ1HOVxXvs5d2dHtmftaG+e40IW0RHf3JHX8ST0s89ZLma41RGx7KUkv5ET3MPk++z
         MtkLTsv4By/1+5JcfQ7n3uux24jXih1WJ9Irt6QFoTl1FeMYVjA1Qr1oyAtDiSEdPg0U
         nuVRH2EGNmU3CscuVu79FhZUknbCS+ZgAMA0ulzoCKNglPjO40CqAIDVmTgttd+CuSWC
         xkDw==
X-Forwarded-Encrypted: i=1; AFNElJ/HJpVH3BMnPWUxfXJk9Q9T2hTt7XJljynfg0M6o2JnR5swHGNtjM0zRleHlM3O3VTOyXX64Yi01zKd@vger.kernel.org
X-Gm-Message-State: AOJu0YwL0z3R1txsyRD8JzpCtyLmcyCtq7hsxBdWJeYSPstHgncrAxIh
	Q9NXUGapY+nOIj8xBhqKH9O+9O1nb5F5hL1jRU9X+FnQbtvtKdWQWbS/
X-Gm-Gg: Acq92OGfVkMcsw5663/S733Z1HxpAUdPshB+stCN2a0VmXapYRqLsAuzfYuYv1qa6uw
	2JVZML4vpT1uzWliYIENBFYP3qQpsiqp8spz/PhEJ3J1m11C/1hcfjgszcXP8qYG/fm1vx0Jha7
	Qyq5UVFJ++Ai2TUsb32hnMpsJ+EehRrxv578R1UZ9GFBZOxg4m4hWtbksrbfGVCnTN0WXLnuQZu
	+eDy46s1pIUt2TEukpdL2imV7Os2CxDPNfzgEagBBqUD1WTa3AybDHT1lhwMBPt1Fkg6CaVxX5u
	K0RtHhHZfbsXKR/msEO41cwO52mfz6N+5+nu2J82HQPiqjfV+LPUbaXZHeMvVKSTTI8g9ttgkhw
	2dUrYw9kVdjHEfO/RJ6z5UAawNlOumD7CVvfPLG0KopbCZHjGY8P2k3M7T8fv1tOXzWfI1iTV3V
	s2zQoakBWpMmajCe5pF3exJVB46bw9jDYkYGLzpR00TFIUPfMBMgFybrQ0q5ucCcXTPIYnM8FXb
	J9ZXCqPyRwnVU7iPqERJJorYbzAxwy5HtKnssqL1R9FokkmKbIzrF6xc19kUJl4cwXqpiI=
X-Received: by 2002:a17:902:e74a:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2bc7a97bd76mr75042445ad.6.1778442758645;
        Sun, 10 May 2026 12:52:38 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:52:38 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/11] iio: adc: hx711: localize loop iterators in hx711_read
Date: Mon, 11 May 2026 01:19:31 +0530
Message-ID: <20260510194947.31997-10-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510194947.31997-1-piyushpatle228@gmail.com>
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 8da39d2801cd..9f17cbc6c2e5 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -23,6 +23,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 
+#define HX711_DATA_BITS		24
+
 /* gain to pulse and scale conversion */
 #define HX711_GAIN_MAX		3
 #define HX711_RESET_GAIN	128
@@ -157,16 +159,16 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 
 static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
-	int i, ret;
 	int value = 0;
 	int val;
+	int ret;
 
 	/* we double check if it's really down */
 	val = gpiod_get_value(hx711_data->gpiod_dout);
 	if (val)
 		return -EIO;
 
-	for (i = 0; i < 24; i++) {
+	for (int i = 0; i < HX711_DATA_BITS; i++) {
 		value <<= 1;
 		ret = hx711_cycle(hx711_data);
 		if (ret)
@@ -175,7 +177,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < trailing_pulses; i++)
+	for (int i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
-- 
2.43.0

