Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733325;
	b=0GdeTqahciEQquTu+ly2GMI3Nwxyw65MICovjFZ2M/r1ZnR+XiBKzy26a0J51vQb4E79
	 0U5q77jyFMQ3dafHOttvMTNSItkNvh984N/sT8ipSp+yZUqCaMd/f1NHPCedblI1W3jrJ
	 8/S4JI5tT7J43r5rFGnS3anw8Vj00sduierPzE2xTn1moiV/8txYrUHbC9h6U0fdDGT3E
	 UHU8jxy5WbeOmR8+uMBaISmzPAvkMu8U2chw4dE73zwpjZALDeeVM5qzyAQXFYULzMjcc
	 Zf1wXSqk4omJFEHUhvqgqMtV5UjaN+/PXlIAkztwPTQxV/ELxcsvZJzaIUig0ZDTJeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
	b=hU8WkkzCrNzD9aE0QSKeodYEd4Iu4feHgfg1eTlZW6N6j9dI211x209SgryuHVuC2p2J
	 sxTAkdxDwc+bBqsJhC2gBwKN8VjRthPtA3gOpW0hWWcnrltw6pfTCUtrQYK2YEhN5TpRr
	 aOipKd+vboOKwW9eT20B+qGel9dAF2Ba/KtgWrQJjS5WdGNoc5sQ7JtMIQWoYbwqrH/NH
	 bsuW9dO1Q/AtYZD2B0UxJGkoqEevmYqtXQ9tqFXKBxM1tRQWE2RLKOJUju+rooPCOg9Dc
	 c+LjAclK28CQbPkTb/5JHzoCm5CKwM+vpMSr/TIjYPpF0uJFwdh4Ss/it3mHiqrECAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNbn5TYI;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C561606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C561606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNbn5TYI
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so189105966b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733323; x=1795338123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
        b=MNbn5TYIf/3m158dUPO7+7WNtkW/VRabw5aJK/Aw7+W3D6EUxYKIp3BighUBxk0q4S
         NAFkfHGSGIQ7Y6v4R6xpWg80p7qkmOzVe72k0+j+26NLpCHFGr6D6gKd+T3y9M9pD5yG
         iAm9bnETom8l099Y31vOryZVYcp2dxUj4UQ2zfpDh6/Xcav3L+Lh+hiiyAbD48vxhrnv
         DGM+SqMJ4/iIahbcaVYPUP7Smvj2wS8qqDVW6aXdFcDb7i3FUsoGaTQRrkzzDPOoCFAu
         fMw0HGC7ARk6UTBPZCRHoA15EiwewHSlarDvTREpcCDu4MoF8nVw9znHvBIczylSuwWo
         y4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733323; x=1795338123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
        b=B75TLSMeALFsHzAAXlbGwDiwAFg4o0RutEQWMNePEssvq+HFAXtP0fhIq5/1UAZDwl
         TKskOMREVhjNwGYsT65SR3ijQFy+4ykFvztq7URbyaZQ/eFwu+47ugc1KdQJnrrzmJbX
         gU3Ci8f3DB1Ps5kUOQkBslqKwT4gN8RclrokX7y02hBKTCxW7rzlXMXCyOuQEJ6hnB4a
         GpJGrp+sNTZEm7w0tH6zReENydQN9CU0aEpQ9KRLS9kjyXkVM81uQpIBEr0oLj2qYsJh
         LY4yTy+qKQpGIvrpuRNyB90lu1ZM8oqOB3EkVQwowEkqTAnMpKh6eBkUpfoC5mBQ8s3N
         Wrxw==
X-Forwarded-Encrypted: i=1; AL+hErEjEj6DUMcSKHQj3cyZx9ggTHX3sO/vp9REJocjrxdF7z7rjlzWNQms9YhXxv2LoJssXmEb7nIcPc/A@vger.kernel.org
X-Gm-Message-State: APuU4Z9nsnJtwnluErze+twKrH7MHYzZ7ODhHOWzW1SmIIyHhTtEOOjp
	Q1y5ZIw6y0glRyqVeoujfo4uGXPmlT0Pb5+wPvzbEpb/4X96tC28unnO
X-Gm-Gg: AYBFou0B+FELxpyYnPXoGZYJz76LqBN7/5P7wMPOPmALUIPA3Q8crYVyNSL0QtuH51h
	iiJAMN5Xr5WCXLUhYSwtHqnHQUDJpThYy2ukJZw+qhhz3nJMdDJpMZ+yVI8hXlgHCbpPFu70UmT
	vYB+touYjoO4W+7hxIy03NhKrDvBC6zLRgLjUu64KT5s1TNyTAWpBXHcZQ611+vgRoDM1RkiZ1Y
	Qh8efXn79m05XpAmS1XQaQS0mYRACc60cbRwhsVQ8t67zS5SzpCTc/DQTcN8yL9XFayS0JVG771
	4nF5mAhekOEiGJVDOeSsgxo5jS8TP2EGy2vHq9/pq7vJGILb+2Y1cCFjHxl1LTEMLUF0bVgJyoZ
	BZRYw0y+sNUj+W3jd/PEfdwuqJLuW/wB/mRlCCttjMBBAI05pUkmQH2F9FUWnZ79+KlGvS8PR34
	dpBbQBY2J28zCARpufNa/RlQ63vJXE2p/IxR4vRQ2CuTCiT7XhQVKeQs6MWHNiuZ3sGIHwq/aby
	jYb3UxuTYRLHjYXx0UDiRj4SOzr4IgSvP7WciKhfiQENpfNZsqSp8qzg8jPvaI4yizViURM09Wa
	41GHdYZmOayPXTMH+0K3bW7l/Gu4zbxyLRJa5UVGUvDtanBKFDN/ndxj3BbUTVbCY5AvbcJdxsx
	aoOZEk7/AwA==
X-Received: by 2002:a17:907:3e8b:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c50964101demr575842866b.39.1794733322499;
        Sun, 15 Nov 2026 01:02:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:02:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 4/5] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun, 15 Nov 2026 11:01:46 +0200
Message-ID: <20261115090147.95337-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f6d7a4ce9712f..8412dab2133e3 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,11 +174,17 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to power off the device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
@@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

