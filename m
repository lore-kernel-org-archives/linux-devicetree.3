Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAA348C5C
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916213; cv=none; b=crRXrnKgTC0NtuCdhRsCdC66RFtHXdyBN6rsvuYFrVzomihxWHVqCM3hS4kd5hjM1HQ4bVAEHTJfoDBcsBW90Bt0V5xHjz9V8Mg4gN1crvHXzl2ImEpnbPP63ncVn57hcHHJnVcjuX27joJeOeXYLx9/VKQ3i6dgs3UPaNtUH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916213; c=relaxed/simple;
	bh=mWMP/xdPSFDaOWdYX4G9vsqs+NvHwtQ1rzsSePjmtQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWEhsfvyfKE/q68cbWpOvoMn9cqbkP78tzI9wv8psEuTx1s1+9swOCV5bqldic31QDMva8PMNnt0fthEhYORH/WWpNkGUakk1SYKNfNSXnJ9rRzqm6Rm+49WGH6iifpG8yDu42DIvZkBATSOzd/ribo4WS02gesmlNFNcFlnsJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu7Ho0fj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu7Ho0fj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-475881b9a4bso786813f8f.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916210; x=1783521010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+UunQnZVp8S6m9pUrNYyzpfVfChMooAV6SEFAVDXiA=;
        b=Eu7Ho0fjbcZZyBGocFM8zMB8Mtf+0YojHIgkw/ZDlPQVOB6jHNOiBjTMryVtO5ZznP
         P7AuAY57GTS96/dDZpvQ3Hz8SxoqDRqCkTdv8vpPcenM3NuOb3z9L/X0iBm9+8Oq3lGG
         Wczu7oP8hK22QqXOpIwoEugVCZB6AwmWXPbBOpTW4PYIeJuP0drmnLe2ul8Tiqt+jxHa
         KiA5eLJuVyD0ZhICiNwKLKiYyr0U8WZsDmmMHAOkcRjUXKNlWYnhA23kudzNdGE23RVp
         n+igv/75C23V/PUvOveSuswLD+5tbOy45mxHk5+VNGj+RDJaB7AtluDlXPOSB3NRbhjo
         2jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916210; x=1783521010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+UunQnZVp8S6m9pUrNYyzpfVfChMooAV6SEFAVDXiA=;
        b=a/bAK8T2d1jkTd40gFoCqPWLave5M1clcJ7SoTZQYUXHdtK8MOgvrBFzkHr8wYB2Ku
         1x2e5Ubr49/lgMRVO4zINfoArF9qoj1/DlUx2VN9L9Ti/IrPElaT6t14iUZYfKLj4IjD
         MY4TrZv6mbEj0kqSlsUsPTeFXJ/UvHSuyU3MLMGEDlHEGLBTcC0rCJX2U2qOCTao5Uyb
         UNbOLf57weF8RhdUINw4RKoOhU0+UP/pKl143KQpAR8JLB0zaKwxEdzgVL6yGhxn9jCn
         t5RMBEh58rN60FGEtnGVzYUse6QN35aezZ0zGv+xxcsjMA6PtixMZPHeDGSNgfWntrKi
         ZBdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCiibc6OjDoROmcDoL+eJ9bPDhI2lRcCPWQv7n9xVYPkyA4HjBo6Q7MDfd5//vBXv3l2ej2rrhT3kG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OW081A941dMl4Ra0tYbuhdBnqKMsgJQaHTHiydQ03X8+4gBE
	FkfU/pk8WqYUa6vf9CD7OKAPjpVDvp+5wcG7fzhLWF2/6y+D5nVP8y+t
X-Gm-Gg: AfdE7cky0kMYC6xSFGDLM4u8xy13/knI35cWop2S/2DGHP72weOwQ7E9QgSIXTInP98
	TuAmTMyRPqtK29PwUDoLKyQrUM0C7Ae73cbgygWsYgnhJaTOpB3FlLDI2bwceOyS2gRtmx5G2lr
	dZ685y03PjewROkFoX4l0PU8wHQtB99DX1k6NCeEtFlKfYtFEvRxItXmXyGG07mvqCCMzdjZmYk
	QD/s5wFTN5IPx5oS4lPYOTdhwkUqt/c+q6U7gz3aPa0SJanAsx0gmdk6gSxBvg4AqNNROShrYFA
	sZUhSVzmEKzy5stw5sGk70G/sa4YcYmfYdkLSVbteMeOUUEnFgiEOnp1AWNjMZ48FXOUXr/InjQ
	aORJikuq5CdS/T21s0FYGNGyrLjCeVxSGYUA5YjhwrXOaAVLKQ8xdYHQDt4bfBCeAW4PkvkP7n/
	f1QiL2jJ9/3BqL6GCTWeCNjAPVN/uPbQFPpK8Smeq0IoxSmCBPbeEm89P3pfOHLUMPXwA0StXon
	qcHMIox3QTKdJGxx77A5u+QLL0=
X-Received: by 2002:a5d:60c3:0:b0:472:d154:facf with SMTP id ffacd0b85a97d-477b5677a8dmr1049369f8f.42.1782916209676;
        Wed, 01 Jul 2026 07:30:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:08 -0700 (PDT)
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
Subject: [PATCH v2 05/10] rtc: rzn1: Fix alarm range check truncation on 32-bit systems
Date: Wed,  1 Jul 2026 15:29:48 +0100
Message-ID: <20260701142953.2014895-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index d56be7314a91..a82f2d7f7a2f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
 #include <linux/spinlock.h>
+#include <linux/time64.h>
 
 #define RZN1_RTC_CTL0 0x00
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
@@ -259,8 +260,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
 	unsigned int days_ahead, wday;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -270,7 +271,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-- 
2.54.0

