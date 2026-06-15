Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750933A6E0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517116; cv=none; b=lECnqzIQ0QRIkYc5/48O4A/g9d1KznQTwUQ59yw1DWC6Y1awM49AjYeJo8YdLUQWnvR+cd0V+7xtgHcQ9QHgyHjs4TDzQvKL+Ti156TXyBXz/5vgpxPtfxL9pWE6HDB/s8L5pE6PJ0Y4iLJhzlcGkeCdeaFk4oFEOjo2fwG6SNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517116; c=relaxed/simple;
	bh=ETGqMavWeBiOQjMJHU7tbf74DHMQeX6TYULgpbT74aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTI1Ol65QEVzc/sxzG/bh1f6xrtIEw6CWDYbV0MB/WOj8UDWfKUtupnIzjjtgbLW18YsKlmbXLBGGaXmeHFTn/rAVP/JSgSCgfC71eDnUGbh3820O79wNlPU13R+u6S6UUv6hn8wJJe4fJ7ePNtdRL8F1yEj2vrVLZrnhC5dU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF/9v95P; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qF/9v95P"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso2268517a12.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517110; x=1782121910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nFkIvMOfm7ZS9BgOncXs0eGFftuYADS8e8/xvDEWbQ=;
        b=qF/9v95PCZkp9OGYx6K5UIrsDVFGUX7W6ydkvm1UvKnle3Dj3gC24/aJOVF3//Nso2
         JpTjoGMetXJZDLA4SqfSWkTUQdQa8BIGCdx8TMkXAGwc5ECe7doSH+Bi/Vj23oofioGG
         UA/pRzCasotJVEKuK/NlGPARxgihV7ln2TGanMsz3xPbWpPsRtUkX2+lqlCP9DoKWvPF
         V/f0r574+ErnnZ56TTcFrlSTDcB/VOf7VOfDuiahaMZIYxpjGdf0ZmPzUcqfoElCQYhy
         XX1E0KzHxqh/iY8X1UlZEkG0cYrkdHhFqkLDS77qYgwTfG+yiH6G7arbDDG+qLJ+b5s0
         iyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517110; x=1782121910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nFkIvMOfm7ZS9BgOncXs0eGFftuYADS8e8/xvDEWbQ=;
        b=TOQMaaG5DxMxv7iah7oasY51wRfBgDnKMk9wf4dCaNCZkjmU1QZPhPIVmbBdzbfnwG
         xzjdnkKuC/yZ8tMACzjy15opvLccaVIVE8HqD22OGwf1SeQwwjeZWA3crqM8m5SgkRVi
         yCcjpz6e1HeZ4lg2lxDt7jLwIeGm9SkAuluskX852ZQln5D7m183mRamNI/wrvV9pI+O
         Ols86nT7MKn7khdUHHxpL6rABQ1tWxyXo4T3oys1yCnBb4f8i5lri+IJne5LXx2WxY0z
         z8S2BJfmMBkoW0JwYc0StQv9HSgdEehdJedy1cbr+DKjwID0k28hPaMF+rOjK2BxEbEf
         8Tww==
X-Forwarded-Encrypted: i=1; AFNElJ9YUGrZhAcr7FMXXUxd+F4kP9a6c18hO5NppTbfUFwkzuNhFA9kwqsqboN0iC9wWI1DsXQqgeKqWiDD@vger.kernel.org
X-Gm-Message-State: AOJu0YzoViOvDGGtYbcQ0XA3a/TzwezVzAcerlme4sp2+Vc/9OCj16oy
	PzTgyXX3/B/2qji5jODr3F/2n194DQD6St+GC4h7gej574cTl9NzqSF1sGlDNA==
X-Gm-Gg: Acq92OHRRNHq8YNFK4X8gpY8njTijWFVnA/U1IwBdA9Re2onK1iU7NA5GovWNukmh+V
	cWsr1CLtK42dcVaIllOdaRhW7Cq+J99/4lf3xmwDzK6w10dUH9os49Y2wF1SaLbQHMjcFQJtXgo
	gJjfgI8nOHImEm9h0zD9IfiWKBIippD5D4WfiRdHgw7mkQZa2DDyJ0U6d+oD+8YEwezAVXOICez
	Ji04NAaMgouGvR56J29xBc6RxRfrE5m7hRtDKUDd/YXviWhqVSAx9WoJq6yngzSVnsNX9A9VWf6
	ZKaKOEN0ec3T5aDrYmeyQ36pm+dHMAKVreKs5RkpoD3yCas5G3PTZdBiv7cm1nskKt3QIVDZFMf
	loK5Ak9hqfIsjlEIm+6ie5VTFIt7tV55r/CNQ/HZAY2akfC6aG8a7eW796du0hAprg9LYKtboN+
	lxml7bC7JTAX7ZMfcF7ZTgayfzFnszSfOkzuX/0kiEECQSkycl+LgyzX+dmEi5Rts2sw1WH0Icb
	pdO
X-Received: by 2002:a05:6a00:2d21:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-844e1a2f1aamr10649157b3a.22.1781517110139;
        Mon, 15 Jun 2026 02:51:50 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm9922207b3a.33.2026.06.15.02.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:51:49 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 17:49:17 +0800
Subject: [PATCH v3 2/2] hwmon: (pmbus/lm25066) add current limit
 configuration support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v3-2-decb4f5b0b77@gmail.com>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781517101; l=2406;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ETGqMavWeBiOQjMJHU7tbf74DHMQeX6TYULgpbT74aQ=;
 b=FDP8Iq+zzz6ciIgFDabF/U/Du5LF+SBtaWRalK/5mSepbgKtRAtuNmJE4X5s32CiALU4zYxsH
 8MQNDluhGpfCbBlW5N+Td4kCSm94Azf7GOtvVFKGcFJqGRc0qjPV04a
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add support for the 'ti,current-range' devicetree property to configure
the current limit via the DEVICE_SETUP (0xD9) register, overriding the
physical CL pin setting.

This configuration is supported on all chips in this driver (LM25066,
LM5064, LM5066, LM5066i) except LM25056.

The property values "low" and "high" map to:
- LM25066: low = 25 mV, high = 46 mV
- LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV

The Bit 4 mapping to High/Low current limit is handled dynamically on
probe because it is swapped for LM25066 compared to the other supported
chips.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/hwmon/pmbus/lm25066.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..53d274033d66 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -34,6 +34,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_AVG_PIN		0xdf
 
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
+#define LM25066_DEV_SETUP_CL_CFG	BIT(2)	/* Current limit configuration */
 
 #define LM25066_SAMPLES_FOR_AVG_MAX	4096
 
@@ -484,6 +485,42 @@ static int lm25066_probe(struct i2c_client *client)
 
 	data->id = (enum chips)(unsigned long)i2c_get_match_data(client);
 
+	if (data->id != lm25056) {
+		int config_new = config;
+		const char *cl_setting;
+		int ret;
+
+		if (!of_property_read_string(client->dev.of_node,
+					     "ti,current-range", &cl_setting)) {
+			config_new |= LM25066_DEV_SETUP_CL_CFG;
+			if (strcmp(cl_setting, "high") == 0) {
+				if (data->id == lm25066)
+					config_new |= LM25066_DEV_SETUP_CL;
+				else
+					config_new &= ~LM25066_DEV_SETUP_CL;
+			} else if (strcmp(cl_setting, "low") == 0) {
+				if (data->id == lm25066)
+					config_new &= ~LM25066_DEV_SETUP_CL;
+				else
+					config_new |= LM25066_DEV_SETUP_CL;
+			} else {
+				dev_err(&client->dev,
+					"invalid current-range setting: %s\n",
+					cl_setting);
+				return -EINVAL;
+			}
+		}
+
+		if (config_new != config) {
+			ret = i2c_smbus_write_byte_data(client,
+							LM25066_DEVICE_SETUP,
+							config_new);
+			if (ret < 0)
+				return ret;
+			config = config_new;
+		}
+	}
+
 	info = &data->info;
 
 	info->pages = 1;

-- 
2.52.0

