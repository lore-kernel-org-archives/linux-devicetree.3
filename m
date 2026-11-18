Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036697;
	b=1BkXI58/SjJuVRNK7PchnEN697Tlb540ZlE7Qv/eM3jmvsBBGjAwZlLUCiVRIQ+rYePX
	 cnn49SyEsjJyLdcIrxR8etNH5eyMvBYlybjTdIWVhKKnA0zAlnTL0TqUyIxN5CXwLkO/B
	 cXKEyTYCKWQUqfMQ6ruTwDU/3ihxs2u6Zr6ZG98+NZIYJo6Jg3jJqC9Euz6/RKaKEnGtS
	 Q5n7O91b4uB+JgBVC/+kES7l3lrXQwCH4sjVcR99tvU22JX35roA4LqG9VuUHN/s8NZXN
	 eropX4ZzRWeerqZ6Ed2RUjPIQPJxioSc0rf1qrDMytHARtD6KfDfpmMIDLlv2MsECOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZgjJ8XS4c/O/84bDgIlPZ0lvCX5UJVbssSmCGQ9+W1o=;
	b=RVPR2JbMBZcARG2tj2Oahp6EP0O64WIDBDFYgrEO4Od/eTrHJY9z1xwRrVfGDZnm5iqq
	 vv7q9hM0lhSxr+Ib+7dyfj5OZg5T5E2NxjEhlW9HZ0VvTOCU0I1PLslFD3jG6CakBmCBF
	 kJ7b2uatIhk4ElQvUARfs21CB0umRUqhB7o85z3w+/K0jj8xb7EQsh4tec4gU9TjTTcde
	 fyA5w7JGyA2RCEHsGLFItZt3JB1V/yKvHHSvpC8QuNydmoFZCu6REo4Q1m9TWfdC3dhwm
	 KBPzZpVJ3yZdBxPh6TcAFXFIU5IJt1Wz3af8PXPBg4GKtbpK4l7fAupebxLOQ+tkUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IoQEAp/H";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DD606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8DD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IoQEAp/H
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1967572c88.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036696; x=1795641496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgjJ8XS4c/O/84bDgIlPZ0lvCX5UJVbssSmCGQ9+W1o=;
        b=IoQEAp/H5oVh6B6j7orZgoCIetzlN+Qfybwy2d3ZFRUrLHSdL52w5RxOzRvUiWDPYh
         PXT7uPkXfwkY8QdKa7t9CbRg6Dc26svJVRFPXh0rJ3Epk3ufT/amOonIknH23hadvMWP
         T8FNFaa1JaY4PUTFKIlifcCBqnCMe7bYZHbSj0sknNFu1+SGkToiOvDmpFtlkRQ7FX+3
         KjNc1SfDfMwWdKPA7Q7/zRDY40qm5ZPH4V8gJCg6eD82/sORuhOJU7UQwtNtF2FIs7oQ
         ecrQxKUml32ShzMPf7wR+uSumQlZvdlntuE9QiRZSYqw+dtIT6e49pon9xZu7cwstjaM
         Bt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036696; x=1795641496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgjJ8XS4c/O/84bDgIlPZ0lvCX5UJVbssSmCGQ9+W1o=;
        b=LyR3yb9j7AzfjVzLAsEz8lghAh0oREfS7ljWxl0ghfBmKr7qc2GSB+udCFyKLItxte
         zvosOlUFoWoR+F7g5c/gQbmIzQgvRoWWPry1veDsWA+NdB6i/eNIYbdKF7lKZ16hmaJK
         7+54UCAKrkk3zMS9u5Egl7VZc8XLFImv+q4hvtcdGUyrRXN0isWJdLH59iLWlBk8yKM+
         pHbhdT7KpURnC2NFVqg9qbPp0oZiAc3FI/apxEDYrCngtCDNbsLy+6tKdYE3uZUpBnSv
         ltFHPHd2Y0ib4EIQwthpTZ5nL1o9BgTu28KypAHJ2TBQMZrgPZy0enx+54mTZQShWkO7
         kKNg==
X-Forwarded-Encrypted: i=1; AL+hErEnOWDoBvxnAuUxu5mQe1TU1CQ2KVT50dSvjHJADwp22X7bCK08yeWMElgNoi94WgTUj6A9igscuk54@vger.kernel.org
X-Gm-Message-State: APuU4Z/TFwsY51uvdMQJdCxRYNceaGt2yISgzt6EZGguZzpf1slLRKF+
	s2hu/LthrUEcVQMr/IrCGq0vTNifKO3oZSjG3U/g3ibWxThhX5aoW9Hj
X-Gm-Gg: AYBFou1MqpqBgHQJWJpc3IyeaPFjHM+fNeVjN74KVJG5TgKZibKC5hnIf/vMT1BlLWt
	U5VIapkZUAdKU4BxUgMlr0u6IZF0Nk5AjIjud28byFCtooq8YEOsjiKYQjDDNSSLSOITb9u1JS7
	648DXxbDFYEyeM/NLuLtkxIs2y4QRYyhkPBnTiF+gy8QQrvF6d4gf4zWT+4j5Hg6yzKMUtzePOp
	8729iAA6VbBo2nhiPJMme2vBOeiBK022eRq1yyfrWR3pdu1ZRsAFJtjX7fYzZbqx9zYYrMi8VW9
	kVdXmdcMWX/T/toq3JTT0qoFkrHkigqzI3QnhDX6TWFnU7gF/n7pBUBJWMkM2yX81V8u4rI1T+T
	xTLt7z89gHe7eU5sBDtjcjaiETOy9xYiO7KO0hY0iv1UWBFfvEwayWTiiP0eZroQfE4Jofi7HlQ
	+c7q93v056D2Q1iohyaGLp1S0IQfsTt4n0XZG4cELW/tYQsL4RkeLibhNSFV//BOheuG0OCiNsa
	jOlzqMoL8rM4BKGfdmi5QumLXXIV9Q9B0XaBggObMC72dOfvOAZ4k1PPMPtUPRrcI0UkKtJyMgZ
	miAvYgXRekyBXqZYvkVG3xpQAnwmZnEYwtXhaei1traFVV/WFVnvGrayI1oQutVxIgMJJ1Dqgzj
	JgLEyV5WBzhgMQnBq4hh55A==
X-Received: by 2002:a05:701a:ccc8:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b543cf29damr3110194c88.12.1795036695422;
        Wed, 18 Nov 2026 13:18:15 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:2fea:c6f8:d30d:433])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm8736807c88.4.2026.11.18.13.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:18:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/2] ASoC: pcm512x: Support external mute GPIO
Date: Wed, 18 Nov 2026 18:18:00 -0300
Message-ID: <20261118211800.63292-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118211800.63292-1-festevam@gmail.com>
References: <20261118211800.63292-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@nabladev.com>

Drive the optional XSMT mute GPIO alongside the PCM512x digital mute.
Assert it before muting the DAC and release it after the digital unmute
has completed.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 sound/soc/codecs/pcm512x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index b760561d0ef7..f6f07de133c4 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -31,6 +32,7 @@ static const char * const pcm512x_supply_names[PCM512x_NUM_SUPPLIES] = {
 
 struct pcm512x_priv {
 	struct regmap *regmap;
+	struct gpio_desc *mute_gpio;
 	struct clk *sclk;
 	struct regulator_bulk_data supplies[PCM512x_NUM_SUPPLIES];
 	struct notifier_block supply_nb[PCM512x_NUM_SUPPLIES];
@@ -1463,6 +1465,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
+		gpiod_set_value_cansleep(pcm512x->mute_gpio, 1);
 		pcm512x->mute |= 0x1;
 		ret = regmap_update_bits(pcm512x->regmap, PCM512x_MUTE,
 					 PCM512x_RQML | PCM512x_RQMR,
@@ -1486,6 +1489,8 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 			return ret;
 		}
 
+		gpiod_set_value_cansleep(pcm512x->mute_gpio, 0);
+
 		regmap_read_poll_timeout(pcm512x->regmap,
 					 PCM512x_ANALOG_MUTE_DET,
 					 mute_det,
@@ -1581,6 +1586,10 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 
 	dev_set_drvdata(dev, pcm512x);
 	pcm512x->regmap = regmap;
+	pcm512x->mute_gpio = devm_gpiod_get_optional(dev, "mute", GPIOD_OUT_HIGH);
+	if (IS_ERR(pcm512x->mute_gpio))
+		return dev_err_probe(dev, PTR_ERR(pcm512x->mute_gpio),
+				     "Failed to get mute GPIO\n");
 
 	for (i = 0; i < ARRAY_SIZE(pcm512x->supplies); i++)
 		pcm512x->supplies[i].supply = pcm512x_supply_names[i];
-- 
2.43.0

