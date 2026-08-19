Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82D45040C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136068; cv=none; b=k32BvkQwJWur/iD4CCEMXyoHzUAhVVKp9n5DRlgqi1BYxpxeYtF4f/5BpWvUxkq6XR8uu82JA5T5a6D4eW1Gqa3IDlorPjOJepvJ+z8VTVu0DmxOUJpqWGxnYHaOOECLhlI7493PazUCXoPgcGVJb7kkqtZG/DOX1drdPzXXwcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136068; c=relaxed/simple;
	bh=fqDxLMxq201J5OX95IYuNjtL/jRJH0w03O9tgHXacaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgyPFKPxjTJCYkiompi+CbVlnGgKfz1YQSgEt/m5/fn4oAiPSfnui90FDfTXMttu8tyxyG0TsvcEZ9ZPjxqN8AuT24qID4a5ptHb0S7PDU+mreZxP6G3v8U+9zT2ODBu9roqezyRGfRWFjJcDIoUiwOhUwUijYYavxLD/ZBz0KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pivtkAR2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pivtkAR2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1373984a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136064; x=1787740864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRmLRFgoYJjChjT5n0JT9k4wL4AVamUoFR+vPjRw0Ag=;
        b=pivtkAR2FTl9ASI3TlSP6ypSo/PXw7UiqIUxrKAhToGSaQUSqx027LitLNhGBZ0f9a
         e13ZfBAcgOTISk8wXS83GdYouhUYkQpexMSr8B9izIaXqOKtJL+Ryx5FDUZLMpTmIs7k
         yKtyov5jSxriF3HtDGkLNW31H0QXoLg74st+hQLesJJeRpjehTH8CLVHZzZ81qcpozHM
         PybrbyLAPCu7n6iRuWhgPTn0U1Gpx1o7X4BIxof8xS9s2tvIXCispV8SQWDTnI/DGlhT
         wQHA8sSA/pCpnN5cKqH7ReEmrCJLqpdPRJ05sLTwQyTXzPRV+XUVJQbHH8h3EiHShdoG
         k9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136064; x=1787740864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRmLRFgoYJjChjT5n0JT9k4wL4AVamUoFR+vPjRw0Ag=;
        b=KxnV5nHXFDmMd0bM7oshoC/F3Q773iSUiu5p3Ijkx8xbBTkn38opwMJNudfv7AC2CW
         VARS+/XpbR2LXqs1RRJDqG4oXcjDGN/vD5YieZPR6nzhy+qLh1Ok1TewsrC1UMQxPDoo
         eSRA6kCYpnBR+LkvtLOL2BR56W42EHIfe6APq+qOcB7PYZSp8mkgYyX0YQHwyKNQcjcv
         ECv8vDvbdhHA0lzZRX7oHe9wb+SwJNrCWnxb2yK10WR0DNbmdfZvqmm22WFfbSNyr0Gd
         TNv6rVuZNHF+ZKRw0XeA+24NZg45oQBXEvWA1JtDwqbMZdUWVUwYdROx8v/PldQhIIe6
         zLiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob0MIYeJ6TUJmUj3I4Tjl/Fg+363uX/hCNDt4xScWLCmCa7lGLMfyhYMBjHE7AW0wvKtvWiMi6eZ1d@vger.kernel.org
X-Gm-Message-State: AFuF++mYo26Ze4affsugZz1o0vJezZikc2XttlyJtKVEwvslSkS0x19S
	FolqQl4NLfYiopwC9T7uk/QOHfD2U4SCBv2Zm1Tor2iJjZAZR2yYZrk8gIzPs5iK
X-Gm-Gg: AR+sD12cwiKHiBPV6Xvt7KBS5idEHbTC6gvpXBkZWl/m27Y3EuvVfOzc1IQ3LOrmz6o
	GVn3V8Tj9snJNmeHw3r5dHQjfrvRFZlBtrsR0bHA3s2LCzlXQipEcLXuvZw6lrkkW1iJY9YD91G
	pMAZ+HWUQPrVqblSX98MU+X0O9wPPhwRjY0UzY6ZWuk7HWhI/Wi4RhNdStyL5I3E8ByrJdkE8dY
	YUwT9uqytygDgcTEaVRIGrzrJQvFCIfE8UJ0zVd547udl2qBlaocSMbWGUgF26N/wQTbHXWCJgF
	cNRz2qb4pvaTb6heWLUmTiQozbV4IkZO3hIy1qd1WTBSi+KEJgibavmvJgkDePc6ySYz2BU6eMZ
	DeQNcIQqbNZP6iZsGlG/4oftS5k0ukxsVp2Logehng8U67fOzRq4qh10lji7tF8e4NX3kH4rQ10
	XoQCJint/xrubHs5DnBAhy4mlVyDvBZfo7x7uELR0GUiALaqhUIk6e+7g28TJbzpkuC2u5eZn3+
	bnYXO/6gZ9skezBVcWz3GDUL1tO3rDkUM/PJOnGuH1yB3J/FGPkgT1frkdtmHviJLmV/5V90nd7
	VHk/NpjWkw==
X-Received: by 2002:a17:90b:1e4a:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-39580ace5fcmr6816160a91.7.1787136064030;
        Wed, 19 Aug 2026 03:41:04 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:41:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 12/15] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
Date: Wed, 19 Aug 2026 11:39:23 +0100
Message-ID: <20260819103926.2136712-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace open-coded shift and mask operations with the bitfield API.

Note that the weekday field is changed from an explicit 0x0f mask to
an 8-bit field definition, matching the hardware manual. This does not
change behaviour, as valid weekday values cannot exceed 7.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- Added RB tag from Wolfram

v2->v3:
- No changes.

v1->v2:
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access instead of 0x3F.
---
 drivers/rtc/rtc-rzn1.c | 50 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 7e2177f46313..02cff5fe117a 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -12,6 +12,8 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
@@ -38,14 +40,18 @@
 #define   RZN1_RTC_CTL2_STOPPED (RZN1_RTC_CTL2_WAIT | RZN1_RTC_CTL2_WST)
 
 #define RZN1_RTC_TIME 0x30
-#define RZN1_RTC_TIME_MIN_SHIFT 8
-#define RZN1_RTC_TIME_HOUR_SHIFT 16
+#define RZN1_RTC_TIME_SEC GENMASK(7, 0)
+#define RZN1_RTC_TIME_MIN GENMASK(15, 8)
+#define RZN1_RTC_TIME_HOUR GENMASK(23, 16)
+
 #define RZN1_RTC_CAL 0x34
-#define RZN1_RTC_CAL_DAY_SHIFT 8
-#define RZN1_RTC_CAL_MON_SHIFT 16
-#define RZN1_RTC_CAL_YEAR_SHIFT 24
+#define RZN1_RTC_CAL_WDAY GENMASK(7, 0)
+#define RZN1_RTC_CAL_DAY GENMASK(15, 8)
+#define RZN1_RTC_CAL_MON GENMASK(23, 16)
+#define RZN1_RTC_CAL_YEAR GENMASK(31, 24)
 
 #define RZN1_RTC_SUBU 0x38
+#define   RZN1_RTC_SUBU_RTCA0FX GENMASK(5, 0)
 #define   RZN1_RTC_SUBU_DEV BIT(7)
 #define   RZN1_RTC_SUBU_DECR BIT(6)
 
@@ -77,15 +83,15 @@ static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm
 	u32 val;
 
 	val = readl(rtc->base + RZN1_RTC_TIMEC);
-	tm->tm_sec = bcd2bin(val);
-	tm->tm_min = bcd2bin(val >> RZN1_RTC_TIME_MIN_SHIFT);
-	tm->tm_hour = bcd2bin(val >> RZN1_RTC_TIME_HOUR_SHIFT);
+	tm->tm_sec = bcd2bin(FIELD_GET(RZN1_RTC_TIME_SEC, val));
+	tm->tm_min = bcd2bin(FIELD_GET(RZN1_RTC_TIME_MIN, val));
+	tm->tm_hour = bcd2bin(FIELD_GET(RZN1_RTC_TIME_HOUR, val));
 
 	val = readl(rtc->base + RZN1_RTC_CALC);
-	tm->tm_wday = val & 0x0f;
-	tm->tm_mday = bcd2bin(val >> RZN1_RTC_CAL_DAY_SHIFT);
-	tm->tm_mon = bcd2bin(val >> RZN1_RTC_CAL_MON_SHIFT) - 1;
-	tm->tm_year = bcd2bin(val >> RZN1_RTC_CAL_YEAR_SHIFT) + 100;
+	tm->tm_wday = FIELD_GET(RZN1_RTC_CAL_WDAY, val);
+	tm->tm_mday = bcd2bin(FIELD_GET(RZN1_RTC_CAL_DAY, val));
+	tm->tm_mon = bcd2bin(FIELD_GET(RZN1_RTC_CAL_MON, val)) - 1;
+	tm->tm_year = bcd2bin(FIELD_GET(RZN1_RTC_CAL_YEAR, val)) + 100;
 }
 
 static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -128,15 +134,15 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 			return ret;
 	}
 
-	val = bin2bcd(tm->tm_sec);
-	val |= bin2bcd(tm->tm_min) << RZN1_RTC_TIME_MIN_SHIFT;
-	val |= bin2bcd(tm->tm_hour) << RZN1_RTC_TIME_HOUR_SHIFT;
+	val = FIELD_PREP(RZN1_RTC_TIME_SEC, bin2bcd(tm->tm_sec)) |
+	      FIELD_PREP(RZN1_RTC_TIME_MIN, bin2bcd(tm->tm_min)) |
+	      FIELD_PREP(RZN1_RTC_TIME_HOUR, bin2bcd(tm->tm_hour));
 	writel(val, rtc->base + RZN1_RTC_TIME);
 
-	val = tm->tm_wday;
-	val |= bin2bcd(tm->tm_mday) << RZN1_RTC_CAL_DAY_SHIFT;
-	val |= bin2bcd(tm->tm_mon + 1) << RZN1_RTC_CAL_MON_SHIFT;
-	val |= bin2bcd(tm->tm_year - 100) << RZN1_RTC_CAL_YEAR_SHIFT;
+	val = FIELD_PREP(RZN1_RTC_CAL_WDAY, tm->tm_wday) |
+	      FIELD_PREP(RZN1_RTC_CAL_DAY, bin2bcd(tm->tm_mday)) |
+	      FIELD_PREP(RZN1_RTC_CAL_MON, bin2bcd(tm->tm_mon + 1)) |
+	      FIELD_PREP(RZN1_RTC_CAL_YEAR, bin2bcd(tm->tm_year - 100));
 	writel(val, rtc->base + RZN1_RTC_CAL);
 
 	writel(0, rtc->base + RZN1_RTC_CTL2);
@@ -294,12 +300,12 @@ static int rzn1_rtc_read_offset(struct device *dev, long *offset)
 	val = readl(rtc->base + RZN1_RTC_SUBU);
 	ppb_per_step = val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
 	subtract = val & RZN1_RTC_SUBU_DECR;
-	val &= 0x3F;
+	val = FIELD_GET(RZN1_RTC_SUBU_RTCA0FX, val);
 
 	if (!val)
 		*offset = 0;
 	else if (subtract)
-		*offset = -(((~val) & 0x3F) + 1) * ppb_per_step;
+		*offset = -(((~val) & RZN1_RTC_SUBU_RTCA0FX) + 1) * ppb_per_step;
 	else
 		*offset = (val - 1) * ppb_per_step;
 
@@ -341,7 +347,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 		subu |= steps + 1;
 	} else {
 		subu |= RZN1_RTC_SUBU_DECR;
-		subu |= (~(-steps - 1)) & 0x3F;
+		subu |= (~(-steps - 1)) & RZN1_RTC_SUBU_RTCA0FX;
 	}
 
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, ctl2,
-- 
2.43.0

