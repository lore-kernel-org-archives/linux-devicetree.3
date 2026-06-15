Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85C408005
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538513; cv=none; b=OzIp8/7ISsFn1QhIdux9SMhs+VcY866622jy2eODsHYN5KvR7Y7GJebY05mVhNbcF9Dnp5M9rI5zI8P8yJQXmjF0oPehlKpl1BNTw7/MGrM8h/l+ZBv85TzSw0kCFUkxEnW9+qijOFlz+eT/f/cV7X3gaPnoluQ3S+YPIsAPQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538513; c=relaxed/simple;
	bh=5J42CA5gXVabx1beJjVi+gafy14nkJZubknFPkXZYEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhD2shXggB7kEnpvyaiiAqbvlV4tSvNLCn35fPfGfbZav/ILZkEk60xGtrF5zk6CP4bAJPvKncN/unZk8KXVocLBk6athZkqGKO5zbmR5BPJVDUfR4oFz9Z+AF5fJBoLxpWfVvH/mNxSSmlUNYU7NnxPJplqd/8AYcXuDj8l+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoZQxaLG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoZQxaLG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so15929335e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538504; x=1782143304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NleHEVmdE3vLoV5ZusttlWQutI1nXw+m2L2dd1O6HVo=;
        b=VoZQxaLGvE2AUssrpAwtUHv8mG0EfUzPlAEuOHMJI1PjhApO3NuYC0+uhAa0h2fZPY
         aVqbmP6M+ubG11vKN1EsuZGsj7gZjUBGoSpAkrbT5VZTNO4OMj11gj63Xa4yX7mJzNwE
         9Zsp/qhYS/OiiQOuctpZcpViC0lyJ/2xriOLIlHpYi75cM/RdNyUwkOqvj3YYKm7aMli
         SEt12yljpjKVOzqLeFEYWzZJgqYiE/hkjB+bhspo/ca8cRQ7ZFudWv+POepu016b7l1o
         zxi52awRcAtKDBmhlz8nz5YArponJEFugMK0o/Ur0VkRIMLB0frW6Okz1498/SY510cS
         za8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538504; x=1782143304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NleHEVmdE3vLoV5ZusttlWQutI1nXw+m2L2dd1O6HVo=;
        b=bP8xP4BVFMK1V1wMXPbsqwoiRcNhuavlu6eHOxq1HYgsRIEWB09gdba7UrqMRs3bCH
         U0IygKpgLLpixIH3Finq8s7YXuBh4iLA/0HeS9CL8j7039w/9sl1SM4ALaQb0T8agnPj
         kctGDXYqPapojfBEXgyV2iJxRInOckEt9eA6fFm2ubOyB//sP2Jz6YG8RSmdXJajm/Fx
         2qHSCeCAg2ArFd5apS5faKtGF7NjELIUhQleNCt96RAM4oFG6u783ZLIxJ0alxa9IzQ8
         H8bqeULNkCJquOQVue9ILg4RzBLVYp6GeyFSJQoaNNX8EV06GorfDIb3JAsAqbwy+klx
         Zkkg==
X-Forwarded-Encrypted: i=1; AFNElJ/f6vSg6NZaJ3xJKK3ZtAfZDxCxT6lf2spd0PA3VHhgaVraffhkQ/gzysty3+NCmHlIn8L9mUE+cl1Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiln3gJa0xFnOOfdZgF+w2WHfmLQ74VyXbbSG9iMpYXoUBj1OL
	taNC5N6dJaAnmMjhDvitS4mR8s741zaC1nhQOzX6k3/b5tXsMeJUjWOP
X-Gm-Gg: Acq92OELv2C8AMdj8AF2L6/JKQ8nq5Cpx5KPfie64niKLuWD7/zzSLEI0fWpzUUCXXn
	PiPFy07Yv/BbLvwfgqKbkxS8ghWxl0qJmr5aGMD3pouLXB4PAlsN+RITNer+spFomfXbzVYyPFy
	JMJst8D61uYUow5Nq3pvTWcUGMvoAC//hDS5CbLvfa02mwAoZbxpAY+vefhxqUHo1PAJawWbPxJ
	ik+p09x7RGk8hBNiQlJf92r4hu7pCJl3yBRbPKpw/v3S/i+lc186lCVb19cwbW9lpm/sCHG9vu6
	w67GjxKMWS8svG7X26I+9wapgEddRltW+0SMvK0Hf/v2LAdm3S/J7qpLN+AKNVKwP+P6Jm7xs5j
	gxSDkH9pG389QmL/sCT6qkn8lpLlJzgu1GtVPkSDYJSYReBEQdKTP2jK5AgXecZaQahCb/pTANy
	a1WXvuQomBHP/TlFqzlNmLbklm8suTnXibBE5DgkLFFIce50AhgFgO/VKBjUE2KGCbB6m1w0mTD
	4f3uE7jL9ZSiLCUSk92CdtmtYmH7UckErCO
X-Received: by 2002:a5d:5d86:0:b0:43d:7bc9:9b2c with SMTP id ffacd0b85a97d-4606db8dca2mr20831910f8f.17.1781538503932;
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and wakeup capability
Date: Mon, 15 Jun 2026 16:47:58 +0100
Message-ID: <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add system-wide power management support along with wakeup capability to
the rtc-rzn1 driver.

The hardware alarm module inside this RTC variant lacks a dedicated seconds
match register, meaning native hardware alarms can only be programmed with
minute-level granularity. For awake states, the driver bridges sub-minute
gaps by switching from a standard alarm interrupt (ALME) to a 1-second
periodic broadcast loop (1SE).

To support device wakeup from low-power states, initialize the device as a
system wakeup source during probe and configure both the hardware alarm IRQ
and the 1-second periodic IRQ as wakeup sources via enable_irq_wake() in the
suspend path. Because of hardware tracking design constraints across the
internal timer blocks, precise point-in-time wakeup alignment cannot be
guaranteed. Emit an explicit warning message during system suspend to notify
the user of this architectural layout limitation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 866ff595188d..12a319e9112c 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -70,6 +70,9 @@ struct rzn1_rtc {
 	 */
 	spinlock_t ctl1_access_lock;
 	struct rtc_time tm_alarm;
+	int alarm_irq;
+	int sec_irq;
+	bool alarm_enabled;
 };
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
@@ -219,6 +222,8 @@ static int rzn1_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 		writel(ctl1, rtc->base + RZN1_RTC_CTL1);
 	}
 
+	rtc->alarm_enabled = enable;
+
 	return 0;
 }
 
@@ -398,6 +403,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	irq = platform_get_irq_byname(pdev, "alarm");
 	if (irq < 0)
 		return irq;
+	rtc->alarm_irq = irq;
 
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev))
@@ -476,8 +482,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
 		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
+		rtc->sec_irq = -ENXIO;
+	} else {
+		rtc->sec_irq = irq;
 	}
 
+	device_init_wakeup(&pdev->dev, true);
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		goto dis_runtime_pm;
@@ -500,6 +511,74 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 }
 
+static int rzn1_rtc_suspend(struct device *dev)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/*
+	 * Note on HW Wakeup Granularity Limitations:
+	 * True second-level accuracy cannot be guaranteed for device wakeups due
+	 * to hardware design tracking limitations across the three available blocks:
+	 * - Alarm Interrupt (RTC_ALM): Only matches on day-of-week, hour, and minute.
+	 * It completely lacks a seconds comparator field.
+	 * - 1-Second Interrupt (RTC_1S): A free-running broadcast that fires every
+	 * second. Activating it as a wakeup source triggers an immediate resume
+	 * on the very next 1-second boundary, bypassing target accuracy.
+	 * - Fixed Interval Interrupt (RTC_PRD): Periodic broadcast options (0.25s,
+	 * 0.5s, 1s, 1min, 1hr, 1day, or 1month) lack point-in-time matching,
+	 * offering no targeted relief.
+	 *
+	 * Consequently, due to the absence of a seconds comparator, if a wakeup is
+	 * requested within the current minute, the system will resume on the very next
+	 * 1-second tick regardless of the actual target alarm time. When the alarm
+	 * target is scheduled for a future minute, the system will resume early at the
+	 * start of that target minute boundary (00 seconds), failing to guarantee
+	 * second-level accuracy for the initial hardware wakeup event.
+	 */
+	if (rtc->alarm_enabled)
+		dev_crit(dev, "second/minute-level wakeup accuracy cannot be guaranteed by HW\n");
+	ret = enable_irq_wake(rtc->alarm_irq);
+	if (ret)
+		return ret;
+	if (rtc->sec_irq >= 0) {
+		ret = enable_irq_wake(rtc->sec_irq);
+		if (ret) {
+			disable_irq_wake(rtc->alarm_irq);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int rzn1_rtc_resume(struct device *dev)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	ret = disable_irq_wake(rtc->alarm_irq);
+	if (ret)
+		return ret;
+	if (rtc->sec_irq >= 0) {
+		ret = disable_irq_wake(rtc->sec_irq);
+		if (ret) {
+			enable_irq_wake(rtc->alarm_irq);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rzn1_rtc_pm_ops, rzn1_rtc_suspend, rzn1_rtc_resume);
+
 static const struct of_device_id rzn1_rtc_of_match[] = {
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
@@ -512,6 +591,7 @@ static struct platform_driver rzn1_rtc_driver = {
 	.driver = {
 		.name	= "rzn1-rtc",
 		.of_match_table = rzn1_rtc_of_match,
+		.pm = pm_ptr(&rzn1_rtc_pm_ops),
 	},
 };
 module_platform_driver(rzn1_rtc_driver);
-- 
2.54.0

