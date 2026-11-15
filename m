Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733325;
	b=HXhmgj0JLEEk4QiTtMl9j6d4hMc8AUo3Lf+/r98WEHOR5OYNpgh7df3UDsWTGmLQb6Wz
	 RShzuoTlA8RgTGSeoBnp3BHX3Qe6h2WFPd3X9ZM19NMLCnY1+WNweU5B5rSn2K48+ZkY7
	 HXsy6xyTJt3tCESgk0aMtXa9W8mF4LXUEl4nvRxIUOJBaG3B3ZRU48umAvIUm3RM1cIiu
	 C62AlOSYLJdhe+O2guNyo6wffZ2PZI+QnrhJJen3XbV4AJe2jx/vMWiMWZ/ALoBa7i80v
	 ax662EmDHrs5p4vc638nY/iKuzrFQnkqVarEPP2cJgXY6pSPexpfkm+T+ny3gDWfuWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
	b=HwPJH6jspfko7jHJC1VQi8U+MsBA7HsciLhT11X2aYIIkOlxMMAP68zWm1bAGvhRf4hB
	 TsOWjF9boDVN47pJDSg6+PTlpMzltd8EVcPgLxPsU/qn29oxX0DrzyDwwDDMpSw7mPS4y
	 qTuwNQEPb7A+skyJLaHLon1vFX30qvrwYyJm4qusa/Pi0qtYxQqcQMeeirDYbAwfZdUpQ
	 b/QfZXQHypYkUzWZkkyFyVp2UZdUmdPdQBidUSrKEshVtQok+Dxef6he/nZjR/dcH6QNm
	 tjqpkUjxLjaUTf4rmWgfGhFu4WpnzksGKqyFddsxKlvAziy6H2+MrPFohYHhHvLV85A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQCdfKgR;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88810606A330
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88810606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQCdfKgR
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so446990166b.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733324; x=1795338124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
        b=wQCdfKgRjSDN5un7cIV5u/eVKfHrhGXf38UEdfx/2tMsnkOf4bSZ5KcELOtnSXb5oL
         0tGvC0lS9lmQpyuvLAaABKnxB3l+RNeKAR1l34OUpt/oEiX6PzIWH6udcdgOafJk5ivB
         QoOo7uV8fnjGpBIuu9aCKPrkYi4Kka3TMnitG2I8Ve0hXGyhb1X145QLcOI3Ds401dGB
         aGigjOzS096fxuRybJYYOBRr9WapmXhXvfi427cUq8fpTYnO/jlV3+S6TofwNPkgEZ1J
         7p+7XcHsrJEtfN28qKBNLO2cmbar/eZpfPZ0aXksY6UbNQ87HpNE99ONCPG78335llAS
         4e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733324; x=1795338124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
        b=cJZy+ZPAB+MYZIAf7iPPm/D1UybEjF7vZUNJTy8OnJTTzPqaWqnjF97qPxAJk+eAog
         POv9lydJ68tZUN1hNT9HeteaHrdUxq/hmg3L4CrGV5mgwrHAv8K4zyjHft4DAAJBcKF1
         VxyrERgs3Sqr+km99hTAH0pCqQVQx3m5CH2Wg9IquLVDrkWqWXtL5Pw2CpTFm/SO4Q1b
         CE5mwEz2Mq83pbm+73ovl/c2DgMeQTgSd1Mw8EEphR+ynx0ImW90c0MXd2TXqli5ce0C
         Ok6W5mkevMMDsBECKVoyb70/KSK97WPbzNXlws5sKTUnx3wesT0uVFtaBTJmFqZmyNKP
         xH5Q==
X-Forwarded-Encrypted: i=1; AL+hErFA/DndPMRkXHdWrqYVuOwyfDEApQVvuO8S3eEffNpYJPr10RrEmOyzz4fF96agsMKviNoOz/3nkD9w@vger.kernel.org
X-Gm-Message-State: APuU4Z8VpOiSYNJzw5pdbepRXbJIZI/c7DPRPzj52kSrg7rJX/YJrbSa
	16UzpejJ9vIVr1+pZaiyAwM7B9PqlYJIGh60XnQ4NK26NDVFTnvSARWu
X-Gm-Gg: AYBFou15UP6ipAk5s3AqH8B+mv9RqzU9b3SoX5HSWrIZ4qAVkK4J99v2eafM97/KANp
	Q0vX2RKpH5hInNmVARHlkJhVQ7pE4f8FJnkymCjh+G7grlR7f9kN/SMlbtOv9z/TYaL1kFQs3Dd
	SS6kgcAziFks1R1CGqbf+SZyMvbOiJbah74D63FOrRMv+L/v/xNAIq4kKDNg/WVdDxXqdI5Zjyl
	ThakDZAQOa8YwtFH/RVDfPLx3ufDEtorEi0bQtynaXIHJ+2Qy1KvYE6r099RbNYqDWT6u/Rw4B4
	VdoogsCwvia254fihEFe8+hTjnGkFT2jkVrwKP1VmU8xLQFfqA0DYAEZrnrkrqKVb08lWJLaxoQ
	JQjek4Yltjd6wrapexkaYe/oKBgngn5K3QdAX6nLpiDK4jXTEAoeuwve+Ip+DR0IfaIsv/yZXOu
	8Dqb0lLyUM8f/2nYU9LGEeryx2XbLJkBTLjiqscaoFdtQTvzMbU39tQS1KX1UilLOR+6lhHv2U/
	9jE3+lJKFPAjVqD7gkpB7Mf90TKXpvDV3oCZKo/iFnCqSJQJa6QlDicT85lkaoI8qi3x/Hc9U6E
	UecUvDgvMxC/Q3qV3KsWVgyQeaPfCRkKuU80ZNcqYeaEZ7i8vAN5CvC2NTR9Yzvi0GL/4thqMSU
	hVkJSfpV7zQ==
X-Received: by 2002:a17:906:f595:b0:c50:94be:22ab with SMTP id a640c23a62f3a-c509633e68cmr632454066b.18.1794733323864;
        Sun, 15 Nov 2026 01:02:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:02:03 -0800 (PST)
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
Subject: [PATCH v5 5/5] mfd: max8907: Add restart handler
Date: Sun, 15 Nov 2026 11:01:47 +0200
Message-ID: <20261115090147.95337-6-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 17 +++++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 8412dab2133e3..b57c497334ea6 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -187,6 +187,19 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+	if (ret)
+		dev_err(max8907->dev, "failed to reset the device!\n");
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -246,6 +259,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..025874e5f8808 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

