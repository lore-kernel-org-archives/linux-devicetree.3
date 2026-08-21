Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908B494803
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320617; cv=none; b=tK/IjMipOB46HRm+2hircCOT5f4zemdxqaImNOR4LrhqiI1gOtjUXc3VAC4EXu9Hodi5jUA1Q/QX8w9702793F1nty/dRL4v7bq0GgWwYB2H3Cs2cPgFe42lGKoYQ4/i9Jw3IyuwVlVVJ2WZxkQjy/gLI2Tb+t743/fGZYxlAjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320617; c=relaxed/simple;
	bh=UTdaoDgRCp5m/9ZYPIxOt/TUt2k/3Iv3XjJlMaJ38PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNulYke4yaXbqBYy5hOXXO8fer86bw9L9fbh45m0ZzKI4TVkVV7utrxCIr4JZi7YxKQbDIqBvUjHLTOzmT+qHWiFjR0xnVkY/IdBGnin4IBGrvL4LlN3X6i2cL7toOoWA4Nh6P4NQcCoH3f63bLjPM7Ty0i1FmPu15EOSbMgrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP7LBz99; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP7LBz99"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so789475a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320615; x=1787925415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIn/JR7QSML3LbxalAPrR4Gs+07rBcCA789wVYtHyok=;
        b=SP7LBz99tQGWq5iWJtd6FvXFClJQLZm4iULsiJcipIxbMwwVBOwR1DgTxTRYwpQtSx
         uzPOpOM3/7ZB4+Ygzbe2lREPI9RVwA5nt5ZtXPdHWR9DIdorTpDUR1TgxqdZ//MB3/qq
         vf4yJ5TXlFvuXGjR8kkGfyn1a6RqifzzafkRcLJgCqiKfiwDjGWliDiKxeWMaXdxnSGP
         NPQXhwBBPEcWMlOR0QEMbc0RoqPCJmlbcspKTdS52wVYYh0FCVoGN/fFmQAT3OvtXQfE
         j0yCMSqrXOSXwngKt5ZqOc94lJ+vqHo23ao3T0zdAXhJwjF+2e06aknPU++bdwfn5L0p
         Bx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320615; x=1787925415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIn/JR7QSML3LbxalAPrR4Gs+07rBcCA789wVYtHyok=;
        b=OuSRMK4QVkDSI6FTPQV9MBy/J9VQ3z1kuPjogA9qrCiAzoGeyqI3d/2ZHqn1TRI1aN
         eTr+6R7mG/B4OADCuS6od3+hqj6FHWmK7X7rIvRFHrxQ1X+/udYJdmLvzv74A3k37WB7
         72XJyoO02tEeBBQyPzn5/i9yIvUlHGt9AoaYJTqWvgB9Q6u71cg6k2hbdvV0AHJpDr4c
         ceWl6kj8e/Lnz8sdQoDiAutpoC8/F9d9RtNFXek8CuHpw4zbCCcOIZqC18Iv44dEPRmv
         ep7p03wJj87ZU+g2EkQV6F6yGG4oiV2aJFgeE+1X2NjOJtwe+Pok3FVw+Mtb7ac1PJK2
         Ks/g==
X-Forwarded-Encrypted: i=1; AHgh+RqoflamvpiJCYM7uND81Q4C560IhNjp7HLcpnQti+YezCw3qtrysdOICI6SbJ/C8IUucq0x78v+bbx1@vger.kernel.org
X-Gm-Message-State: AOJu0YxDv/yoB6UrU6RQOPJROiIoeLiuWGYY9uQSCazHecZ6YH/4YlMU
	/7ySRpEqTAkU20yEquATwAOI/X45X/g98jbmxoSNQoTWTsxnwwHylO4Z
X-Gm-Gg: AR+sD12GSFdH6Ibpjro8EJlv9HL2IJyEPYAvSnMApVudYwI706ZA4uIuoY0VIIYusxs
	paE+GjJ0qDiAwzSiKzIGV5ChAWlx/SteQHzxv52Fq3JENEwDJjHdTZJe3dBcpes2EaVIhA7CCx3
	JJTmlDwFgAP+FVXweskttdEnHj183sGc+U87WXSuhR7MUScFHpRe9JRMacMpdb6IzeqyqXMXYgF
	uJ7U35WpZtzypihw3IYWiSuSXzuZ3EyBf1EXPUdQiZpHVk32gs3VpfTNMq1rWzWL0K1XOkZWGx/
	/oacQbczAsav35dxV5CD27Iuxlyz4rYghoEbAP42m0XBZUUkzEdUPWyY4zlZatYK23nsmbMiCb/
	uJEYWiPC1sP+bKnXBQjmvr+rInEce5XPo2XSMnJVtwJLkEMMsh+zG9PVfiAWl4x3sor5tdMfUtA
	dGb9vwCHZPDjQvvRYFlaztNJOq5taGY3hdqiPNOSPo7HBWbGPDDEIYC0F/3lYXXrN46fre8Dr93
	6/9kSlv8aeLh0RflzORXp7PRjWyoxkg24NgFgnynRRCDYE95c0aoCOcgUf1dxMaHk4arajpkL26
	2SCn7OG3/idMThFfZ4aQ7w==
X-Received: by 2002:a05:6a20:ac44:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3cd2fd9e554mr13238918637.8.1787320615049;
        Fri, 21 Aug 2026 06:56:55 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 04/17] rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
Date: Fri, 21 Aug 2026 14:55:55 +0100
Message-ID: <20260821135608.275233-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

RZN1_RTC_ALW is a weekday bitmask where bit N represents weekday N.
When no alarm has been configured, the register has its power-on-reset
value of zero.

rzn1_rtc_read_alarm() uses fls() to convert the weekday bitmask into a
weekday number. When RZN1_RTC_ALW is zero, fls(0) returns zero and
fls(wday) - 1 evaluates to -1. This invalid weekday is then used to
calculate the alarm date and can either leave tm_wday set to -1 or
produce a fabricated alarm date.

Treat a zero RZN1_RTC_ALW value as an unset alarm weekday and return
without calculating the alarm date. Move reading RZN1_RTC_CTL1 before
this check so that alrm->enabled is updated for both configured and
unconfigured alarms.

On a cold-booted board with no alarm configured, the following was
observed before the fix:

    root@rzn2h-evk:~# cat /proc/driver/rtc
    rtc_time        : 00:00:19
    rtc_date        : 2000-01-01
    alrm_time       : 00:00:00
    alrm_date       : 2000-01-07
    alarm_IRQ       : no
    alrm_pending    : no
    update IRQ enabled      : no
    periodic IRQ enabled    : no
    periodic IRQ frequency  : 1
    max user IRQ frequency  : 64
    24hr            : yes

After the fix:

    root@rzn2h-evk:~# cat /proc/driver/rtc
    rtc_time        : 00:00:25
    rtc_date        : 2000-01-01
    alrm_time       : 00:00:00
    alrm_date       : 2000-01-01
    alarm_IRQ       : no
    alrm_pending    : no
    update IRQ enabled      : no
    periodic IRQ enabled    : no
    periodic IRQ frequency  : 1
    max user IRQ frequency  : 64
    24hr            : yes

Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8c70dbf8c7ec..e0fdb591ba91 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -234,13 +234,24 @@ static int rzn1_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (ret)
 		return ret;
 
+	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+	alrm->enabled = !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE));
+
 	min = readl(rtc->base + RZN1_RTC_ALM);
 	hour = readl(rtc->base + RZN1_RTC_ALH);
-	wday = readl(rtc->base + RZN1_RTC_ALW);
 
 	tm->tm_sec = 0;
 	tm->tm_min = bcd2bin(min);
 	tm->tm_hour = bcd2bin(hour);
+
+	/*
+	 * If wday is zero, no bit is set in RZN1_RTC_ALW. This is the
+	 * register's power-on reset value.
+	 */
+	wday = readl(rtc->base + RZN1_RTC_ALW);
+	if (!wday)
+		return 0;
+
 	delta_days = ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
 	tm->tm_wday = fls(wday) - 1;
 
@@ -249,9 +260,6 @@ static int rzn1_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		rtc_time64_to_tm(alarm, tm);
 	}
 
-	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
-	alrm->enabled = !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE));
-
 	return 0;
 }
 
-- 
2.43.0

