Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680682;
	b=MyelMIFf5wl4Tg3aO7GycsBl+bJaWDi/ZF2+OETgPE3WcQ8IT1pvYQ0CXkzxcgBUwJOB
	 Z1rwk5EOLx5JVBYGFROUDQmvzUL/DCkdTc2uM4xruyS/6fhP6WC3l7iq7/6pHcySoMKuz
	 FfBN48euYJ8PXNSHghbNlSlZL/Gua7YvxXVAZ3PAgAY5A0HpuGvJgZI/1zKMagL52TWaw
	 TxQmwjlMWlViR+SoJoeyD/yLbXOx1RsoHxqiK3ycaoR5HHahNNgPazDNv2TyDOuMrzvHV
	 k0hxnheYjHWQdcf4Zl3YdtnZEmTZHZQPG+OwEWyJLYZDAo1tYX10A3sdOWOdFN4MGnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
	b=FSbj3YNpDjPFVD1pGUZfafrisyH9dKzqn7bNpabvoSXuFTSLzbFdMw7iLLDkuFI+LCPZ
	 3xds+rWvM9Mg7t8XroNLud022PCUqYeu+RYi8n61OqUDz+c2EpCpzylmZPvZqNx+PopMA
	 bv8ps0x5GmKyuhugRLXMYm0hwKuBk5BHsiptp1YXuo834p8mSO97nBp+JEllQPo4Mq107
	 6xHeHV9rbkulClXeZxbA1coo/fLNaHB8u3hZtcEI5Wj00rzysfv67qucuvqJyubikgx2J
	 0tyTPV/1mQBMGor8P6LxTUrh40/oGhF7MuCTTcjqeZDotbwhMYgu6UuytRFphYS/fDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EjfUq8wZ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80A606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E80A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EjfUq8wZ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2307460a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680682; x=1794285482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=EjfUq8wZKD3R/dDZ+kWoTopD8ZmC+9X4+EPqk09OXIxHyQJwsEL/xubPSC4orNaHsC
         +j/c1FlnEz1/o3R2o9ojMrNKFQ23qP0jDRDia+XjPzd6TuMFnBBOo48A9RaL8BJ7KaPx
         A1VcrY6HmIkHZq5Rsrz+3DJJmNd4RqZiZbUUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680682; x=1794285482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=fw+ZpB+mOhtDGgdTDpYnSKlL/rgXgcU64Vp3on8pn0kMm7m9Bi2BCYCPOOzi08GvkA
         zu+79EPFHQZCVBDGLELlskkLWNLrve8b7uqT6hM4GXgR2fNZLK+kD0981q9wpGZ23WDD
         8kZyEBMqjMBvX6Hf3oJBuBUExP7S3btNyIY19uxvcvlu9gY3Yscs9Uh6u8YiGeSh2DR5
         T/9kYpzbNZEtXWoV5XM61xTdAPQSX++4iIq3u6qUm2+2gk/gjgwxpxQfcTk/wC59AW7V
         aD3QEkBxwOenwd+kp41Q1OrEAKfUp8tfdbrj1R4yUFo94ahNu6GJ+nT2nPbTJWJZZDGk
         L+5w==
X-Forwarded-Encrypted: i=1; AKwUvBw2Gyyzx8ejMwW5NQ7qvdoy7WKR42q6UAHAgDTfEiJBOn+QLmDzQhmUtwlyxFWfKJKcRIPDU8mHRd0G@vger.kernel.org
X-Gm-Message-State: APuU4Z8mCA4RKGCaXuyQRzbN910oUuikDKRpCrLei3zhMjfc1GBBOd5i
	V8K9eA26XsTL/N0d2NzqxPoT0ubSVhvSmonQnVJzR3iIBmk+P+jvmliFAGzMgwIWVQ==
X-Gm-Gg: AYBFou25ljqXSrC1RKni13rbRma3YxZduemTFMO209WMzHBYbmQoRK2TFGQP4cnylsh
	zBnFSExWRiv3FEZSXOnfyK1JQsk6pUL+hJDUTGxlqb8FjJymcXW/es2v1WyBQzNDUW9Oek/K/dM
	6edl3ETOrsSWGwsCBJgOXfdadbuFyj1TOz0xp+VXJqQKxsdK00qxT1rE4hmg9aNWrrQrcQVr1pY
	utPEuH3+T56+9k75+Ifp6C9v+Sv1CEfNqsuQx7eoZJABwZq55t9mFEs5l04mBlMtX+WhRaXfVqG
	EVs/yIW1DTBXfaUX6G015ofoYAogAYdsk9J2RDwPDB8NSMfJiw9DNQ3TH+0ATcwtbqHe39OcXU+
	7aqLh247JAAOMc0aX2K7Gp1hZna2gfB26Ck04IOPw6K03mtdqZha72/RLUdnecY+N96zCNmJ+WT
	d0vnjWvkvAoWBxuqZbD4HEPN6Z9FVB/DeBCxPfXOFaS9Zixyv/sRhpDrMLun/R7xv6mdP2RTDkJ
	sIauxf5bCWEI7DI2M2/+g8CzsIb+d4MvJt/vPtvsHGZhWYMWOYOt3C1n8w97QCb2FgF/mySgcTo
	+ybHJMfEXqVFz1TUHZDHYICPAo8ima74zMravVTVH918Ra6XZnv/9KRRO8hKugy0UEV3ndzYnb1
	MM6yKMH4bixcP
X-Received: by 2002:a17:90b:2fcd:b0:3ac:a7ee:6780 with SMTP id 98e67ed59e1d1-3ae8986606fmr10535707a91.66.1793680681667;
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:28 +0800
Message-ID: <20261103043734.2179858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.56.0.385.gac671c819a-goog

