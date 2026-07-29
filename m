Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195330F55B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300404; cv=none; b=g7ZcVB4gtt1HOZ71XCdHgShTZU7omS/+vFGztYUnrf0MRdYdxkjrGLuVNKWe9MTQ5973JBCugISFPjZk13QbT8Bl7D8c4y4djsgVwBo2+2ZerwICOX9il2McK6gEnUou5IPKGo8BwfKQgYSDJvbLLQqOiM9jSlRq4S7odll9n5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300404; c=relaxed/simple;
	bh=rWZwf1SmZmy+I60NhIjL5+z4C+Nz7YTugxwvI3MpXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZV/szk134xNtGpulVqVbVmmQxznG2A+cnbkuntvPxXY7yu9QLRLDMNn4n0BW7gJiNC+KbhIP19FsnssalVIyEDrJMHtrvWmd4i+unOZ4uQVn00vb7tZUT2bxa11X6kKnhIQvwrAI2FNxo5TpXv3bZti/ybpqsLkpR6M+vPJkdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIEHBQqG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIEHBQqG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383cb94f742so595251a91.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300402; x=1785905202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=SIEHBQqGEFgXbC2VXV7kxS12kxpAT53rF78v828mVe1erULTDz50ne5LNHaRpmYypR
         GV0h8RC81bamgIPop7rsw+ShB40YInRRSNMUrYtK1WFgFxkA8lm60crnNHxNMtpza1hs
         BHOYGNzFSUWZTxQm3Ub7PYCHMoQQMyWxuNRvpTRIox2zQ+u6m93rzC3T47uitc27jTQ1
         z0FXJe1zFAzbDtaIlmTyRka7uMpdONu6Hkxz81B2CaLivSU0naD2GoE7AmCzukmxH1BT
         sYzq34zJxS+AtYvqy5OH3PA/VMAObzwFSfrNTfJn97KOZVMHAtWhsKbTRaeG6frE6uxh
         +ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300402; x=1785905202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsowAhie0fn+JDFgZmQoMRNcudB/ZaxkZWEVB+SjP1w=;
        b=lawyvuZIgIITwVnmhVli0TvMQmY5ltrr1O3BRbOshEAWOcHol89VFYBd6LDuwJkwFn
         taVTlZM+fzk9iFjnxnaCKN4w3ljXreb4FWQ8fIWtFxK83Kv78/xCu1lgqdxm/h9ZlOoX
         rOJY0nDqcpAWwEI22Q2EAYNZJl6uaXIM0RbMDE2uR5yikITtLt+UwFCwHHCgTyvGwR+B
         WtqQA+yA0wGJykGB7ZmpTsFt8f8JwXV30s7DUGsLccSEw9lPTJ7qRK3pNHOYGACNmXdh
         4NisRNUWC3UyJPvUn4Rzob+mLY+gb5KPVBZTni8mJDPQwtVHGCqPjaqfxDBPSRGnSx75
         k4gg==
X-Forwarded-Encrypted: i=1; AHgh+RpLdFTmUTxhR1ERrOfD+8uxJg6PKFbzfPa788V0gL4FWhABzUOGh8l9thVWn5ROO2bvIDpL9J9b7+0q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8rt9Ewchxeh9hS047YQAhQqKpIOnPc7kmMN9A05F23TB/H4gv
	nFykZnOUSXMQGDhBvLjdUJN2JAi0gzUvA7BWQbhoEKHq0qWhHQ/aw5qa
X-Gm-Gg: AR+sD12xouFZ5s09tvUthk2uDAxoGQ2j5CJpUn+1nN1eZDP2SlQ6xICFkOYWMBNvoLC
	wuOxg+ITFGJCHbt5gmr72HSmx0OAezqPsIbCnenOeKLLr8A6S1tdY0G+NxW/xAfYBSYyXQw5Yg6
	Cx37aZHBWCpR8r8HHxhOaddDM7atyxdjEIyfng4M0UJItAwdIEplwW28rflrv+QcSql4z01ZPvt
	Lu/lhIGJkun9jtVFv7lQpz6+dQ+uE0/dgA5AjbI9QcY50tcaoZanLAvQ7Wx1HSaiPgnjUR5ZxU0
	Smz3h/6WdAbQmloak3cgG13OMqNWIh0PAZNvuQgBwn+ZFCywYDzgE1+KV4AoDdxgaSyh7DOdey2
	z/vqCjNuxGBEVOLR3L1zPtNF2KZRlUVaSW+rU/6UkjIXF3FLzH29FOxRA5/JAJ5CeowjlkTCUM+
	/V9WKUcXepQqJl2yPmDl7J51+lHDe4ZOmLEw1rkGCg4pKf7LN8JBgxnp5RmYKi5qF6Dggq4ITeF
	hi8
X-Received: by 2002:a17:90b:3c07:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38f6a1968f4mr6147224a91.0.1785300402308;
        Tue, 28 Jul 2026 21:46:42 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm4730437eec.10.2026.07.28.21.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 21:46:41 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 01:46:10 -0300
Subject: [hwmon-next PATCH v4 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-adt7470_thermalzone-v4-2-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
In-Reply-To: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Instead of a magic 255, use a macro to refer to it.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index c45b984c02e6..87ddd7b8ddae 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -100,6 +100,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_FAN_MAX(x)	(ADT7470_REG_FAN_MAX_BASE_ADDR + ((x) * 2))
 
 #define ADT7470_PWM_COUNT	4
+#define ADT7470_PWM_MAX		255
 #define ADT7470_REG_PWM(x)	(ADT7470_REG_PWM_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MAX(x)	(ADT7470_REG_PWM_MAX_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MIN(x)	(ADT7470_REG_PWM_MIN_BASE_ADDR + (x))
@@ -850,7 +851,7 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 
 	switch (attr) {
 	case hwmon_pwm_input:
-		val = clamp_val(val, 0, 255);
+		val = clamp_val(val, 0, ADT7470_PWM_MAX);
 		mutex_lock(&data->lock);
 		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
 				   val);
@@ -910,7 +911,7 @@ static ssize_t pwm_max_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_max[attr->index] = temp;
@@ -945,7 +946,7 @@ static ssize_t pwm_min_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_min[attr->index] = temp;

-- 
2.55.0

