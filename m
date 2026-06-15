Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2882F40801A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538513; cv=none; b=rY7uhYsktgz+zU9/j+2+qG2PhAe80WM4ergxhZEZr9rTrNphCuFXI/cckE/icb41CDq/lv1jPFjiYqLGdPCthgd8z0ID0hZdadrxkI1aZLt3yjTHFBPTp5ME9RW8p1zVjAmLbGj1e/Nh9NeEDEw6M9wv7/N4xRmzPKSjTGWkxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538513; c=relaxed/simple;
	bh=3VaIy9lYxPseySDhvgtPJEdtxb7eyDUqidR6PRSBZYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljltZrpNPFqbg1LrLES2Ii1O34tZq94E+LYmHlEdsZEZWezljDPrteD0s4mZqJ1ieYi3kiab9WppTFidaK/Kcc6+uoAHLW16M1g+yEwANwhkgNI0yBcHpBqoTh/2WMRjzeaWg0AwDQv48T5G6b7GDgWLLrQQZAtV6RBH4QRkuQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgDiRWRi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgDiRWRi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-460166910e6so1851879f8f.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538506; x=1782143306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9HWytDa9V2PZ0L29istICZrF1ai/UsBjTqPqnYxQeA=;
        b=MgDiRWRi1oDaK6TYLJY2M8uTd7BJ6NLg2IYN/Zx/EbgI4RiG/7fO5fAuUTmHOUMkFC
         NlOcucG9LfBXa7MIGz0X96/88VoCFHSbRc0dr8qsPP4jNCFpBn0d2IQlvz/2alU2Qj7l
         vswSTh7Qd1l7tzjpcXwwAV90GVfW07+TxIuoPtyrEq20rMuQF/CY20stp/LBwZLx1WCU
         SCAoZrqXuPQLYQktOPFWFbQwjz7jQjphJpwG4c1G8JYx2c7FWhGCUNkFCxnnUmm93HoR
         feundSfJFhKUlVdOTG+IC7Rsb9xFhzA+NFC7R30ANtSb/Tv/myCFfzfhgDjTNq0T2b77
         EP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538506; x=1782143306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9HWytDa9V2PZ0L29istICZrF1ai/UsBjTqPqnYxQeA=;
        b=sast7YQ2UHerp+OjAJi9+ibZh5TrkmzIRhaQ7G1jsl9lQs1z8Zy0lx+y/ThzigXmW6
         tW0FlbB1FA4dT1eOaEicOVqYd/x7aEMx7lpMh5Fvojcw/GNScjH1eq3CpEQir9Mblm2n
         cMrbX0iuownyYUIv+mwZ9TxdMFwBjO4jaJ+9ytO22k9soxrv3ivOk4NQDvKUpRVNZ6sb
         eUkMEotU4Jq0/mqTAQ4jEcePGIk6pnaVwEbcZ4f7+yirefkvsDWU2r+myhJvi87s9Xve
         jlHXbCaPAC5yglUqZqGomfr0AL2sagMXQczsxnjIW2TRxEK7AwO2BjMBel6NSqZ+FmxO
         /K5g==
X-Forwarded-Encrypted: i=1; AFNElJ8bpS+bGuWcdKeYYN15HZjjd8hyMHbQXJmDJDIylkKgRx+Qj37SOJoktg6Hqr2YXsdFVpTINuJq+Rvj@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSNVkOEZy9Qn9YDk063JrLlF9Lvrpwk9j6aELoSRP8aH/QuI4
	3YIzEC018K54MupRITQobxJKilUf6e7nZrzCwhS1Fg2w4fr3px9Sx3+d
X-Gm-Gg: Acq92OGKTLDWFRrLk/kv7aoTs4YxxgcYUC1XCVjC6Gzw73a+l/TdLBkXhAAFF2rXnKf
	adfnZsTBCqb3ZkYGPZr/nFei2KoQd9llGXTBzDkb/5xOQOWj8jMoaTeXkcZQ5dTxoWNn/SPOZDz
	e/lg7ExfgtpZ7Pqqtdxz4vQxRoNGbbFrA0Wo9kVgwEUdeoJf9Zq2uSLrHkZgEiC3OrhG9kyywHJ
	nbzWyrMhe83R8ppazeD1LyVRmaljNi55i3H8Iea6CtaUF5h/2vmFEp2H06EY4jlFebI+FZmROwh
	eeWuF0qziT0a3uTN7FzQmdAjmvSLtfTOJF0DrIMiFBlKvWCrWGPAVNyUuiKqTB2WkLLd2X3a5gi
	Up24QwRnQs9Z4MZPhZGqF5T9TAwgWjE9SHECb4ekpV6gIyDPMVZHSBbqD/xuYIqDUG76L5lMZl1
	yDrqw7s5rwk9BxHaUyB7GBkaUhrkkuYZIvsRgOLJGhXe8/s3lOI5+4qXA9h7wLlWxPTiZpfMko1
	z0jVdZ+L3o9EvoqgNUblC+q6ReULZxhFLkR
X-Received: by 2002:a05:6000:18a4:b0:45e:f68d:e791 with SMTP id ffacd0b85a97d-46074a38ce1mr15429804f8f.0.1781538506394;
        Mon, 15 Jun 2026 08:48:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
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
Subject: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on 32-bit systems
Date: Mon, 15 Jun 2026 16:48:00 +0100
Message-ID: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index fe21fa624288..06339adae71f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
 #include <linux/spinlock.h>
+#include <linux/time64.h>
 
 #define RZN1_RTC_CTL0 0x00
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
@@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
 	unsigned int days_ahead, wday;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-- 
2.54.0

