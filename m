Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1E397E65
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776523674; cv=none; b=qPnTTQkbRzM6xhrRO4PZLth5BntRw24tybqPML/dooWtP0+8CbL/mA+aJ4gO9xzCZTTC/Q78c7zbSIjJrDM7kz2GHRf5OAXzqmQDF4/zt5y0bNIih1ckXKqlP1tL6t/4H+4Thqmrs70m9oPhwGi1jHCkRn0z8oUbBBLVevKe66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776523674; c=relaxed/simple;
	bh=XKtOaV+bu3GvFb00eX45ajrX/DX5a1syVpVsKIHtT+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFuhLYZa68sSLlIRs2WbOtxrzdQ7sqJjwXgdB/7RzbdI/t6OeiS8P3gov0R7KaAI/7YMjwm7vo3EIq2HQCtq35g3Z3mJFar+BGY1OG76aKozE3OJonxISX5uWGAXI5cBUmkTc9UXOZR6o14GsZBY8/SWsprr5Fjb/C7APSSv40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwHZS1HB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwHZS1HB"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e91b06006so13026071fa.2
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776523671; x=1777128471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjixepHmZluQFzutL7IUoBNMtxTYec1nzIsEup2SLc4=;
        b=QwHZS1HB7y2cHsS0zZaLVw5mgiblgjtZL9OQg4LWZS7YHSOrwTACoGfkc+nBgrTwjJ
         l0CiPXZhHIQVP+DT5NlNUIOlDX2JhKdQh2rzLfcrPOC2WXuLpYhdaYqFWPRsYAoHI1VF
         im+iyRR0RFPhr4fH+bjE15Vf84b1sCnHos0710rtGpIygt5d+0T7l6bEYO+g2LpLlUAq
         YLc2nGAquDJmz4uHAEXiw8g0tqGoADWRJunJe5B5TkyvrKfzybR8Kj/IHGbQDN+d/Bo5
         1UgTxWWOmwM0eCz2R3OdS6DCpsseOndxbgeTKsNW32kCv7NM0Xq65ITzu0mvcwhBHV5u
         2tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776523671; x=1777128471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CjixepHmZluQFzutL7IUoBNMtxTYec1nzIsEup2SLc4=;
        b=e4zv4p3iAWfpxZHMlVV9+v3O7i4K1sBsbe1HGsVpuB+j1s+PpnactijDgl96PB63I/
         6GtbJwDcDgq6VlCjgRlHkiaxfIoWdk9xIFKcwIBfYYZLJpLvwUsgP5k+NBWLYXix3ywY
         1kd0FNoZ8JcU84LxTVOspSvytakLsHHhXOyWMRUnJfOO5TzmUwqTX4yV1YLsgKmgV/wz
         6lgY81U2SwjSkEYKEzhBd6hNlDZVMdgtMVALkyy1l3/5WyOHjn+UAbUwFcGw1PJ79on1
         i7hMsH4pLxXSJBpxmzI/dGTWycQdwOuCU/BT3T1ai7obX8SQtx1aMtv9o7Jtg/nx5I30
         zCYw==
X-Forwarded-Encrypted: i=1; AFNElJ9bdLCsvdFM2BqmW/WUVyz3akkAZtjVZnOdlO5SVZlV1VvFqS2RT3J3F+Rvkwgz0j+bU5jlq2Rgc0bp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83B3lS+H4PwYaE3QpOWyA3phnv7kbYkqR54A5crCR0/9JA1vl
	JWx+m2Hlqh4DHCCNho0HOSCBHzctboKs3113AtoezwyNc2mYWg1iQQQg
X-Gm-Gg: AeBDieseZJtqwsjZRhOBNdTJvqpfKktJhedoVqD9cbtMbz8Vfb7vofADMbmC+Cczdyq
	bALPnmY4de1V0eYh3i5FWGIeGcvW+jbPP5nfypXqxCSOxKWSAkKWW9feZO6E3JALkIzLbILCQAj
	GXyBUt/IyDXBIRoHGUmLoCsKKj/v+ncPRx9sp4Q8tas2eVnGBfecGLL5yPw+hgeSsWVUiJzQhaa
	qcALT6hxm9ewO6bxYOz7Tm8gbTZbJw84mxDnVQ+pnT2N535s4QLxJQYDnnvmSnoEdon5i73aCoS
	lm+Qt9+hnGiA92K92K8RVlZAPKltLvGE12lwq1K1+LKloJM7jM1YwiKqZTTbyDVRd/pAq3kc+Yj
	zrDz3MGkbZTL2/6wVnYENEjhnT5D8CNDwJIGzqrZVohEiE6JoWlo92XQG0Y5LPInqACkjADiVVV
	NvcbSquHipgxjKXkoHhl8wNAQ=
X-Received: by 2002:a05:651c:144a:b0:38b:f0f0:e3f7 with SMTP id 38308e7fff4ca-38ec77f4afbmr20680301fa.7.1776523670642;
        Sat, 18 Apr 2026 07:47:50 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f51easm10901001fa.6.2026.04.18.07.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:47:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] misc: apds990x: Drop Vled supply
Date: Sat, 18 Apr 2026 17:47:14 +0300
Message-ID: <20260418144716.132936-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260418144716.132936-1-clamor95@gmail.com>
References: <20260418144716.132936-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the APDS9900/9901 documentation, this chip has only one
supply, VDD; hence, drop the Vled supply. Additionally, supply has been
set to lowercase for consistency.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/misc/apds990x.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/apds990x.c b/drivers/misc/apds990x.c
index 742ab331a221..264335b581c1 100644
--- a/drivers/misc/apds990x.c
+++ b/drivers/misc/apds990x.c
@@ -113,7 +113,7 @@ struct apds990x_chip {
 	struct apds990x_platform_data	*pdata;
 	struct i2c_client		*client;
 	struct mutex			mutex; /* avoid parallel access */
-	struct regulator_bulk_data	regs[2];
+	struct regulator		*vdd_supply;
 	wait_queue_head_t		wait;
 
 	int	prox_en;
@@ -179,10 +179,6 @@ static const u8 again[]	= {1, 8, 16, 120}; /* ALS gain steps */
 static const u16 arates_hz[] = {10, 5, 2, 1};
 static const u8 apersis[] = {1, 2, 4, 5};
 
-/* Regulators */
-static const char reg_vcc[] = "Vdd";
-static const char reg_vled[] = "Vled";
-
 static int apds990x_read_byte(struct apds990x_chip *chip, u8 reg, u8 *data)
 {
 	struct i2c_client *client = chip->client;
@@ -597,8 +593,9 @@ static int apds990x_detect(struct apds990x_chip *chip)
 #ifdef CONFIG_PM
 static int apds990x_chip_on(struct apds990x_chip *chip)
 {
-	int err	 = regulator_bulk_enable(ARRAY_SIZE(chip->regs),
-					chip->regs);
+	int err;
+
+	err = regulator_enable(chip->vdd_supply);
 	if (err < 0)
 		return err;
 
@@ -615,7 +612,7 @@ static int apds990x_chip_on(struct apds990x_chip *chip)
 static int apds990x_chip_off(struct apds990x_chip *chip)
 {
 	apds990x_write_byte(chip, APDS990X_ENABLE, APDS990X_EN_DISABLE_ALL);
-	regulator_bulk_disable(ARRAY_SIZE(chip->regs), chip->regs);
+	regulator_disable(chip->vdd_supply);
 	return 0;
 }
 
@@ -1108,14 +1105,12 @@ static int apds990x_probe(struct i2c_client *client)
 	chip->prox_persistence = APDS_DEFAULT_PROX_PERS;
 	chip->prox_continuous_mode = false;
 
-	chip->regs[0].supply = reg_vcc;
-	chip->regs[1].supply = reg_vled;
-
-	err = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regs), chip->regs);
-	if (err)
-		return dev_err_probe(dev, err, "failed to get supplies\n");
+	chip->vdd_supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(chip->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(chip->vdd_supply),
+				     "failed to get vdd-supply\n");
 
-	err = regulator_bulk_enable(ARRAY_SIZE(chip->regs), chip->regs);
+	err = regulator_enable(chip->vdd_supply);
 	if (err < 0)
 		return dev_err_probe(dev, err, "cannot enable regulators\n");
 
@@ -1164,7 +1159,7 @@ static int apds990x_probe(struct i2c_client *client)
 error_pm:
 	pm_runtime_disable(dev);
 error_regulator:
-	regulator_bulk_disable(ARRAY_SIZE(chip->regs), chip->regs);
+	regulator_disable(chip->vdd_supply);
 
 	return err;
 }
-- 
2.51.0

