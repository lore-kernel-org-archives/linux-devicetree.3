Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCE226CE32
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758342; cv=none; b=OzELMHVU/VJibwiTqXGCu581xONqzRCYRFYvvHexkCMQTRKbCcUS3n4N7a1/dCVS+r4wpfamE+rYNKbPCYt803lX6QOJ0q3tFpNnwX0g7mIL/Z/ed0DU+mhQjWnHvQtg40m5DiHz6ErRlhu1vNmEEk93cC4IwtGEePSt9uCNHAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758342; c=relaxed/simple;
	bh=BaV5O758oRar5RTUsmj9w+tUOf355SflKEzM/C3X95Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f125wV2R7bltFL5si/DDnnrYrlGUS42emE7Az7qnhCaalemXYGiq21aZRJyEcz5ebw90kBfpJYWRHuj8XsdtAwiA2OG/al+f7NLCrPp18hHW4YZNzH+CRK7BGj4/O0Ft5sRX/5oe2D6UWGGz8G6/PeqCJOHfkEB4WBpZ4hydra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEpsy+zj; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEpsy+zj"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137bd9ed2b1so964234c88.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758340; x=1781363140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T1d1Epw5U6/dAcfuifWImjl16XZ+3Fa2sK3u067DnI=;
        b=lEpsy+zjN0tombu/FjjjppZolOW9+PFV8ckOeo1E8cT/P9/cF6G72vGcMDYvCvvlJU
         dXl5UYj1dDdLt+DLZLbRGMKAh6u8Er9pQm315Fb8GlQF7ulFkR0tnk2NubkB33gYaoDS
         izNrAGVHT+e+0cifGVcQUBXHmE58Ho6BLf0OrzjzfdXc78df+5MxeXj6KaS51Dr9x1Uq
         fNJy+7CcrVU/q96EUrFu3eGu7GL1qbQSG7L5F2n7pZnH9T7lsB+T/kGovanCE8PwdG6s
         m5O+A9rme3hEWIaXytsRNjjMz8P8y1bqz660M+imZ8R0URc6nPt4u9zZtkCpCccQSNTs
         SfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758340; x=1781363140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8T1d1Epw5U6/dAcfuifWImjl16XZ+3Fa2sK3u067DnI=;
        b=gQgBUujLQm2vK7WQuhG2O3aeYupJMNRszqz8fFSW7SaoOHbX7hn7NSkrrXyRdqwzHT
         6ZdgYVW+ozr1SOiPjjibwjPfLw5Gu1XaeddPdw2G1L3diD3Ot6Y1RpKRycPR0IL+VTQv
         J8LvntmtGZeuF9jK3trylQn2sh0VPVYEWRY3wg+/NE3Y/k5N1rqYwGGoJ44/ErxmBzwI
         X0oc1pHjG66FuhqbY/9vTzUUQkLPje81VLTQsH5ATc/idW2mZPu16V7jwQzPGfxCZ4g7
         hnDlrvQRrZD863GzLSlfgIiFBNR0EGaBZeeBYbmmUFimIp7vZYtb1/ztyPHB4nXYsFIE
         EPnA==
X-Forwarded-Encrypted: i=1; AFNElJ/t/7dZwy7X9YG7v4GiiflIkrGkO2aCI5l/PVCqjpWt3a5PTAjhLyb2Ul+eGxuttPG+kuMcrL/jz8/h@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfXW+u9L34Ey83bycTvxxAHxrfVOGAm3L7O6EhNUzEQ6IlAid
	sPt4sdLOnIwRO5J+ejoeHeG926BzfMXFNjFLghoAmHKpNUCJdXuTiyaI
X-Gm-Gg: Acq92OHhEOaeKqhz8Er40Swuvf3zMt3bi3ttdtAjFh5LPqF6GI/du8kU1K5Tv8IgAWm
	VNGipLJm4PhWVqGJoNA4Wg3RfrBr3tvcA8/CbIn9hLyrbrWcVloz1aDMqSqgSDrhCDg0JVU6dtW
	1db4AW0ClO57qnwKWDaSKrfHmO7g0920ktbfO8IzdEfvFne6dqH66Sz3ED4lw7FXbDHnZiiuWr6
	HwXeGCNneJWVysnvjZfyGmnYIRWDD7Y1NHuX8evtN1Lun+LvUgC5Me3qT1/JdGwHQw4c4FCRdmL
	bwZNzTii6yLeuNbQajWIu+M6oQEiuTIuUCu5bPxAOwJQq1B2K3gaMN2GluYMQtSMxOkAoqlmdhm
	SVvL8YjYgrjtHXQM6or0bwhdpacsFU3WjwEJxo6fdmuaqpEk9ep/zrEpqXUfQ4UYugcpU1UTsCW
	4CXtCb8zqi5i42bLSyjxA0yUoMPCvDzG6rMvIzlHBCd39EmKpr7Q==
X-Received: by 2002:a05:7022:2397:b0:12d:de3e:cbfe with SMTP id a92af1059eb24-13806767673mr4808249c88.37.1780758340361;
        Sat, 06 Jun 2026 08:05:40 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm8415607c88.11.2026.06.06.08.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:05:39 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] Input: cap11xx - remove unused register macros
Date: Sat,  6 Jun 2026 23:03:55 +0800
Message-ID: <20260606150458.250606-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606150458.250606-1-jerrysteve1101@gmail.com>
References: <20260606150458.250606-1-jerrysteve1101@gmail.com>
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

