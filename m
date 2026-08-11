Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F944331E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450858; cv=none; b=ZguP5KSbFFVyGgOfwPqOjgxhAOyvNiBMIvBpLQC2PQfJP2MF6VA0KGVYZWs8Jy52VMdM1jENcbguFCX3obt15NYQkJ9spaGHKXn38vucY7JUzXY01+oEVpz57/2rMVVylBvsVwUnG/rnDOBKOdNamT0AWdrq6v/VOMr0JhgyA2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450858; c=relaxed/simple;
	bh=eYYAZt1D/azsw9KiyzJSs5x1E12lPK58GJkuELjCTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKbzjDJK506O7yeyrC8Iv5qiNrMeM/4ej0nC1JPqZYNSx+dilQawlLO7IuYaoCxpzUAz1UarerkaxZvLdIoKon9mfwUk1PxR6xbs0XfLNiUXzpGTy6jC/QVcvqd09Zg9yikBvBtdYsK/mN7afa11tUOLK5xHicb13HZfqHJ2VlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UmD2gsVl; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UmD2gsVl"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so3276343a12.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450857; x=1787055657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=UmD2gsVlUCkjjjCgEhB1BENgxroVNIETQZHZCmnABrHU5UOkWXXEsRTLE2H6VlqswC
         Jwd9uk4puvmNyLdAv/+kOFXYWMaMEzwZVN8nDqoxsHFx15ilzAGsGF8XINHTtjhKO5av
         hQCaIKiV3T+hipr5e16zLCF9RhDKedg4OQyG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450857; x=1787055657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0rjMz7r89FDG00LgKpSG7rJxKNH2nfPyMU32ONUt3s=;
        b=Bob2YgpI6pC6v1b9h63tW/GjFk6RKKJyhF+ft1HZRl7mMeT/jt0PuM0KaijtzTzNC4
         73vPmxQbF+uCdpHGK9/HJ/jfOS2gxM0dwS37xbeXvMgPKW7GjJ0gSgo3z8OK5ZQ8j9kC
         3gBtuxqEeSunVgtK+xze/h4gxKacyeSvPqp6JP+JIfyxLHXm0sv1qXAulUp5GvO3qQMq
         rndWIjA2A7GtSrgKo79K5aX2FrcwlgHUurxFMI0ZKMQBrx0JHV3jiDXmrPzYQkSWB1gD
         8MsoauoJH6UgvBeXcFE8vJUVdqXfqSNXqFgOY8Jnc3Xwn2qdVS+tHNMuXtPFRFwF/EaE
         9aBw==
X-Forwarded-Encrypted: i=1; AHgh+RoUPpxrka4JtiWCc/i/JHXUq54jWW29dSE9gB1xJhmUVsH4ffEHqQpJaIs6Uwr+ev8BuMTVcvJCJdkK@vger.kernel.org
X-Gm-Message-State: AOJu0YxaQImgn7G1j/VYD/T+h3oHWlYAAUqW+Mjpwfq8kGyMni+JoZV3
	Ys65w606y1QJez9bRQz8qi+5Xl17vv313c9QubvAYv+xWBbjHIPuW1GJzKBJ361ebA==
X-Gm-Gg: AR+sD12SF0nF0hxWq3sLeDigKI+ned1mlZQ9hWh4a3lt7qLFlKjAFlmVAbib/fWxPCj
	ZLNYBBWLK+uG5S2WhSrIczYMEO7YibxBA96gjCdkbApNkM2I5Elv6zrncvR0/naPsTgaqlWNFsa
	1W9KCbqWPwHdYiinRmj+MEvqrCJoonn4dBc1rX0h9xwzMJa+huGzmRK5wQMMfJ2QHU8+zrBQH8J
	Rq4539ovcsgktMWW95QD3tVFFn73oNoc22hOeh2vbRA4IaT8/p8bX78IEp1dkZME0fePGZYbjEb
	oV4kD56VThb0QSpbmiWTsqgz67TDctu1FX2IhV90oTV95c6YWb0Yol/iYEFHiUdVFu4QUMyMn7M
	c/XALgT+2dj6Ftg9QRcKM5dGvZPjMAuHfIEy8EKQrrq0mixRC4MUdlTt08wyenwUvsGpDNUUYdL
	7aRVKZPZKCPv5hcI7v/ChLYpQ2GPRwliD6oaXRTp1mI5VtY+usKeZPdO6yIKrQPPYo3ee/IJFON
	bMAPTQYaoCeShV9N5TlGNxGldILRX8q/EHe8NyIcgUHAA==
X-Received: by 2002:a05:6a00:32c3:b0:845:40d1:87fa with SMTP id d2e1a72fcca58-84fa873632emr3028343b3a.25.1786450856753;
        Tue, 11 Aug 2026 05:20:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:05 +0800
Message-ID: <20260811122011.3539250-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
2.55.0.679.g6767b8d81c-goog

