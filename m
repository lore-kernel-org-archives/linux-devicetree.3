Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903869;
	b=lV/mHeSfJWQY0/5JZUSqQDxAkpuXTC7OyCWzF379+lobcByRJdFq4u1G06PZceIDsjKT
	 /iKfeIhUDmlPJxpXxUvUVy2YdbDutUM7jNsRxBGWP1Y/kfZKpBl/AoHhATarZipWbQ8gy
	 1GtlhfB4qFj3DHRApRdGkbXOAni/9dlGF918HH6zSpBBf9B0AxSy4LVTbmXrvztsLpcWS
	 cAnTWSXgvuoKnF96o6LXprfE3cQr5nAKxHDdZlZ6HuRyEEqEouF3j0ZCEncLk8sqVNxRT
	 tYuB1G9UUXzR66Ncf2K2Mkogs6fCQ6QnsHHrWQKhAfi8zoqFJDplybhcQkAtaj32iYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
	b=IJya/nS4J3BomIBBm1SuswuV8Rqx/cP7/IYhY7qDLcZqtJ+u/Kas1C/cbcIPcHx7ZAj8
	 VvvWWIAk5+aAD1eFbkvuiYQcJ1WB9LSVJqWDcfbsdS1vqclLwM1TbE9+mvYz1ioTH5yq/
	 gA6aFCxe7KuIRvqLaL7aiTdgsPyi4+loJNIqF+UV3lFuJE9JW/NZ6y1+pAvgWTkT5V858
	 uu4O0BJCEVdbK5YOqtcKzjSavujiBYeRL8Pav7rYDx9DLgZhpeJvuHFn4PeI7uobFPmRG
	 c8R0TnxvCwOs7si39xik8bpQ+Jfp96uy+EXRaV9UFsYTvbzgXnQfbySIJQtX7tnOGbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qJ0w7yjt;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B56606A88C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B56606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qJ0w7yjt
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso2595337a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903867; x=1795508667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
        b=qJ0w7yjtJE1lC1zKPwOibwHew9VyeF40XwkE7/3yvx5PT+Ju5NAaJ4PAYpSd+gwHGY
         w7cc1v7y04SypaBVvpt0FdJ28SLaaLsSZoQeNlJY+q4fNMRgEosPLHV3CHWwRikNnAx1
         GmpPsBD7FywbCP4QoC/tQcG+Bwl3jGw0dQYN3ntPTRr5NsIOkJK7aiGBYTPyHA9B3Yhf
         m9wg2+ELiGZz1v/ioIhxWmVh2DL4jz1BZ6oJLEFOPFEMV0/0NSkxHHhQAeV0VysiAjI7
         ZrbLuE9PTGnkywNGKg28gayA6JsZ5rWJo/l+NwLWZQZynBQktGrHxtKU7fZkqerZZW1Y
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903867; x=1795508667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
        b=ITFdE3Te1Bm5keG74laPJa0Nvr34Rf5Wd6mV5qa/nHyJRofj4IivrAvh7A9l9+J6g5
         7VB2CFXfKuJ4XWO2Na5rjkpqh6fW6KzilFrfuGn+35dAA79tJrYtCNS5u6jEHtFk4Uxc
         M3NPz0LhIeXWkZkqqhR3ULUaGpN5HihT7S4SA5SzeS0mU5XLR+4g/UcqpaFJ8f1aVSnI
         iJFZOHOgSbtB90HatsbgbgYaIJ3vHrKf9uyePYRuKO20CSVsvsZ8uVOEm6E8MFrTBj6V
         4TFqcrIwIu+eyx7mQB+UGJV1fxirNDefxP7GI2r1egb9Bu5mVsG5RiMInYTkf8waaJHY
         wDSA==
X-Forwarded-Encrypted: i=1; AL+hErHkdTv1t/94plnI7dij7ODKWenfBMcO8niVv9xqSW2pHzS2NeoW662Aw2WO0nC0kD1YJtFJUa0WJ7kk@vger.kernel.org
X-Gm-Message-State: APuU4Z905BeoM1MMfTVgLXhkz1489XbD2ipA9SGXUrcQ5MtrLNhEghLf
	Lx5w6ebFHHnyN3VZ5GH8OV8r/6PQ5ulgcLgkawBP9/gNHwAmziM70BFs5l//oPg4RiY=
X-Gm-Gg: AYBFou0gr3W1nuWVp/ZB1raVNO3fZNK1yGQ9oHj/u8haKwO4X4eUHPQFSjziW9sXPZm
	s9PztFQDejKZ71ZrLEPilt8S8X6U9sDTLI1uqIr1xVgwW0yQ6j2G6WQBLQUGLvJt6YqeJQTr17p
	TaaD89zKAlCgesxYV/EFk2LVYeQdTtC77QLwiDM/6dkVJO+Q1v/PlN1CymznvCsmPXoVgLaWjTF
	hsm1LTTadxOGmwD4EGfpZ8eW0yPV6lSy7yluk7AvmBJvV8PujZf57QVJ1PPPtdHDv8kJnorsoXE
	hI6fkjmVd9438APUhiiYr9MLK5G4o+X9o90dJc5+FqoDBqnjFXliEU1RAesCBZMLCZ2IfN1pJlz
	UoA8+g/LcltaHcF02p4sTk8Cx+9wlL4ownCmi9OXAy5042Y+ekp+ES4j3x+/UzpBkkB/s61mA3x
	kgeL6zKc4qyBXZJs4bb5YVYcehScZkiLSh0kLm1VC4Iz4Qgg9HolVQbYkwIGPDiAhe5pPh58tC9
	1m/xofq2xATTBO7HWJ6eceeOJHVn1RECaUmxK+H4JtPCoHCMUoY3Z79PuHcY/ksba/s7Fltoa7s
	pkFH7Mb7QxcNdGlDOqz7xZiQXKHfAyoYz7qqJFKFkIws+l0NArpCR9+FbzU6lumsSxeaY07ipeD
	sOBHNr8n96tCkRsfezaWUxDKpqSroRhhyDoWbmG0l3yyZ5RKj
X-Received: by 2002:a05:6402:88a:b0:6b5:5530:c9af with SMTP id 4fb4d7f45d1cf-6b7c0bb79ebmr6791992a12.15.1794903867414;
        Tue, 17 Nov 2026 00:24:27 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:13 +0100
Subject: [PATCH v4 3/5] thermal/drivers/generic-adc: Allow probe without TZ
 registration
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-bat-temp-adc-v4-3-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=2598;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IewvetNZMf9FalFWEd0iq4I/lCqxZHq/FLtsO53H2jA=;
 b=K0QTEVwf1uzSjckbKxKpcCKrAkkngarK9NjPv21hTvhJ9thkoh3P+WGons6vpo/CWOd5JylkV
 h4KSZ3LpFcKCi0kZt4zAzExS9pRPsxol5yvMrSY/2FHbt73E/Xe8w2m
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

If the devicetree node is not referenced in a zone under /thermal-zones,
devm_thermal_of_zone_register() will fail with -ENODEV.

Since the driver is now also registering as an IIO device[0], allow the
probe to continue without the thermal zone.

We also can't use gadc_thermal_get_temp() anymore because we haven't
necessarily initialized tz_dev.

Link: https://git.kernel.org/torvalds/c/3762f5851ac5 [0]
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/thermal/thermal-generic-adc.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index c6a7a65aa6a6..b73cd47bffa6 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -55,9 +55,8 @@ static int gadc_thermal_adc_to_temp(struct gadc_thermal_info *gti, int val)
 	return temp;
 }
 
-static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+static int gadc_thermal_iio_to_temp(struct gadc_thermal_info *gti, int *temp)
 {
-	struct gadc_thermal_info *gti = thermal_zone_device_priv(tz);
 	int val;
 	int ret;
 
@@ -70,6 +69,13 @@ static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
+static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct gadc_thermal_info *gti = thermal_zone_device_priv(tz);
+
+	return gadc_thermal_iio_to_temp(gti, temp);
+}
+
 static const struct thermal_zone_device_ops gadc_thermal_ops = {
 	.get_temp = gadc_thermal_get_temp,
 };
@@ -90,7 +96,7 @@ static int gadc_thermal_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_PROCESSED:
-		ret = gadc_thermal_get_temp(gtinfo->tz_dev, val);
+		ret = gadc_thermal_iio_to_temp(gtinfo, val);
 		if (ret)
 			return ret;
 
@@ -193,16 +199,13 @@ static int gadc_thermal_probe(struct platform_device *pdev)
 
 	gti->tz_dev = devm_thermal_of_zone_register(dev, 0, gti,
 						    &gadc_thermal_ops);
-	if (IS_ERR(gti->tz_dev)) {
-		ret = PTR_ERR(gti->tz_dev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Thermal zone sensor register failed: %d\n",
-				ret);
+	ret = PTR_ERR_OR_ZERO(gti->tz_dev);
+	if (ret == -ENODEV)
+		dev_dbg(dev, "Thermal zone sensor register failed: %d\n", ret);
+	else if (ret)
 		return ret;
-	}
-
-	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+	else
+		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
 
 	return gadc_iio_register(&pdev->dev, gti);
 }

-- 
2.56.1

