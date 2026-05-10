Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23331F9BB
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442721; cv=none; b=AgPyShqdxQFpY4AvBRznMmx24ILJYSr3Q3soTa7o3XYYrs0fN7bWrbCKi+e8dCtQPzicd9me9MbB3Vm5eK1Dsr9DXpK/pEboRT0Gl1ZL3DybiYHm+Hvy7iMbyvviIraENOnKoPaeVyrLJAM9C/nf8Aj7qHkpoIXt8zWUDTnB1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442721; c=relaxed/simple;
	bh=SJ2BW98p81Na7BI7ENpdz1Wo6C3u+mKqcgpg9bZolXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nem2XMWshlsBibwSfw89hNZkoxBfI8S7k9gKRIhwt3HlqQnurZysK9t+0b0JP3//mAn8acfJ/IDOXCeywEIwApGnW7JJKqlHEKxSTlyJHzHMcLE6h4IlzuAlAt2jDPEkzqXpuxZ8YR6Px+BP2Mv8jIhtKBMzylo5KhF+g70D5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkUTzfs+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkUTzfs+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b458ca2296so23344685ad.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442720; x=1779047520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wePw3fvqh14IAiFXg0oU3SyxE97VnhTicxkSYMPbBQU=;
        b=NkUTzfs+pt2T8R5zOHwnHUJhS6sX5w+g0Oq7lLHAfNnQf9QKdCA9C+eaOMZo274WtR
         15JigBDoCvyRLnQWtnm+jDcWDzkn/4xtSA2NqM0MacHxDR03f7BhSbSHq625k4fpoDDZ
         tcQTeCZWzw6XuIGPw4+18xJuYayuluNOqNGLSzxLNfLAqGGmk4L+P+O5LsqdWg+UPqjE
         krz+19wokh+XVs4Dt7G1I6gHAvbfdjOSbvHrtLVsIt0SV2FgcqDsN8T+hn8OlszJaZHV
         FxPMAM1Uke9ckNGXL1oh18rPMbRvyl69+ZvD9uZfAEyjzim+MX0HGeyooqMiHG0ddtKc
         TEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442720; x=1779047520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wePw3fvqh14IAiFXg0oU3SyxE97VnhTicxkSYMPbBQU=;
        b=SqW4cwh/zTdG7wUfx9ie8qzo0NW1sIpRIKHaodgevhpknAxU20ic2MkxgWkI1TVLcv
         b/5YV8X4XHvxh6c3D9K1zy1t7NrNqRN7QyITt9rsgpUu3ytb/ffUNxa3PsVWo6lRQbse
         7UGY3/Q6fF642UaaX+YjHhjvZO6CpVzuh4W2NL/gaJTbJ7RqlHBW7RLH00yNciC4478b
         oGm9ZvCJ3xVExPIcm57MgL7efpGNW4Ota3EwHwVzLfL5fx8y+wjt75wmFMXnuhmOaYxT
         +4IybX67VukIGDGDjwXCUXhnt9+mXCwKAz5BfFSJfAepwNftbldSxskOiWONbaPJCuUV
         IduQ==
X-Forwarded-Encrypted: i=1; AFNElJ+quYYm80pknoMLVlP85DviEw57PUijSROncosY5O49BOzCJr0cZVW6Zs9aK9scCeOBI3LqZJqFlXSo@vger.kernel.org
X-Gm-Message-State: AOJu0YxPI/axkVh1fgourayjsyZh/oz3h/0gX9fOYiS7hRs7jLOE7Dlz
	um7bqxbwTjJRL5WytznPasJ6VPjlQm3b2PmFbQKjMI0xIINAC9ujwdt+
X-Gm-Gg: Acq92OFtOhHphYzTUCxp2ThdyroJK3TO242NLLly9MwmaSO7518DRyaYcA9qL/+/wmr
	hiG9ItylH0RBo/fmlfNr6D+gdNgP0s1drNSlTLeNhmmJG2iL+0f4+UEM0hMf441CVN4KJ6zc4Ml
	j9EvIn/CsxqiQ43622clpTxzYscen2szRzcVdC9/Wh8cii+S5ohvq4yepZQ8RvhKgqvDy66mKTI
	Vi92oaCfWfOiwO9FV/YRIMZ+nzlUueQrDZV+5c+F1p+ao2D2B/2iOQQ/RkFC48jh4xMt1lTnGw7
	LZNzLnWzr7I2c5XXa958uNlnguYAgq0lHDjht0PmeVJCVk5ha8ogsOJwMnHscoDFolpNWOWpOcj
	2xoe4rkCT3rrxsM2I7BHVBp5UqmSCNbfAwWMnXrom942FP9NYums2JdZFAUNnZQIUoSql3MXOFE
	fuEQ9LgQXasQOWf3GLosA/in3KODasnYranzM2g11aYWNdaAKEoYr3N71enKW7y0IJDAHFmDCIG
	a0A40NepgnR3L0JlNEHWtzbs6ul5T3yHi023arTTxgZIwrCN4116vR4eTpJ9uMJmx2j7roS77V1
	+ZTWvw==
X-Received: by 2002:a17:902:f70b:b0:2ba:5e44:ce8f with SMTP id d9443c01a7336-2baf0bd5421mr116260325ad.0.1778442720061;
        Sun, 10 May 2026 12:52:00 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:51:59 -0700 (PDT)
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
Subject: [PATCH v7 08/11] iio: adc: hx711: split variable assignments in hx711_read and hx711_reset
Date: Mon, 11 May 2026 01:19:30 +0530
Message-ID: <20260510194947.31997-9-piyushpatle228@gmail.com>
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

Separate the initial value assignments from the declarations in
hx711_read() and hx711_reset().

This is a small preparatory cleanup before the later loop-iterator and
variant-specific changes adjust the local variable layout in these
functions.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 24be690c371b..8da39d2801cd 100644
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
 
@@ -204,7 +205,8 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
-	int val = hx711_wait_for_ready(hx711_data);
+	int val;
+	val = hx711_wait_for_ready(hx711_data);
 
 	if (val) {
 		/*
-- 
2.43.0

