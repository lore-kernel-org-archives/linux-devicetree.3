Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159263A1A55
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141796; cv=none; b=K1hFisaDYgm1w+m9F45i1tpSmuCom0qY8/Pw7jTwQP0Z8h9LJkCJ5Vh99N270Gca23m6UIZDjQN2w9HDP8BkgCP7vaDP7ToQlYPJtpjSoks7TYE312MAYUTf1A/WKRPxO18wgzJnjeLx294CpMXb7pFEoUcY9Xd8p/+Cz0FI7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141796; c=relaxed/simple;
	bh=R9bwTFIJwq+fwIoSatBtXQNRjV3224ZU1kWtKpEQ9Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIDrvxqRUK97Pq6qeoBCj9z/PWRm7hS3UxvpFXCoIntzyfONXJOXksyOZDdbpAXn7DMR64xth6z1OySPe76zGdN+My3cmQM5lREGhTthR0TH8RRjvd+4cjl9f29p4qmdGezhbaZHyUUKHwT39xZquWfzBNuwjN9uYZCmtsE6HPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbXdtKU/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbXdtKU/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-839dc688d6cso1141875b3a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141794; x=1779746594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvUEwi2/32Pm+I7ySH9JgCFLggtG2+BEwjV7D+cKqy0=;
        b=WbXdtKU/eCEjZuKwBI7CdlHCVikh+9TI8m7nb2YVRmOmS+nE40OgOXIKXuIbfALRMQ
         +Yvv6KqZ2g5nuXDflz4hNH6o85IAfRlHT8m+1zK9cQythbltEplGt0qQuRPg1wHPcY3R
         PeuIZAR8BfKOLVkig+x3do1N1IF3+ok0k3YzQpFRyVo5C1Vj/9JmGPN9us5CWHXJxx8O
         V2vyR7Z/3ou0Lmon+IlDPP7sBg6rrRg5qlgS+i8PVa+oq2MauzJ2sF1PbDzb0G5ELtkh
         S2jJmFIZxm7XPhztWOAKv/APy5XKTvGH21ID8oHciVfULlAPbD1IQMTorIg2VwFhzkUq
         Nw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141794; x=1779746594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvUEwi2/32Pm+I7ySH9JgCFLggtG2+BEwjV7D+cKqy0=;
        b=kB7vO0Ikg3cNsTO/IakLOSWGLoiIGb8BcZShFIsWSuiDPfQWDoClkYOjkXDpKE0WeG
         fkqefjVwQTwnwq1013/lphkwyd5Cxl4r1bObyGhugxeCL1QMwDzk+t0pKR2w+/8ttLma
         NDlD8g61TudrG3irIoWE+baRUsOp3kTVFUtlUkRwQfwrhtfIBspPGLXXyahs832BEKd8
         YA9c4b5+TmDbTEIXDsc0igvELvs/2nDNYPMIgURV2RHYkf0NuUDaXFhrMVkkL8S3zp+U
         s0YvXJTlzYcwoMaQpnI6yQAtprl3nkdFGBiMhQtx5XSbly1PGBd8cs6Ml4ijoYCPY/O5
         mHWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ndiMoaSROKQu8HhltA+aIoLessx6+elr42AmJcNEbo1xf+w3S22hpk8kXYSpkecyuDKc9jWCHjk6w@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc96G1+QdxRD5n3hRuS/zlGxc5QJg1GdWVEXbcsLG1k7TSvPTm
	jReUImpTu3L13n/LGAN4BKp2p9aEi9O2hQcBjr0RMMTggXrmRKmiDT4l
X-Gm-Gg: Acq92OF91EogJmt+Sv2Xi5RwjywWbO6qWe4uWhMhvOhD8ZA7gQaNvK7JPfjYiQ+xtun
	qZGa0CoN7DN7Nt+gxNtjKUgfYCQYYcrkc3Mu0JVXEeZULND1BGq3FAmJE9a68CRyOj9j1hiougR
	wKNiY2CiDWX0syHkCXDxoHDFAHtFEQIt2/rR9311B558CYsmD/II0YU2hko76ImltqI65fF9ZOx
	xFNNIYQQunk5Gkq/Nec2j1Wep9Yp6eZldyc4nrTnw7HI09W6Bdna6YUEbwHYKjJHAh8Uw/kyh1d
	OPFlkA/nWrj2/QzayqHZo8/tAMT3Uq/uRULN/7HME+WzxLOHbE8SGcA0VuNSwACatSmEtw/Paac
	qD1UeEO8jlIHhWTSvQA4JQiqitcVQ8Chg1Fb7rkIARxKIcgFmqYc7rvz6kXQdSF+QHBoABAdTJ1
	7wfeUl5fuXFtO9bpnv9isvYQLKpp5OvXdYDQ/+RdReBjiEK5gc5JvuPjf68GNI6ZH3PojwXXPou
	mu4rCnzo/4qgxbvrM/nnhMgEJEVPmITuEcHopPWBRpI0ssa9FjotZ/3+Nco3mjXqoqQV0o=
X-Received: by 2002:a05:6a00:12e7:b0:837:666f:8fcb with SMTP id d2e1a72fcca58-83f33ba1603mr16232568b3a.5.1779141794380;
        Mon, 18 May 2026 15:03:14 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:03:13 -0700 (PDT)
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
Subject: [PATCH v9 09/11] iio: adc: hx711: localize loop iterators in hx711_read
Date: Tue, 19 May 2026 03:32:25 +0530
Message-ID: <20260518220228.63322-10-piyushpatle228@gmail.com>
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

Tighten the scope of the loop variables in hx711_read() now that
trailing-pulse selection is already handled by the callers.

Also replace the 24-bit loop bound with a named constant while touching
the same code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
No change from v8.
 drivers/iio/adc/hx711.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 9e5cafa1e307..0db2d2db9242 100644
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

