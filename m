Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95355437873
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360321; cv=none; b=WSYWzR1ERdmD22wrXkDM8KiMP40ceBqINtNNtj02FIkQNDTbNWtVfPctGkT/Iv+P6Iu0smWPD6dZD8AJ+lbY1TD/eNnQvWyIPaxQ2qNFLlz5orU1ZaCpBC2v9/7hD65YPVTLOVOJyUByqZpppIbwtaAvEGurvtFYyYewSH2GAgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360321; c=relaxed/simple;
	bh=wDKg3949l7LKDN3iJCa35rFedzi7hERQNBoms8nmWs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otbf2pPdlUAcu8pzm3YHsqVR5VNjIl8uUkKdbP6Udf2Hm0aoHqatm27GHxZRe4og39B35GqwBZdhLiAk2GrCnYGoswyjRhhVMhOXqLpJBkN1IKtIE2fElpGP5yfNOY7FUr2FdmEmVeIg3mR2CA+srLH/VxWeCuMbPE42wCjXYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqcBVw1r; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqcBVw1r"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so24203785e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360318; x=1783965118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VOnINUcgOb/1TkHiHZ5Ip+Dq1Q+UlPz7jlmFhbw04k=;
        b=RqcBVw1rqyHoWMsg/AnElpN+qHGX2lOHrsKh47O6GftNJZ/MfXNDZ/auKfu4lxChaC
         2PMpOnhudBIw0jiudsnxnpy3O0TSzVa7YMMoa6fnj1qd0Ng/A7NifzxPJVsArHCeC5wW
         kKaym2Ud5T5zQaRZsEzXAHvWNYT/wP/NmuKMl46OdwBIS0MHXuu8Uw22IBFDZtLu7pYV
         WxGtRfUz2Abpy8EMz3Ie/7RfOLsEoy0m8l30Xk6I3EGWLh1nVA8ODaOssCgxOMmot80C
         Ej9/jgoFANLkdepHKOLT31ati95stmEdlwXwxAvBQRja3x6xilhljfh7Lw12hHusczdv
         uatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360318; x=1783965118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VOnINUcgOb/1TkHiHZ5Ip+Dq1Q+UlPz7jlmFhbw04k=;
        b=MA2ujOpGuqVxaJz2tjKRou7DaIBWG8ont/9Oq+qyZnQE6UWVZZ8r/4wuR/x6wPbG05
         E2P36P1Ot/fb2Y9D9j4w9WoukGuGFELo8b1l8PpquktWXUHzK5hXAgZAu63LfrlVAnWY
         o2TGpqdTkqtAgenv2zoIHflBKmVO7XhWSmTbIC0Le1dyxZjLSXrpkaJB+RIwuP8v7Jiy
         JkLN2ZlaX8SGXJMi7wrs0phKqhx9B8NkdOl7oN5nAURqkToIDsLNXxTPo4HbBzf3CdxB
         DQtVE5ZQKAqfN/ct79X8FyNYeKmO7F9gnBkYuT0+NPnkwD9a/HgmxBMG/I426MJ/Bn+X
         FbJw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8IUe1cVYjinO9GXiwUS1/5vGWCLdp+/ni6gkPjIBXstDmevFW2xElmAbR4gsBhnhiFBpANuiqh59D@vger.kernel.org
X-Gm-Message-State: AOJu0YzeCq2tewnTNtKko4eSgzb1im/Fpq5aSt+P1kdU2+m0sl2JeROO
	NzvWt9k/2GePjMEfKxkMxb5MyHGoMFC1l5dmaG6R1Vve0dzY8uecWrNO
X-Gm-Gg: AfdE7cnDQLLCPqZJxzJCxQH/mRU5hiDSkoZ22hOJHMxEEqWcn3o/7RJEWKYBvatkwUb
	j9wBHQ8/YxmP/NqWp2s+Th4XP570kmRq2HleE3u8/Umj3DdF8B5mg0ZYvC8Ba8AJ9erm3QJcZqD
	9ZTn3q9oyTGR0vTgHEDF+/Zp32xFANCLoYnYRp9/IwCnUJtfiXZ2CGDEQCZvdnVOTA+RJA4GEZN
	wyA0iz0nUOuaJ0Ujb1fJ2DzqZrKiOj2TXxA/88gtzONhZyp6R2xfoIABA7DSI61b7EQ8V6LWhXZ
	vholRKNolgS90Ql/7Cwsjjea85XsugDUX+CQygmAS4MvCluXM79cyKzomapJ+Avst1u4qWdNdoC
	uoDggIiD1HfZMI3FOUtwIGYxYG2BpaDbymkz06LLq+LPH5T+XwvFuGSh8rDd+ryzKG5SPcEfUKO
	KZraxX+vaJtqAr8u4bwVwDznf9KiyV+35sWlpD8/CbUpuklujFYWLlsN8wNajoF0CzFkP1+M8UC
	OuaCV2Kpf0iewItTn4zJr+gew4=
X-Received: by 2002:a05:600c:19c8:b0:490:b724:507d with SMTP id 5b1f17b1804b1-493df041be3mr18938845e9.11.1783360317982;
        Mon, 06 Jul 2026 10:51:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:57 -0700 (PDT)
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
Subject: [PATCH v3 11/12] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
Date: Mon,  6 Jul 2026 18:51:37 +0100
Message-ID: <20260706175138.12587-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace open-coded shift and mask operations with the bitfield API.

Note that the weekday field is changed from an explicit 0x0f mask to
an 8-bit field definition, matching the hardware manual. This does not
change behaviour, as valid weekday values cannot exceed 7.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes.

v1->v2:
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access instead of 0x3F.
---
 drivers/rtc/rtc-rzn1.c | 50 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index f6272eb5a896..2c3c82f8c693 100644
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
@@ -301,12 +307,12 @@ static int rzn1_rtc_read_offset(struct device *dev, long *offset)
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
 
@@ -348,7 +354,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 		subu |= steps + 1;
 	} else {
 		subu |= RZN1_RTC_SUBU_DECR;
-		subu |= (~(-steps - 1)) & 0x3F;
+		subu |= (~(-steps - 1)) & RZN1_RTC_SUBU_RTCA0FX;
 	}
 
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, ctl2,
-- 
2.54.0

