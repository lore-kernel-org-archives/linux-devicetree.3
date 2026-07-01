Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBD34DB6D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916217; cv=none; b=Z0JYWmVGy4rDzNiVdt0aSJ4NY+9rT31/cxAXA81K5R380W19gLksD/1EqVJOoFcgKd2uZrQbNj+M4ZZZYkQUcBtFJe/6aSL4CvxeSYj4nI7OGbe/21hxuq9UmjTd6B3OfEdpwHNk0le75lIelXI9JcCT+D+06I/N8TTiBoEy7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916217; c=relaxed/simple;
	bh=Yhd1iVQuF4Gj5a1KqyYLwT1xDJsQUr3ICql4FDx5XqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exGY7+mcbECtOAZTcbR9gJh1rNLHD9uJ98X0Xf34nNH+fmieFjHHo8oSlcd6zM1n08jqNsucsm/+Zcu+vCvXCs6uF2M2CLat7/Xr+B4BgA6KueJ55Ie0P+KpKNpo+RYmm4sYjTuhMEKFcTw8if9+JjvUtekve2s19i8/noDiLAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3FauQup; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3FauQup"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4924593f45dso6290465e9.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916214; x=1783521014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/5R2n7GlIYPdOfOxpHGr0Kq5mLmcq/odZqFXCD5Qig=;
        b=l3FauQupwepd+/RbQ7eZvzSPmLOOEjlDzvHJaeug049vcvNBov3O6U1pgM13cilsIH
         cHYNCC/c1ftKk8LteX0JERrtXC4grHXUiap3yHPTbWUxtqxbWqEHWne7+u7d2rQvGfv3
         Ifqxolol6PE67I/DVepQFpiFfZrT2UVq18lx+EltHd9zLcgkbgDo5jLa1mDFMZGl/F54
         StOSMXw7H7eqeuKdQNKlisChJxhYn4DmPQZ+P3Siqx4FLhbV5iz8lZl5tt+n2jTkXhZI
         TIN2K4KLlKz1DzmYGcarM1kV1LX4zDXaH2D198Ni1j7IyCgT+P673whHQJpO7gtTR1sx
         mMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916214; x=1783521014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/5R2n7GlIYPdOfOxpHGr0Kq5mLmcq/odZqFXCD5Qig=;
        b=DFYZEgza0tsECCOZFAUaC9oakWOTIDehwJJrQJKbjD8jCgF5rWUNhbTODf/vHTholK
         WVzUTTEI1VSV4Y1xBhVp44jayqWgkAhX/GWVp9MlE1Gi8PYjAN6yaWZD/0J43Ez3dnyR
         aSdssEiZON701MGvPBMIneLbyVPKzYFpNIQ8HwMIYJfD+G28u4SNvKz/UhU3sOBeDRC5
         V7Bd7c+OtX44/Kg/kG6og6PxjEIVxnPDcrqDxqm0fRUbpdBdYPRdA1ZhlmqR/k/lkbEb
         0f6lQfu4qS22QdNcywccbyNonaeulAc81MEe1+oN23NOec5n9mef+xDx2WG6PK8cZWp0
         nyog==
X-Forwarded-Encrypted: i=1; AFNElJ8EkLnR8/JB2u5YYk1v5Jm/IH5ZNsBKUQWR2Eth1DE7cbp/18odChheEbgb4WUmwJQLzBxRN6vKpUQf@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHkUtuXmOiOU2G2WoibRGQn6pzWZ16bNbgpBy1m6gW8QxZKvk
	rygFcaPyUd/k7KwqxT2lLIsoOdj57lZH4dHJSbTShy6MBk63VoSG+Gqv
X-Gm-Gg: AfdE7cmO8yEafeN6ru/N0FR8PQCl7/otcIm5CKZrs9cIaqNAnIUaHU7cTd+As2TTQ3O
	7Z19RsLfWEFr1VqEapnOWRggBhh9lJ6yLULZajr7zW+6SZXBtBEEnkXRL1/XZaTn0u5DDWdHaqJ
	JDBBRJBqhHav17GP9InQhhkjMxItiCUS5Tcmod7EDjFuXg9mnEQd5Ci17iAGqocwREP0PbTlunV
	6NRQFsaj5ziMj4l/2KWg707kkQRb4Kx+DllpapATr1ScMyBx1yQdFfYCA7dNziXyDuPS5v8y2Rj
	BVckk2XNCClHzvEOkyL7fgDAttbLADaAx4CpgD/7fZeivIgIREBov8nC2O5xsaBJLSdQFw41lp+
	8TLnPzrnEeHo9XqR7n+ujOnBH95askiptqoJkIS/lu/NUI8Sq0V2veDJnIFhEpGH5cVVvXBYhJr
	/fKBTmZbhEdkBgmkneQ0QwzNd1QHjeYilRKs0XDilCS7Jbrjft6rB0LuagMWqrvJp9ixTiTbUd2
	J/uqJBSbel2G9/tS+P0JGfIDpQ=
X-Received: by 2002:a05:600c:8590:b0:492:6487:a87 with SMTP id 5b1f17b1804b1-493c2ba1f4dmr24533765e9.32.1782916213985;
        Wed, 01 Jul 2026 07:30:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:13 -0700 (PDT)
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
Subject: [PATCH v2 09/10] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
Date: Wed,  1 Jul 2026 15:29:52 +0100
Message-ID: <20260701142953.2014895-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace open-coded shift and mask operations with the bitfield API.

Note that the weekday field is changed from an explicit 0x0f mask to
an 8-bit field definition, matching the hardware manual. This does not
change behaviour, as valid weekday values cannot exceed 7.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access instead of 0x3F.
---
 drivers/rtc/rtc-rzn1.c | 50 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index f236b08e3ca9..2afd8251c868 100644
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
@@ -39,14 +41,18 @@
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
 
@@ -78,15 +84,15 @@ static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm
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
@@ -129,15 +135,15 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -300,12 +306,12 @@ static int rzn1_rtc_read_offset(struct device *dev, long *offset)
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
 
@@ -347,7 +353,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 		subu |= steps + 1;
 	} else {
 		subu |= RZN1_RTC_SUBU_DECR;
-		subu |= (~(-steps - 1)) & 0x3F;
+		subu |= (~(-steps - 1)) & RZN1_RTC_SUBU_RTCA0FX;
 	}
 
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, ctl2,
-- 
2.54.0

