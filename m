Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984F47CC7A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512599; cv=none; b=FBL6D+fNL4Bf5AZcvOFRDwWRm9blE1DKe8sqBgn8FqyU6AcYso32utz8kkueQZE3UpVS0gdGYGVQDlW72ZxzTFq/Hh/eCkjybrMAfZdoK1+teqcXURv8G3rl1um6LdecASolraRotPAGEKcXLBx9QgTABDxxzYU5GYHWAHPMMUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512599; c=relaxed/simple;
	bh=8sTc3ePfTO1HkNzwXZekmT2AeOdDHgPOdpy0VtjDF3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijroRSQfCWDpt0oHCb1F+iBeKMn75IfY2V2J1pG4RKGj+4vYvqrQWz5Nns1yR/+0kXLL+TG0MoAbiHrg6Dw0tpBlj+73iScnOAKI3uKWvwo0IbEUifyRwv2ZEQ9q/338qBZAPY+y/XIrLmxs0e/9CWG7h2BDpMP4fytDbhKVRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMWK9FZG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMWK9FZG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf20f6be6bso36033515ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512598; x=1781117398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTBVI1ML053TliZ0TwngU1Pm81C+cTmh1wKJVMjMXjs=;
        b=UMWK9FZGyn5aqZNwbAriEO048QBwpmTtpVSEIcQK/YtIKZZF25FfJusNJSweiQMBlC
         d9KjJfHlSewLHTMjNC5+KTtZT1wtzXCSauqu1anBXBqtmz/nqli1QwexzikRP89TEnEe
         84RYhjEu7eAKa6AGupUCPSDPaEBK6jOBDmbre5fRjsIJevQfecbfEJ1NuglswXEm8tgb
         Ca/mZubmlAL4DGTQaaGkrEUeTQG0dRyhDTmjJhHpIRJpeFZUegUJf2/MjGBphEKaPtsn
         xytxdjmm+87Jldjd7L23YpDpR6UWJTfgLVtwq3WV4nuhLM4lpbJwD3TmX2ca9fMsRjiM
         eVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512598; x=1781117398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTBVI1ML053TliZ0TwngU1Pm81C+cTmh1wKJVMjMXjs=;
        b=QJcfU7QFm3YySManh31ExqYpB9ZU4fSKL1B7wLtBh4oBsBjPNAPsFDd0E0wMEXqCbB
         IA0xbQKNrubzGBfkoixP7aLtOWADMQRBzfhhVBTiIDif2hu86n454dvn3+7atwsyt/yc
         nWjyoeuMRkZO9H0qnW32BuyZwI4uqOa3OaMmlOgW/x5px/UCPOT6OKh6bgW1KEoXT3qQ
         56vPiNbjKLwlYAn9DAlZosXJ45BT37F7RqqzwJPvBxWPt+dSzI4+N77NSE0y12Ibh3bK
         uXMyaeehemu1vCECA8KeTA2TglWFL0YPvykSA++1kPPU+LYSG8apDwbdmNraVkivZEC6
         JIpg==
X-Forwarded-Encrypted: i=1; AFNElJ/oCFI/tgq0CpasO7n9SjlufKgzoPjC63ue/RAQARiRUQ/nG7WIYQFa1ikPjkTFy2f+fn2AIKVdnYk3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uEWdv+vH1Db3TDBhcqys4nMWGXdsWeXTMw6FnyXk6COly8zV
	vZJYg5xT5PfeVoNj4oqJhH3cVBph69nao54MF9oqN3ZsOndgKensqznA
X-Gm-Gg: Acq92OG84+EAgn8qrjGS/yljR72ujpurk06HT8loUPtweC/r6iImY5yYj2asOF6NY5P
	4YAWrVNWAunt6kvIvhppmq5ebwyWc/NqY1nO+H7E40LFuANrkTN4/1hwkSmym2Z5WSLGNlkl/4x
	Lz7lrBuztn+vste7x0f2Y1TPE9wPvA2HWXOTll7ryNuHrlPZFdrEcpiDK5I8uTjffvagfvrcXEW
	3N0AuJQkpd3BE4onyPx2vKi1EETE3dwl0eKZhzKj8pNwKkg6euh7R8uhDaKML3FPEv0wI8y8ObC
	faDf3tRGHeeRvcJOI/Tu4841jXOyHR/dpKZZo/hlb5aRuDyDR/wFaFF/vSe8xduL31ltx8NWYTN
	lXZlLd9gtDO4TL0UFseCGlk5uJaZ+KitSHSaoR5DCQQoQw4TVUX/YxHYjT06/TD8JsH0RiedPIi
	0ijEwpFXJrJRAXRWZ00EDX0cddksMjLnhCL4O5zaVhK1GUbEb1x5jek6KlJj2wGJpxbipdb+fFa
	HTataKyjlWrIYZ4HThBeKJ8dhjest+zxwidb/jXZLy6iTlz3ZdEpw==
X-Received: by 2002:a17:903:4b50:b0:2c0:a373:89b9 with SMTP id d9443c01a7336-2c163a24bf2mr49596335ad.6.1780512597506;
        Wed, 03 Jun 2026 11:49:57 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c1:4015:6e6f:ee79:7998:9a6f:65e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm32139675ad.4.2026.06.03.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:49:57 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v11 09/11] iio: adc: hx711: localize loop iterators in hx711_read
Date: Thu,  4 Jun 2026 00:18:57 +0530
Message-ID: <20260603184859.89693-10-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603184859.89693-1-piyushpatle228@gmail.com>
References: <20260603184859.89693-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tighten the scope of the loop variables in hx711_read() now that
trailing-pulse selection is already handled by the callers.

Also replace the 24-bit loop bound with a named constant while touching
the same code.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 4ccb0bf2d71f..e5d842853b71 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -23,6 +23,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 
+#define HX711_DATA_BITS		24
+
 /* gain to pulse and scale conversion */
 #define HX711_GAIN_MAX		3
 #define HX711_RESET_GAIN	128
@@ -157,16 +159,16 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 
 static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
-	int i, ret;
 	int value = 0;
 	int val;
+	int ret;
 
 	/* we double check if it's really down */
 	val = gpiod_get_value(hx711_data->gpiod_dout);
 	if (val)
 		return -EIO;
 
-	for (i = 0; i < 24; i++) {
+	for (int i = 0; i < HX711_DATA_BITS; i++) {
 		value <<= 1;
 		ret = hx711_cycle(hx711_data);
 		if (ret)
@@ -175,7 +177,7 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < trailing_pulses; i++)
+	for (int i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
-- 
2.43.0

