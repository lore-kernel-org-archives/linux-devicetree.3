Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095664;
	b=YsPcMd4SFgXoPNxLQrOy6dgpv/3YTCcbeBmlfLSeF9CcA+Y98XOD1yZfLUGrYLWexTu1
	 g2McguB34mdR1Bi3niUkYSDlbSu9Vcu++TlQ2CJBgV+yYzn/GoL+HCf8yob+zOz1gsS3o
	 z/xZ8YSaZ6gJIIPded98sJVWqePxTu7NgHCbEq1YeDV1qOPME3p1aturpumMhweRu0+1E
	 9btPHnc3YYT1jfXjJeLgIc4KzEVrb7d85L5uyqyg7gnt+WpZ7xo9Rd0zk31C1tLYyQELk
	 VT1vim6U+oGxBtlw4sno0oXtiT1CIaBXGv3T91rEgZBHWfTBZhxATX+LStOqf+uOwOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
	b=NV0/dSDfRD4PAjemfpuIYBAsBsQtkJbRY+UAsuInMzgIkjmSb70SaQFeDfycABuEq01I
	 YyQEef478szebSKeE9UZGTGK91lY24xvC29T6b+n7zhd7RGAoMJAyrmNX0YIKj+VzqyX0
	 WH6t2opyU+J9xHCt1HXWKPV50ira6YYAM4LtvtZ/VmPxd4OoxR0U/zytmLgnwbbSDk8QX
	 jO0r0qD3JkroVw+DKHucpYAJ9eQhbzuf2jPgVRr6ABB6WHaWQnX+VfRcHyE9YmL+6rl9e
	 KWtzGEqKJ+arqGEx1O0dps5+nFtlsXbmVr26w+cTTbTYyyXLeTZJBTGfAKUgDAesxZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/U05xbt";
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40B5606A336
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E40B5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/U05xbt
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-77bf892b496so819252137.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095663; x=1795700463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
        b=e/U05xbtSd5otnBRhSiLYb+iTFeJTRE5BGOH6JDpCrPI1tCFJwmhSxgCrWtid+bsCt
         SoVcOibC0+QUBOfu4+XtDZ2Dj7UMPUmNjiv+zlAsddzHWkM1+U+qv79x896tQdrqO2Xz
         AfW6HKqDmotgN1VrKLRA1u3udVKhLw+fMsrri8JnN/AnmfGhtmcH97/ED6DGjsEyHWUn
         rGEo71AaZyzQ4bBbusDudUZ1VpTsl22I7vE9QVxWRd6uGfHbVcjRyZ6Nixc/OO0xCA3d
         /0tjfc8h2I9/xz0a104M7JuH9h2jQFE0+psja0IrLv5w6o45VywGiOukFkvDn9XBovKG
         DjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095663; x=1795700463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
        b=Rmyg1e+BYpJiVO5F5OHj/YcOTNo9qItmdqDOvcpmEoI2VK4rt3PkWK4jUoWny9Njf6
         L2GtIpJegWrcvqTd5VSnL8qchY4q2M22OT3J6mQ0sj4Z/PPEebPNGWBLaAhunh1gBqmE
         IieBo7VEZc9MhiuyrwUvwYhe91Iarkd77yb/f54GoWQQ6NmCTOu6X5IO4CRQyeVvFvY3
         QL1qHlDB3txo8LoUbSmOeADVin7MqnMRie1h52CPXYQfOAh9Rir6ZnegEMN/zLpn6b75
         kub9r6l7b6PUdHhfzDUYT+A6AQ9eZRHmwjrH4lIijlnjkNKU45R8oa1eAGvInKKmhMPh
         /yCA==
X-Forwarded-Encrypted: i=1; AL+hErFIV4zarbIs9MbyiHAcwK5vksxdQI2j85OPicN6YQKKFL0P5WwvUiVnHaoT7hcUbvawWXphb5Q7zNht@vger.kernel.org
X-Gm-Message-State: APuU4Z+5wA1PJg3gJ2Y0KUW/QGlPK8MyKQg0B4NfoLwKOsiHFWE1D1U3
	DoHhZqQ38pCC6jO2gJMvWmHbDHnt4NIn+SONMjqQJbUANuFzvkcHgxTh
X-Gm-Gg: AYBFou3pAGV8cTmzg6pRXxCoMF4bffUcHF6njzA/ue0Zn6MkSe51R1zscdvo6BJlpor
	m6wwHt5fp1nCk/zlN1jFlYi/VswgALilyEL4N+GopiZ1oel9QrC/EuGptUz6GFroCR+qQGrpciC
	vU4HYz95NaH6q0B+6yjG3eMd24SswcRH0VCi9I76i992leYUr4AQR/5WT2zX6MZDOwCvNE9zX7a
	/fIufZHfSRuKagKdqa0uDNdqrY32czpaREaKtTDnxlzLv0ASNpKQT8jm+BK6/A4KLa1bPO3Rljr
	zYAyr9Vzx3V9LDnM+EAlerVhmFYEqnB8PLTBV6/Ju1IGHQTwhJECicEXnJ/zjqsV65ZINVreIBt
	pvpQ0kOPmfbHBxKChYXdSX1v0OxSkWmtLtQ1cWc2hsT4U+++zpUSVl+v173J7UbqtMYi7E17MQq
	v5wpj532Q8M/hiJtRMBYNUaEoSMIm9Cq5kAEhb/dgNHAfl3oJuJnR+JjjYN4RWZ3lI79yWscMEK
	UqJEh7u1BzBOpkhvB+uuIMsTk8WqLyLwbBjkux2MSx231R+nXIhxDSN+qTqWmWN8LhdYa9e6iuz
	QL70mLqHXnqWl4ba37uf4BFDgPsph8HUTYc5gw1Cy8MI5X2roIwsJ/AwkSSBX0eTl3I3pwm6BUm
	Asjrj17nVfSxi3GI+EpE=
X-Received: by 2002:a05:6102:54a8:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d6ba191168mr2215348137.5.1795095662707;
        Thu, 19 Nov 2026 05:41:02 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free on removal
Date: Thu, 19 Nov 2026 10:40:39 -0300
Message-ID: <20261119134041.16611-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
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

The LRADC trigger is devm-allocated against the IIO device, but it is
manually unregistered after iio_device_unregister(). The latter deletes
the IIO device and releases its managed resources, freeing the trigger
before mxs_lradc_adc_trigger_remove() accesses it.

Since commit 699fb50d9903 ("drivers: base: Free devm resources when
unregistering a device"), device_del() releases managed resources.
Consequently, iio_device_unregister() drops the trigger's allocation
reference before the driver unregisters it.

On an i.MX28 EVK with KASAN enabled, unbinding the LRADC parent with:

  echo 80050000.lradc > /sys/bus/platform/drivers/mxs-lradc/unbind

reports a slab-use-after-free in device_release_driver_internal().

Allocate the managed trigger against the platform device instead. This
matches the trigger device's parent and keeps the allocation alive until
the platform driver's remove callback has unregistered the trigger.

Cc: stable@vger.kernel.org
Fixes: 699fb50d9903 ("drivers: base: Free devm resources when unregistering a device")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Joshua Crofts <crofts@kernel.org>
---
Changes since v4:
- None. Only collected Joshua's tag.

 drivers/iio/adc/mxs-lradc-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..64dd3a9995ff 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -454,7 +454,7 @@ static int mxs_lradc_adc_trigger_init(struct iio_dev *iio)
 	struct iio_trigger *trig;
 	struct mxs_lradc_adc *adc = iio_priv(iio);
 
-	trig = devm_iio_trigger_alloc(&iio->dev, "%s-dev%i", iio->name,
+	trig = devm_iio_trigger_alloc(adc->dev, "%s-dev%i", iio->name,
 				      iio_device_id(iio));
 	if (!trig)
 		return -ENOMEM;
-- 
2.43.0

