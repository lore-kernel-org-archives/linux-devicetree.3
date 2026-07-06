Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A153EDADC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360313; cv=none; b=kj7FONS4oiUDiVGpqU4+Z4iVjJtGTg9WCdNzxXv0lRT/SmyviXf99bAdIw8pjh7sPIbjFw0HQkLH5O46w630GKe3GgQ3YxsQcxVppGGcnYT4lYrLAu04F1JeJ5EpQUplkSkrazQMZgg0ADwuR6MgJDfbKOwHp/a8wWOtd7UZK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360313; c=relaxed/simple;
	bh=6Sjgo2jOp18Djngxf7/ipFFmJe+Fa9xcZITBuXHAxPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPM2ebkGPpJngYyBNJTSc6lMXmHA3AKBhhOTtNo69jS6TNN/DdXAcoOEzgoMkY7LWafPk7bNQOsiJp/W5fMmAsjTkyMrmDXM82te8Z5Iq7G/wAbnF1av0I2HFHgAsxKwPGkeW+Oxo+/VCN9ieKQYNt4cSGKIlhvwN1WWH4DE8ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Url2/NhP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Url2/NhP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so36696055e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360309; x=1783965109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh5vS2RRIIEr3rSaPu1c6fxxyM70bAInUDVodaYtikc=;
        b=Url2/NhP68+7Kzsx2oCp8bbxPPTL8huP0am5rnW1PinIcoL9qPAaJdXD+D/COx5LPX
         X88w85pnWB1AB8j6AmlRHZX859Dw5wzcST2gYKVhpcHJoM9ZxkdJqpffpFrVh2+z6r6F
         lyPoVwmgRrjBONsEvcjtF6WMiRDs9dedqucBQuC/vjaX0DFM4iVhaYn56UAB3lg11CZV
         2KbQTMNxH/ZmFAWM0H7p087aeL7FGl9JDOQvVbrTM+QzPcLTejeRxEKRkCzSLM23rHTy
         PBQlULSIyqi2M4IAygVBYYlAnvYGJc5gM3FRzdccKaFAz45nLVi//Q+yNRqDLSpeHN9U
         GkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360309; x=1783965109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hh5vS2RRIIEr3rSaPu1c6fxxyM70bAInUDVodaYtikc=;
        b=p7AWJM2NrrKRVbYLYv7ndhcri2iiMbqWZYpozYKWX9KEat/IKOw+8+11KlrHgphqhc
         xoBCf1XqjTAfUcF8E55UqD/5gQ7EKoxPBueBq24J0loBwSqPd8hRAGsdp08IPWt1GAbD
         0pkBNJAJgJTEj+vpuLap96ajzul2Dvm9j5+7OwObhhL2G1X7xcjymIsDa079lggKpzF+
         hJNMtkPtjfW4fVLyDCAjW+GNcHYoljtg0AG+VcYqofaFVq1mllry2vQK4f4r4OWWt3zp
         cXvETL4u0BrVF+XvDW+mssHLWoIBV0oQ0uvOO7t40PEj6QnR2CCouj5GsVxW+K7VcTuX
         g+OA==
X-Forwarded-Encrypted: i=1; AHgh+RrLYDgt1wijekNtntr4raHwQeFJRn9TSLYfHEL8+F64IoA3iVOU3tcR/PHTMDi/xjFSDF0izMY0mgZP@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZutgnm3h+9kiDrqNif21sX+kL9lnpRzUW366TbrmpZtGL7s3
	SBDT6J+se0k9/ZRhG+wYKAeJj0ZcMVu4rDHufB3DSdirXGmNXjlwiI0m
X-Gm-Gg: AfdE7clp1niLSHjEUXHCbz+E5MnrXz446/7uddIiKo4tG2T8uWdz8XkpG1etKyGOmbZ
	gaTm66y1SEb0O2eDvFiaB+C96MiEaNs4lBVhcTFT2HY9okgKO9LaXB/afzTbOtROWvbjZJttbXw
	dL0NJzZA94NwDTG4mQgPZ3Kjabt1EaRL0CUAdEnwoRnF6CZ4m3y6ktJyocHv9XdVPDIZsUpZdP6
	MU9CXI/36Cd3nzNzI1fhQIfkQY43oqlZokJRppKF5GHC4nVnUCnMd/KEhp1wYQfpWRSRW5i8rOD
	FCYqGYdQNtSRmRM8Xx7x9ErqKFUNFgjN6EmKYxKeBEvieZ5FZz5iYW15Ok1EwjbvyxqNGZcgUxI
	B+0HYGvGtDx9Gra+vu38ouOTyMesfCLDGXLEYdH6V2E1pxgDvAx0xgXSe9m9ZrUWhCgQ5aFzZXw
	VM2UbFtniBizeKXBsjJcb4ZBw8AFNb7wNfYLKV4gIE7sMdRp3yrG4rlC4l57nYD3K6el6WeKwdl
	xJKv7L+omyKgBZ0/+LfwUFiwe+utuAI3xoDiQ==
X-Received: by 2002:a05:600c:698d:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-493df038708mr18885645e9.8.1783360309480;
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 03/12] rtc: rzn1: fix weekday underflow when alarm crosses month boundary
Date: Mon,  6 Jul 2026 18:51:29 +0100
Message-ID: <20260706175138.12587-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rzn1_rtc_set_alarm(), the driver attempts to calculate the weekday
for an alarm by computing the day delta between the alarm time and the
current time:

    days_ahead = tm->tm_mday - tm_now.tm_mday;
    wday = (tm_now.tm_wday + days_ahead) % 7;

However, if an alarm is scheduled for the beginning of the next month
while the current time is at the end of the month (e.g., current day is
31, alarm day is 1), `tm->tm_mday - tm_now.tm_mday` results in a negative
value (-30). Since `days_ahead` is an unsigned int, this underflows to a
large positive number, leading to an incorrect `wday` being written to
the RZN1_RTC_ALW register. As a result, the alarm fails to fire.

Fix this by utilizing the already computed `alarm` time64_t timestamp.
Convert it back into an rtc_time struct via rtc_time64_to_tm(), which
automatically handles month boundaries and correctly populates the
`tm_wday` field.

Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- New patch to fix weekday underflow when alarm crosses month boundary.
---
 drivers/rtc/rtc-rzn1.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index aa27ad7f5941..3c83f95c18c4 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -260,7 +260,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
 	unsigned long alarm, farest;
-	unsigned int days_ahead, wday;
+	struct rtc_time alarm_tm;
+	unsigned int wday;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -274,8 +275,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-	days_ahead = tm->tm_mday - tm_now.tm_mday;
-	wday = (tm_now.tm_wday + days_ahead) % 7;
+	rtc_time64_to_tm(alarm, &alarm_tm);
+	wday = alarm_tm.tm_wday;
 
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
 	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
-- 
2.54.0

