Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BF33A0E93
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141793; cv=none; b=remXXdhMK6CU9vKSNWrRe13htfvZVuawYqzRUz/s+YQ/p4DmRyc5dIKGjCi6pI9hVXJ23/TsrALqVJOTeWJITVYabuNI9/LjY3G3gZvmnxUOOCL5SJouav7d6VjFuZR0syqMCGoCoDYJSz3FRpVZ2CsAxG6zqVXDgb8dp+s+cKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141793; c=relaxed/simple;
	bh=SYBXHINTBKF35umDA/Ci4NtfcsdeWgeH1PRaMh4zRvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4KOm6doYNk8lGN7tRF1TrbRWt0tRO+K5sK/aR1sGO2AOnEJhP9HZfJ5spRP6Z6UkSf1HGNsUcJv+0b8FPntwGZ17fK3DHaGwLM1JNXAsnmwpEm8M4v0Z8Ywsi8jZcLUjSl4KWY66ob/6tUGwMayWYNIPSXQ6yaLPaGxoU/cLS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROTD/znj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROTD/znj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1068349b3a.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141790; x=1779746590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ae3/JbEJyowtyIvHRgRioSvia9PJ2dzMefDwMaXfbE=;
        b=ROTD/znj1SOgZt/pjwiZlK4xbcIP/SomI6Pwa4FE0oKjdsTqS8gy9kXRbDGeQEdiGT
         EKjpSO/1u3kbQcbT1wx9iM/5/4g+nivA8qfuXmWZWdZlFfwoxYedSml61OknuMghw/Gm
         kUptQWuZDvKvNiJ4B0hnIXCUdk7E7FV883F6pQfh+BFZbsX3fSrrbOZ7NBZ1RNMNEDg9
         3/AMw6c8Q6X3axgAelyNvHaei4BjyO+alqtYgFFdGHlbduNETTY7CiHoJuuQn7awrSti
         sG/zWdByBdxC6Q2wxzOvDhn4dadFdP/j0ki6VcPCbfa3KgLIOL2JlzlleYzUjO2WjxPk
         94tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141790; x=1779746590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Ae3/JbEJyowtyIvHRgRioSvia9PJ2dzMefDwMaXfbE=;
        b=I4t9+GHkjM3Rm/hUy3os2+fSlYzAtBlrSC4qXo5X3xs21yfxC6kuTBYmTxS9A2E8cd
         VSDjOowKlaTuqoZ8J5a5nWCDvm3ApUvdYh+BhBnxNRCN7IvZN9ZGUomsgpRaawEEFjwI
         S0U4j3JOUZIm1F0WxfDfwS7xLdBkuq4XSQc5i17iyywo4YvYLd1lgHETA5nQcTPXVY6h
         YJ6PnqyC9OsqYGpONFLff7sZiIdwJUFjO/FNTACKj+oAQXBVze07ZgkesYzGjs3cYLsi
         i2D0pgc0sT2MlMU9Q8JcdlzExJVs+CTLrTbAgMT8yDt1LRbuLj+V/gXpnYyWtVY80FGq
         a/Ag==
X-Forwarded-Encrypted: i=1; AFNElJ822TrpvXfMNHSMvPKZ6dnBYM99dO+8TV7rZUgmRsmsEpjbouSBgA9GiQFBictUWB/7g96LYigOE1D0@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTErNLSFJf0cJKbJkSWKcxWn/7FY1p5i/gYm5IGa0Ro4MjWqv
	xViVywegVs4FpMNrCcn01oBpp3vgXjCZ9f2dMdcuQnbbrAdU+WKDfaTt
X-Gm-Gg: Acq92OFhYoN6p6rqpxXd3ZSe8p6RqzFq8Q1R9YtVZpkE/73+CEazwFHxCNghLwoMEU/
	VHLzliKmwx5X5K85bl8thTDmPyxmYwj2YRKLBIb5u/Y6wYAKh/oCjI0rr1iYySRMMMUJs94yLpy
	EMy4lVYKUIxX3+G4BQq/wNfroaPFtuCCvVhH3Rh1x4Xkwf/kVNJ9okK6wO4U5PEp2UjqdQeqpho
	hCugWYL77aIU8mWh4HdB25Vp92ReXSOE5IXCHQZUi1fzWSsKlC/0DLAHBcXRn3LnJDzOP34pHZB
	Xf4p0DgPFQo5Hbz2TpyuTaaLa+OPs/HzCF74/MeJ2wiGqn6TjIh0fEiokSTZLtSsp4Yi/L7t9Zw
	SpLZmxuDUAgQO/yz4QBgFQkANvu5xv3zM6wcgbszx5FXCp06Yhf1Shcz2x4UCUKKanaMu1Yo1Yo
	o20juJxkq43Nem/TfqY5mgeNMp1sqI8pgBQTMMHtK+JPxatEDrXGqf2e0233FBZ+lHoCYBywxck
	+aM8LdXlCMKi5Nri6zdsGrW2MSi4ARJ1YBp+Cw4iWPtn+lyPQcm0BR4cCkH
X-Received: by 2002:a05:6a00:3907:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-83f33c25b5bmr17418803b3a.16.1779141790385;
        Mon, 18 May 2026 15:03:10 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:03:09 -0700 (PDT)
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
Subject: [PATCH v9 08/11] iio: adc: hx711: split variable assignments in hx711_read and hx711_reset
Date: Tue, 19 May 2026 03:32:24 +0530
Message-ID: <20260518220228.63322-9-piyushpatle228@gmail.com>
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

Separate the initial value assignments from the declarations in
hx711_read() and hx711_reset().

This is a small preparatory cleanup before the later loop-iterator and
variant-specific changes adjust the local variable layout in these
functions.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
No change from v8.
 drivers/iio/adc/hx711.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 30e1ce321747..9e5cafa1e307 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -159,9 +159,10 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
 	int i, ret;
 	int value = 0;
-	int val = gpiod_get_value(hx711_data->gpiod_dout);
+	int val;
 
 	/* we double check if it's really down */
+	val = gpiod_get_value(hx711_data->gpiod_dout);
 	if (val)
 		return -EIO;
 
@@ -204,7 +205,9 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
-	int val = hx711_wait_for_ready(hx711_data);
+	int val;
+
+	val = hx711_wait_for_ready(hx711_data);
 
 	if (val) {
 		/*
-- 
2.43.0

