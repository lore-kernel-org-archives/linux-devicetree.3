Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161A49481B
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320610; cv=none; b=Y9rSfjvry82dsITLZwww5/CF0zWz7JkUBWybhFrDuP9fCNpoS5EB/YtIDxNxAhaaplp2m+z5V2oAIB1TT/NO9CEIH4Yayydhkp0qYm6ZBcMk1Z0duO1UezTkCUTwegomRjRqB9UuwOiUVnBJg1w2I8jmVruww6zndUNaZsRIi1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320610; c=relaxed/simple;
	bh=nOwCB0GUu636xzrMDwXRCKSR8TtZ4OMEI81GMCIE7vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hasedx/ld/+aJBvqwQ07mfEl9VEDSUxQUydltsuZOaftpshtl3lJJiKkCZbwIb0ebQA0IrwBySXbMdAoKc/DZnP3RvrxTM/MRLGIvuViBdPEH3aZaX08lPXUBRAxYAEeZGT3iCyI+Br3MrnHskTyDs5xJ7IZZ35ZSGYdT9YKgx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZlSwPEA; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZlSwPEA"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso715982a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320608; x=1787925408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0FHwOXmdVjq/fR8LKjN0dCSgITp6opJdRR3Iv2IfwI=;
        b=GZlSwPEArMzym3mMiIDUoMBvgTPk1zsx40bWbVKQToRaXTN7Jttyz8G7pOnaLsJmKm
         eaU6JxtDXMghu5Fkb29IFtMKKYnaeY0nredMIOhYO73maawqLzAGD2NQ3YC9j+n+mGzH
         EwT9sahdv0VOz3KKn9kqsDo91KUNWBVvlHYTh60XeaN7aq35LEwIDTPKZgN2rD9xEvWt
         LguIJLZCO2IBy5+a6F9C+qN2MxJ0ZQyAipEkw9uH3sOmM6VozVMNLaysAZ7yWJ2+uTse
         bqsW6uQJi+evP/vaZqnaM2TGxhQIlF10WYooPsCnIkGBnWBxhIMZeZuMitgAGP+TWiQK
         pfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320608; x=1787925408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0FHwOXmdVjq/fR8LKjN0dCSgITp6opJdRR3Iv2IfwI=;
        b=A7NKRWS6LxkFxEO3QBVatUYnRY54RejVJ1rj69ivx8qofZFNiceJYVDD0F6Mc6QQVb
         2XVpiLGDwBYMfAZ/wHcdW5waY081n8cjdSzVGU7NklGKrVr5nbUJx6iW4XRansiL2sbJ
         2b8CHaqy7S1a4JZuqNU5lxRzO1XTHPaMXBLJ3Eot9hJMq/305Dfr3WmqhEDXFtqa0QGu
         4BdIXR9mrBoGRS2ck2nMnUppXml1tcTg101yV1Ko9WkjlasWNQR3I29oSgFsavUHzvmk
         t/J70S+CVKo40reO+itF6UjsAe+ASYZwXUtzUGyYAvVpQn9EDK7zyS7Tqfk0BcQWGj05
         scxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDDfINwimzXgHlbe8icy5MQ+HUMCk3/W6th7SkYdhycy6xbt1+OP19tKcl1d0oIIIi5mmq5VO0cUR+@vger.kernel.org
X-Gm-Message-State: AOJu0YwU4o2w2mP0e46s1Y6xYUFSTzJOrYjf2nEwIbBU/iscZLx+YH9U
	sjvvp+3hnMMzUYU2UI1u/VSD4d2s7JDSUarquXePXo89WTkthhluARH1
X-Gm-Gg: AR+sD10Z7EXWV98c9tUCsdx6OaL6gn+Td63UZKuhkaDb5Pc9c9ne6O195DwzZuJ66eD
	gV+0677/bvtS+SciRDcBfa2AvSNlFSdT9AsrrnVWCrn80ryolwnQr2eOBfErS/xctc3IUOYITnn
	rWBl2FL06QUn+ElB28vt42ZQ+RLpcRKX8icoQzkrNWyAAfO6mKFso0fNQcWTETgZGDHoPjz+mVJ
	q7Hh4DCQjWae6wvoRagRMkmMoD7Rs/eSvW6Zu0rbX6EpV+6OA6PDTKQVR6HYP85Zdm7mZR5awN3
	LHv55ESpb0ZmZfWdZBBzEQ1ymJNZxR2xzad3bKtY3bgO3Gpe2HVpHLjRhfUJBto9ZcE7jLFQxIc
	R/skJYiyR5KDAyRpCXR0i5Bhqv3I8jhkLk+9H0DBLBzhw8T6Sfn7/M4N+UJiThPK4EPXA+HYRiD
	oD+z+bjlQauXVkYeBg73gdRebFfG8hosGstXL+Vd0f18k0MOYhldIy1rrQ346773ta4ibqsbqB2
	unnPjGFR6fFludRdW3uS1wD1LzFCAc6lGwqkx9XJ5absZhzxFajdWA/xp1f6N6SK/Q1qxYefzR3
	VNqKioFpnakJczX1w9gHgBZML7du2nUz
X-Received: by 2002:a05:6a21:6f16:b0:3bf:8de9:c647 with SMTP id adf61e73a8af0-3cd2fa2dfa0mr14028111637.0.1787320608326;
        Fri, 21 Aug 2026 06:56:48 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:47 -0700 (PDT)
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
Subject: [PATCH v5 03/17] rtc: rzn1: Fix weekday underflow when alarm crosses month boundary
Date: Fri, 21 Aug 2026 14:55:54 +0100
Message-ID: <20260821135608.275233-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

rzn1_rtc_set_alarm() calculates the alarm weekday from the difference
between the alarm day and the current day of the month. When the alarm
crosses a month boundary, this difference can become negative. Since
days_ahead is unsigned, it underflows and results in an incorrect
weekday being programmed into RZN1_RTC_ALW.

The RTC core already provides a fully populated struct rtc_time for
the alarm, including the correct tm_wday. Use tm->tm_wday directly
instead of recalculating the weekday from the day-of-month.

This avoids the underflow and ensures alarms scheduled across a month
boundary use the correct weekday.

Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- Made use of tm->tm_wday directly instead of recalculating the weekday
  from the day-of-month.
- Updated commit message.

v2->v3:
- New patch to fix weekday underflow when alarm crosses month boundary.
---
 drivers/rtc/rtc-rzn1.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index aa27ad7f5941..8c70dbf8c7ec 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -260,7 +260,6 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
 	unsigned long alarm, farest;
-	unsigned int days_ahead, wday;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -273,13 +272,9 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (time_after(alarm, farest))
 		return -ERANGE;
 
-	/* Convert alarm day into week day */
-	days_ahead = tm->tm_mday - tm_now.tm_mday;
-	wday = (tm_now.tm_wday + days_ahead) % 7;
-
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
 	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
-	writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
+	writel(BIT(tm->tm_wday), rtc->base + RZN1_RTC_ALW);
 
 	rtc->tm_alarm = alrm->time;
 
-- 
2.43.0

