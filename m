Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AE349CDB
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916215; cv=none; b=iFJdVoSMZSC/zdX7eJcmQ3mV7hMBip2KfC7LmJfAM55/1KGcYJlhHztIeyITIpl46Rm98A4l1mbqX426JngYkRaVJZ6gOU2FPK1tBw4Xp/X5rbL514cxQEH2d9iqdmefgqO59XM3/eGTqUan4/W/yQFL6ry06TBsjcAreY/B7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916215; c=relaxed/simple;
	bh=Rbnq2Ej5FKBQgS003/b6Pf76go9Kj6sgibIMBjnk5aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfwEKamqFJpuasT+hmNHywhN2sTWXgH5ndaMjqASKDWu4gX3CWDguGfqLv7cV5s8IL0kJOVYAn7M3owMu/KAB1ISCEcF/7Rel0t38IUUGldQklHPNnWAPSFTo81dblsIYL6uH8TU5sD4jxbLswHPhpZeMBkPVY3Og68w63pAEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ank6lA1Y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ank6lA1Y"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-471eeac43bfso574398f8f.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916212; x=1783521012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akjB/2/LB1aH23D2hcdzx1hoAmWJ4htZCQR9ePuxd94=;
        b=ank6lA1YHxRDqytau0/pQWVz8X+Qjc0RkZZmJp1bL+VwXi3g9c9f57FRTcF52+NGRk
         UOvaCJ7qIDJVtvNcDTlACQjcqgrhAs8zsY9g2eoHPVKf6jGOdcYWuLHZB27YdxApel66
         floYki/SiNJEWtGrhryVR1mGO5Z99Pgx212jgfiXr6JSK3GtecOQR+GaXGQ7XkIUbVUl
         dWRJxqF2P+Ro8PewP0Af3b1I3XTYOYblvXghgnZyfCoomnoWNOu51r4+/vS8lpsXS4U7
         F89jGEHzVmnDFsLs7tcxpFgzatvQTxOwUuQNhCHNCN40JvUkkDkGfjQ6t77hYV9883F+
         TqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916212; x=1783521012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akjB/2/LB1aH23D2hcdzx1hoAmWJ4htZCQR9ePuxd94=;
        b=gsnYpJ/9CJCQFhZ+ZPLsXUQomhI73mwCwe0mKAJ3rZn+K5aGqiSjS9KFUCbCR3WQBr
         gTPZ2Uskz2fDL8SMN+soF0XGB5C3AfbH2yX09WdJFILEpJhmMIxbmFcRvbCoD9Yk6qIH
         wntIxzUwQEYiKw2O+rzvvCaazlGZa0QfqKhRkahFpQMnU7MqY1V8991nGSR/w1d4Wg2N
         +pQFzpCSa8iM0G0K/VRb35OL1IBcpSagN3j66eZlnG46Pp1aK5pxvtEfw9MrzvyzNFaK
         9ZuH6bmJ+G/dYYAWNXECX6NSqg77ytCZsLw7eNxdvWuAcQkhoQi1Qvq49vIC5s6/mTYj
         +jTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1JhLlSONyP3Qm7Wi5dNSWqii9sx1OvTMbjdwjSfkixJ/ZXDUbyre2BJkx1yDnTAq8mco4KfyhNOZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDgrDUEf5WVIestXQRr5+7Y9YAyph8vGIF8kJJbgbNeoGoM+m
	H8ldNQFgt/mMLd+KmheY/tMLaLBsEdsDwpaQ06kJm4kwBYaJnFFZRk2L
X-Gm-Gg: AfdE7cne4G4HztuwGeoItY5WWOhD6WjY6p5RU6N5AISw9zeIdpD+iJ32dh7ZhyKM3Ja
	k4CkFz4uNSrd65suOK6Se2sKYFh0Q2I77y+BWyyAnLqIuWZgKSuz+0fmcU5x/WyRuNjUPt7k2q9
	OZWewFbncv0L4xqQOWwzlTvSd5VFSZWfXCopRfBuvg50T03SlhL/NSFyYeIDKxm5P1a1w+OrkZa
	Ay1NOsIFhRBylCoU12YT9tWN2zA7c03jplHtB+j70FuznlSct+xxUGHVevjnnWXq1ZJTxVg4dkR
	h+EJuoHkux7rQS7LrI5JZHTvfWY8lObq99H9WXCkI5x08297wrpi/t1L93qsler6hPrIGm3uO07
	ZEQI+TVjdGO7ev3ZceiyHzrsbaE8cS59tUpCJ3K3PtjdFtfYg4aPrQjR/NAYFwquPZesZuCQt0U
	1l0wNsXO+mMbYNBHVNu3fxREBJk98r4D1qtO9DbkDCvU0we+ExhtObELRr0xmXZYqn8V5xEr6/8
	sO3PJ3qL+tWH9TPhStrGuDSnAE=
X-Received: by 2002:a05:6000:2905:b0:474:b9d1:321b with SMTP id ffacd0b85a97d-47757e57453mr3004596f8f.6.1782916211834;
        Wed, 01 Jul 2026 07:30:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 07/10] rtc: rzn1: Use temporary variable for struct device
Date: Wed,  1 Jul 2026 15:29:50 +0100
Message-ID: <20260701142953.2014895-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 1a45a3d895cf..4540d764edfb 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -380,13 +380,14 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
 	int irq, ret;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
@@ -394,13 +395,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base))
-		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
+		return dev_err_probe(dev, PTR_ERR(rtc->base), "Missing reg\n");
 
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
 
-	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
+	rtc->rtcdev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc->rtcdev))
 		return PTR_ERR(rtc->rtcdev);
 
@@ -408,15 +409,15 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->alarm_offset_max = 7 * 86400;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
 		return ret;
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
-	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	xtal = devm_clk_get_optional(dev, "xtal");
 	if (IS_ERR(xtal)) {
 		ret = PTR_ERR(xtal);
 		goto dis_runtime_pm;
@@ -467,9 +468,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->ctl1_access_lock);
 
-	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
+	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
+		dev_err(dev, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
@@ -479,12 +480,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		goto dis_runtime_pm;
 	}
 	if (irq >= 0)
-		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
+		ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
 	if (irq < 0 || ret) {
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
-		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
 	ret = devm_rtc_register_device(rtc->rtcdev);
@@ -494,7 +495,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 
 	return ret;
 }
-- 
2.54.0

