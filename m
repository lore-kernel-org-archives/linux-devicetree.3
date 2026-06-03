Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC10477E31
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512594; cv=none; b=B79IBm43btuCVD/gBC9NjZtPg/mw3WlLgA9Dlp2RauILM/2hn8kA3GKWtcCAgP65OI5YLeoWJR+R/HPJ/WRBISgDx/l8kq6ebJDo02e+waYN0FJTUJ5G/BsoV826BCcXSw2IvUXObjy2hUSuZoWWQfpO1WelOW2zGbLxoS9ao/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512594; c=relaxed/simple;
	bh=IyYb8UgF/AKA8+P9d730SEMTu3OzJGnh9mo/jac4tKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbpHlJkFvT7k7w0ajSDtqN08/BF5Cr8zPCkjFSf9WvcU3wxo4RVubNhOzkE9rEy9LcCmjezyyBuvZtX7HYLCtgyXaMAx6BrmbmZZT7Jc6l8pI6RbL8FGYtp4Ezsl7ujBd7x7ROLopRWBzNHX+gi6CcXaB1VOPO0+52T3+PCZUf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rS1o4ZGI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rS1o4ZGI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0bd02d97eso48687245ad.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512592; x=1781117392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1zPHIbDPv87v1NJ8/Wn8nmreCkN/BzTtCRIc6PgU/s=;
        b=rS1o4ZGIIa1cXEa/YK+hV+m4TLWhWt42DUfvU2pmVxDQ9L3gia4i+kh8z3VKDMLqsZ
         xX1TqL+aw+ybwc0rHhcMZSVge0aBzHXfaRRQXFgozRYSKp7IqNLZP2iSpWM4ceKoU4Yg
         9am5Xm5Xee0lPt2dB5DroebWr7+N0LrQAFOvSQt4emHup4vtKQXlG7IRoIKCB37I6LEH
         GVylcIUVVSiwld2nr2OdNxZ7q6J6R+9sUVKWFfgySJHk+83rE12RsIPxL+KkgdVo2J74
         pk89/z3GWBN7VtA0VZaF39iQ+FDp+xaqJHGVFdab+EOjSG95EE3834YQtS0IUpJtvnq7
         maZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512592; x=1781117392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O1zPHIbDPv87v1NJ8/Wn8nmreCkN/BzTtCRIc6PgU/s=;
        b=Thy3MHeRUk1X1ZLi8E6BOLDzvymTX12zHljWw25iARSLCZmoLgUdQAOaVNVrVJjgUz
         6u5/rItVoZcWn1QQzRvmEa+Vq4v3n6XepW4a6EuMsHnrwEKe4PGgTY3yeDogKS0O0Kgl
         d598kMBlj0wCyKdCz4OnH20Ch3GImjvHI5fFGAIjch+vkf6BiqtrHvQFDk5mZh6SbqPS
         dRFbX1B+od/WtDZ1uHC9JKFU7PLEPgmSjgGOarXwLP2TFhcB0v44imMRmevrJyxdGCmQ
         /JvogJUUAzOHsM5gRtnQzpUGIsjO6U/u2eqFSeI/xissVYVxc5KgEtd5Xza83MZtGRoK
         /uDg==
X-Forwarded-Encrypted: i=1; AFNElJ9SI5NVgbVOgph0tge0xx+dacvVKRj00IuRunAmhw0oOATDlGFIUl6ZhH886oC8G02Rc8l5yoeDfPnn@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ6b0fPB9nr5lvbE6GjE0l6r67UYTQ3HZFKcWol/pRD3tAMNH6
	IFZUhAGcDPfukoTeS4wzo/IUliiogDls0Boz1IMGMxbydECd8d4dZg+kPEpQ9Q==
X-Gm-Gg: Acq92OFo0D+kkw3ANthBGb8lHsXYH8+cS1OrbBtm2SHAFtqhV4L6z3IeX8Rh4iA615h
	UPPefKtgk51X5FSw7u+H6/tUNK3XGmeqZppvH8/dyrD/E+uVy5x9DNYZoCxxyNhakq+yRdbDU3z
	M6MC29AJQ2ZfuBLUAL1Wz0gzTWG6xkxJXaDretV3TyE/y0mszkyjeSXsmbRsuqpp3ThTSjztu5w
	Taj4Ez3N9MA7N4SCd9kKpE/UPTvchOiiySE+2twEI4WF3MXFxm91nmbQ0TdeY9DGhdTNdOF8v7W
	Q4Q05ovChyDcDTRofy7FYalZOQuF5RF5Qa/kwtkRv5YELgZz9o0hPN9LQfw8r7dimvj1Puhkr2k
	tv4r66I5Thc96mb+I86LZhVup8FX1GNyLqBbN/9SPAlk9mtrk98Qoo2/sLovA61Ks65XCYWVcGk
	AGKGeUCpfsuGq7AK49dgvulWk3sfwQLq0Ww74p+nsK1+wycGsVEH+zNGNwlLbpOPhcjMy0HcPx3
	XRffZcU5WDlAyHf1CKA7hD/4lgmmuntmX55NunKHBMec5pyIpAYMA==
X-Received: by 2002:a17:903:2443:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2c1644dd3a8mr46147885ad.41.1780512592203;
        Wed, 03 Jun 2026 11:49:52 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c1:4015:6e6f:ee79:7998:9a6f:65e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm32139675ad.4.2026.06.03.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:49:51 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v11 08/11] iio: adc: hx711: split variable assignments in hx711_read and hx711_reset
Date: Thu,  4 Jun 2026 00:18:56 +0530
Message-ID: <20260603184859.89693-9-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603184859.89693-1-piyushpatle228@gmail.com>
References: <20260603184859.89693-1-piyushpatle228@gmail.com>
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
index 30e1ce321747..4ccb0bf2d71f 100644
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
 
@@ -204,8 +205,9 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
-	int val = hx711_wait_for_ready(hx711_data);
+	int val;
 
+	val = hx711_wait_for_ready(hx711_data);
 	if (val) {
 		/*
 		 * an examination with the oszilloscope indicated
-- 
2.43.0

