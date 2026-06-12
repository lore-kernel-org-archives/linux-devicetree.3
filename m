Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EE346777
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249009; cv=none; b=Ghm6zBJOF/ob+kggX+hxqUrMfkV2crUjnalOuaYIS3dUxe/jgMYH3fNdwHxsfQopwG2SNSt0W4ENQLQeeQm5O8GWu8kRzLWNfjbNnvRa7z9r3XcjvPJer5ZokNWEnVlliNc2mXVJ2Ogk7b2QP5SHc+BoRvhdHFW+jczW3eDCYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249009; c=relaxed/simple;
	bh=BaV5O758oRar5RTUsmj9w+tUOf355SflKEzM/C3X95Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qi7qvlWoYfiT1qrCkX+SPQwvreQDMw+jb6gMN85UQCM15EGpIdOE4T0GiDiUxXTJFDoQs3UlonI08dOkOPBLDxn5on+iM1FkZaCiYwDib9QDcQ3sxk1rtsett2+nOSrMOJF5Kh/wIUJKl411E87rrAYhD8U1Iko3uDO6zGnN9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxBtF60w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxBtF60w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b7866869so6015895e9.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249006; x=1781853806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T1d1Epw5U6/dAcfuifWImjl16XZ+3Fa2sK3u067DnI=;
        b=dxBtF60wNuxOmwDy4Q0qGkFZdf/xFnGxf+BamVOG8EcgWDpuuC0pmvKbdSkPWDjXdG
         NveZpXquJhGi2Vdze+CFJz7a6dc46eCmR0sKbrH5vFJ9a9CDSOzvhyxIGbpgNdSDEg8c
         MfBIBfWswIJ4l/uRuBBSsF1+aqA2ztUiaKjcumF4koondFq+SCg2GrF0Edzz37YEYcYk
         8FfOmwzNNKHr/Jy3rMHB8L3RJwzrMfIYPkVwBVZXTAWbnrCtqrlzNFZzHUi86fNC0RAU
         dRHdGhHl4vu7a3Y0BFyAXzEsBTK1iN2Bn+mWghiWkr/zJiVmFb30ygAn1+m/a5tuZQNU
         ItSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249006; x=1781853806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8T1d1Epw5U6/dAcfuifWImjl16XZ+3Fa2sK3u067DnI=;
        b=VSaHBCSYZOHQfjEgSV1DFohfa3qgHLE9j1e9FF0P+HtY15ow6S86ErFYBYxMboj5Ql
         57PQNDBYs7c87etIwRwJMTsV5/ofYMla/3XsYPxJar7rpIZJ/lHaygkdm7i0FACB97NE
         tlKfGdw/k89DIUzDHrYbDlbBodgfPySnwatWOtoKZmvq3h1KYdKyAhBWf9kXqCVTMgGi
         LAIfWmeCw9LwvGKUz6l2BoJtFe/mSRwsd63yf+ple7GvPwgzdp/JYTKF1oBWd2iW+UZ2
         WRojpuQfV11aDKmuDMfv3HIaHxuOcVVO6d1RGPGwwgbO0JdONmSnP52j5qXr32i9Q/7n
         GBUw==
X-Forwarded-Encrypted: i=1; AFNElJ/F57fVFrDOTECY9jZ0s+kIByXPR8r45mcSCqiTDEJOHQSgYtTlU7jvZ0RLFIJedEJYCUI1z3dIZT3F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+tIPuhBvAl+sBDW3LVkzSUJe9dY5mlyEIQQC8k8ACU2vAo0dG
	dd4BncW88LcMRV2tZjRfa8V4Z5ozWhWv69jXXIPHMoPt0eVX9M1RqIPzn18stgjAUCc=
X-Gm-Gg: Acq92OFL8MeEkpItHDaNTATuoxsd2LfssMHf7ba0TGAlwryVj4qLvIwPfzV8skGgzin
	wvBHU+KPgeVHyfqB8Ju2qV2KLgXsMCS/QciPErId4h00iu5xm0MAZA6ktVhpRgKxSMeJNkcFSn3
	FOKnys12/MUXy82sG3IdfBenYhi7IiyxHWlXgwfVdh6146LulZnrvTIeHMzd+68qGpSWYSqhJTE
	NfBNM5TsPy7bvXH3cogPGbEPrpg2md20Oa1YiCzJ/3MQWMKx4ipWACjbBp0ovyDJLn2I0ABnwWk
	R4bzPmL8dGrcLl2b51+h8aNMG1OUu0bY1K1aEjkfuDTXTp8b+6BMI+KiiF4JxYTPjcZA9BrcVQF
	YWrB8hLyt/nIIYuQz82RYjYbOlwimieAtliGFYeA9CVifktb5aTReloxN5QLgyX7BS3fsEsGW+f
	xG+pmUK6tKlAb9r9tBJ+0fQBEjXHZ0c4zHNhyMuV0=
X-Received: by 2002:a7b:c7d7:0:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490ec5215bamr9160255e9.33.1781249006412;
        Fri, 12 Jun 2026 00:23:26 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] Input: cap11xx - remove unused register macros
Date: Fri, 12 Jun 2026 15:22:08 +0800
Message-ID: <20260612072237.1177304-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
References: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused register address macros and unused definitions in
the cap11xx_reg_defaults array and cap11xx_volatile_reg.

This cleanup reduces code clutter and makes the driver easier to
maintain without affecting functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 58 --------------------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 485d8ba97723..686174722204 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -20,53 +20,23 @@
 #define CAP11XX_REG_MAIN_CONTROL_GAIN_SHIFT	(6)
 #define CAP11XX_REG_MAIN_CONTROL_GAIN_MASK	(0xc0)
 #define CAP11XX_REG_MAIN_CONTROL_DLSEEP		BIT(4)
-#define CAP11XX_REG_GENERAL_STATUS	0x02
 #define CAP11XX_REG_SENSOR_INPUT	0x03
-#define CAP11XX_REG_NOISE_FLAG_STATUS	0x0a
-#define CAP11XX_REG_SENOR_DELTA(X)	(0x10 + (X))
 #define CAP11XX_REG_SENSITIVITY_CONTROL	0x1f
 #define CAP11XX_REG_SENSITIVITY_CONTROL_DELTA_SENSE_MASK	0x70
-#define CAP11XX_REG_CONFIG		0x20
-#define CAP11XX_REG_SENSOR_ENABLE	0x21
-#define CAP11XX_REG_SENSOR_CONFIG	0x22
-#define CAP11XX_REG_SENSOR_CONFIG2	0x23
-#define CAP11XX_REG_SAMPLING_CONFIG	0x24
-#define CAP11XX_REG_CALIBRATION		0x26
-#define CAP11XX_REG_INT_ENABLE		0x27
 #define CAP11XX_REG_REPEAT_RATE		0x28
 #define CAP11XX_REG_SIGNAL_GUARD_ENABLE	0x29
-#define CAP11XX_REG_MT_CONFIG		0x2a
-#define CAP11XX_REG_MT_PATTERN_CONFIG	0x2b
-#define CAP11XX_REG_MT_PATTERN		0x2d
-#define CAP11XX_REG_RECALIB_CONFIG	0x2f
 #define CAP11XX_REG_SENSOR_THRESH(X)	(0x30 + (X))
-#define CAP11XX_REG_SENSOR_NOISE_THRESH	0x38
-#define CAP11XX_REG_STANDBY_CHANNEL	0x40
-#define CAP11XX_REG_STANDBY_CONFIG	0x41
-#define CAP11XX_REG_STANDBY_SENSITIVITY	0x42
-#define CAP11XX_REG_STANDBY_THRESH	0x43
 #define CAP11XX_REG_CONFIG2		0x44
 #define CAP11XX_REG_CONFIG2_ALT_POL	BIT(6)
-#define CAP11XX_REG_SENSOR_BASE_CNT(X)	(0x50 + (X))
-#define CAP11XX_REG_LED_POLARITY	0x73
 #define CAP11XX_REG_LED_OUTPUT_CONTROL	0x74
 #define CAP11XX_REG_CALIB_SENSITIVITY_CONFIG	0x80
 #define CAP11XX_REG_CALIB_SENSITIVITY_CONFIG2	0x81
-
-#define CAP11XX_REG_LED_DUTY_CYCLE_1	0x90
-#define CAP11XX_REG_LED_DUTY_CYCLE_2	0x91
-#define CAP11XX_REG_LED_DUTY_CYCLE_3	0x92
 #define CAP11XX_REG_LED_DUTY_CYCLE_4	0x93
 
-#define CAP11XX_REG_LED_DUTY_MIN_MASK	(0x0f)
-#define CAP11XX_REG_LED_DUTY_MIN_MASK_SHIFT	(0)
 #define CAP11XX_REG_LED_DUTY_MAX_MASK	(0xf0)
 #define CAP11XX_REG_LED_DUTY_MAX_MASK_SHIFT	(4)
 #define CAP11XX_REG_LED_DUTY_MAX_VALUE	(15)
 
-#define CAP11XX_REG_SENSOR_CALIB	(0xb1 + (X))
-#define CAP11XX_REG_SENSOR_CALIB_LSB1	0xb9
-#define CAP11XX_REG_SENSOR_CALIB_LSB2	0xba
 #define CAP11XX_REG_PRODUCT_ID		0xfd
 #define CAP11XX_REG_MANUFACTURER_ID	0xfe
 #define CAP11XX_REG_REVISION		0xff
@@ -111,37 +81,15 @@ struct cap11xx_hw_model {
 
 static const struct reg_default cap11xx_reg_defaults[] = {
 	{ CAP11XX_REG_MAIN_CONTROL,		0x00 },
-	{ CAP11XX_REG_GENERAL_STATUS,		0x00 },
-	{ CAP11XX_REG_SENSOR_INPUT,		0x00 },
-	{ CAP11XX_REG_NOISE_FLAG_STATUS,	0x00 },
 	{ CAP11XX_REG_SENSITIVITY_CONTROL,	0x2f },
-	{ CAP11XX_REG_CONFIG,			0x20 },
-	{ CAP11XX_REG_SENSOR_ENABLE,		0x3f },
-	{ CAP11XX_REG_SENSOR_CONFIG,		0xa4 },
-	{ CAP11XX_REG_SENSOR_CONFIG2,		0x07 },
-	{ CAP11XX_REG_SAMPLING_CONFIG,		0x39 },
-	{ CAP11XX_REG_CALIBRATION,		0x00 },
-	{ CAP11XX_REG_INT_ENABLE,		0x3f },
 	{ CAP11XX_REG_REPEAT_RATE,		0x3f },
-	{ CAP11XX_REG_MT_CONFIG,		0x80 },
-	{ CAP11XX_REG_MT_PATTERN_CONFIG,	0x00 },
-	{ CAP11XX_REG_MT_PATTERN,		0x3f },
-	{ CAP11XX_REG_RECALIB_CONFIG,		0x8a },
 	{ CAP11XX_REG_SENSOR_THRESH(0),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(1),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(2),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(3),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(4),		0x40 },
 	{ CAP11XX_REG_SENSOR_THRESH(5),		0x40 },
-	{ CAP11XX_REG_SENSOR_NOISE_THRESH,	0x01 },
-	{ CAP11XX_REG_STANDBY_CHANNEL,		0x00 },
-	{ CAP11XX_REG_STANDBY_CONFIG,		0x39 },
-	{ CAP11XX_REG_STANDBY_SENSITIVITY,	0x02 },
-	{ CAP11XX_REG_STANDBY_THRESH,		0x40 },
 	{ CAP11XX_REG_CONFIG2,			0x40 },
-	{ CAP11XX_REG_LED_POLARITY,		0x00 },
-	{ CAP11XX_REG_SENSOR_CALIB_LSB1,	0x00 },
-	{ CAP11XX_REG_SENSOR_CALIB_LSB2,	0x00 },
 };
 
 static bool cap11xx_volatile_reg(struct device *dev, unsigned int reg)
@@ -149,12 +97,6 @@ static bool cap11xx_volatile_reg(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case CAP11XX_REG_MAIN_CONTROL:
 	case CAP11XX_REG_SENSOR_INPUT:
-	case CAP11XX_REG_SENOR_DELTA(0):
-	case CAP11XX_REG_SENOR_DELTA(1):
-	case CAP11XX_REG_SENOR_DELTA(2):
-	case CAP11XX_REG_SENOR_DELTA(3):
-	case CAP11XX_REG_SENOR_DELTA(4):
-	case CAP11XX_REG_SENOR_DELTA(5):
 		return true;
 	}
 
-- 
2.54.0

