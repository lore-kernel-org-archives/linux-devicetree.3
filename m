Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680678;
	b=RFNqostJgcHmYwdwNSVMLwwD8aIH76i2WkebUHxStdVZKBykWn2PAsvwZTdubFEj5M/K
	 mnSRkq0WWm4mzfEj3ubELJQypTAk3OpciKs2k47+7M6VSK038+s8pwdbyVUR+0B3MRrNJ
	 D/kj7CsJEICQH2H3tGJKLKcrGjaIHHZXK90VQWFRvuwLKYOdEtmpFwY1gfme6qnR/PKaT
	 0DWP1QRFu9ttDQKgrSUHRr60YMo6pxrL4ZUvKT5h93MiphubMpa05sGaJ1+umsK2OWv8D
	 3UYA7DYwz0AWvQGzGFM4fps3/MGS8am7Zw2NTdiW+w061vi+ryaDW873ObWb/lqQ7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
	b=XX2/4/WnWPvB1NB3i8DTsro838cSbzMSfsr4oYlEU4ZaKEswlo9Ed+jmjdA0HfjMudrT
	 xYSajjHlg7Z0qXDgy0kE0yAUTjx3lhsLI7oyuw8teXo1UIdj2GafDky068DFMBUfCMIc6
	 vERpfVWlruyDsbINwqVkOBQ08ijUqaWjBMMdtVqEhMgXRIdYRqqM8rBS7qVGW6VPWg3gc
	 s07Z4hDVfY8r2qxi3LvQhgMoJcUxghg+ANCMaqS9Yl1o+3ofEnbSYPSWpnvOCuJ98Vu+U
	 6GIdtCdUCY5yRSg3TbjXS/0FLwE9pkK7gWXrDFF6SEOP6fpR0uTECTM7Q25QghG79kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZKpGzlmX;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4C606A32E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A4C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZKpGzlmX
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1201744a12.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680677; x=1794285477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=ZKpGzlmX0djeNLrXuX9lTpy2ii6SP/KxxSi6BOaEFbrjgQBU3M2vDz2L4c67FfPral
         JfFDWMhXs1qA1QUSktgnWBvfFFLuvqdgkCOFmwIDZwxycU4385176BZckVSjX/CqV7ZQ
         +wfL45iXhYgGfu3vN5nwL+d1+dOh10dong9Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680677; x=1794285477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=B4rsEneRwcsgApKzWnZJXEefD0K8KoRxpEDPpcUKmSoGthtj4scDLNMulz5hHiY5uc
         rc/o2aMka0wPCBWMeVmBvoUo5xk6/b0I3fyM56ZfRlrwRtvC0f+fkaDtBAS22tVYoliK
         AlE+EAXKK4WXV80T7u5w5Gho0SE2DNmcqGbpdYmwC/aAaytvP8SobqY1B3H+OwocUEw/
         Cye9m4f+ajpNWBCIPHrVedSdz/BdPsDCwkA/6SNi1e2XBwWU13aIbf1c0RRN04VDq/LX
         OAHsJfcXSZYFV7GZGwBgz4qntqJeffxJfDKqq8dA7tVqzQohGjvR7HAzvS0gJX789jCi
         uvww==
X-Forwarded-Encrypted: i=1; AKwUvBwkn/7bIlxYBQK5zq4LBEwUWc91xRigc8p92gPU13xAv6t7Pc91XeHI8hM2h2etLpkK9rD9S7KvcwVP@vger.kernel.org
X-Gm-Message-State: APuU4Z8BpSpQfC9QvKiPh/NDjzvkCL0dQWY2+bJMgmze8QPfvPTa60XX
	tuFiRJ6bq2RJyC3T4BavTZCkXLCXM11+WuN2HxvfkH8ePhN4HejdG8PlL6a4+/ZP3A==
X-Gm-Gg: AYBFou2wdadTfxlORu+2H9MunHYd0RrTNNbH2jJV6Pl95W6Uqgh2pGNThZDw6T6ondI
	frXVE8nBOvVMe+2JuSVuqbEu/x3wxrE+5GDf7fNkoimmisE0n3e+DrySMULpkpYGpZV+zQSG9U0
	sotwo2YhqOcIZI7+qFFDWUkrZwUaIiXBKYlQ9qb+AP9RVi9Eb6ggSXsguuXYBYW2Z7BBcqXZD9K
	ZuSn+esf6UysQuR41mka1ReLu79Xjamd/6Ha1M2Lj4zKONqsLfnZhLPG+Tbx5ARHqYD7Ek6Estr
	VCtwM1DokXANchZIW7ppfc/ixl4N9b83KM+tPtONhWMZZkk8d7rCmaWgwcccqwzGgXzuTxdgGYK
	otUizV29+CeidLaYeUSG1CWxEHHMnQGfEga5NuEWQFIhRzGvpeEcPCN/8BMjfLuhHyKOmIZyE/p
	R0APzf6Z4cKVp5X6bS5S4LH+NK7IoPS2VT2+DVxX0Z2fvlpl81b2qRWeXN8+2p7jfeV0dBRGTfy
	MUF+3oxKl31Lq0X8XMPXRe9gQKr5uBV6yw1xdL7LWBfQCdRtoh+8TwTDAWymraWJByKolLeJaxh
	WvYDfpjb83TiL9nJ2bBZEWEInTRYRaAgjqH+/l6ffXgTmQwsM64ryj9PNjFdvLBT23XuHiNf9mo
	YfrXnxYDPt55O
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr10534419a91.63.1793680677425;
        Mon, 02 Nov 2026 20:37:57 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:56 -0800 (PST)
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
Subject: [PATCH v7 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:27 +0800
Message-ID: <20261103043734.2179858-4-wenst@chromium.org>
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.56.0.385.gac671c819a-goog

